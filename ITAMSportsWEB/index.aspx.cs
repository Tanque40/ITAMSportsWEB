using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace ITAMSportsWEB {
	public partial class index : System.Web.UI.Page {
		private String forScripts(String tipo, String message) {
			String script = @"<script type='text/javascript'>
								alerta('{0}', '{1}')
						      </script>";
			return String.Format(script, tipo, message.Replace('\'', '\"'));
		}
		private OdbcConnection conectarBD() {
			String stringDeConexion = "Driver={SQL Server Native Client 11.0}; Server=daibruno.database.windows.net;Uid=bruno;Pwd=bvitte18$;Database=ITAMSports;";
			try {
				OdbcConnection conexion = new OdbcConnection(stringDeConexion);
				conexion.Open();
				return conexion;
			} catch (Exception ex) {
				String tipo = "error";
				String script = forScripts(tipo, ex.Message.ToString());
				ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
				return null;
			}
		}
		protected void Page_Load(object sender, EventArgs e) {
			OdbcConnection miConexion = conectarBD();
			if(miConexion != null) {
				try {
					//Primero llenamos los eventos
					String query = String.Format("SELECT TOP (10) Deporte.nombre as Deporte, CAST(Evento.fecha as VARCHAR) as Fecha, CAST(Evento.hora as VARCHAR(5)) as Hora, Evento.descripcion as Descripción FROM Evento, Deporte WHERE Evento.fecha >= '{0}' AND Evento.idDep = Deporte.idDep", DateTime.Now.ToString("yyyy/MM/dd"));
					OdbcCommand cmd = new OdbcCommand(query, miConexion);
					OdbcDataReader rd = cmd.ExecuteReader();
					proximosEventosView.DataSource = rd;
					proximosEventosView.DataBind();

					//Llenamos los Equipos
					query = "SELECT Equipo.nombre as Equipo, Deporte.nombre as Deporte, Equipo.jugados as 'Partidos Juagdos', Equipo.ganados as 'Partidos Ganados', Equipo.perdidos as 'Partidos Perdidos' FROM Equipo, Deporte WHERE Equipo.idDep = Deporte.idDep";
					cmd = new OdbcCommand(query, miConexion);
					rd = cmd.ExecuteReader();
					equiposView.DataSource = rd;
					equiposView.DataBind();

					//Cerramos la conexión
					miConexion.Close();
				} catch (Exception ex) { //Por si hay errores con el odbc
					String tipo = "precaucion";
					String script = forScripts(tipo, ex.Message.ToString());
					ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
				}
			}
		}
	}
}
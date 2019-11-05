using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITAMSportsWEB {
	public partial class eventos : System.Web.UI.Page {
		private String forScripts(String tipo, String message) {
			String script = @"<script type='text/javascript'>
								alerta('{0}', '{1}')
						      </script>";
			return String.Format(script, tipo, message.Replace('\'', '\"').Replace("\n", " ").Replace("\t", " ").Replace("\v", " ").Replace("\f", " ").Replace("\r", " "));
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
					String query = String.Format("SELECT * FROM Evento, Deporte WHERE Evento.idEvento = '{0}' AND Evento.idDep = Deporte.idDep", Convert.ToInt16(Session["idEvento"]));
					OdbcCommand cmd = new OdbcCommand(query, miConexion);
					OdbcDataReader rd = cmd.ExecuteReader();
					String fecha = "Fecha: " + rd.GetDate(1);
					String hora = "Hora: " + rd.GetDateTime(2);
					String lugar = "Lugar: " + rd.GetString(3);
					String descripcion = "Descrípción: " + rd.GetString(4);
					Char idDeporte = rd.GetChar(5);
					String deporte = rd.GetString(7);
					listEvento.Items.Add(fecha);
					listEvento.Items.Add(hora);
					listEvento.Items.Add(lugar);
					listEvento.Items.Add(descripcion);
					lbEquipo.Text = deporte;

					query = String.Format("Select nombre From Equipo Where idDep = '{0}'", idDeporte);
					cmd = new OdbcCommand(query, miConexion);
					rd = cmd.ExecuteReader();
					while (rd.Read()) {
						listParticipantes.Items.Add(rd.GetString(0));
					}

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
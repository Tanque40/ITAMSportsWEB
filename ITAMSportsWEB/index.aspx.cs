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
					String query = String.Format("SELECT TOP (10) Deporte.nombre as Deporte, CAST(Evento.fecha as VARCHAR) as Fecha, CAST(Evento.hora as VARCHAR(5)) as Hora, Evento.descripcion as Descripción FROM Evento, Deporte WHERE Evento.fecha >= '{0}' AND Evento.idDep = Deporte.idDep", DateTime.Now.ToString("yyyy/MM/dd"));
					OdbcCommand cmd = new OdbcCommand(query, miConexion);
					OdbcDataReader rd = cmd.ExecuteReader();
					proximosEventosView.DataSource = rd;
					proximosEventosView.DataBind();
					//Para el dropdown list de eventos
					query = String.Format("SELECT TOP(10) Evento.idEvento, Deporte.nombre, CAST(Evento.fecha as VARCHAR) as Fecha FROM Evento, Deporte WHERE Evento.fecha >= '{0}' AND Evento.idDep = Deporte.idDep", DateTime.Now.ToString("yyyy/MM/dd"));
					cmd = new OdbcCommand(query, miConexion);
					rd = cmd.ExecuteReader();
					ListItem row;
					String texto;
					eventosList.Items.Clear();
					while (rd.Read()) {
						row = new ListItem();
						texto = rd.GetString(1) + " del día: " + rd.GetDate(2).ToString("dd/MM/yyyy");
						row.Text = texto;
						row.Value = rd.GetInt16(0).ToString();
						eventosList.Items.Add(row);
					}

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

		protected void btEventos_Click(object sender, EventArgs e) {
			Session["idEvento"] = eventosList.SelectedValue;
			Console.WriteLine(Session.ToString());
			Response.Redirect("eventos.aspx");
		}
	}
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace ITAMSportsWEB {
	public partial class index : System.Web.UI.Page {
		private OdbcConnection conectarBD() {
			String stringDeConexion = "Driver={SQL Server Native Client 11.0}; Server=" + Server.MachineName + "\\SQLExpress;Uid=bruno;Pwd=bvitte18;Database=ITAMSports;";
			try {

			} catch (Exception ex) {

			}
		}
		protected void Page_Load(object sender, EventArgs e) {

		}
	}
}
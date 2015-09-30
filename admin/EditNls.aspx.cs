using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace AviertDirect.admin
{
    public partial class EditNls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.nlsDataSource.ConnectionString = ConfigurationManager.ConnectionStrings["AviertDirectConnectionString"].ConnectionString;
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AviertDirect.Helper;

namespace AviertDirect
{
    public partial class Landing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx", true);
            }

            User user = (User)Session["user"];

            Person person = UserHelper.GetPerson(user);
            this.lblUsername.Text = string.Format("{0} {1}", person.GivenName, person.LastName);
        }

        protected void btnLogout_Command(object sender, CommandEventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("login.aspx", true);
        }
    }
}
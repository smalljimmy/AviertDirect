using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AviertDirect.Helper;

namespace AviertDirect
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("userarea.aspx", true);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            User user = null;

            if (!UserHelper.CheckIfUserExists(this.txtUsername.Text.Trim()) ||
               !UserHelper.CheckPassword(this.txtUsername.Text.Trim(), this.txtPassword.Text))
            {
                Response.Redirect("login.aspx", true);
            }
            else
            {
                user = UserHelper.GetUser(this.txtUsername.Text.Trim());
                user.LastLogin = DateTime.Now;
                UserHelper.UpdateLastLogin(user);
                Session["user"] = user;
                Response.Redirect("landing.aspx", true);
            }
        }
    }
}
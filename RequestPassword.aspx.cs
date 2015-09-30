using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AviertDirect.Helper;
using System.Net.Mail;
using System.Net;
using System.IO;

namespace AviertDirect
{
    public partial class RequestPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void getPassword(object sender, CommandEventArgs e)
        {
            Person person = null;
            User user = null;
            string password = null;
            string messageText = null;

            this.Captcha1.ValidateCaptcha(this.txtCaptcha.Text.Trim());
            if (!this.Captcha1.UserValidated)
            {
                this.txtCaptcha.Text = string.Empty;
                return;
            }

            password = UserHelper.CreateRandomPassword(10);

            using (AviertDataContext context = new AviertDataContext())
            {
                person = context.Person.SingleOrDefault(p => p.EMail == this.txtEMail.Text.Trim());
                if (person == null)
                {
                    this.txtEMail.Text = string.Empty;
                    this.txtCaptcha.Text = string.Empty;
                    return;
                }
                user = context.User.Single(u => u.UserId == person.UserId);
            }

            UserHelper.SetPassword(user, password);

            messageText = File.ReadAllText(Request.PhysicalApplicationPath + @"\MailTemplate\password.html");
            messageText = messageText.Replace("[password]", password);
            messageText = messageText.Replace("[name]", string.Format("{0} {1}", person.GivenName, person.LastName));

            Tools.SendMail(person.EMail, "AVIERTdirect Passwort", messageText, true);

            Response.Redirect("login.aspx", true);
        }
    }
}
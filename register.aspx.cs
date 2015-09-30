using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using AviertDirect.Helper;
using AviertDirect.Model;

namespace AviertDirect
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Command(object sender, CommandEventArgs e)
        {
            User user = null;
            Person person = null;

            user = new User()
            {
                Username = this.txtUsername.Text.Trim(),
                Password = this.txtPassword1.Text
            };

            person = new Person()
            {
                Gender = (short)(this.rbnGender.SelectedValue == "female" ? Gender.Female : Gender.Male),
                GivenName = this.txtGivenName.Text,
                LastName = this.txtLastName.Text,
                Nationality = this.ddlNationality.SelectedValue,
                Language = this.ddlLanguage.SelectedValue,
                Birthday = DateTime.Parse(this.txtBirthday.Text),
                Phone = this.txtPhone.Text,
                EMail = this.txtEMail.Text,
                Permit = this.ddlPermit.SelectedValue,
                Co = this.txtCo.Text,
                Street = this.txtStreet.Text,
                StreetNo = this.txtStreetNo.Text,
                ZIP = this.txtZip.Text,
                City = this.txtCity.Text
            };


            Session["user"] = user;
            Session["person"] = person;

            Response.Redirect("register2.aspx", true);
        }
    }
}
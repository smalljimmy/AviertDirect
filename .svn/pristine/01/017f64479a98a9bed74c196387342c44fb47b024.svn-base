using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AviertDirect.Helper;
using AviertDirect.Model;

namespace AviertDirect
{
	public partial class register2 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}

        protected void cbxAgb_Changed(object sender, EventArgs e)
        {
            if (!this.cbxAgb.Checked && this.IsPostBack)
            {
                this.pnlAgbError.Visible = true;
                return;
            }
            else
            {
                this.pnlAgbError.Visible = false;
            }
        }

		protected void btnSubmit_Click(object sender, EventArgs e)
		{
			Person person = null;
			User user = null;
			DatatransTransaction transaction = null;
			InsuranceDetails details = null;
			string htmlForm = null;

            this.cbxAgb_Changed(sender, e);

			// Benutzer in DB anlegen
			if (Session["user"] == null || Session["person"] == null)
			{
				Response.Redirect("register.aspx", true);
			}

			user = (User)Session["user"];

			if (!UserHelper.CheckIfUserExists(user.Username))
			{
				UserHelper.CreateUser(ref user);
			}

			// Person anlegen
			person = (Person)Session["person"];
			person.UserId = user.UserId;
			UserHelper.CreatePerson(ref person);

			// Versicherungs-Details anlegen
			details = UserHelper.CreateInsuranceDetails(person);

			// Versicherung beginnen (erstellt Transaktion)
			InsuranceHelper.BeginInsurance(person,
										   DateTime.Parse(this.txtBegin.Text),
										   !string.IsNullOrEmpty(this.txtEnd.Text) ? DateTime.Parse(this.txtEnd.Text) : default(DateTime),
										   int.Parse(this.ddlFranchise.SelectedValue),
                                           int.Parse(this.rbnPaymentMethod.SelectedValue));

            // Folgeaktionen bestimmen
            string absoluteUrl = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath;
            switch (int.Parse(this.rbnPaymentMethod.SelectedValue))
            {
                case (int)PaymentMethod.VisaDebit:
                case (int)PaymentMethod.PostFinance:
                    // Transaktion holen und Weiterleitung zu Datatrans Payment-Seite durchfuehren
                    transaction = DatatransHelper.GetFirstTransaction(person);
                    htmlForm = DatatransHelper.PrepareForm(transaction, absoluteUrl);
                    var context = HttpContext.Current;
                    context.Response.Clear();
                    context.Response.Write(htmlForm);
                    context.Response.End();
                    break;

                case (int)PaymentMethod.PayPal:
                    //TODO: forward to PayPal
                    break;

                case (int)PaymentMethod.StandingOrder:
    				Response.Redirect("success_da.aspx", true);
                    break;
            }
		}

	}
}
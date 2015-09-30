using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AviertDirect.Helper;

namespace AviertDirect
{
    public partial class userarea : System.Web.UI.Page
    {
        protected Person m_person = null;
        protected User m_user = null;
        public InsuranceDetails m_details = null;

        protected void loadData()
        {
            m_person = UserHelper.GetPerson(m_user);
            m_details = UserHelper.GetInsuranceDetails(m_person);


            if (!IsPostBack)
            {
                this.txtCo.Text = m_person.Co;
                this.txtStreet.Text = m_person.Street;
                this.txtStreetNo.Text = m_person.StreetNo;
                this.txtZip.Text = m_person.ZIP;
                this.txtCity.Text = m_person.City;

                this.txtEnd.Text = ((DateTime)m_details.EndDate).ToShortDateString();
                this.txtBegin.Text = ((DateTime)m_details.StartDate).ToShortDateString();

                // this.txtCancelDate.Text = ((DateTime)m_details.EndDate).ToShortDateString();

                this.lblFranchise.Text = string.Format("CHF {0:0.00} ", m_details.Franchise);

                //this.txtBegin2.Text = DateTime.Now.ToShortDateString();
                //this.txtEnd2.Text = ((DateTime)m_details.EndDate).ToShortDateString();
                //this.lblPraemie.Text = string.Format("CHF {0:0.00} ", PraemienHelper.GetPraemieOhneMitgliederbeitrag((int)m_details.Franchise));
                //this.lblErstePraemie.Text = string.Format("CHF {0:0.00} ", PraemienHelper.GetErstePraemie((int)m_details.Franchise, (DateTime)m_details.StartDate));

                this.lblLetzteBelastung.Text = InsuranceHelper.GetLetzteBelastung(m_person).ToShortDateString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            m_user = (User)Session["user"];
            if (m_user == null)
            {
                Response.Redirect("login.aspx", true);
            }


            loadData();
            this.lblUsername.Text = string.Format("{0} {1}", m_person.GivenName, m_person.LastName);

            // load person
           
        }


        protected void btnSubmitAddress_Command(object sender, CommandEventArgs e)
        {
            Person person = null;
            using (AviertDataContext context = new AviertDataContext())
            {
                person = context.Person.SingleOrDefault(p => p.PersonId == m_person.PersonId);
                person.Co = this.txtCo.Text.Trim();
                person.Street = this.txtStreet.Text.Trim();
                person.StreetNo = this.txtStreetNo.Text.Trim();
                person.ZIP = this.txtZip.Text.Trim();
                person.City = this.txtCity.Text.Trim();
                context.SubmitChanges();
            }

            loadData();
        }

        protected void btnChangePassword_Command(object sender, CommandEventArgs e)
        {
            UserHelper.SetPassword(m_user, this.txtPassword.Text);
        }

        protected void btnLogout_Command(object sender, CommandEventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("login.aspx", true);
        }

        protected void btnChangeEnd_Command(object sender, CommandEventArgs e)
        {
            InsuranceHelper.EndInsurance(m_person, DateTime.Parse(this.txtEnd.Text));
            this.txtCancelDate.Text = ((DateTime)m_details.EndDate).ToShortDateString();
            this.lblLetzteBelastung.Text = InsuranceHelper.GetLetzteBelastung(m_person).ToShortDateString();
            loadData();
        }

        protected void btnChangeBegin_Command(object sender, CommandEventArgs e)
        {
            InsuranceDetails details = null;
            using (AviertDataContext context = new AviertDataContext())
            {
                details = context.InsuranceDetails.SingleOrDefault(d => d.DetailsId == m_details.DetailsId);
                details.StartDate = DateTime.Parse(this.txtBegin.Text);
                context.SubmitChanges();
            }
            loadData();
        }

        protected void btnCancelInsurance_Command(object sender, CommandEventArgs e)
        {
            InsuranceHelper.EndInsurance(m_person, DateTime.Parse(this.txtCancelDate.Text));
            loadData();
            this.txtEnd.Text = ((DateTime)m_details.EndDate).ToShortDateString();
            this.lblLetzteBelastung.Text = InsuranceHelper.GetLetzteBelastung(m_person).ToShortDateString();
        }
    }
}
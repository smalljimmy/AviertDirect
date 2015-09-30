using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using AviertDirect.Model;
using System.Globalization;

namespace AviertDirect.admin
{
    public partial class PersonAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.personDataSource.ConnectionString = ConfigurationManager.ConnectionStrings["AviertDirectConnectionString"].ConnectionString;
            this.personDetailsSource.ConnectionString = ConfigurationManager.ConnectionStrings["AviertDirectConnectionString"].ConnectionString;
            this.transactionsDataSource.ConnectionString = ConfigurationManager.ConnectionStrings["AviertDirectConnectionString"].ConnectionString;
            this.userDataSource.ConnectionString = ConfigurationManager.ConnectionStrings["AviertDirectConnectionString"].ConnectionString;
            this.insuranceDetailsDataSource.ConnectionString = ConfigurationManager.ConnectionStrings["AviertDirectConnectionString"].ConnectionString;
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = e.Row.Cells[0].Text.PadLeft(8, '0');
                e.Row.Cells[3].Text = Enum.GetName(typeof(TransactionStatus), int.Parse(e.Row.Cells[3].Text));
            }
        }

        protected void personDetailsView_DataBound(object sender, EventArgs e)
        {
            if (personDetailsView.Rows.Count == 0) return;

            Gender gender = (Gender)int.Parse(personDetailsView.Rows[4].Cells[1].Text);
            personDetailsView.Rows[4].Cells[1].Text = (gender == Gender.Female ? "Frau" : "Herr");

            personDetailsView.Rows[0].Cells[1].Text = personDetailsView.Rows[0].Cells[1].Text.PadLeft(8, '0');

            try
            {
                personDetailsView.Rows[7].Cells[1].Text = (new CultureInfo(personDetailsView.Rows[7].Cells[1].Text)).DisplayName;
            }
            catch (Exception ex)
            {
                // do nothing
            }

        }

        protected void userDetailsView_DataBound(object sender, EventArgs e)
        {
            if (userDetailsView.Rows.Count == 0) return;
            userDetailsView.Rows[1].Cells[1].Text = Enum.GetName(typeof(UserStatus), int.Parse(userDetailsView.Rows[1].Cells[1].Text));

            if (userDetailsView.Rows[3].Cells[1].Text.Length < 10)
            {
                userDetailsView.Rows[3].Cells[1].Text = "nie";
            }
           
        }

        protected void insuranceDetailsView_DataBound(object sender, EventArgs e)
        {
            if (insuranceDetailsView.Rows.Count == 0) return;
            insuranceDetailsView.Rows[2].Cells[1].Text = string.Format("CHF {0:0.00}", int.Parse(insuranceDetailsView.Rows[2].Cells[1].Text));

        }
    }
}
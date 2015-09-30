using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AviertDirect.Helper;

namespace AviertDirect
{
    public partial class cancel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["refno"] == null)
            {
                return;
            }

            DatatransHelper.WriteTransactionReceipt(Request);

            DatatransHelper.ConfirmTransaction(Request.Params["refno"],
                                               null,
                                               null,
                                               null,
                                               null,
                                               Request.Params["status"]);

            Response.Redirect("/index.html", true);
        }
    }
}
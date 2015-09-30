using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AviertDirect.Helper;

namespace AviertDirect
{
    public partial class error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["refno"] == null)
            {
                return;
            }

            DatatransHelper.WriteTransactionReceipt(Request);

            string message = string.Format("{0}: {1}", Request.Params["errorMessage"], Request.Params["errorDetail"]);

            DatatransHelper.ConfirmTransaction(Request.Params["refno"],
                                               null,
                                               null,
                                               null,
                                               message,
                                               Request.Params["status"]);
        }
    }
}
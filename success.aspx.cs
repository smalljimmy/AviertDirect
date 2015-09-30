using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AviertDirect.Helper;

namespace AviertDirect
{
    public partial class success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["refno"] == null)
            {
                return;
            }

            DatatransHelper.WriteTransactionReceipt(Request);

            DatatransHelper.ConfirmTransaction(Request.Params["refno"],
                                               Request.Params["uppTransactionId"],
                                               Request.Params["pmethod"],
                                               Request.Params["authorizationCode"],
                                               Request.Params["responseMessage"],
                                               Request.Params["status"]);

            DatatransHelper.CreateAlias(Request.Params["refno"],
                                        Request.Params["maskedCC"],
                                        Request.Params["aliasCC"],
                                        Request.Params["expm"],
                                        Request.Params["expy"]);
        }
    }
}
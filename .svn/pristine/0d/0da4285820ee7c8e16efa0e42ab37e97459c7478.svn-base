using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using AviertDirect.Helper;

namespace AviertDirect
{
    /// <summary>
    /// Zusammenfassungsbeschreibung für RegistrationService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class RegistrationService : System.Web.Services.WebService
    {

        [WebMethod]
        public string CheckUsername(string p_username)
        {
            string result = "ok";

            if (UserHelper.CheckIfUserExists(p_username))
            {
                result = ProposeUsername(p_username);
            }

            return (result);
        }

        [WebMethod]
        public string ProposeUsername(string p_username)
        {
            return UserHelper.ProposeUsername(p_username);
        }


        [WebMethod]
        public string GetPaymentData(int p_franchise, string p_begin, int p_paymentMethod)
        {
            string result = null;
            DateTime begin = default(DateTime);

            if (!DateTime.TryParse(p_begin, out begin))
            {
                throw new Exception("Das Datum ist ungültig");
            }

            result = string.Format("{0:0.00}|{1:0.00}|{2:0.00}",
                                   PraemienHelper.GetPraemieOhneMitgliederbeitrag(p_franchise),
                                   PraemienHelper.GetErstePraemie(p_franchise, begin, p_paymentMethod),
                                   PraemienHelper.GetPraemie(p_franchise, p_paymentMethod));
            return (result);
        }
    }
}

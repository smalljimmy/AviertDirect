using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AviertDirect.Helper
{
    public class NlsHelper
    {
        public static string GetNlsObject(string p_key, string p_language)
        {
            NlsObject nlsObj = null;
            string result = "[MISSING]";

            if (string.IsNullOrEmpty(p_key))
            {
                throw new Exception("Missing NLS key");
            }

            if (string.IsNullOrEmpty(p_language))
            {
                p_language = "de";
            }

            p_key = p_key.ToUpper();
            p_language = p_language.ToUpper();

            using (AviertDataContext context = new AviertDataContext())
            {
                nlsObj = context.NlsObject.SingleOrDefault(nls => nls.NlsKey.ToUpper().Equals(p_key) && nls.Language.ToUpper().Equals(p_language));

                if (nlsObj != null)
                {
                    result = nlsObj.Text;
                }
            }

            return (result);
        }
    }
}
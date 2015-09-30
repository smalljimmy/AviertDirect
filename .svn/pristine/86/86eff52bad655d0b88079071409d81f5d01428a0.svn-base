using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AviertDirect.Helper;

namespace AviertDirect.Controls
{
    [DefaultProperty("Key")]
    [ToolboxData("<{0}:NlsObject runat=server Key=\"\" />")]
    public class NlsObject : Label
    {
        protected string m_key = null;

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public string Key
        {
            get
            {
                return (m_key);
            }

            set
            {
                m_key = value;
            }
        }

        protected override void RenderContents(HtmlTextWriter output)
        {
            string data = string.Empty;

            
            if (this.Page.Session["debug"] != null)
            {
                data = string.Format("[{0}]:", m_key);
            }

            data += NlsHelper.GetNlsObject(m_key, (string)this.Page.Session["language"]);
            output.Write(data);
        }
    }
}

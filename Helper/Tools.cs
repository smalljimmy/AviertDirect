using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;

namespace AviertDirect.Helper
{
    public class Tools
    {
        public static void SendMail(string p_recipient, string p_subject, string p_text)
        {
            SendMail(p_recipient, p_subject, p_text, false);
        }

        public static void SendMail(string p_recipient, string p_subject, string p_text, bool p_isHtml)
        {
            SmtpClient smtpClient = new SmtpClient();
            NetworkCredential basicCredential = new NetworkCredential("tom", "_1nn0v4t10n");
            MailMessage message = new MailMessage();
            MailAddress fromAddress = new MailAddress("noreply@aviertdirect.ch");

            smtpClient.Host = "server01.lionsdomain.com";
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = basicCredential;

            message.From = fromAddress;
            message.Subject = p_subject;
            message.IsBodyHtml = true;
            message.Body = p_text;
            message.To.Add(p_recipient);

            try
            {
                smtpClient.Send(message);
            }
            catch (Exception ex)
            {
                //Error, could not send the message
            }
        }
    }
}
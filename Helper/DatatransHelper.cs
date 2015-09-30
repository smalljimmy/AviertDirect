using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AviertDirect.Model;
using System.Web.UI;
using System.IO;
using System.Collections;
using System.Configuration;
using System.Xml;
using System.Net;

namespace AviertDirect.Helper
{
    public class DatatransHelper
    {
        public static bool TestMode
        {
            get 
            {
                return (bool.Parse(ConfigurationManager.AppSettings["TestMode"]));
            }
        }

        public static void BatchExecuteTransactions(IEnumerable<DatatransTransaction> p_transactions)
        {
            string xml_request = null;

            foreach (DatatransTransaction transaction in p_transactions)
            {
                transaction.Status = (short)TransactionStatus.Pending;
            }

            using (AviertDataContext context = new AviertDataContext())
            {
                context.DatatransTransaction.InsertAllOnSubmit(p_transactions);
                context.SubmitChanges();
            }

            foreach (DatatransTransaction transaction in p_transactions)
            {
                xml_request = GetXmlTransaction(transaction);
                DoWebRequest(xml_request);
            }
        }

        public static DatatransTransaction CreateTransaction(InsuranceDetails p_details, double p_amount)
        {
            DatatransTransaction transaction = null;

            transaction = new DatatransTransaction()
            {
                DetailsId = p_details.DetailsId,
                Amount = (decimal)p_amount,
                Status = (int)TransactionStatus.Pending,
                InsDate = DateTime.Now
            };

            using (AviertDataContext context = new AviertDataContext())
            {
                context.DatatransTransaction.InsertOnSubmit(transaction);
                context.SubmitChanges();
            }

            return (transaction);
        }

        public static void ConfirmTransaction(string p_transaction,
                                              string p_uppTransactionId,
                                              string p_pmethod,
                                              string p_authorizationCode,
                                              string p_responseMessage,
                                              string p_status)
        {
            DatatransTransaction transaction = null;
            long id = 0;
            TransactionStatus status = TransactionStatus.Unknown;

            if ("success".Equals(p_status))
            {
                status = TransactionStatus.Authorized;
            }
            else if ("error".Equals(p_status))
            {
                status = TransactionStatus.Rejected;
            }
            else if ("cancel".Equals(p_status))
            {
                status = TransactionStatus.Cancelled;
            }

            p_transaction = p_transaction.TrimStart('0');
            id = long.Parse(p_transaction);

            using (AviertDataContext context = new AviertDataContext())
            {
                transaction = context.DatatransTransaction.Single(t => t.TransactionId == id);
                transaction.DT_uppTransactionId = p_uppTransactionId;
                transaction.DT_pmethod = p_pmethod;
                transaction.DT_authorizationCode = p_authorizationCode;
                transaction.DT_responseMessage = p_responseMessage;
                transaction.Status = (short)status;
                context.SubmitChanges();
            }
        }

        public static string RequestParamsToString(HttpRequest p_request)
        {
            string datatrans_response = string.Empty;

            datatrans_response += string.Format("{0}: {1}\r\n", "timestamp".PadRight(20, '.'), DateTime.Now.ToString());

            foreach (string key in p_request.Params)
            {
                if (Char.IsLower(key[0]))
                {
                    datatrans_response += string.Format("{0}: {1}\r\n", key.PadRight(20, '.'), p_request.Params[key]);
                }
            }

            return (datatrans_response);
        }

        public static void WriteTransactionReceipt(HttpRequest p_request)
        {
            string data = null;
            string filename = null;
            TextWriter writer = null;

            filename = string.Format(@"c:\AviertDirect\Transactions\{0}.log", p_request.Params["refno"]);

            data = RequestParamsToString(p_request);

            writer = new StreamWriter(filename);
            writer.Write(data);
            writer.Close();
        }

        public static void DoWebRequest(string p_xml)
        {
            string url = "xx";
            XmlDocument XMLResponse = null;
            HttpWebRequest objHttpWebRequest;
            HttpWebResponse objHttpWebResponse = null;
            Stream objRequestStream = null;
            Stream objResponseStream = null;
            XmlTextReader objXMLReader;

            objHttpWebRequest = (HttpWebRequest)WebRequest.Create(url);

            try
            {
                byte[] bytes;
                bytes = System.Text.Encoding.ASCII.GetBytes(p_xml);
                objHttpWebRequest.Method = "POST";
                objHttpWebRequest.ContentLength = bytes.Length;
                objHttpWebRequest.ContentType = "text/xml; encoding='utf-8'";
                objRequestStream = objHttpWebRequest.GetRequestStream();

                objRequestStream.Write(bytes, 0, bytes.Length);

                objRequestStream.Close();

                objHttpWebResponse = (HttpWebResponse)objHttpWebRequest.GetResponse();

                if (objHttpWebResponse.StatusCode == HttpStatusCode.OK)
                {
                    objResponseStream = objHttpWebResponse.GetResponseStream();
                    objXMLReader = new XmlTextReader(objResponseStream);
                    XmlDocument xmldoc = new XmlDocument();
                    xmldoc.Load(objXMLReader);
                    XMLResponse = xmldoc;
                    objXMLReader.Close();
                }

                objHttpWebResponse.Close();
            }
            catch (WebException we)
            {
                throw new Exception(we.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                objRequestStream.Close();
                objResponseStream.Close();
                objHttpWebResponse.Close();

                objXMLReader = null;
                objRequestStream = null;
                objResponseStream = null;
                objHttpWebResponse = null;
                objHttpWebRequest = null;
            }
        }

        public static string GetXmlTransaction(DatatransTransaction p_transaction)
        {
            CreditCardAlias alias = null;
            string transaction_id = null;
            double amount = 0.00;

            transaction_id = p_transaction.TransactionId.ToString();
            transaction_id = transaction_id.PadLeft(8, '0');

            amount = (double)p_transaction.Amount;

            if (TestMode)
            {
                amount = 1.00;
            }

            using (AviertDataContext context = new AviertDataContext())
            {
                alias = context.CreditCardAlias.Single(a => a.InsuranceId == p_transaction.DetailsId);
            }

            string xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>" + 
                         "<authorizationService version=\"1\">" +
                         "<body merchantId=\"3000005923\">" +
                         "<transaction refno=\"" + transaction_id + "\">" + 
                         "<request>" + 
                         "<amount>" + (int)(amount / 100) + "</amount>" + 
                         "<currency>CHF</currency>" + 
                         "<aliasCC>" + alias.Alias + "</aliasCC>" + 
                         "<expm>" + alias.ExpirationMonth + "</expm>" + 
                         "<expy>" + alias.ExpirationYear + "</expy>" + 
                         "</request>" + 
                         "</transaction>" + 
                         "</body>" +
                         "</authorizationService>";

            return (xml);

        }

   
        public static string PrepareForm(DatatransTransaction p_transaction, string rootUrl)
        {
            StringWriter writer = null;
            string transationId = null;

            writer = new StringWriter();
            transationId = p_transaction.TransactionId.ToString();
            transationId = transationId.PadLeft(8, '0');

            if (TestMode)
            {
                p_transaction.Amount = new Decimal(1.00); ;
            }

            writer.WriteLine("<html><head></head><body onload=\"document.datatrans.submit()\">");
            writer.WriteLine("<form name='datatrans' id='datatrans' action='https://payment.datatrans.biz/upp/jsp/upStart.jsp' method='post'>");
            writer.WriteLine("<input type='hidden' name='merchantId' value='3000004038'>");  //5923 = xml
            writer.WriteLine(string.Format("<input type='hidden' name='amount' value='{0}'>", (int)p_transaction.Amount * 100));
            writer.WriteLine("<input type='hidden' name='currency' value='CHF'>");
            writer.WriteLine("<input type='hidden' name='useAlias' value='yes'>");
            writer.WriteLine(string.Format("<input type='hidden' name='refno' value='{0}'>", transationId));
            writer.WriteLine("<input type='hidden' 'name='successUrl' value='{0}success.aspx'>", rootUrl);
            writer.WriteLine("<input type='hidden' 'name='errorUrl' value='{0}error.aspx'>", rootUrl);
            writer.WriteLine("<input type='hidden' 'name='cancelUrl' value='{0}cancel.aspx'>", rootUrl);
            writer.WriteLine("</form></body></html>");

            return (writer.ToString());
        }

        public static DatatransTransaction GetFirstTransaction(Person p_person)
        {
            DatatransTransaction result = null;
            InsuranceDetails details = null;

            details = UserHelper.GetInsuranceDetails(p_person);

            using (AviertDataContext context = new AviertDataContext())
            {
                result = context.DatatransTransaction.First(t => t.DetailsId == details.DetailsId);
            }

            return (result);
        }

        public static DatatransTransaction GetLastTransaction(Person p_person)
        {
            DatatransTransaction result = null;
            InsuranceDetails details = null;
            IEnumerable<DatatransTransaction> transactions = null;

            details = UserHelper.GetInsuranceDetails(p_person);

            using (AviertDataContext context = new AviertDataContext())
            {
                transactions = context.DatatransTransaction.Where(t => t.DetailsId == details.DetailsId);
                result = transactions.Last();
            }

            return (result);
        }

        public static void CreateAlias(string p_transactionRef, string p_masked, string p_alias, string p_expMonth, string p_expYear)
        {
            DatatransTransaction transaction = null;
            long id = -1;

            p_transactionRef = p_transactionRef.TrimStart('0');
            id = long.Parse(p_transactionRef);

            using (AviertDataContext context = new AviertDataContext())
            {
                transaction = context.DatatransTransaction.Single(t => t.TransactionId == id);

                CreditCardAlias alias = new CreditCardAlias()
                {
                    Alias = p_alias,
                    MaskedCcNumber = p_masked,
                    ExpirationMonth = int.Parse(p_expMonth),
                    ExpirationYear = int.Parse(p_expYear),
                    InsuranceId = (int)transaction.DetailsId
                };

                context.CreditCardAlias.InsertOnSubmit(alias);
                context.SubmitChanges();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AviertDirect.Model;
using System.IO;

namespace AviertDirect.Helper
{
    public class BillingHelper
    {
        public static void DoBillRun()
        {
            IEnumerable<InsuranceDetails> full_billing_accounts = null;
            IEnumerable<InsuranceDetails> partial_billing_accounts = null;
            List<DatatransTransaction> transactions = null;
            DatatransTransaction transaction = null;
            double partial_amount = 0.00;
            int days_to_bill = 0;
            int paymentMethod = 0;

            full_billing_accounts = GetInsurancesToBillFull();
            partial_billing_accounts = GetInsurancesToBillPartially();
            transactions = new List<DatatransTransaction>();

            // Normale Belastung. Versicherungsende liegt in der Zukunft (nicht im aktuellen Monat)
            foreach (InsuranceDetails details in full_billing_accounts)
            {
                transaction = new DatatransTransaction()
                {
                    Amount = (Decimal)PraemienHelper.GetPraemie((int)details.Franchise, paymentMethod),
                    DetailsId = details.DetailsId
                };
                transactions.Add(transaction);
            }

            // Teilweise Belastung. Versicherungsende im aktuellen Monat
            foreach (InsuranceDetails details in partial_billing_accounts)
            {
                days_to_bill = details.EndDate.Value.Day;
                partial_amount = PraemienHelper.GetPraemie((int)details.Franchise, paymentMethod) / 30 * days_to_bill;

                transaction = new DatatransTransaction()
                {
                    Amount = (Decimal)partial_amount,
                    DetailsId = details.DetailsId
                };
                transactions.Add(transaction);
            }

            DatatransHelper.BatchExecuteTransactions(transactions);
        }

        protected static IEnumerable<InsuranceDetails> GetInsurancesToBillFull()
        {
            IEnumerable<InsuranceDetails> details_list = null;

            using (AviertDataContext context = new AviertDataContext())
            {
                details_list = context.InsuranceDetails.Where(id => id.Status == (int)InsuranceStatus.Active &&
                                                              (id.EndDate == null || (id.EndDate > DateTime.Now && id.EndDate.Value.Month != DateTime.Now.Month && id.EndDate.Value.Year != DateTime.Now.Year)));
                                                               
            }

            return (details_list);
        }

        protected static IEnumerable<InsuranceDetails> GetInsurancesToBillPartially()
        {
            IEnumerable<InsuranceDetails> details_list = null;

            using (AviertDataContext context = new AviertDataContext())
            {
                details_list = context.InsuranceDetails.Where(id => id.Status == (int)InsuranceStatus.Active &&
                                                                    id.EndDate != null &&
                                                                    id.EndDate.Value.Month == DateTime.Now.Month &&
                                                                    id.EndDate.Value.Year == DateTime.Now.Year);

            }

            return (details_list);
        }

        public static void InformAboutExpiringCreditCards()
        {
            DateTime nextMonth = DateTime.Now.AddMonths(1);
            IEnumerable<CreditCardAlias> aliases2expire = null;
            string mail_template = null;
            string message = null;
            Person person = null;
            InsuranceDetails details = null;

            mail_template = File.ReadAllText(AppDomain.CurrentDomain.BaseDirectory + @"\MailTemplate\cc_expire.html");

            using (AviertDataContext context = new AviertDataContext())
            {
                aliases2expire = context.CreditCardAlias.Where(a => a.ExpirationMonth == nextMonth.Month && a.ExpirationYear == nextMonth.Year);
            }

            foreach (CreditCardAlias alias in aliases2expire)
            {
                using (AviertDataContext context = new AviertDataContext())
                {
                    details = context.InsuranceDetails.Single(d => d.DetailsId == alias.InsuranceId);
                    person = context.Person.Single(p => p.PersonId == details.PersonId);
                }

                message = mail_template.Replace("[name]", string.Format("{0} {1}", person.GivenName, person.LastName));
                Tools.SendMail(person.EMail, "Ablauf Ihrer Kreditkarte", message, true);
            }
        }
    }
}
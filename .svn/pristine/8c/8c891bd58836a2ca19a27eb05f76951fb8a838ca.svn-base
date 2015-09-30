using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AviertDirect.Model;

namespace AviertDirect.Helper
{
    public class InsuranceHelper
    {
        public static void BeginInsurance(Person p_person, DateTime p_start, DateTime p_end, int p_franchise, int p_paymentMethod)
        {
            InsuranceDetails details = null;
            double erstePraemie = 0.00;

            if (p_end < p_start)
            {
                throw new Exception("Enddatum liegt vor dem Startdatum");
            }

            using (AviertDataContext context = new AviertDataContext())
            {
                // Start- und Enddatum setzen
                details = context.InsuranceDetails.Single(d => d.PersonId == p_person.PersonId);
                details.StartDate = p_start;
                details.EndDate = p_end;
                details.Franchise = p_franchise;
                details.Status = (int)InsuranceStatus.Pending;

                // Aenderungen uebernehmen
                context.SubmitChanges();
            }

            erstePraemie = PraemienHelper.GetErstePraemie((int)details.Franchise, (DateTime)details.StartDate, p_paymentMethod);

            DatatransHelper.CreateTransaction(details, erstePraemie);
        }

        public static void EndInsurance(Person p_person, DateTime p_endDate)
        {
            InsuranceDetails details = null;

            using (AviertDataContext context = new AviertDataContext())
            {
                // Enddatum setzen
                details = context.InsuranceDetails.SingleOrDefault(d => d.PersonId == p_person.PersonId);
                details.EndDate = p_endDate;
                details.Status = (int)InsuranceStatus.Terminated;

                // Aenderungen uebernehmen
                context.SubmitChanges();
            }
        }

        public static DateTime GetLetzteBelastung(Person p_person)
        {
            DateTime result = default(DateTime);
            DatatransTransaction transaction = null;
            InsuranceDetails details = null;

            details = UserHelper.GetInsuranceDetails(p_person);

            result = (DateTime)details.EndDate;
            result = new DateTime(result.Year, result.Month, 1);

            if (details.EndDate < DateTime.Now)
            {
                transaction = DatatransHelper.GetLastTransaction(p_person);
                if (transaction != null)
                {
                    result = (DateTime)transaction.InsDate;
                }
            }

            return (result);
        }

        public static void InactivateExpiresInsurances()
        {
            IEnumerable<InsuranceDetails> expiredInsurances = null;

            using (AviertDataContext context = new AviertDataContext())
            {
                expiredInsurances = context.InsuranceDetails.Where(d => d.Status == (int)InsuranceStatus.Active && (d.EndDate != null && d.EndDate < DateTime.Now));

                foreach (InsuranceDetails details in expiredInsurances)
                {
                    details.Status = (int)InsuranceStatus.Terminated;
                }

                context.SubmitChanges();
            }
        }
    }
}
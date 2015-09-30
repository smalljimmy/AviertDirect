using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AviertDirect.Model;

namespace AviertDirect.Helper
{
    public class PraemienHelper
    {
        public static double MITGLIEDERBEITRAG = 30.00; // Mitgliederbeitrag in den Folgemonaten (regulaere Praemie)
        public static double MITGLIEDERBEITRAG_ERSTER_MONAT = 40.00; // Mitgliederbeitrag fuer die erste Praemie

        /// <summary>
        /// Diese Methode berechnet die Monatspraemie. Der Mitgliederbeitrag ist hier noch NICHT enthalten.
        /// </summary>
        /// <param name="p_franchise">Zu Grunde liegende Franchise</param>
        /// <returns>Die Monatspraemie ohne Mitgliederbeitrag</returns>
        public static double GetPraemieOhneMitgliederbeitrag(int p_franchise)
        {
            double result = 0.00;

            // Monatspraemie bestimmen auf Grund der Franchise
            switch (p_franchise)
            {
                case 300:
                    // Wenn Franchise = 300 dann Monatspraemie 215.05
                    result = 215.05;
                    break;
                case 500:
                    // Wenn Franchise = 500 dann Monatspraemie 201.25
                    result = 201.25;
                    break;
                case 1000:
                    // Wenn Franchise = 1000 dann Monatspraemie 177.05
                    result = 177.05;
                    break;
                case 1500:
                    // Wenn Franchise = 1500 dann Monatspraemie 149.95
                    result = 149.95;
                    break;
                default:
                    // Falls aus unerfindlichen Gruenden eine andere Franchise angeflogen kommt soll eine 
                    // Fehlermeldung ausgegeben werden
                    throw new Exception("Fuer diese Franchise kann keine Praemie berechnet werden");
            }

            return (result);
        }

        /// <summary>
        /// Diese Methode berechnet die Praemie im ersten Monat. Falls die Versicherung rueckwirkend
        /// abgeschlossen wird, wird die Anzahl bereits vergangener Monate beruecksichtigt.
        /// </summary>
        /// <param name="p_franchise">Zu Grunde liegende Franchise</param>
        /// <param name="p_begin">Datum an welchem die Versicherung beginnen soll</param>
        /// <param name="p_paymentMethod">Zahlungsart</param>
        /// <returns>Die erste zu belastende Praemie</returns>
        public static double GetErstePraemie(int p_franchise, DateTime p_begin, int p_paymentMethod)
        {
            double praemie = 0.00;
            int vorhergehendeMonate = 0;

            // Monatspraemie berechnen
            praemie = PraemienHelper.GetPraemieOhneMitgliederbeitrag(p_franchise);
            // Tagespraemie: Ergibt sich durch die Annahme ein Monat entspricht 30 Tagen. Gesamtpraemie durch 30 dividieren ergibt Tagespraemie
            double tagespraemie = praemie / 30;
            // Resttage: 30 Tage - Tag des Beginndatums plus 1
            int resttage = 30 - p_begin.Day + 1;
            // Erste Praemie: Anzahl Resttage * Tagespraemie plus 40 Franken im ersten Monat
            double erstePraemie = (resttage * tagespraemie) + MITGLIEDERBEITRAG_ERSTER_MONAT;

            // Minimum-Praemie pruefen je nach Franchise und ggf.korrigieren
            switch (p_franchise)
            {
                case 300:
                    // Wenn Franchise = 300 und die erste Praemie weniger als 47.20 ist, erste Praemie auf 47.20 setzen
                    if (erstePraemie < 47.20) erstePraemie = 47.20;
                    break;
                case 500:
                    // Wenn Franchise = 500 und die erste Praemie weniger als 46.75 ist, erste Praemie auf 46.75 setzen
                    if (erstePraemie < 46.75) erstePraemie = 46.74;
                    break;
                case 1000:
                    // Wenn Franchise = 1000 und die erste Praemie weniger als 45.90 ist, erste Praemie auf 45.90 setzen
                    if (erstePraemie < 45.90) erstePraemie = 45.90;
                    break;
                case 1500:
                    // Wenn Franchise = 1500 und die erste Praemie weniger als 45.00 ist, erste Praemie auf 45.00 setzen
                    if (erstePraemie < 45.00) erstePraemie = 45.00;
                    break;
                default:
                    // Falls aus unerfindlichen Gruenden eine andere Franchise angeflogen kommt soll eine 
                    // Fehlermeldung ausgegeben werden
                    throw new Exception("Fuer diese Franchise kann keine Praemie berechnet werden");
            }

            // Zuschlag
            erstePraemie += GetZuschlag(PraemienHelper.GetPraemieOhneMitgliederbeitrag(p_franchise), p_paymentMethod);

            // Erste Praemie auf 5 Rappen runden
            erstePraemie = Round(erstePraemie);

            // Anzahl bereits vergangener Monate seit dem Beginn-Datum berechnen
            vorhergehendeMonate = (DateTime.Now.Year * 12 + DateTime.Now.Month) - (p_begin.Year * 12 + p_begin.Month);
            if (vorhergehendeMonate > 0)
            {
                // Wenn das Beginn-Datum nicht im aktuellen Monat liegt, zur ersten Praemie jeweils die Praemien fuer die
                // bereits ins Land gegeangenen Monate addieren
                erstePraemie = erstePraemie + (vorhergehendeMonate * GetPraemie(p_franchise, p_paymentMethod));
            }

            return (erstePraemie);
        }

        /// <summary>
        /// Diese Methode berechnet die effektive Praemie fuer die Folgemonate. Dabei wird der Mitgliederbeitrag
        /// von CHF 30.00 beruecksichtigt.
        /// </summary>
        /// <param name="p_franchise">Zu Grunde liegende Franchise</param>
        /// <param name="p_paymentMethod">Zahlungsart</param>
        /// <returns>Monatspraemie inkl. Mitgliederbeitrag</returns>
        public static double GetPraemie(int p_franchise, int p_paymentMethod)
        {
            double praemie = 0.00;

            // Monatspraemie berechnen und 30 Franken Mitgliederbeitrag addieren
            praemie = GetPraemieOhneMitgliederbeitrag(p_franchise) + MITGLIEDERBEITRAG;
            praemie += GetZuschlag(praemie, p_paymentMethod);
            // Erste Praemie auf 5 Rappen runden
            praemie = Round(praemie);
            return (praemie);
        }




                /// <summary>
        /// Diese Methode berechnet den Zuschlag je nach Zahlungsart.
        /// </summary>
        /// <param name="p_franchise">Zu Grunde liegende Prämie</param>
        /// <param name="p_paymentMethod">Zahlungsart</param>
        /// <returns>Zuschlag</returns>
        public static double GetZuschlag(double p_praemie, int p_paymentMethod)
        {
            double zuschlag = 0.00;
            // Zuschlag für Zahlungsart
            switch (p_paymentMethod) {
                case (int)PaymentMethod.VisaDebit:
                    zuschlag = 1.8;
                    break;
                case (int)PaymentMethod.PostFinance:
                    zuschlag = 6.0;
                    break;
                case (int)PaymentMethod.PayPal:
                    zuschlag = p_praemie * 0.04;
                    break;
            }

            return (zuschlag);
        }


        /// <summary>
        /// Methode zur Rundung der Betraege. Praezision ist auf 5 Rappen.
        /// </summary>
        /// <param name="p_value">Zu rundender Betrag</param>
        /// <returns>Gerundeter Betrag</returns>
        public static double Round(double p_value)
        {
            decimal invalue = Convert.ToDecimal(p_value);
            decimal ganzzahl = Math.Truncate(invalue);
            decimal zehner = (int)((invalue - ganzzahl) * 10);
            decimal nachkomma = (int)((invalue - ganzzahl) * 100);

            zehner *= 10;

            decimal diff = nachkomma - zehner;

            if (diff != 0)
            {
                if (diff <= 5)
                    zehner += 10;
                else
                    zehner += 5;
            }

            return (double)(ganzzahl + zehner / 100);
        }
    }
}
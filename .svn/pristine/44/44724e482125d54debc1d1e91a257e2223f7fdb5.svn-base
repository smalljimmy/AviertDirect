using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using AviertDirect.Model;

namespace AviertDirect.Helper
{
    public class UserHelper
    {
        public static User GetUser(string p_username)
        {
            User user = null;

            using (AviertDataContext context = new AviertDataContext())
            {
                user = context.User.SingleOrDefault(u => u.Username.Equals(p_username));
            }

            return (user);
        }

        public static Person GetPerson(User p_user)
        {
            Person person = null;

            using (AviertDataContext context = new AviertDataContext())
            {
                person = context.Person.SingleOrDefault(p => p.UserId == p_user.UserId);
            }

            return (person);
        }

        public static InsuranceDetails GetInsuranceDetails(Person p_person)
        {
            InsuranceDetails details = null;

            using (AviertDataContext context = new AviertDataContext())
            {
                details = context.InsuranceDetails.SingleOrDefault(d => d.PersonId == p_person.PersonId);
            }

            return (details);
        }


        public static bool CheckPassword(string p_username, string p_password)
        {   
            bool passwordCorrect = false;
            User user = null;
            string encryptedPassword = null;

            using (AviertDataContext context = new AviertDataContext())
            {
                user = context.User.SingleOrDefault(u => u.Username.Equals(p_username));

                if (user != null)
                {
                    encryptedPassword = EncryptPassword(p_password);
                    if (user.Password.Equals(encryptedPassword))
                    {
                        passwordCorrect = true;
                    }
                }
            }

            return (passwordCorrect);
        }

        public static bool CheckIfUserExists(string p_username) 
        {
            bool exists = false;
            User user = null;

            if (string.IsNullOrEmpty(p_username)) return exists;
            p_username = p_username.Trim();

            using (AviertDataContext context = new AviertDataContext())
            {
                user = context.User.SingleOrDefault(u => u.Username.Equals(p_username));
                if (user != null)
                {
                    exists = true;
                }
            }

            return (exists);
        }

        public static void CreatePerson(ref Person p_person)
        {
            using (AviertDataContext context = new AviertDataContext())
            {
                context.Person.InsertOnSubmit(p_person);
                context.SubmitChanges();
            }
        }

        public static void UpdateLastLogin(User p_user)
        {
            User user = null;
            using (AviertDataContext context = new AviertDataContext())
            {
                user = context.User.SingleOrDefault(u => u.UserId == p_user.UserId);
                user.LastLogin = DateTime.Now;
                context.SubmitChanges();
            }   
        }

        public static InsuranceDetails CreateInsuranceDetails(Person p_person)
        {
            InsuranceDetails details = null;

            details = new InsuranceDetails()
            {
                PersonId = p_person.PersonId,
                InsertDate = DateTime.Now,
                Status = (int)InsuranceStatus.Created
            };

            using (AviertDataContext context = new AviertDataContext())
            {
                context.InsuranceDetails.InsertOnSubmit(details);
                context.SubmitChanges();
            }

            return (details);
        }

        public static void CreateUser(ref User p_user)
        {
            if (string.IsNullOrEmpty(p_user.Username) || string.IsNullOrEmpty(p_user.Password))
            {
                throw new Exception("Fehler beim Erstellen des Benutzers.");
            }

            if (CheckIfUserExists(p_user.Username))
            {
                throw new Exception("Der Benutzer existiert bereits.");
            }

            p_user.Password = EncryptPassword(p_user.Password);
            p_user.Status = (int)UserStatus.Created;
            p_user.CreationDate = DateTime.Now;
            p_user.PasswordDate = DateTime.Now;


            using (AviertDataContext context = new AviertDataContext())
            {
                context.User.InsertOnSubmit(p_user);
                context.SubmitChanges();
            }
        }

        public static void SetPassword(User p_user, string p_password)
        {
            User user = null;

            using (AviertDataContext context = new AviertDataContext())
            {
                user = context.User.SingleOrDefault(u => u.UserId == p_user.UserId);
                user.Password = EncryptPassword(p_password);
                user.PasswordDate = DateTime.Now;
                context.SubmitChanges();
            }
        }

        private static string EncryptPassword(string p_password)
        {
            p_password =string.Format("+CO4$Zn{0}ijeWTrh#", p_password);
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] textToHash = Encoding.Default.GetBytes(p_password);
            byte[] result = md5.ComputeHash(textToHash);
            string pw = BitConverter.ToString(result);
            pw = pw.Replace("-", string.Empty);

            return (pw);
        }

        public static string ProposeUsername(string p_username)
        {
            int loopCount = 0;
            string username = p_username;

            while (CheckIfUserExists(username))
            {
                loopCount++;
                username = string.Format("{0}{1}", p_username, loopCount);
            }

            return (username);
        }


        public static string CreateRandomPassword(int passwordLength)
        {
            string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789!@$?_-";
            char[] chars = new char[passwordLength];
            Random rd = new Random();

            for (int i = 0; i < passwordLength; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }

            return new string(chars);
        }
    }
}
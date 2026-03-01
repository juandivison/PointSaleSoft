using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.IO;

using System.Xml.Linq;
using System.Net.Mail;
using System.Net.Mime;


namespace Core.NET.Command.Email
{
    public class ToEmialSend
    {
        public string Atach { get; set; }
        public string From { get; set; }
        public string To { get; set; }
        public string CC { get; set; }
        public string BCC { get; set; }
        public string Sobject { get; set; }
        public string Body { get; set; }
        public string Bod { get; set; }
        public Boolean IsHml { get; set; }
        public Int16 Port { get; set; }
        public string HostName { get; set; }
        public string EmailUser { get; set; }
        public string EmailPass { get; set; }
        public Boolean EnableSsl { get; set; }
    }
    public class cEmail
    {
        public static Boolean EnableSsl = true;
        private static string[] aLista;
        public static Boolean SendEmailAction(ToEmialSend EmailSend)
        {

            try
            {
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.To.Clear();

                foreach (var item in EmailSend.To.Split(';'))
                {
             
                    mail.To.Add(item); 
                }

                mail.CC.Clear();
                foreach (var item in EmailSend.CC.Split(';'))
                {
                   
                    mail.CC.Add(item);
                }

                mail.Bcc.Clear();

                foreach (var item in EmailSend.BCC.Split(';'))
                {
                   
                    mail.Bcc.Add(item);
                    
                }


                mail.From = new System.Net.Mail.MailAddress(EmailSend.From);
                mail.Subject = EmailSend.Sobject;
                //string Body = "<b>Welcome to CodeDigest.Com!!</b>";
                mail.Body = EmailSend.Body;
                mail.IsBodyHtml = EmailSend.IsHml;


                Attachment Data;
                if (!(EmailSend.Atach.Trim() == "") )
                {
                    aLista = EmailSend.Atach.Split(';');
                    for (int idx = 0; idx < aLista.Length; idx++)
                    {
                        if (aLista[idx] == "")
                            continue;
                        Data = new Attachment(aLista[idx], MediaTypeNames.Application.Octet);
                        mail.Attachments.Add(Data);
                    }
                }
                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
                smtp.Host = EmailSend.HostName;

                smtp.Credentials = new System.Net.NetworkCredential(EmailSend.EmailUser, EmailSend.EmailPass);
                smtp.Port = EmailSend.Port;
                smtp.EnableSsl = EnableSsl;
                smtp.Send(mail);

                return true;

            }
            catch (Exception ex)
            {
                //File.WriteAllText("EmailsLog.txt", ex.Message);
                return false;
                //throw;
            }
        }
        /*
        public static ctrMessages SendEmail(ToEmialSend EmailSend)
        {
            ctrMessages sendError = new ctrMessages();
            sendError.Success = false;
            sendError.Messages = "";
            sendError.Code = "EML001";
            try
            {


                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.To.Clear();
                foreach (var item in EmailSend.To.Split(';'))
                {

                    mail.To.Add(item);
                }
                mail.From = new System.Net.Mail.MailAddress(EmailSend.From);
                mail.Subject = EmailSend.Sobject;
                //string Body = "<b>Welcome to CodeDigest.Com!!</b>";
                mail.Body = EmailSend.Body;
                mail.IsBodyHtml = EmailSend.IsHml;
                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
                smtp.Host = EmailSend.HostName;
                smtp.Credentials = new System.Net.NetworkCredential(EmailSend.EmailUser, EmailSend.EmailPass);
                smtp.Port = EmailSend.Port;
                smtp.EnableSsl = false;
                smtp.Send(mail);
                sendError.Success = true;
                sendError.Messages = "Email sent";
                sendError.Code = "EML002";

            }
            catch (Exception ex)
            {
                sendError.Success = false;
                sendError.Messages = ex.Message; ;
                sendError.Code = "EML003";
                //throw;
            }
            return sendError;
        }
        */
    }
}

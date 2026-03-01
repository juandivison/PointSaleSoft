using Core.NET.Command.Email;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
namespace Emails
{
    public partial class Form1 : Form
    {
        private string[] FAttachentList;
        public Form1()
        {
            InitializeComponent();
        }
        public Form1(string[] args)
        {
            InitializeComponent();
            SendEmail(args);

        }

        private void SendEmail()
        {

            if (VariablesGlobales.Host == "@hotmail.com")
            {
                ToEmialSend prm = new ToEmialSend();
                prm.To = txtTo.Text;
                prm.From = VariablesGlobales.username + VariablesGlobales.Host;
                prm.HostName = "smtp.live.com";
                prm.Port = 587;
                prm.EmailUser = VariablesGlobales.username + VariablesGlobales.Host;
                prm.EmailPass = VariablesGlobales.password;
                prm.IsHml = true;
                prm.CC = txtBCC.Text;
                prm.BCC = txtBCC.Text;
                prm.Sobject = txtSobject.Text;
                prm.Body = txtBody.Text;
                prm.Atach = txtAttach.Text;
                cEmail.EnableSsl = true;
                cEmail.SendEmailAction(prm);
                
                if (cEmail.SendEmailAction(prm))
                {
                    MessageBox.Show("Mensaje enviado");

                }
                else
                    MessageBox.Show("Error al enviar el mensaje, verifique los datos");
                txtTo.Clear();
                txtCC.Clear();
                txtBCC.Clear();
                txtSobject.Clear();
                txtAttach.Clear();
                txtBody.Clear();
            }
            if (VariablesGlobales.Host == "@gmail.com")
            {
                ToEmialSend prm = new ToEmialSend();
                prm.To = txtTo.Text;
                prm.From = VariablesGlobales.username + VariablesGlobales.Host;
                prm.HostName = "smtp.gmail.com";
                prm.Port = 587;
                prm.EmailUser = VariablesGlobales.username + VariablesGlobales.Host;
                prm.EmailPass = VariablesGlobales.password;
                prm.IsHml = true;
                prm.CC = txtBCC.Text;
                prm.BCC = txtBCC.Text;
                prm.Sobject = txtSobject.Text;
                prm.Body = txtBody.Text;
                prm.Atach = txtAttach.Text;
                cEmail.EnableSsl = true;
                cEmail.SendEmailAction(prm);
                if (cEmail.SendEmailAction(prm))
                    MessageBox.Show("Mensaje enviado");
                else
                    MessageBox.Show("Error al enviar el mensaje verifique los datos");
                txtTo.Clear();
                txtCC.Clear();
                txtBCC.Clear();
                txtSobject.Clear();
                txtAttach.Clear();
                txtBody.Clear();
            }

            if (VariablesGlobales.Host == "@outlook.com")
            {
                ToEmialSend prm = new ToEmialSend();
                prm.To = txtTo.Text;
                prm.From = VariablesGlobales.username + VariablesGlobales.Host;
                prm.HostName = "smtp-mail.outlook.com";
                prm.Port = 587;
                prm.EmailUser = VariablesGlobales.username + VariablesGlobales.Host;
                prm.EmailPass = VariablesGlobales.password;
                prm.IsHml = true;
                prm.CC = txtBCC.Text;
                prm.BCC = txtBCC.Text;
                prm.Sobject = txtSobject.Text;
                prm.Body = txtBody.Text;
                prm.Atach = txtAttach.Text;
                cEmail.EnableSsl = true;
                cEmail.SendEmailAction(prm);
                if (cEmail.SendEmailAction(prm))
                    MessageBox.Show("Mensaje enviado");
                else
                    MessageBox.Show("Error al enviar el mensaje verifique los datos");
                txtTo.Clear();
                txtCC.Clear();
                txtBCC.Clear();
                txtSobject.Clear();
                txtAttach.Clear();
                txtBody.Clear();

            }

            if (VariablesGlobales.Host == "@yahoo.com")
            {
                ToEmialSend prm = new ToEmialSend();
                prm.To = txtTo.Text;
                prm.From = VariablesGlobales.username + VariablesGlobales.Host;
                prm.HostName = "smtp.mail.yahoo.com";
                prm.Port = 587;
                prm.EmailUser = VariablesGlobales.username + VariablesGlobales.Host;
                prm.EmailPass = VariablesGlobales.password;
                prm.IsHml = true;
                prm.CC = txtBCC.Text;
                prm.BCC = txtBCC.Text;
                prm.Sobject = txtSobject.Text;
                prm.Body = txtBody.Text;
                prm.Atach = txtAttach.Text;
                cEmail.EnableSsl = true;
                cEmail.SendEmailAction(prm);
                if (cEmail.SendEmailAction(prm))
                    MessageBox.Show("Mensaje enviado");
                else
                    MessageBox.Show("Error al enviar el mensaje verifique los datos");
                txtTo.Clear();
                txtCC.Clear();
                txtBCC.Clear();
                txtSobject.Clear();
                txtAttach.Clear();
                txtBody.Clear();
            }
        }
        /// <summary>
        //main con parametros
        /// </summary>

        private void SendEmail(string[] args)
        {

            
             
                ToEmialSend prm = OnGetParams();
                if (VariablesGlobales.Error)
                {
                    MessageBox.Show(VariablesGlobales.DescripcionError, "Error enviando Email",MessageBoxButtons.OK,MessageBoxIcon.Error);
                    System.Environment.Exit(0);
                }
                prm.To = txtTo.Text;
                prm.From = VariablesGlobales.username + VariablesGlobales.Host;
                prm.HostName = getHostName(VariablesGlobales.Host);
                prm.Port = 587;
                prm.EmailUser = VariablesGlobales.username + VariablesGlobales.Host;
                prm.EmailPass = VariablesGlobales.password;
                prm.IsHml = true;
                prm.CC = txtBCC.Text;
                prm.BCC = txtBCC.Text;
                prm.Sobject = txtSobject.Text;
                prm.Body = txtBody.Text;
                prm.Atach = txtAttach.Text;
                cEmail.EnableSsl = true;
                //cEmail.SendEmailAction(prm);
                if (cEmail.SendEmailAction(prm))
                {
                    MessageBox.Show("Mensaje enviado");
                    System.Environment.Exit(0);
                }
                else
                    MessageBox.Show("Error al enviar el mensaje verifique los datos");
                   System.Environment.Exit(0);
            /*   
            txtTo.Clear();
                txtCC.Clear();
                txtBCC.Clear();
                txtSobject.Clear();
                txtAttach.Clear();
                txtBody.Clear();
            */

                 
           
        }

        private string getHostName(string name)
        {
            string Hname=string.Empty;
            switch (name)
            {
                case "@hotmail.com":
                    {
                        Hname = "smtp.live.com";
                        break;
                    }
                case "@gmail.com":
                    {
                        Hname = "smtp.gmail.com";
                        break;
                    }
                case "@outlook.com":
                    {
                        Hname = "smtp-mail.outlook.com";
                        break;
                    }
                case "@yahoo.com":
                    {
                        Hname = "smtp.mail.yahoo.com";
                        break;
                    }
                default: break;
            }
            return Hname;
        }
        private ToEmialSend OnGetParams()
        {
            ToEmialSend prm = new ToEmialSend();
            string paraname = string.Empty;
            string paravalue = string.Empty;
            VariablesGlobales.Error = false;
            foreach (string argumento in Environment.GetCommandLineArgs())
            {
                if (VariablesGlobales.Error)
                    break;
                paraname = argumento.Split('=')[0].ToLower();
                try
                {
                    paravalue = argumento.Split('=')[1].ToLower();
                }
                catch
                {
                    paravalue = "";
                }
                switch (paraname)
                {
                    case "/auto":

                        VariablesGlobales.Auto = paravalue;
                        break;
                    case "/u":
                        VariablesGlobales.username = paravalue;
                        textUser.Text = VariablesGlobales.username;
                        break;

                    case "/h":
                        VariablesGlobales.Host = paravalue;
                        comboHostName.Text = VariablesGlobales.Host;
                        break;

                    case "/p":
                        VariablesGlobales.password = paravalue;
                        textPass.Text = VariablesGlobales.password;                       
                        break;

                    case "/t":
                        VariablesGlobales.to = paravalue;
                        txtTo.Text = VariablesGlobales.to;
                        break;

                    case "/c":
                        VariablesGlobales.CC = paravalue;
                        txtCC.Text = VariablesGlobales.CC;
                        break;

                    case "/b":
                        VariablesGlobales.BCC = paravalue;
                        txtBCC.Text = VariablesGlobales.BCC;
                        break;

                     case "/s":
                         VariablesGlobales.Sobject = paravalue;
                         txtSobject.Text = VariablesGlobales.Sobject;
                        break; 

                    case "/f":
                        VariablesGlobales.Body1 = paravalue;
                        txtBody.Text = VariablesGlobales.Body1;                      
                        break;

                    case "/a":

                        VariablesGlobales.Attach = paravalue;                       
                        txtAttach.Text = VariablesGlobales.Attach;

                        FAttachentList = VariablesGlobales.Attach.Split(';');
                        for (int idx = 0; idx < FAttachentList.Length; idx++)
                        {
                            if (!File.Exists(FAttachentList[idx].ToString()))
                            {
                                VariablesGlobales.Error = true;
                                VariablesGlobales.DescripcionError = "Archivo adjunto no encontrado.";
                                break;
                            }
                        }
                        break;
                }

            }
            return prm;
        }



        private void button5_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            txtAttach.Text = openFileDialog1.FileName;
           
        }

        private void button4_Click(object sender, EventArgs e)
        {
            
            
            if (txtTo.Text == "")
            {

                MessageBox.Show("Debe por lo menos llenar aquien le va a enviar el mensaje");

            }
            else
            {
                VariablesGlobales.username = textUser.Text;
                VariablesGlobales.password = textPass.Text;
                VariablesGlobales.Host = comboHostName.Text;
                
                SendEmail();
            }
            /*
        if (!(textBoxTo.Text.Trim() == ""))
        {
            To = textBoxTo.Text;
            Subject = textBoxSubject.Text;
            Body = textBoxMgs.Text;

            Mail = new MailMessage();
            Mail.To.Add(new MailAddress(this.To));
            Mail.From = new MailAddress("jacobo-samedi@hotmail.com");
            Mail.Subject = Subject;
            Mail.Body = Body;
            Mail.IsBodyHtml = false;

            if (!(textBoxAdjuntar.Text.Trim() == ""))
            {
                Data = new Attachment(textBoxAdjuntar.Text, MediaTypeNames.Application.Octet);
                Mail.Attachments.Add(Data);
            }
            SmtpClient Client = new SmtpClient("smtp.live.com", 587);
            using (Client)
            {
                Client.Credentials = new System.Net.NetworkCredential("jacobo-samedi@hotmail.com", "amos040591");
                Client.EnableSsl = true;
                Client.Send(Mail);
            }
            MessageBox.Show("Mensaje enviado");

        }  */
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
       
    }
     
}

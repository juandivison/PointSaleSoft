using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Emails
{
    class VariablesGlobales
    {
        private static string v_Body1 = "";
        public static string Body1
        {
            get { return v_Body1; }
            set { v_Body1 = value; }
        }

        private static string v_Body = "";
        public static string Body
        {
            get { return v_Body; }
            set { v_Body = value; }
        }

        private static string v_Attach = "";
        public static string Attach
        {
            get { return v_Attach; }
            set { v_Attach = value; }
        }

        private static string v_CC = "";
        public static string CC
        {
            get { return v_CC; }
            set { v_CC = value; }
        }

        private static string v_BCC = "";
        public static string BCC
        {
            get { return v_BCC; }
            set { v_BCC = value; }
        }

        private static string v_To = "";
        public static string to
        {
            get { return v_To; }
            set { v_To = value; }
        }
        private static string v_username = "";
        public static string username
        {
            get { return v_username; }
            set { v_username = value; }
        }

        private static string v_password = "";
        public static string password
        {
            get { return v_password; }
            set { v_password = value; }
        }


        private static string v_Host = "";
        public static string Host
        {
            get { return v_Host; }
            set { v_Host = value; }
        }

        private static string v_Sobject = "";
        public static string Sobject
        {
            get { return v_Sobject; }
            set { v_Sobject = value; }
        }

        public static string Auto { get; set; }

        public static bool Error { get; set; }

        public static string DescripcionError { get; set; }
    }
}
using System;
using System.IO;
using System.Text;

namespace CreateLogs
{
	//<Summary>
	// This class used to created log files
	// Created by ali ahmad h - 2002
	//</Summary>

	public class CreateLogFiles
	{
		private string sLogFormat;
		private string sErrorTime;

		public CreateLogFiles()
		{
			//sLogFormat used to create log files format :
			// dd/mm/yyyy hh:mm:ss AM/PM ==> Log Message
			sLogFormat = DateTime.Now.ToShortDateString().ToString()+" "+DateTime.Now.ToLongTimeString().ToString()+" ==> ";
			
			//this variable used to create log filename format "
			//for example filename : ErrorLogYYYYMMDD
			string sYear	= DateTime.Now.Year.ToString();
			string sMonth	= DateTime.Now.Month.ToString();
			string sDay	= DateTime.Now.Day.ToString();
			sErrorTime = sYear+sMonth+sDay;
		}

		public void ErrorLog(string sPathName, string sErrMsg)
		{
			StreamWriter sw = new StreamWriter(sPathName+sErrorTime,true);
			sw.WriteLine(sLogFormat + sErrMsg);
			sw.Flush();
			sw.Close();
		}
        public static void LogErrorToText(Exception ex)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("********************" + " Error Log - " + DateTime.Now + "*********************");
            sb.Append(Environment.NewLine);
            sb.Append(Environment.NewLine);
            sb.Append("Exception Type : " + ex.GetType().Name);
            sb.Append(Environment.NewLine);
            sb.Append("Error Message : " + ex.Message);
            sb.Append(Environment.NewLine);
            sb.Append("Error Source : " + ex.Source);
            sb.Append(Environment.NewLine);
            if (ex.StackTrace != null)
            {
                sb.Append("Error Trace : " + ex.StackTrace);
            }
            Exception innerEx = ex.InnerException;

            while (innerEx != null)
            {
                sb.Append(Environment.NewLine);
                sb.Append(Environment.NewLine);
                sb.Append("Exception Type : " + innerEx.GetType().Name);
                sb.Append(Environment.NewLine);
                sb.Append("Error Message : " + innerEx.Message);
                sb.Append(Environment.NewLine);
                sb.Append("Error Source : " + innerEx.Source);
                sb.Append(Environment.NewLine);
                if (ex.StackTrace != null)
                {
                    sb.Append("Error Trace : " + innerEx.StackTrace);
                }
                innerEx = innerEx.InnerException;
            }
            string filePath = Environment.CurrentDirectory.Trim();
            filePath = filePath + "Errorlog.txt";

            if (File.Exists(filePath))
            {
                StreamWriter writer = new StreamWriter(filePath, true);
                writer.WriteLine(sb.ToString());
                writer.Flush();
                writer.Close();
            }
        }
	}
}

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data;

namespace CreateLogs
{
    class Program
    {


        static int value = 0, value1 = 0, value2=0;
        static int TotalLogs = 100;

        static void Main(string[] args)
        {
            //sLogFormat used to create log files format :
            Hashtable hashtable = new Hashtable();           
            CreateLogFiles Err = new CreateLogFiles();
            Random rnd = new Random();

          /*  hashtable[1] = "Exception ==> Divide by zero is not allowed";
            hashtable[2] = "Error ==> System.NullReferenceException";
            hashtable[3] = "Exception ==> Three";
            hashtable[4] = "Warning ==> Variable is assigned but its Value is never used";
            hashtable[5] = "Error ==> System.IndexOutOfRangeException";
            hashtable[6] = "Exception ==> System.TypeInitializationException ";
            hashtable[7] = "Error ==> Object not set to reference to an Object";
            hashtable[8] = "Warning ==> Eight";
            hashtable[9] = "Exception ==> System.OutOfMemoryException";*/

            Hashtable HExType = new Hashtable();
            HExType[0] = "Error";
            HExType[1] = "Warning";
            HExType[2] = "Exception";

            Hashtable HBackend = new Hashtable();
            HBackend[0] = "Business Layer";
            HBackend[1] = "Data Layer";
            HBackend[2] = "UI Layer";

            Hashtable HData = new Hashtable();
            HData[1] = "Divide by zero is not allowed";
            HData[2] = "System.NullReferenceException";
            HData[3] = "The request failed with HTTP Status 503:Service unavailable";
            HData[4] = "Variable is assigned but its Value is never used";
            HData[5] = "System.IndexOutOfRangeException";
            HData[6] = "System.TypeInitializationException ";
            HData[7] = "Object not set to reference to an Object";
            HData[8] = "The Operation has Timed Out";
            HData[9] = "System.OutOfMemoryException";
            HData[10] = "Error While Creating Stored Procedure";
            HData[11] = "The Underlying connection was Closed : A connection that was expected";
            HData[12] = "The request failed with HTTP Status 404:Not Found";
            HData[13] = "The XML String couldnt be Loaded into XML Document";
            HData[14] = "The Given key was not present in the dictionary";
            HData[15] = "The Underlying Connection was Closed. An unexpected error occured on a  receive";
            HData[16] = "Input Schema Validation Exception. Validation XML Failed for Output";


            if (args != null && args.Length > 0)
                TotalLogs = int.Parse(args[0]);

           // ExceptionLogging.SendExcepToDB("hai","aaa");     

            for (int i = 0; i < TotalLogs; i++)
            {
                value = rnd.Next(1, 17);
                value1 = rnd.Next(1, 3);                
                //Err.ErrorLog("Logs/ErrorLog", (string)hashtable[value]);  
                ExceptionLogging.SendExcepToDB((string)HBackend[value1], (string)HExType[value1], (string)HData[value]);
                Console.WriteLine((string)HData[value]);  
            }                      
        }       
    }
}

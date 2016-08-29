using System;    
using System.Configuration;   
using System.Data.SqlClient;   
using System.Data;
using MySql.Data.MySqlClient; 
   
public static class ExceptionLogging   
{   
    static MySqlConnection con;   
    private static void connecttion()   
    {
        string constr = "Server=localhost;Database=dashboard;Uid=root;Pwd=venu12345;";
        con = new MySqlConnection(constr);   
        con.Open();   
    }
    public static void SendExcepToDB(string strbkApplication,string strExceptionType, string strExceptionMsg)
    {

        connecttion();
        MySqlCommand com = new MySqlCommand("ExceptionLoggingToDataBase", con);
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("strbkApplication", strbkApplication);
        com.Parameters.AddWithValue("strExceptionType", strExceptionType);
        com.Parameters.AddWithValue("strExceptionMsg", strExceptionMsg);        
        com.ExecuteNonQuery();

        if (con != null)
        {
            con.Close();
            con = null;
        }
    }
   
}  

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Summary description for EventService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[ScriptService]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class EventService : System.Web.Services.WebService
{

    public EventService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }


    [WebMethod]
    [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
    public Boolean SaveEvent(string firstName, string lastName, string temperature, string dateTimeTaken)
    {
        SqlConnection objConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["COVID-Event-ConnectionString"].ToString());
        objConnection.Open();
        SqlCommand command = objConnection.CreateCommand();
        command.CommandType = CommandType.StoredProcedure;
        command.CommandText = "AddCOVIDEvent";
        command.Parameters.AddWithValue("@firstName", firstName);
        command.Parameters.AddWithValue("@lastName", lastName);
        command.Parameters.AddWithValue("@temperature", temperature);
        command.Parameters.AddWithValue("@dateTimeTaken", dateTimeTaken);
      

        command.ExecuteNonQuery();
        objConnection.Close();
        return true;
    }
}

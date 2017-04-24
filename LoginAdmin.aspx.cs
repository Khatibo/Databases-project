using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
        SqlCommand cmd = new SqlCommand("loginProcedure3", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string username = TextBox3.Text;
        string password = TextBox4.Text;

        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@password", password));
        SqlParameter count = cmd.Parameters.Add("@a", SqlDbType.Int);
        count.Direction = ParameterDirection.Output;

        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();


        if (count.Value.ToString().Equals("1"))
        {
            //To send response data to the client side (HTML)
            Response.Write("Passed");

            /*ASP.NET session state enables you to store and retrieve values for a user
            as the user navigates ASP.NET pages in a Web application.
            This is how we store a value in the session*/
            Session["ADMIN"] = username;

            //To navigate to another webpage
            Response.Redirect("AdminPage.aspx", false);

        }
        else
        {
            Response.Write("Failed...Please enter another username");
        }


    }
}

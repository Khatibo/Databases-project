using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUpParent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Get the information of the connection to the database
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("Sign_Up", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        //To read the input from the user
        string FirstName = TextBox1.Text;
        string LastName = TextBox2.Text;
        string Email = TextBox3.Text;
        string Mobile1 = TextBox4.Text;
        int M1 = Convert.ToInt32(Mobile1);
        string Mobile2 = TextBox5.Text;
        if (Mobile2 == string.Empty)
        {

            cmd.Parameters.Add(new SqlParameter("@mobile2", 0));
        }
        else
        {
            int M2 = Convert.ToInt32(Mobile2);
            cmd.Parameters.Add(new SqlParameter("@mobile2", M2));
        }
        string Address = TextBox6.Text;
        string Phone = TextBox7.Text;
        int p = Convert.ToInt32(Phone);
        string username = TextBox8.Text;
        String password = TextBox9.Text;

        //pass parameters to the stored procedure
        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@password", password));
        cmd.Parameters.Add(new SqlParameter("@first_name", FirstName));
        cmd.Parameters.Add(new SqlParameter("@last_name", LastName));
        cmd.Parameters.Add(new SqlParameter("@email", Email));
        cmd.Parameters.Add(new SqlParameter("@address", Address));
        cmd.Parameters.Add(new SqlParameter("@phone", Phone));
        cmd.Parameters.Add(new SqlParameter("@mobile1", Mobile1));


        //Save the output from the procedure
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
            Session["field1"] = "HIIII";

            //To navigate to another webpage
            Response.Write("Thank you for applying:)");

        }
        else
        {
            Response.Write("Failed...Please enter another username");
        }







    }
}
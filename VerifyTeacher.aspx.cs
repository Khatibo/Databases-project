using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VerifyTeacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        string conStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(conStr);
        //create a new connection
        SqlCommand com = new SqlCommand("View_Teachers", conn);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(com);



     
        com.Parameters.AddWithValue("@admin", (string)(Session["ADMIN"]));

        

        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();

        

        try
        {
            conn.Open();
            da.Fill(dt);


        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            if (conn.State == ConnectionState.Open)
                conn.Close();
        }
        GridView1.DataSource = dt;
        GridView1.DataBind();


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("Verify_Teachers", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        //To read the input from the user
        string id= TextBox1.Text;
        int ID = Convert.ToInt32(id);
        string Username = TextBox2.Text;
        string password = TextBox3.Text;
      //pass parameters to the stored procedure
        cmd.Parameters.Add(new SqlParameter("@admin", (string)Session["ADMIN"]));
        cmd.Parameters.Add(new SqlParameter("@username", Username));
        cmd.Parameters.Add(new SqlParameter("@password", password));
        cmd.Parameters.Add(new SqlParameter("@teacher", ID));
      


        //Save the output from the procedure
        SqlParameter count = cmd.Parameters.Add("@a", SqlDbType.Int);
        count.Direction = ParameterDirection.Output;

        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();


        if (count.Value.ToString().Equals("0"))
        {
           

            Response.Write("You can't verify this teacher!");
        }






    }
}
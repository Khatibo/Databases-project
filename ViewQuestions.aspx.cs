using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewQuestions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        string conStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(conStr);
        //create a new connection
        SqlCommand com = new SqlCommand("View_Questions", conn);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(com);


        
        com.Parameters.AddWithValue("@TeacherUsername", (string)(Session["TeacherUsername"]));
        com.Parameters.AddWithValue("@course_name", (string)(Session["course_name"]));
        com.Parameters.AddWithValue("@course_code", (string)(Session["course_code"]));

        //Save the output from the procedure
        SqlParameter count = com.Parameters.Add("@a", SqlDbType.Int);
        count.Direction = ParameterDirection.Output;

        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();

        if (count.Value.ToString().Equals("0"))
       
            Response.Write("Failed...You Don't teach this course");
        
        
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
        //Get the information of the connection to the database
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("Answer_Questions", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        //To read the input from the user
        string number = TextBox1.Text;
        int nb = Convert.ToInt32(number);
        string answer = TextBox2.Text;


        //pass parameters to the stored procedure
        cmd.Parameters.AddWithValue("@TeacherUsername", (string)(Session["TeacherUsername"]));
        cmd.Parameters.AddWithValue("@name", (string)(Session["course_name"]));
        cmd.Parameters.AddWithValue("@code", (string)(Session["course_code"]));
        cmd.Parameters.Add(new SqlParameter("@answer", answer));
        cmd.Parameters.Add(new SqlParameter("@number", nb));
        
        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

            Response.Write("your answer has been posted ..Thank you :)");

      

    }
}
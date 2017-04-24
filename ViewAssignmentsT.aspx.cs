using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAssignmentsT : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        string conStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(conStr);
        //create a new connection
        SqlCommand com = new SqlCommand("View_Solutions", conn);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(com);



        com.Parameters.AddWithValue("@username", (string)(Session["TeacherUsername"]));
        com.Parameters.AddWithValue("@name", (string)(Session["course_name1"]));
        com.Parameters.AddWithValue("@code", (string)(Session["course_code1"]));

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
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("grade_assignments", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        //To read the input from the user
        string student = TextBox1.Text;
        int ssn = Convert.ToInt32(student);
        string g= TextBox2.Text;
        int grade = Convert.ToInt32(g);
        string assignment = TextBox3.Text;
        int number = Convert.ToInt32(assignment);

        //pass parameters to the stored procedure

        cmd.Parameters.AddWithValue("@number",number );
        cmd.Parameters.AddWithValue("@student", ssn);
        cmd.Parameters.AddWithValue("@grade", grade);
        

        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Write("your answer has been posted ..Thank you :)");



    }
}
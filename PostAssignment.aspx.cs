using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PostAssignment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {









    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();


        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Post_Assignments", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        DateTime DueDate = DateTime.ParseExact(TextBox1.Text, "yyyy-mm-dd",System.Globalization.CultureInfo.InvariantCulture);

        string CourseCode = TextBox2.Text;
        string CourseName = TextBox3.Text;
        int nb = int.Parse(TextBox4.Text);
        string Content = TextBox5.Text;



        cmd.Parameters.Add(new SqlParameter("@teacher", (string)(Session["TeacherUsername"])));
        cmd.Parameters.Add(new SqlParameter("@code", CourseCode));
        cmd.Parameters.Add(new SqlParameter("@name", CourseName));
        cmd.Parameters.Add(new SqlParameter("@due_date",DueDate));
        cmd.Parameters.Add(new SqlParameter("@id", nb));
        cmd.Parameters.Add(new SqlParameter("@content", Content));

        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write("Thank you :)");




    }
}
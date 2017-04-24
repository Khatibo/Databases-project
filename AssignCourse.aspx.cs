using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AssignCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();


        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Assign_Teacher", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string name = TextBox1.Text;
        string code = TextBox2.Text;
        int id =int.Parse(TextBox3.Text);

        cmd.Parameters.AddWithValue("@username", (string)(Session["ADMIN"]));
        cmd.Parameters.AddWithValue("@teacher_id", id);
        cmd.Parameters.AddWithValue("@course_name", name);
        cmd.Parameters.AddWithValue("@course_code", code);
        //Executing the SQLCommand
        SqlParameter count = cmd.Parameters.Add("@a", SqlDbType.Int);
        count.Direction = ParameterDirection.Output;

        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();


        if (count.Value.ToString().Equals("1"))
        {
            //To send response data to the client side (HTML)
            Response.Write("Done");

    


        }
        else
        {
            Response.Write("You can't assign this teacher");
        }



    }
}
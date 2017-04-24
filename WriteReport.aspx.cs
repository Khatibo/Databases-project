using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WriteReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Get the information of the connection to the database
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(connStr);


        SqlCommand cmd = new SqlCommand("Write_Reports", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        //To read the input from the user
        string Name = TextBox1.Text;
        string code = TextBox2.Text;
        string ssn = TextBox3.Text;
        int ssn2 = Convert.ToInt32(ssn);
        string comment = TextBox4.Text;
        string content = TextBox5.Text;
        
        //pass parameters to the stored procedure
        cmd.Parameters.Add(new SqlParameter("@teacher",(string)Session["TeacherUsername"]));
        cmd.Parameters.Add(new SqlParameter("@student", ssn2));
        cmd.Parameters.Add(new SqlParameter("@name", Name));
        cmd.Parameters.Add(new SqlParameter("@code", code));
        cmd.Parameters.Add(new SqlParameter("@comment", comment));
        cmd.Parameters.Add(new SqlParameter("@content", content));
       

        //Save the output from the procedure
        SqlParameter count = cmd.Parameters.Add("@a", SqlDbType.Int);
        count.Direction = ParameterDirection.Output;

        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();


        if (count.Value.ToString().Equals("1"))
        {
           
            //To navigate to another webpage
            Response.Write("Thank you :)");

        }
        else
        {
            Response.Write("Failed...You Cannot write report in this course or for this student ");
        }

    }
}
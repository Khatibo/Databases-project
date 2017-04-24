using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();


        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Create_Activities", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string name = TextBox1.Text;
        DateTime date = DateTime.ParseExact(TextBox2.Text, "yyyy-mm-dd", System.Globalization.CultureInfo.InvariantCulture);
        string location = TextBox3.Text;
        string type = TextBox4.Text;
        string equipement = TextBox5.Text;
        string description= TextBox6.Text;
        string id = TextBox7.Text;



        cmd.Parameters.AddWithValue("@username", (string)(Session["ADMIN"]));
        cmd.Parameters.AddWithValue("@activity_name", name);
        cmd.Parameters.AddWithValue("@type", type);
        cmd.Parameters.AddWithValue("@description", description);
        cmd.Parameters.AddWithValue("@location",location);
        cmd.Parameters.AddWithValue("@date",date);
        cmd.Parameters.AddWithValue("@equipement",equipement );
        cmd.Parameters.AddWithValue("@teacher_id", id);
        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
}
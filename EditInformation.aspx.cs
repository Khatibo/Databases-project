using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditInformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();


        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Edit_Info_Of_School", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string info = TextBox1.Text;
        
        
        cmd.Parameters.AddWithValue("@username", (string)(Session["ADMIN"]));
        cmd.Parameters.AddWithValue("@new_info",info);
       
        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewReviews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DataTable dt = new DataTable();
        string conStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(conStr);
        //create a new connection
        SqlCommand com = new SqlCommand("View_School_Reviews", conn);
        com.Parameters.AddWithValue("@name", (string)(Session["Infoo"]));
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(com);
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


        Session.RemoveAll();

    }


}
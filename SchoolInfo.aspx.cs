
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SchoolInfo : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {



        DataTable dt = new DataTable();
        string conStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(conStr);
        //create a new connection

        if (Session["Search"] != null)

        {


            SqlCommand com = new SqlCommand("All_info_Search", conn);
            com.Parameters.AddWithValue("@name", (string)(Session["Search"]));
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
            grdloadproperties.DataSource = dt;
            grdloadproperties.DataBind();
          

        }
        else {

          


                SqlCommand com = new SqlCommand("All_info_Search", conn);
                com.Parameters.AddWithValue("@name", (string)(Session["Info"]));
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
                grdloadproperties.DataSource = dt;
                grdloadproperties.DataBind();
           



        }
        Session.RemoveAll(); 

   }


}

    
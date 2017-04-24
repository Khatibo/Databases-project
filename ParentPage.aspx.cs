using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ParentPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
    
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textbox = TextBox1.Text;
        Session["Search"] = textbox;
        if (textbox!="")
        Response.Redirect("SchoolInfo.aspx",false);
       

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textlist = DropDownList1.SelectedItem.Text;
        Session["Infoo"] = textlist;
        Response.Redirect("SchoolInfo.aspx");




    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textlist = DropDownList1.SelectedItem.Text;
        Session["Infoo"] = textlist;
        Response.Redirect("ViewAnnouncementsP.aspx");

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textlist = DropDownList1.SelectedItem.Text;
        Session["Infoo"] = textlist;
        Response.Redirect("ViewReviewsP.aspx");

    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textbox = DropDownList1.SelectedItem.Text;
        Session["Info2"] = textbox;
        if (textbox != "")
            Response.Redirect("School_infoS.aspx", false);


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textbox = TextBox1.Text;
        Session["Search2"] = textbox;
        if (textbox != "")
            Response.Redirect("School_infoS.aspx", false);



    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textlist = DropDownList1.SelectedItem.Text;
        Session["Inf"] = textlist;
        Response.Redirect("ViewAnnouncementsS.aspx");

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textlist = DropDownList1.SelectedItem.Text;
        Session["Inf"] = textlist;
        Response.Redirect("ViewReviewsS.aspx");

    }
}
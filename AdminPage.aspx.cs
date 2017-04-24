using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPage : System.Web.UI.Page
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
        Session["Info3"] = textbox;
        if (textbox != "")
            Response.Redirect("School_infoA.aspx", false);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textbox = TextBox1.Text;
        Session["Search3"] = textbox;
        if (textbox != "")
            Response.Redirect("School_infoA.aspx", false);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

    
            Response.Redirect("VerifyTeacher.aspx", false);

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textbox = DropDownList1.SelectedItem.Text;
        Session["AdminInfo"] = textbox;
        if (textbox != "")
            Response.Redirect("ViewAnnouncements.aspx", false);
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textbox = DropDownList1.SelectedItem.Text;
        Session["AdminInfo"] = textbox;
        if (textbox != "")
            Response.Redirect("ViewReviews.aspx", false);
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);


        Response.Redirect("AcceptReject.aspx", false);

    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);


        Response.Redirect("VerifyStudents.aspx", false);

    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);


        Response.Redirect("EditInformation.aspx", false);
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);


        Response.Redirect("PostAnnouncement.aspx", false);
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);


        Response.Redirect("Create.aspx", false);
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);


        Response.Redirect("AssignCourse.aspx", false);
    }
}
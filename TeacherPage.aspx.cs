using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TeacherPage : System.Web.UI.Page
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
        Session["Info4"] = textbox;
        if (textbox != "")
            Response.Redirect("School_infoT.aspx", false);

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textbox = TextBox1.Text;
        Session["Search4"] = textbox;
        if (textbox != "")
            Response.Redirect("School_infoT.aspx", false);

    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);
            Response.Redirect("TeacherCourses.aspx", false);
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);
        Response.Redirect("PostAssignment.aspx", false);
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textlist = DropDownList1.SelectedItem.Text;
        Session["Infooo"] = textlist;
        Response.Redirect("ViewAnnouncementsT.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textlist = DropDownList1.SelectedItem.Text;
        Session["Infooo"] = textlist;
        Response.Redirect("ViewReviewsT.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);
        Response.Redirect("ViewAssignmentsT.aspx", false);
        Session["course_name1"] = TextBox4.Text;
        Session["course_code1"] = TextBox5.Text;
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);
        Session["course_name"] = TextBox2.Text;
        Session["course_code"] = TextBox3.Text;


        Response.Redirect("ViewQuestions.aspx", false);
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);
        Response.Redirect("ViewMyStudentsT.aspx", false);
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);
        Response.Redirect("WriteReport.aspx", false);
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }

    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FirstPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Log_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
        if (DropDownList2.SelectedItem.Text == "Teacher")
        {
            Response.Redirect("LoginTeacher.aspx", true);
            Session["LoginTeacher"] = "HIIII";
        }
        else
        {
            if (DropDownList2.SelectedItem.Text == "Parent")
            {
                Response.Redirect("ParentLogIn.aspx", true);
                Session["ParentLogIn"] = "HIIII";
            }

            else
            {
                if (DropDownList2.SelectedItem.Text == "Student")
                {
                    Response.Redirect("LoginStudent.aspx", true);
                    Session["LoginStudent"] = "HIIII";
                }
                else
                {
                    if (DropDownList2.SelectedItem.Text == "Administrator")
                    {
                        Response.Redirect("LoginAdmin.aspx", true);
                        Session["LoginAdmin"] = "HIIII";
                    }
                }
            }
        }
    }


    protected void Sign_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        /*create a new SQL command which takes as parameters the name of the stored procedure and
         the SQLconnection name*/
        if (DropDownList1.SelectedItem.Text == "Teacher")
        {
            Response.Redirect("SignUpTeacher.aspx", true);
            Session["SignUpTeacher"] = "HIIII";
        }
        else
        {
            if (DropDownList1.SelectedItem.Text == "Parent")
            {
                Response.Redirect("SignUpParent.aspx", true);
                Session["SignUpParent"] = "HIIII";
            }

            else
            {
                if (DropDownList1.SelectedItem.Text == "Student")
                {
                    Response.Redirect("Signupstudent.aspx", true);
                    Session["Signupstudent"] = "HIIII";
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textlist = DropDownList3.SelectedItem.Text;
        Session["InfoFirst"] = textlist;
        Response.Redirect("SchoolInfoFirst.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textlist = DropDownList3.SelectedItem.Text;
        Session["InfoFirst"] = textlist;
        Response.Redirect("ViewAnnouncementsFirst.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textlist = DropDownList3.SelectedItem.Text;
        Session["InfoFirst"] = textlist;
        Response.Redirect("ViewReviewsFirst.aspx");

    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();

        //create a new connection
        SqlConnection conn = new SqlConnection(connStr);

        string textbox = TextBox1.Text;
        Session["SearchFirst"] = textbox;
        if (textbox != "")
            Response.Redirect("SchoolInfoFirst.aspx", false);
    }
}
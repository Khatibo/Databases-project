﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VerifyStudents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        string conStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
        SqlConnection conn = new SqlConnection(conStr);
        //create a new connection
        SqlCommand com = new SqlCommand("View_Students", conn);
        com.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(com);




        com.Parameters.AddWithValue("@username", (string)(Session["ADMIN"]));



        conn.Open();
        com.ExecuteNonQuery();
        conn.Close();



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


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();


        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Verify_Students", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string id = TextBox1.Text;
        int ssn = int.Parse(id);
        string username = TextBox2.Text;
        string password = TextBox3.Text;

        cmd.Parameters.Add(new SqlParameter("@ssn", ssn));
        cmd.Parameters.AddWithValue("@adminname", (string)(Session["ADMIN"]));
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@password", password);
        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

    }
}
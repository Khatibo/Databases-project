using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUpTeacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();


        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("sign_up_teacher", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string first = TextBox1.Text;
        string middle = TextBox2.Text;
        string last = TextBox3.Text;
        string birth = DropDownList2.Text +"-"+ DropDownList3.Text +"-"+ DropDownList4.Text;
        DateTime Birthdate = DateTime.ParseExact(birth, "yyyy-mm-dd", System.Globalization.CultureInfo.InvariantCulture);
        string address = TextBox6.Text;
        string email = TextBox5.Text;
        string gender = DropDownList1.Text;
        int years = int.Parse(TextBox4.Text);
        int phone = int.Parse(TextBox7.Text);
        string name = DropDownList5.Text;
        string level = DropDownList6.Text;

        cmd.Parameters.Add(new SqlParameter("@first", first));
        cmd.Parameters.Add(new SqlParameter("@middle", middle));
        cmd.Parameters.Add(new SqlParameter("@last", last));
        cmd.Parameters.Add(new SqlParameter("@birthdate", Birthdate));
        cmd.Parameters.Add(new SqlParameter("@address", address));
        cmd.Parameters.Add(new SqlParameter("@email", email));
        cmd.Parameters.Add(new SqlParameter("@gender", gender));
        cmd.Parameters.Add(new SqlParameter("@phone",phone ));
        cmd.Parameters.Add(new SqlParameter("@name", name));
        cmd.Parameters.Add(new SqlParameter("@level",level));
        cmd.Parameters.Add(new SqlParameter("@years_of_experience", years));

        //Executing the SQLCommand
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write("Thank you for applying:)");
    }
}
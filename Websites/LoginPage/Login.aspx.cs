using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Login_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        string checkuser = "select count(*) from UserData where UserEmail='" + TextBox_Username.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
        if (temp == 1)
        {
            conn.Open();
            string checkPasswordQuery = "select password from UserData where UserEmail='" + TextBox_Username.Text + "'";
            SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
            string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
            if(password == TextBox_Password.Text)
            {

                if (TextBox_Password.Text == "Admin#1")     //check if admin password matches
                {
                    Session["1"] = TextBox_Username.Text;   //assign session 1 to admin
                    Response.Redirect("Home_Admin.aspx");
                }
                else if (TextBox_Password.Text == "Manager#1")  //check if manager password matches
                {
                    Session["2"] = TextBox_Username.Text;   //assign session 2 to admin
                    Response.Redirect("Home_Page.aspx");    
                }
            }
            else
            {
                LabelPW.Text = "Password is correct";
                LabelUN.Text = "";
            }
        }
        else
        {
            LabelUN.Text = "Username is Incorrect!";
            LabelPW.Text = "";
        }
    }
}
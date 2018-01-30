using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["2"] != null)
        {
            if (IsPostBack == false)
            {
                labelTxt.Text += " " + Session["2"].ToString();
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)    //logout button
    {
        Session["2"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void ButtonGo_Click(object sender, EventArgs e)   //Search button
    {
        if (DDLGo.SelectedValue == "SID")   //Search by student id
        {
            Response.Redirect("Search_Reports_Stud.aspx");
        }

        if(DDLGo.SelectedValue == "UC")     //Search by unit code
        {   
            Response.Redirect("Search_Reports_UC.aspx");
        }
    }
}
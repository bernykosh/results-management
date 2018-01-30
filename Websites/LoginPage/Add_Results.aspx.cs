using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;

public partial class Add_Results : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["2"] != null)
        {
            return;
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)    //add button
    {
        SqlDataSourceAddResults.Insert();   //insert data from sql data source
        LabelAdd.Text = "Result Added...";
        LabelAdd.ForeColor = System.Drawing.Color.Green;
    }

    protected void Button2_Click(object sender, EventArgs e)    //reset button
    {
        RBListSemes.SelectedIndex = -1;
        TextBox_Year.Text = "";
        TextBox_Ass01.Text = "";  
        TextBox_Ass02.Text = "";
        TextBox_ExamMark.Text = "";
        LabelAdd.Text = "";
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)    //pop up for deletion
        {
            LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton3");
            lb.Attributes.Add("onclick", "return confirm('Are you sure to delete record with Student ID = " + DataBinder.Eval(e.Row.DataItem, "Student_ID") + "?');");
        }
    }
}


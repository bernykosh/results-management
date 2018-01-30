using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class ViewResults : System.Web.UI.Page
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

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string val1 = e.Row.Cells[7].Text; //Gets the mark of assign 01 
            string val2 = e.Row.Cells[8].Text; //Gets the mark of assign 02
            string val3 = e.Row.Cells[9].Text; //Gets the mark of exam 

            //add those 3 values
            int tMark = int.Parse(val1) + int.Parse(val2) + int.Parse(val3);
            //Assign it into the 10th column
            e.Row.Cells[10].Text = tMark.ToString();

            //Get the grade and assign it into the 11th column
            if (tMark < 50)
            {
                e.Row.Cells[11].Text = "FAIL";
            }
            else if ((tMark >= 50) && (tMark < 60))
            {
                e.Row.Cells[11].Text = "C";
            }
            else if ((tMark >= 60) && (tMark < 70))
            {
                e.Row.Cells[11].Text = "CR";
            }
            else if ((tMark >= 70) && (tMark < 80))
            {
                e.Row.Cells[11].Text = "D";
            }
            else if ((tMark >= 80) && (tMark <= 100))
            {
                e.Row.Cells[11].Text = "HD";
            }
        }
    }
}
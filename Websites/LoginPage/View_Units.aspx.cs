using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class ManageUnits : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["1"] != null)
        {
            return;
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    //grid view 01 ( download unit outline )
    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        //Column to download the unit outline doc
        if (e.CommandName == "Download")
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/Data/") + e.CommandArgument);
            Response.End();
        }
    }

    //grid view 02 ( display Units )
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //pop up before deletion
        if(e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
            lb.Attributes.Add("onclick", "return confirm('Are you sure to delete record with Unit Code = " + DataBinder.Eval(e.Row.DataItem, "Unit_Code") +"?');");
        }
    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //deletes unit outline doc from the 'Data' folder
        TableCell unitID = GridView2.Rows[e.RowIndex].Cells[0]; //gets the unit code from first column
        string fileN = unitID.Text.Trim();
        File.Delete(Server.MapPath("~/Data/") + fileN + ".pdf");    //finds the unit outline doc from the unit code name
    }
}


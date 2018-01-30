using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class Student : System.Web.UI.Page
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

    protected void Button1_Click(object sender, EventArgs e)    //Add student button
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        string checkuser = "select count(*) from Students where Student_ID='" + TxtBox_StudID.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();

        if (temp == 1)  //check if the same student id exists
        {
            LabelExists.Text = "*Student ID already exists, Please enter another one";
        }
        else if (FileUpload_StudentPhoto.HasFile)   //check if student photo file exists
        {
            string fileExtention = System.IO.Path.GetExtension(FileUpload_StudentPhoto.FileName);
            string fileName = TxtBox_StudID.Text + fileExtention;
            TB_StudentPhoto.Text = fileName;
            FileUpload_StudentPhoto.SaveAs(Server.MapPath("~/Photos/") + Path.GetFileName(fileName));
            string link = "Photos/" + Path.GetFileName(fileName);
            TB_StudentPhoto.Text = link;
            SqlDataSourceAddStudents.Insert();  //add the data from sql data source
            LabelAdd.Text = "Result Added...";
            LabelExists.Text = "";
            LabelAdd.ForeColor = System.Drawing.Color.Green;

        }
       
        else
        {
            LabelBrowse.Text = "*Please insert a file to upload";
            LabelBrowse.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)    //reset button
    {
        TxtBox_StudID.Text = "";
        TxtBox_fName.Text = "";
        TxtBox_Surname.Text = "";
        LabelAdd.Text = "";
        LabelBrowse.Text = "";
        LabelExists.Text = "";
    }

    protected void GridViewStudent_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)    //pop up for deletion
        {
            LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton3");
            lb.Attributes.Add("onclick", "return confirm('Are you sure to delete record with Student ID = " + DataBinder.Eval(e.Row.DataItem, "Student_ID") + "?');");
        }
    }

    protected void GridViewStudent_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Deletes student photo from the 'Photos' folder
        TableCell studID = GridViewStudent.Rows[e.RowIndex].Cells[1]; //takes the student id from student id row
        string fileN = studID.Text.Trim();
        File.Delete(Server.MapPath("~/Photos/") + fileN + ".jpg");  //finds the file with that name and deletes from the 'Photos' folder
    }
}
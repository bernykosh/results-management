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

public partial class Add_Units : System.Web.UI.Page
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

    protected void Button1_Click(object sender, EventArgs e)    //Add button for units
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        string checkuser = "select count(*) from Units where Unit_Code='" + TextBox_UnitCode.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();

        if (FileUpload_UnitOutline.HasFile)
        {
            string fileExtention = System.IO.Path.GetExtension(FileUpload_UnitOutline.FileName);
            if (fileExtention.ToLower() != ".pdf")  //checks if the file is a pdf type
            {
                LabelBrowse.Text = "*Please insert a PDF type file";
                LabelBrowse.ForeColor = System.Drawing.Color.Red;
            }
            
            else if (temp == 1)  //checks if the same unit code exists
            {
                LabelExists.Text = "*Unit Code already exists, Please enter another one";
            }

            else 
            {
                string fileName = TextBox_UnitCode.Text + fileExtention;
                TB_UnitOutline.Text = fileName;
                FileUpload_UnitOutline.PostedFile.SaveAs(Server.MapPath("~/Data/") + fileName);
                SqlDataSourceAddUnits.Insert(); //inserts data from sql data source 
                LabelAdd.Text = "Unit Added...";
                LabelAdd.ForeColor = System.Drawing.Color.Green;
                //clears out if any shown error msgs when added successfully
                LabelBrowse.Text = "";  
                LabelExists.Text = "";
            }
        }
        else
        {
            LabelBrowse.Text = "*Please insert a file to upload";
            LabelBrowse.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)    //reset button
    {   
        TextBox_UnitCode.Text = "";
        TextBox_UnitTitle.Text = "";
        TextBox_UnitCoord.Text = "";
        LabelAdd.Text = "";
        LabelBrowse.Text = "";
        LabelExists.Text = "";
    }
}



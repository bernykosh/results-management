using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Data.OleDb;
using System.Configuration;

public partial class Excel_File_Upload : System.Web.UI.Page
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

    protected void Button1_Click(object sender, EventArgs e)    //button for upload
    {
        int Student_ID;
        String Unit_Code;
        int Semester;
        int Year;
        int Assessment_01;
        int Assessment_02;
        int Exam_Mark;

        if (FileUpload1.HasFile)    //check if it has a file
        {
            String type = Path.GetExtension(FileUpload1.FileName);
            if (type.ToLower() == ".xlsx")  //check if the file type is 'xlsx'
            {
                String path = Path.GetFileName(FileUpload1.FileName);
                path = path.Replace(" ", "");
                FileUpload1.SaveAs(Server.MapPath("~/ExcelFile/") + path);
                string ExcelPath = Server.MapPath("~/ExcelFile/") + path;
                OleDbConnection excelCon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");
                excelCon.Open();
                OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", excelCon);
                OleDbDataReader dr = cmd.ExecuteReader();

                while (dr.Read())   //read data from the excel file
                {
                    Student_ID = Convert.ToInt32(dr[0].ToString());
                    Unit_Code = dr[1].ToString();
                    Semester = Convert.ToInt32(dr[2].ToString());
                    Year = Convert.ToInt32(dr[2].ToString());
                    Assessment_01 = Convert.ToInt32(dr[2].ToString());
                    Assessment_02 = Convert.ToInt32(dr[2].ToString());
                    Exam_Mark = Convert.ToInt32(dr[2].ToString());
                    //pass those values into the saveData function and return when it gets inserted into the database
                    saveData(Student_ID, Unit_Code, Semester, Year, Assessment_01, Assessment_02, Exam_Mark);
                }
                labelSuccess.Text = "Data has been saved Successfully...";
                excelCon.Close();
            }
            else
            {
                //if the file type is not 'xslx'
                labelUpload.Text = "Error..Please insert (.xslx) type file";
                labelUpload.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            //if the upload field is empty
            labelUpload.Text = "Please insert a file to upload";
            labelUpload.ForeColor = System.Drawing.Color.Red;
        }
    }

    private void saveData(int studID, String unitCode, int semes, int year, int assign01, int assign02, int examMark)
    {   //insert the excel data into the results's database
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        conn.Open();
        String query = "insert into Results(Student_ID,Unit_Code,Semester,Year, Assessment_01_Mark, Assessment_02_Mark, Exam_Mark) values(" + studID + ",'" + unitCode + "','" + semes + "','" + year + "','" + assign01 + "','" + assign02 + "','" + examMark + "')";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = query;
        cmd.Connection = conn;
        cmd.ExecuteNonQuery();
        conn.Close();
    }
}
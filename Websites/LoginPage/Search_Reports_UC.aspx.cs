using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Data;

public partial class Search_Reports_UC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack == false)
        {
            DDLUnitCode.AppendDataBoundItems = true;
            DDLUnitCode.Items.Add("Choose a Unit Code");
            DDLUnitCode.DataBind();
        }
        else
        {
            //unit labels           
            labelTxtID.Visible = false;
            labelTxtName.Visible = false;
            labelTxtSemes.Visible = false;
            labelTxtYear.Visible = false;
            labelCount.Visible = false;
            labelUnitAvg.Visible = false;
        }

        if (Session["2"] != null)
        {
            return;
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void Search2_Click(object sender, EventArgs e)
    {
        bool unit, semes, year;
        unit = semes = year = false;
        int totalFinal = 0;
        string gradeFinal = "";
        double unitAvg = 0.0;

        string connectionStr = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionStr))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            StringBuilder sbCommand = new StringBuilder("Select * from Results where 1 = 1");

            if (DDLUnitCode.SelectedValue != "Choose a Unit Code")
            {
                sbCommand.Append(" AND Unit_Code=@Unit_Code");
                SqlParameter param = new SqlParameter("@Unit_Code", DDLUnitCode.SelectedValue);
                cmd.Parameters.Add(param);
                unit = true;
            }

            if (DDLSemester.SelectedValue != "Select Semester")
            {

                sbCommand.Append(" AND Semester=@Semester");
                SqlParameter param = new SqlParameter("@Semester", DDLSemester.SelectedValue);
                cmd.Parameters.Add(param);
                semes = true;
                labelTxtSemes.Visible = true;
                labelTxtSemes.Text = "Semester: " + DDLSemester.SelectedValue;
            }

            if (TxtBoxYear.Text.Trim() != "")
            {
                sbCommand.Append(" AND Year=@Year");
                SqlParameter param = new SqlParameter("@Year", TxtBoxYear.Text);
                cmd.Parameters.Add(param);
                year = true;
                labelTxtYear.Visible = true;
                labelTxtYear.Text = "Year: " + TxtBoxYear.Text;
            }

            cmd.CommandText = sbCommand.ToString();
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            dt.Columns.Add("Student ID");
            dt.Columns.Add("Unit Code");
            dt.Columns.Add("Semester");
            dt.Columns.Add("Year");
            dt.Columns.Add("Assessment 01");
            dt.Columns.Add("Assessment 02");
            dt.Columns.Add("Exam Mark");
            dt.Columns.Add("Total Mark");
            dt.Columns.Add("Grade");


            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                DataRow dr = dt.NewRow();
                dr["Student ID"] = rdr["Student_ID"];
                dr["Unit Code"] = rdr["Unit_Code"];
                dr["Semester"] = rdr["Semester"];
                dr["Year"] = rdr["Year"];
                dr["Assessment 01"] = rdr["Assessment_01_Mark"];
                dr["Assessment 02"] = rdr["Assessment_02_Mark"];
                dr["Exam Mark"] = rdr["Exam_Mark"];
                dr["Total Mark"] = getTotalMark((int)rdr["Assessment_01_Mark"], (int)rdr["Assessment_02_Mark"], (int)rdr["Exam_Mark"]);
                dr["Grade"] = getGrade(getTotalMark((int)rdr["Assessment_01_Mark"], (int)rdr["Assessment_02_Mark"], (int)rdr["Exam_Mark"]));
                totalFinal = totalFinal + getTotalMark((int)rdr["Assessment_01_Mark"], (int)rdr["Assessment_02_Mark"], (int)rdr["Exam_Mark"]);
                dt.Rows.Add(dr);
            }


            if (unit == true)
            {
                dt.Columns.Remove("Unit Code");
            }
            if (semes == true)
            {
                dt.Columns.Remove("Semester");
            }
            if (year == true)
            {
                dt.Columns.Remove("Year");
            }

            gvSearch.DataSource = dt;
            gvSearch.DataBind();
            conn.Close();

            if (DDLUnitCode.SelectedValue != "Choose a Unit Code")
            {
                //if unit code is selected to search
                conn.Open();

                //get unit title
                string unitTile = "Select Unit_Title from Units where Unit_Code='" + DDLUnitCode.SelectedValue + "'";
                SqlCommand com1 = new SqlCommand(unitTile, conn);
                string titleName = com1.ExecuteScalar().ToString();

                //get unit outline pdf name
                string pdfName = "Select Unit_outline_pdf_document from Units where Unit_Code='" + DDLUnitCode.SelectedValue + "'";
                SqlCommand com2 = new SqlCommand(pdfName, conn);
                string fileName = com2.ExecuteScalar().ToString();

                //display those data
                labelTxtID.Visible = true;
                labelTxtID.Text = "Unit Code: " + DDLUnitCode.SelectedValue;
                labelTxtName.Visible = true;
                labelTxtName.Text = "Unit Title: " + titleName;
                
                //link button displays to download
                LabelDownload.Visible = true;
                LabelDownload.Text = "File Download:";
                LinkButton1.Visible = true;
                LinkButton1.Text = fileName;               
                conn.Close();
            }
            else
            {
                LabelDownload.Visible = false;
                LinkButton1.Visible = false;
            }
        }
        if (gvSearch.Rows.Count != 0)
        {
            labelCount.Visible = true;
            labelCount.Text = "Results Count: " + gvSearch.Rows.Count.ToString();
            labelUnitAvg.Visible = true;
            unitAvg = (totalFinal / gvSearch.Rows.Count);
            gradeFinal = getGrade(Convert.ToInt32(unitAvg));
            labelUnitAvg.Text = "Unit Average: " + unitAvg.ToString() + " - " + gradeFinal;
        }
        else
        {
            labelCount.Visible = false;
            labelUnitAvg.Visible = false;
        }

    }
    
    private int getTotalMark(int ass1_Mark, int ass2_Mark, int finalMark)
    {
        int totalMarks = ass1_Mark + ass2_Mark + finalMark;
        return totalMarks;
    }

    private string getGrade(int tMark)
    {
        string grade = "";

        if (tMark < 50)
        {
            grade = "FAIL";
        }
        else if ((tMark >= 50) && (tMark < 60))
        {
            grade = "C";
        }
        else if ((tMark >= 60) && (tMark < 70))
        {
            grade = "CR";
        }
        else if ((tMark >= 70) && (tMark < 80))
        {
            grade = "D";
        }
        else if ((tMark >= 80) && (tMark <= 100))
        {
            grade = "HD";
        }
        return grade;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)    //link button for unit outline doc to download
    {
        //get the unit outline pdf doc from Units table
        string connectionStr = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionStr);
        conn.Open();
        string unitFile = "Select Unit_outline_pdf_document from Units where Unit_Code='" + DDLUnitCode.SelectedValue + "'";
        SqlCommand comd = new SqlCommand(unitFile, conn);
        string fileName = comd.ExecuteScalar().ToString();
        conn.Close();
        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "filename=" + fileName);
        Response.TransmitFile(Server.MapPath("~/Data/") + fileName);
        Response.End();

    }
}


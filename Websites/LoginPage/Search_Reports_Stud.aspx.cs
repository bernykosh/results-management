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

public partial class Search_Reports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (IsPostBack == false)    
        {
            DDLStudent.AppendDataBoundItems = true;
            DDLStudent.Items.Add("Choose a Student ID");    //Displays this after every load
            DDLStudent.DataBind();
        }
        else
        {
            //student labels
            ImageStud.Visible = false;
            labelTxtID.Visible = false;
            labelTxtName.Visible = false;
            labelTxtSemes.Visible = false;
            labelTxtYear.Visible = false;
            labelCount.Visible = false;
            labelCourseAvg.Visible = false;
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
 
    protected void Search1_Click(object sender, EventArgs e)
    {
        bool stud, semes, year;
        stud = semes = year = false;
        int totalFinal = 0;
        string gradeFinal = "";
        double courseAvg = 0.0;

        string connectionStr = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connectionStr))
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            StringBuilder sbCommand = new StringBuilder("Select * from Results where 1 = 1");
            //read the data inserted
            if (DDLStudent.SelectedValue != "Choose a Student ID")
            {
                sbCommand.Append(" AND Student_ID=@Student_ID");
                SqlParameter param = new SqlParameter("@Student_ID", DDLStudent.SelectedValue);
                cmd.Parameters.Add(param);
                stud = true;
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
            //Add columns to grid view
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
                //read from database
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

            if (stud == true)   //search by student id
            {
                dt.Columns.Remove("Student ID");    //removes student id column in gridview
            }
            if (semes == true)  //search by semester
            {
                dt.Columns.Remove("Semester");
            }
            if (year == true)   //search by year
            {
                dt.Columns.Remove("Year");
            }

            gvSearch.DataSource = dt;
            gvSearch.DataBind();    //binds data to gridview
            conn.Close();

            if (DDLStudent.SelectedValue != "Choose a Student ID")
            {   //Student id is selected to search
                conn.Open();

                //Get student name, surname and photo
                string pic = "Select Student_Photo from Students where Student_ID='" + DDLStudent.SelectedValue + "'";
                string stuName = "Select Student_fName from Students where Student_ID='" + DDLStudent.SelectedValue + "'";
                string stuSurname = "Select Student_Surname from Students where Student_ID='" + DDLStudent.SelectedValue + "'";

                SqlCommand com1 = new SqlCommand(pic, conn);
                SqlCommand com2 = new SqlCommand(stuName, conn);
                SqlCommand com3 = new SqlCommand(stuSurname, conn);

                string urlPic = com1.ExecuteScalar().ToString();
                string name1 = com2.ExecuteScalar().ToString();
                string name2 = com3.ExecuteScalar().ToString();
                string studName = name1 + " " + name2;

                //display those data
                ImageStud.Visible = true;
                ImageStud.ImageUrl = urlPic;
                labelTxtName.Visible = true;
                labelTxtName.Text = "Student Name: " + studName;
                labelTxtID.Visible = true;
                labelTxtID.Text = "Student ID: " + DDLStudent.SelectedValue;
                conn.Close();
            }
            if (gvSearch.Rows.Count != 0)   //if the there's data in gridview
            {
                labelCount.Visible = true;
                labelCourseAvg.Visible = true;
                //Count how many rows
                labelCount.Text = "Results Count: " + gvSearch.Rows.Count.ToString();

                //calculate course average
                courseAvg = (totalFinal / gvSearch.Rows.Count);
                gradeFinal = getGrade(Convert.ToInt32(courseAvg));
                labelCourseAvg.Text = "Course Average: " + courseAvg.ToString() + " - " + gradeFinal;
            }
            else   //if gridview has no data
            {
                labelCount.Visible = false; //make those labels invisible
                labelCourseAvg.Visible = false;
            }
        }
    }

    private int getTotalMark(int ass1_Mark, int ass2_Mark, int finalMark)
    {
        //total marks achieved
        int totalMarks = ass1_Mark + ass2_Mark + finalMark;
        return totalMarks;
    }

    private string getGrade(int tMark)  //Get the grade by checking against the total mark
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
}

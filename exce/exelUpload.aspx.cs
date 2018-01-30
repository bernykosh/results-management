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
using System.Text.RegularExpressions;

namespace Final_Assignment.ManageResults
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Manager"] == null)// if admin session is null (user not logged in properly from login page)
            {
                Response.Redirect("/Account/Login.aspx");
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            String UnitCode;
            String StudentID;
            String SemesterID;
            String Year;
            String Assignment_01;
            String Assignment_02;
            String Exam;
            String regexUnitCode = @"^[a-zA-Z]{3}[0-9]{4}$";
            String regexStudentID = @"^[0-9]{8}$";
            String regexYear = @"^([0-9]{4})$";
            int rowCounter = 0;
            String errorString = "<br>Error Summary, ( Please check the exel file ) " + "<br>Following rows did not add to the data base <br><br>";
            bool containErrors = false;
            if(ufExel.HasFile)
            {
                String fileType = Path.GetExtension(ufExel.FileName);
                if (fileType.ToLower() == ".xlsx")
                {
                    string path = Path.GetFileName(ufExel.FileName);
                    path = path.Replace(" ", "");
                    ufExel.SaveAs(Server.MapPath("~/Data/") + path);
                    String ExcelPath = Server.MapPath("~/Data/") + path;
                    OleDbConnection mycon = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0; Data Source = " + ExcelPath + "; Extended Properties=Excel 8.0; Persist Security Info = False");
                    mycon.Open();
                    OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        try
                        {
                            rowCounter++;
                            containErrors = false;
                            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["LoginConnectionString"].ConnectionString);
                            UnitCode = dr[0].ToString().Trim();
                            if (!Regex.IsMatch(UnitCode, regexUnitCode))
                            {
                                errorString += "* Row number : " + rowCounter + " - Invalid Unit Code format [aaa1111]" + "<br>";
                                containErrors = true;
                            }
                            StudentID = dr[1].ToString().Trim();
                            if (!Regex.IsMatch(StudentID, regexStudentID))
                            {
                                errorString += "* Row number : " + rowCounter + " - Invalid Student ID format [11111111]" + "<br>";
                                containErrors = true;
                            }
                            SemesterID = "0" + dr[2].ToString().Trim();
                            if (!(SemesterID == "01" || SemesterID == "02"))
                            {
                                errorString += "* Row number : " + rowCounter + " " + SemesterID + " - Invalid Semester" + "<br>";
                                containErrors = true;
                            }
                            Year = dr[3].ToString().Trim();
                            if (!Regex.IsMatch(Year, regexYear))
                            {
                                errorString += "* Row number : " + rowCounter + " - Invalid Year format [yyyy]" + "<br>";
                                containErrors = true;
                            }
                            Assignment_01 = dr[4].ToString().Trim();
                            if (!(Convert.ToInt32(Assignment_01) >= 0 && Convert.ToInt32(Assignment_01) <= 20))
                            {
                                errorString += "* Row number : " + rowCounter + " - Assignment 01 marks out of range" + "<br>";
                                containErrors = true;
                            }
                            Assignment_02 = dr[5].ToString().Trim();
                            if (!(Convert.ToInt32(Assignment_02) >= 0 && Convert.ToInt32(Assignment_02) <= 20))
                            {
                                errorString += "*  Row number : " + rowCounter + " - Assignment 02 marks out of range" + "<br>";
                                containErrors = true;
                            }
                            Exam = dr[6].ToString().Trim();
                            if (!(Convert.ToInt32(Exam) >= 0 && Convert.ToInt32(Exam) <= 60))
                            {
                                errorString += "* Row number : " + rowCounter + " - Exam marks out of range" + "<br>";
                                containErrors = true;
                            }

                            unitCode.Text = UnitCode;
                            unitCode.Visible = false;
                            con.Open();
                            string checkUnit = "select UnitCode from UnitData where UnitCode='" + unitCode.Text + "'";//to check unit exists in the database
                            SqlCommand comUnit = new SqlCommand(checkUnit, con);
                            if (comUnit.ExecuteScalar() == null)
                            {
                                errorString += "* Row number : " + rowCounter + " - Unit Code does not exist in the data base ( " + unitCode.Text + " )<br>";
                                containErrors = true;
                            }
                            con.Close();

                            studentID.Text = StudentID;
                            studentID.Visible = false;
                            con.Open();
                            string checkStundet = "select StudentID from StudentData where StudentID='" + studentID.Text + "'";// to check student id registered inside the student data table
                            SqlCommand comStudent = new SqlCommand(checkStundet, con);
                            if (comStudent.ExecuteScalar() == null)
                            {
                                errorString += "* Row number : " + rowCounter + " - Student ID does not exist in the data base ( " + studentID.Text + " )<br>";
                                containErrors = true;
                            }
                            con.Close();

                            semester.Text = SemesterID;
                            semester.Visible = false;

                            year.Text = Year;
                            year.Visible = false;

                            a1.Text = Assignment_01;
                            a1.Visible = false;

                            a2.Text = Assignment_02;
                            a2.Visible = false;

                            exam.Text = Exam;
                            exam.Visible = false;

                            if (containErrors)
                            {
                                lblError.Visible = true;
                            }
                            else
                            {
                                dsInsertResult.Insert();
                            }
                        }
                        catch (System.Exception error)// will catch any exception thrown because of invalid excel table format
                            {
                            lblError.Text = " Invalid excel table format [ Must have 7 columns ]";
                            lblStatus.Visible = true;
                            mycon.Close();
                            return;
                            }
                        }
                    mycon.Close();
                    lblError.Text = errorString;
                    lblStatus.Visible = true;
                    File.Delete(ExcelPath);// delete the exel file after reading data
                }
                else
                {
                    lblFileStatus.Text = "Invalid file type, Please insert a .xslx type file";
                    lblFileStatus.ForeColor = System.Drawing.Color.Red;
                    lblFileStatus.Visible = true;
                }
            }
            else
            {
                lblFileStatus.Text = "Please insert a file to upload";
                lblFileStatus.ForeColor = System.Drawing.Color.Red;
                lblFileStatus.Visible = true;
            }
        }
        protected void lbLogout_Click(object sender, EventArgs e)
        {
            Session["Manager"] = null;
            Response.Redirect("/Account/Login.aspx");
        }

        protected void lbAddResults_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ManageResults/addResults.aspx");
        }

        protected void lbHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ManageResults/ManageResults.aspx");
        }
    }
}
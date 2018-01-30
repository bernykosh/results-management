<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View_Results.aspx.cs" Inherits="ViewResults" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Results</title>
    <style type="text/css">
        .auto-style1 {
            width: 16%;
        }

        .auto-style2 {
            width: 61px;
            text-align: right;
        }

        .auto-style6 {
            color: #660033;
            font-size: large;
            font-family: Arial;
        }

        .auto-style7 {
            color: #000099;
            font-family: Arial;
        }

        .auto-style8 {
            font-size: large;
            text-align: center;
        }

        .auto-style9 {
            color: #CC0000;
            font-size: small;
        }

        .auto-style10 {
            text-align: left;
            width: 66px;
        }
        .auto-style34 {
            color: #660033;
            font-size: large;
            font-family: Arial;
        }
        .auto-style32 {
            width: 13px;
            text-align: center;
            color: #660033;
            font-size: large;
            height: 25px;
        }
        .auto-style31 {
            width: 141px;
            text-align: left;
            color: #000066;
            font-size: large;
            height: 25px;
        }
        </style>
    <h1 class="auto-style7">View Results</h1>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2"><strong>
                <asp:HyperLink ID="Home" runat="server" CssClass="auto-style34" NavigateUrl="~/Home_Page.aspx">Home</asp:HyperLink>
                </strong></td>
            <td class="auto-style32"><strong>&gt;</strong></td>
            <td class="auto-style31"><strong>
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="auto-style34" NavigateUrl="~/Add_Results.aspx">Add Results</asp:HyperLink>
                </strong></td>
        </tr>
    </table>
    <hr />
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; font-family: Arial">
            <asp:SqlDataSource ID="SqlDataSourceVR" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT Students.Student_Photo, Results.Student_ID, Results.Unit_Code, Results.Semester, Results.Year, Results.Assessment_01_Mark, Results.Assessment_02_Mark, Results.Exam_Mark, Units.Unit_Title FROM Results INNER JOIN Students ON Results.Student_ID = Students.Student_ID INNER JOIN Units ON Results.Unit_Code = Units.Unit_Code"></asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceVR" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="2" GridLines="None" OnRowDataBound="GridView2_RowDataBound" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="Student_Photo" HeaderText="Student_Photo" SortExpression="Student_Photo" Visible="False" />
                    <asp:BoundField DataField="Student_ID" HeaderText="Student ID" SortExpression="Student_ID" />
                    <asp:ImageField DataImageUrlField="Student_Photo" HeaderText="Student Photo" ControlStyle-Width="55" ControlStyle-Height="55">
                        <ControlStyle Height="55px" Width="55px"></ControlStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="Unit_Code" HeaderText="Unit Code" SortExpression="Unit_Code" />
                    <asp:BoundField DataField="Unit_Title" HeaderText="Unit Title" SortExpression="Unit_Title" />
                    <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                    <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                    <asp:BoundField DataField="Assessment_01_Mark" HeaderText="Assessment 01" SortExpression="Assessment_01_Mark" />
                    <asp:BoundField DataField="Assessment_02_Mark" HeaderText="Assessment 02" SortExpression="Assessment_02_Mark" />
                    <asp:BoundField DataField="Exam_Mark" HeaderText="Exam Mark" SortExpression="Exam_Mark" />
                    <asp:TemplateField HeaderText="Total Mark"></asp:TemplateField>
                    <asp:TemplateField HeaderText="Grade"></asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <span class="auto-style9"><em><strong>No Result Records Available..</strong></em></span>
                </EmptyDataTemplate>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
    </form>
    </div>
</body>
</html>

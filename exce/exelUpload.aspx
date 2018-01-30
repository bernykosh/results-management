<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exelUpload.aspx.cs" Inherits="Final_Assignment.ManageResults.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: right;
            width: 177px;
            height: 41px;
        }
        .auto-style4 {
            width: 177px;
        }
        .auto-style5 {
            color: #00CC00;
            font-size: x-large;
        }
        .auto-style6 {
            text-align: right;
            width: 177px;
            height: 43px;
        }
        .auto-style7 {
            height: 43px;
        }
        .auto-style8 {
            height: 41px;
        }
        .auto-style9 {
            color: #FF3300;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <strong>Upload results |
        <asp:LinkButton ID="lbHome" runat="server" OnClick="lbHome_Click">Home</asp:LinkButton>
&nbsp;|
        <asp:LinkButton ID="lbAddResults" runat="server" OnClick="lbAddResults_Click">Add Results</asp:LinkButton>
&nbsp;|
        <asp:LinkButton ID="lbLogout" runat="server" OnClick="lbLogout_Click">Logout</asp:LinkButton>
&nbsp;| <br />
        <br />
        </strong>
    
    </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style6">Upload File : </td>
                <td class="auto-style7">
                    <asp:FileUpload ID="ufExel" runat="server" BackColor="#0099FF" BorderColor="#999999" Height="21px" Width="219px" />
                    <asp:Label ID="lblFileStatus" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="btnSave" runat="server" Height="25px" OnClick="btnSave_Click" Text="Save Result" Width="113px" />
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:Label ID="lblStatus" runat="server" CssClass="auto-style5" Text="Data has been saved" Visible="False"></asp:Label>
        <asp:TextBox ID="unitCode" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="studentID" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="semester" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="year" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="a1" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="a2" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="exam" runat="server" Visible="False"></asp:TextBox>
        <br />
        <asp:Label ID="lblError" runat="server" CssClass="auto-style9" Text="Label" Visible="False"></asp:Label>
        <br />
        <asp:SqlDataSource ID="dsInsertResult" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:LoginConnectionString %>" DeleteCommand="DELETE FROM [ResultData] WHERE [ID] = @original_ID AND [UnitCode] = @original_UnitCode AND [StudentID] = @original_StudentID AND (([SemesterID] = @original_SemesterID) OR ([SemesterID] IS NULL AND @original_SemesterID IS NULL)) AND (([Year] = @original_Year) OR ([Year] IS NULL AND @original_Year IS NULL)) AND (([Assigment_01] = @original_Assigment_01) OR ([Assigment_01] IS NULL AND @original_Assigment_01 IS NULL)) AND (([Assigment_02] = @original_Assigment_02) OR ([Assigment_02] IS NULL AND @original_Assigment_02 IS NULL)) AND (([Exam] = @original_Exam) OR ([Exam] IS NULL AND @original_Exam IS NULL))" InsertCommand="INSERT INTO [ResultData] ([UnitCode], [StudentID], [SemesterID], [Year], [Assigment_01], [Assigment_02], [Exam]) VALUES (@UnitCode, @StudentID, @SemesterID, @Year, @Assigment_01, @Assigment_02, @Exam)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ResultData]" UpdateCommand="UPDATE [ResultData] SET [UnitCode] = @UnitCode, [StudentID] = @StudentID, [SemesterID] = @SemesterID, [Year] = @Year, [Assigment_01] = @Assigment_01, [Assigment_02] = @Assigment_02, [Exam] = @Exam WHERE [ID] = @original_ID AND [UnitCode] = @original_UnitCode AND [StudentID] = @original_StudentID AND (([SemesterID] = @original_SemesterID) OR ([SemesterID] IS NULL AND @original_SemesterID IS NULL)) AND (([Year] = @original_Year) OR ([Year] IS NULL AND @original_Year IS NULL)) AND (([Assigment_01] = @original_Assigment_01) OR ([Assigment_01] IS NULL AND @original_Assigment_01 IS NULL)) AND (([Assigment_02] = @original_Assigment_02) OR ([Assigment_02] IS NULL AND @original_Assigment_02 IS NULL)) AND (([Exam] = @original_Exam) OR ([Exam] IS NULL AND @original_Exam IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_UnitCode" Type="String" />
                <asp:Parameter Name="original_StudentID" Type="String" />
                <asp:Parameter Name="original_SemesterID" Type="String" />
                <asp:Parameter Name="original_Year" Type="String" />
                <asp:Parameter Name="original_Assigment_01" Type="Int32" />
                <asp:Parameter Name="original_Assigment_02" Type="Int32" />
                <asp:Parameter Name="original_Exam" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="unitCode" Name="UnitCode" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="studentID" Name="StudentID" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="semester" Name="SemesterID" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="year" Name="Year" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="a1" Name="Assigment_01" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="a2" Name="Assigment_02" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="exam" Name="Exam" PropertyName="Text" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UnitCode" Type="String" />
                <asp:Parameter Name="StudentID" Type="String" />
                <asp:Parameter Name="SemesterID" Type="String" />
                <asp:Parameter Name="Year" Type="String" />
                <asp:Parameter Name="Assigment_01" Type="Int32" />
                <asp:Parameter Name="Assigment_02" Type="Int32" />
                <asp:Parameter Name="Exam" Type="Int32" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_UnitCode" Type="String" />
                <asp:Parameter Name="original_StudentID" Type="String" />
                <asp:Parameter Name="original_SemesterID" Type="String" />
                <asp:Parameter Name="original_Year" Type="String" />
                <asp:Parameter Name="original_Assigment_01" Type="Int32" />
                <asp:Parameter Name="original_Assigment_02" Type="Int32" />
                <asp:Parameter Name="original_Exam" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

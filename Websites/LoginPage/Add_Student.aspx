<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Student.aspx.cs" Inherits="Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <title>Add Student</title>
    <style type="text/css">
        .auto-style1 {
            width: 22%;
        }
        .auto-style8 {
            width: 50%;
            color: #000099;
            font-family: Arial;
        }
        .auto-style9 {
            width: 94%;
        }
        .auto-style15 {
            width: 216px;
            text-align: right;
            color: #000099;
        }
        .auto-style16 {
            color: #000099;
        }
        .auto-style18 {
            font-weight: bold;
            color: #000066;
            font-size: large;
        }
        .auto-style19 {
            height: 23px;
            width: 481px;
            text-align: left;
        }
        .auto-style20 {
            width: 481px;
            text-align: left;
        }
        .auto-style22 {
            width: 216px;
            text-align: right;
            color: #000099;
            height: 26px;
        }
        .auto-style23 {
            width: 481px;
            text-align: left;
            height: 26px;
        }
        .auto-style24 {
            width: 216px;
        }
        .auto-style25 {
            font-size: small;
        }
        .auto-style26 {
            width: 216px;
            text-align: right;
            color: #000099;
            height: 23px;
        }
        .auto-style38 {
            font-weight: bold;
        }
        .auto-style39 {
            width: 216px;
            text-align: right;
            color: #000099;
            height: 29px;
        }
        .auto-style40 {
            width: 481px;
            text-align: left;
            height: 29px;
        }
        .auto-style41 {
            height: 465px;
            text-align: left;
        }
        .auto-style42 {
            text-align: left;
        }
        .auto-style45 {
            color: #CC0000;
        }
        .auto-style46 {
            height: 33px;
        }
    </style>
    <h1 class="auto-style8">Add / View Students</h1>
    <table class="auto-style1">
        <tr>
            <td class="auto-style46"><strong>
                <asp:HyperLink ID="Home" runat="server" CssClass="auto-style34" style="font-size: x-large; font-family: Arial; color: #660033;" NavigateUrl="~/Home_Page.aspx">Home</asp:HyperLink>
                </strong></td>
        </tr>
    </table>
&nbsp;<hr />
</head>
<body style="height: 381px">
    <form id="form1" runat="server">
    <div style="font-family:Arial" class="auto-style41">
    
        <asp:SqlDataSource ID="SqlDataSourceAddStudents" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" DeleteCommand="DELETE FROM [Students] WHERE [Student_ID] = @original_Student_ID AND (([Student_Photo] = @original_Student_Photo) OR ([Student_Photo] IS NULL AND @original_Student_Photo IS NULL)) AND (([Student_fName] = @original_Student_fName) OR ([Student_fName] IS NULL AND @original_Student_fName IS NULL)) AND (([Student_Surname] = @original_Student_Surname) OR ([Student_Surname] IS NULL AND @original_Student_Surname IS NULL))" InsertCommand="INSERT INTO [Students] ([Student_ID], [Student_Photo], [Student_fName], [Student_Surname]) VALUES (@Student_ID, @Student_Photo, @Student_fName, @Student_Surname)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Students]" UpdateCommand="UPDATE [Students] SET [Student_Photo] = @Student_Photo, [Student_fName] = @Student_fName, [Student_Surname] = @Student_Surname WHERE [Student_ID] = @original_Student_ID AND (([Student_Photo] = @original_Student_Photo) OR ([Student_Photo] IS NULL AND @original_Student_Photo IS NULL)) AND (([Student_fName] = @original_Student_fName) OR ([Student_fName] IS NULL AND @original_Student_fName IS NULL)) AND (([Student_Surname] = @original_Student_Surname) OR ([Student_Surname] IS NULL AND @original_Student_Surname IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Student_ID" Type="Int32" />
                <asp:Parameter Name="original_Student_Photo" Type="String" />
                <asp:Parameter Name="original_Student_fName" Type="String" />
                <asp:Parameter Name="original_Student_Surname" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TxtBox_StudID" Name="Student_ID" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TB_StudentPhoto" Name="Student_Photo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TxtBox_fName" Name="Student_fName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TxtBox_Surname" Name="Student_Surname" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Student_Photo" Type="String" />
                <asp:Parameter Name="Student_fName" Type="String" />
                <asp:Parameter Name="Student_Surname" Type="String" />
                <asp:Parameter Name="original_Student_ID" Type="Int32" />
                <asp:Parameter Name="original_Student_Photo" Type="String" />
                <asp:Parameter Name="original_Student_fName" Type="String" />
                <asp:Parameter Name="original_Student_Surname" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <table class="auto-style9">
            <tr>
                <td class="auto-style26">
                    <h3 class="auto-style16">Student ID:</h3>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="LabelExists" runat="server" CssClass="auto-style25" ForeColor="#CC0000"></asp:Label>
                    <br />
                    <asp:TextBox ID="TxtBox_StudID" runat="server" Width="180px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtBox_StudID" CssClass="auto-style25" ErrorMessage="*Student ID must contain only 8 digits" ForeColor="#CC0000" ValidationExpression="^[0-9]{8}$" ValidationGroup="SavingGroup"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtBox_StudID" CssClass="auto-style25" ErrorMessage="*Student ID cannot be blank" ForeColor="#CC0000" ValidationGroup="SavingGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style39">
                    <h3 class="auto-style16">Student First Name:</h3>
                </td>
                <td class="auto-style40">
                    <asp:TextBox ID="TxtBox_fName" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtBox_fName" CssClass="auto-style25" ErrorMessage="*Student Name cannot be blank" ForeColor="#CC0000" ValidationGroup="SavingGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
                    <h3 class="auto-style16"><strong>Student Surname:</strong></h3>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="TxtBox_Surname" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtBox_Surname" CssClass="auto-style25" ErrorMessage="*Student Surname cannot be blank" ForeColor="#CC0000" ValidationGroup="SavingGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <h3 class="auto-style16"><strong>Student Photo:</strong></h3>
                </td>
                <td class="auto-style20">
                    <asp:FileUpload ID="FileUpload_StudentPhoto" runat="server" Width="180px" />
                  
                    &nbsp;<asp:TextBox ID="TB_StudentPhoto" runat="server" Visible="False" Width="16px"></asp:TextBox>
&nbsp;
                    <asp:Label ID="LabelBrowse" runat="server" CssClass="auto-style25" Text="Upload your file here."></asp:Label>
                   
                </td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style20">
                    <strong>
                    <asp:Button ID="ButtonSave" runat="server" OnClick="Button1_Click" Text="Save" Width="95px" CssClass="auto-style18" Height="26px" ValidationGroup="SavingGroup" />
                    &nbsp;
                    </strong>
                    <asp:Label ID="LabelAdd" runat="server" CssClass="auto-style25"></asp:Label>
                    <strong>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="Reset" Height="26px" Width="62px" CssClass="auto-style38" OnClick="Button2_Click" />
                    </strong>
                </td>
            </tr>
        </table>
        &nbsp;
        <hr />
        <div style="font-family:Arial; text-align:center" class="auto-style42">

            <asp:GridView ID="GridViewStudent" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Student_ID" DataSourceID="SqlDataSourceAddStudents" AllowPaging="True" OnRowDataBound="GridViewStudent_RowDataBound" OnRowDeleting="GridViewStudent_RowDeleting">
                <Columns>
                    <asp:TemplateField HeaderText="Edit Details" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" OnClientClick="return confirm('Are you sure you want to update?');" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Student_ID" HeaderText="Student ID" ReadOnly="True" SortExpression="Student_ID" />
                    <asp:ImageField DataImageUrlField="Student_Photo" HeaderText="Student Photo" ControlStyle-Width="50" ControlStyle-Height = "50">
<ControlStyle Height="50px" Width="50px"></ControlStyle>
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="Student Name" SortExpression="Student_fName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Student_fName") %>'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" CssClass="auto-style25" ErrorMessage="*Student Name cannot be blank" Font-Italic="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Student_fName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Student Surname" SortExpression="Student_Surname">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Student_Surname") %>'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" CssClass="auto-style25" ErrorMessage="*Surname cannot be blank" Font-Bold="False" Font-Italic="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Student_Surname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remove Student" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <span class="auto-style45"><strong>No Students Added..</strong></span>
                </EmptyDataTemplate>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>

        </div>
    
    </div>
    </form>
</body>
</html>

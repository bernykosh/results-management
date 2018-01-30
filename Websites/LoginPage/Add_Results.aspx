<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Results.aspx.cs" Inherits="Add_Results" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Results</title>
    <style type="text/css">
        .auto-style1 {
            width: 55%;
        }
        .auto-style2 {
            width: 61px;
            text-align: right;
            height: 25px;
        }
        .auto-style8 {
            width: 31%;
            color: #000099;
            font-family: Arial;
        }
        .auto-style9 {
            width: 82%;
            margin-left: 96px;
        }
        .auto-style10 {
            height: 23px;
            width: 198px;
            text-align: left;
        }
        .auto-style15 {
            width: 251px;
            text-align: right;
            color: #000099;
        }
        .auto-style20 {
            width: 372px;
            text-align: right;
            color: #000099;
        }
        .auto-style21 {
            width: 372px;
            text-align: right;
            color: #000099;
            height: 42px;
        }
        .auto-style23 {
            width: 251px;
            text-align: right;
            color: #000099;
            height: 42px;
        }
        .auto-style24 {
            height: 23px;
            width: 163px;
            }
        .auto-style25 {
            width: 163px;
            text-align: left;
            height: 42px;
        }
        .auto-style30 {
            font-weight: bold;
            color: #000066;
            font-size: large;
        }
        .auto-style32 {
            width: 13px;
            text-align: center;
            color: #660033;
            font-size: large;
            height: 25px;
        }
        .auto-style34 {
            color: #660033;
            font-size: large;
            font-family: Arial;
        }
        .auto-style35 {
            width: 163px;
            text-align: left;
        }
        .auto-style36 {
            width: 298px;
            text-align: left;
            height: 42px;
            font-size: small;
        }
        .auto-style37 {
            text-align: left;
        }
        .auto-style38 {
            font-weight: bold;
        }
        .auto-style39 {
            font-size: small;
        }
        .auto-style40 {
            width: 615px;
            text-align: left;
            color: #000099;
        }
        .auto-style41 {
            width: 615px;
            text-align: left;
            color: #000099;
            height: 42px;
        }
        .auto-style42 {
            width: 615px;
            text-align: right;
            color: #000099;
        }
        .auto-style45 {
            width: 679px;
            height: 42px;
        }
        .auto-style47 {
            width: 679px;
            height: 26px;
        }
        .auto-style48 {
            width: 679px;
        }
        .auto-style49 {
            width: 198px;
            text-align: left;
            height: 42px;
        }
        .auto-style50 {
            width: 198px;
            text-align: left;
        }
        .auto-style51 {
            width: 198px;
            text-align: left;
            height: 26px;
        }
        .auto-style52 {
            color: #CC0000;
        }
        .auto-style53 {
            width: 15px;
            text-align: center;
            color: #990033;
            font-size: large;
            height: 25px;
        }
        .auto-style54 {
            width: 117px;
            text-align: left;
            color: #000066;
            font-size: large;
            height: 25px;
        }
        </style>
    <h1 class="auto-style8">Add Results</h1>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2"><strong>
                <asp:HyperLink ID="Home" runat="server" CssClass="auto-style34" NavigateUrl="~/Home_Page.aspx">Home</asp:HyperLink>
                </strong></td>
            <td class="auto-style32"><strong>&gt;</strong></td>
            <td class="auto-style54"><strong>
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="auto-style34" NavigateUrl="~/View_Results.aspx">View Results</asp:HyperLink>
                </strong></td>
            <td class="auto-style53"><strong>&gt;</strong></td>
            <td class="auto-style34"><strong>
                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="auto-style34" NavigateUrl="~/Excel_File_Upload.aspx">Excel File Upload</asp:HyperLink>
                </strong></td>
        </tr>
    </table>
&nbsp;
    <hr />
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-family:Arial" class="auto-style37">
    
        <asp:SqlDataSource ID="SqlDataSourceAddResults" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" DeleteCommand="DELETE FROM [Results] WHERE [Id] = @original_Id AND (([Student_ID] = @original_Student_ID) OR ([Student_ID] IS NULL AND @original_Student_ID IS NULL)) AND (([Unit_Code] = @original_Unit_Code) OR ([Unit_Code] IS NULL AND @original_Unit_Code IS NULL)) AND (([Semester] = @original_Semester) OR ([Semester] IS NULL AND @original_Semester IS NULL)) AND (([Year] = @original_Year) OR ([Year] IS NULL AND @original_Year IS NULL)) AND (([Assessment_01_Mark] = @original_Assessment_01_Mark) OR ([Assessment_01_Mark] IS NULL AND @original_Assessment_01_Mark IS NULL)) AND (([Assessment_02_Mark] = @original_Assessment_02_Mark) OR ([Assessment_02_Mark] IS NULL AND @original_Assessment_02_Mark IS NULL)) AND (([Exam_Mark] = @original_Exam_Mark) OR ([Exam_Mark] IS NULL AND @original_Exam_Mark IS NULL))" InsertCommand="INSERT INTO [Results] ([Student_ID], [Unit_Code], [Semester], [Year], [Assessment_01_Mark], [Assessment_02_Mark], [Exam_Mark]) VALUES (@Student_ID, @Unit_Code, @Semester, @Year, @Assessment_01_Mark, @Assessment_02_Mark, @Exam_Mark)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Results]" UpdateCommand="UPDATE [Results] SET [Student_ID] = @Student_ID, [Unit_Code] = @Unit_Code, [Semester] = @Semester, [Year] = @Year, [Assessment_01_Mark] = @Assessment_01_Mark, [Assessment_02_Mark] = @Assessment_02_Mark, [Exam_Mark] = @Exam_Mark WHERE [Id] = @original_Id AND (([Student_ID] = @original_Student_ID) OR ([Student_ID] IS NULL AND @original_Student_ID IS NULL)) AND (([Unit_Code] = @original_Unit_Code) OR ([Unit_Code] IS NULL AND @original_Unit_Code IS NULL)) AND (([Semester] = @original_Semester) OR ([Semester] IS NULL AND @original_Semester IS NULL)) AND (([Year] = @original_Year) OR ([Year] IS NULL AND @original_Year IS NULL)) AND (([Assessment_01_Mark] = @original_Assessment_01_Mark) OR ([Assessment_01_Mark] IS NULL AND @original_Assessment_01_Mark IS NULL)) AND (([Assessment_02_Mark] = @original_Assessment_02_Mark) OR ([Assessment_02_Mark] IS NULL AND @original_Assessment_02_Mark IS NULL)) AND (([Exam_Mark] = @original_Exam_Mark) OR ([Exam_Mark] IS NULL AND @original_Exam_Mark IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Student_ID" Type="Int32" />
                <asp:Parameter Name="original_Unit_Code" Type="String" />
                <asp:Parameter Name="original_Semester" Type="Int32" />
                <asp:Parameter Name="original_Year" Type="Int32" />
                <asp:Parameter Name="original_Assessment_01_Mark" Type="Int32" />
                <asp:Parameter Name="original_Assessment_02_Mark" Type="Int32" />
                <asp:Parameter Name="original_Exam_Mark" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DropDownListStudents" Name="Student_ID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownListUnits" Name="Unit_Code" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="RBListSemes" Name="Semester" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox_Year" Name="Year" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox_Ass01" Name="Assessment_01_Mark" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox_Ass02" Name="Assessment_02_Mark" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="TextBox_ExamMark" Name="Exam_Mark" PropertyName="Text" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Student_ID" Type="Int32" />
                <asp:Parameter Name="Unit_Code" Type="String" />
                <asp:Parameter Name="Semester" Type="Int32" />
                <asp:Parameter Name="Year" Type="Int32" />
                <asp:Parameter Name="Assessment_01_Mark" Type="Int32" />
                <asp:Parameter Name="Assessment_02_Mark" Type="Int32" />
                <asp:Parameter Name="Exam_Mark" Type="Int32" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Student_ID" Type="Int32" />
                <asp:Parameter Name="original_Unit_Code" Type="String" />
                <asp:Parameter Name="original_Semester" Type="Int32" />
                <asp:Parameter Name="original_Year" Type="Int32" />
                <asp:Parameter Name="original_Assessment_01_Mark" Type="Int32" />
                <asp:Parameter Name="original_Assessment_02_Mark" Type="Int32" />
                <asp:Parameter Name="original_Exam_Mark" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStud" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Student_ID], [Student_Photo] FROM [Students]" InsertCommand="INSERT INTO [Students] ([Student_ID]) VALUES (@Student_ID)   ">
            <InsertParameters>
                <asp:ControlParameter ControlID="DropDownListStudents" Name="Student_ID" PropertyName="SelectedValue" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceUC" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT [Unit_Code] FROM [Units]" DeleteCommand="DELETE FROM [Units] WHERE [Unit_Code] = @original_Unit_Code" InsertCommand="INSERT INTO [Units] ([Unit_Code]) VALUES (@Unit_Code)" OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_Unit_Code" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="DropDownListUnits" Name="Unit_Code" PropertyName="SelectedValue" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <table class="auto-style9">
            <tr>
                <td class="auto-style20">
                    <h4><strong>Student ID:</strong></h4>
                </td>
                <td class="auto-style24">
                    <asp:DropDownList ID="DropDownListStudents" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceStud" DataTextField="Student_ID" DataValueField="Student_ID" Height="25px" Width="186px">
                    </asp:DropDownList>
                </td>
                <td class="auto-style40">
                    &nbsp;</td>
                <td class="auto-style23">
                    <h4>Assessment 01 Mark:</h4>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="TextBox_Ass01" runat="server" Width="180px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="FieldValidatorAss1" runat="server" ControlToValidate="TextBox_Ass01" CssClass="auto-style39" ErrorMessage="*Assignment 01 cannot be Blank" ForeColor="#CC0000" ValidationGroup="AddingResults"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style45">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox_Ass01" CssClass="auto-style39" ErrorMessage="*Mark should be between 0 - 20" ForeColor="#CC0000" ValidationExpression="^[0-9]$|^0[1-9]$|^1[0-9]$|^20$" ValidationGroup="AddingResults"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">
                    <h4><strong>Unit </strong>Code:</h4>
                </td>
                <td class="auto-style25">
                    <asp:DropDownList ID="DropDownListUnits" runat="server" DataSourceID="SqlDataSourceUC" DataTextField="Unit_Code" DataValueField="Unit_Code" Height="25px" Width="186px" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style41">
                    &nbsp;</td>
                <td class="auto-style15">
                    <h4>Assessment 02 Mark:</h4>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="TextBox_Ass02" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="FieldValidatorAss2" runat="server" ControlToValidate="TextBox_Ass02" CssClass="auto-style39" ErrorMessage="*Assignment 02 cannot be Blank" ForeColor="#CC0000" ValidationGroup="AddingResults"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style45">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox_Ass02" CssClass="auto-style39" ErrorMessage="*Mark should be between 0 - 20" ForeColor="#CC0000" ValidationExpression="^[0-9]$|^0[1-9]$|^1[0-9]$|^20$" ValidationGroup="AddingResults"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <h4>Semester:</h4>
                </td>
                <td class="auto-style35">
                    <strong>
                    <asp:RadioButtonList ID="RBListSemes" runat="server" Height="39px" Width="43px" CellPadding="1" CellSpacing="1">
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                    </strong>
                   
                </td>
                <td class="auto-style42">
                    <asp:RequiredFieldValidator ID="RFieldValidatorSemes" runat="server" CssClass="auto-style39" ErrorMessage="*Please select a Semester" ValidationGroup="AddingResults" ControlToValidate="RBListSemes" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style15">
                    <h4>Exam Mark:</h4>
                </td>
                <td class="auto-style50">
                    <asp:TextBox ID="TextBox_ExamMark" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="FieldValidatorMark" runat="server" ControlToValidate="TextBox_ExamMark" CssClass="auto-style39" ErrorMessage="*Exam Mark cannot be Blank" ForeColor="#CC0000" ValidationGroup="AddingResults"></asp:RequiredFieldValidator>
                    <br />
                </td>
                <td class="auto-style48">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TextBox_ExamMark" CssClass="auto-style39" ErrorMessage="*Exam Mark should be between 0 - 60" ForeColor="#CC0000" ValidationExpression="^[0-9]$|^0[1-9]$|^1[0-9]$|^2[0-9]$|^3[0-9]$|^4[0-9]$|^5[0-9]$|^60$" ValidationGroup="AddingResults"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <h4>Year:</h4>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBox_Year" runat="server" Width="180px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="FieldValidatorYear" runat="server" ControlToValidate="TextBox_Year" CssClass="auto-style39" ErrorMessage="*Year cannot be Blank" ForeColor="#CC0000" ValidationGroup="AddingResults"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style40">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox_Year" CssClass="auto-style39" ErrorMessage="*Year must be in the format of [yyyy]" ForeColor="#CC0000" ValidationExpression="^[0-9]{4}$" ValidationGroup="AddingResults"></asp:RegularExpressionValidator>
                </td>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style51">
                    <strong>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" Width="113px" CssClass="auto-style30" ValidationGroup="AddingResults" />
                    <br />
                    <asp:Label ID="LabelAdd" runat="server" CssClass="auto-style36"></asp:Label>
                    </strong>
                    <br />
                </td>
                <td class="auto-style47">
                    <strong>
                    <asp:Button ID="Button2" runat="server" Text="Reset" Height="26px" Width="62px" CssClass="auto-style38" OnClick="Button2_Click" />
                    </strong>
                </td>
            </tr>
            </table>
        </div>
        <hr />
        <div style="font-family:Arial; text-align:center" class="auto-style37">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSourceAddResults" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Edit Result" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton OnClientClick="return confirm('Are you sure to UPDATE?');" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" Font-Bold="False"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                    <asp:TemplateField HeaderText="Student ID" SortExpression="Student_ID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDLStud" runat="server" DataSourceID="SqlDataSourceStud" DataTextField="Student_ID" DataValueField="Student_ID" Height="25px" SelectedValue='<%# Bind("Student_ID") %>' Width="124px">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Student_ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit Code" SortExpression="Unit_Code">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDListUC" runat="server" DataSourceID="SqlDataSourceUC" DataTextField="Unit_Code" DataValueField="Unit_Code" Height="25px" SelectedValue='<%# Bind("Unit_Code") %>' Width="117px">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Unit_Code") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Semester" SortExpression="Semester">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDListSemester" runat="server" Height="18px" SelectedValue='<%# Bind("Semester") %>' Width="45px">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Semester") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Year" SortExpression="Year">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBoxYear" runat="server" Text='<%# Bind("Year") %>' Height="16px" Width="74px"></asp:TextBox>
                            <em>
                            <br />
                            <asp:RequiredFieldValidator ID="FieldValidatorYear" runat="server" ControlToValidate="txtBoxYear" CssClass="auto-style53" ErrorMessage="*Year cannot be blank" Font-Italic="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            <br />
                            </em>
                            <asp:RegularExpressionValidator ID="ExpressionValidatorYear" runat="server" ControlToValidate="txtBoxYear" CssClass="auto-style39" ErrorMessage="*Year must be in format [yyyy]" Font-Italic="True" ForeColor="#CC0000" ValidationExpression="^[0-9]{4}$"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Year") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Assessment 01" SortExpression="Assessment_01_Mark">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBoxAss01" runat="server" Text='<%# Bind("Assessment_01_Mark") %>'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="FieldValidatorAss01" runat="server" ControlToValidate="txtBoxAss01" CssClass="auto-style39" ErrorMessage="*Assign 01 cannot be blank" Font-Italic="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="ExpressionValidatorAss01" runat="server" ControlToValidate="txtBoxAss01" CssClass="auto-style39" ErrorMessage="*Mark between 0 - 20" Font-Italic="True" ForeColor="#CC0000" ValidationExpression="^[0-9]$|^0[1-9]$|^1[0-9]$|^20$"></asp:RegularExpressionValidator>
                            <br />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Assessment_01_Mark") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Assessment 02" SortExpression="Assessment_02_Mark">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBoxAss02" runat="server" Text='<%# Bind("Assessment_02_Mark") %>' Height="16px" Width="60px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="FieldValidatorAss02" runat="server" ControlToValidate="txtBoxAss02" CssClass="auto-style39" ErrorMessage="*Assign 02 cannot be blank" Font-Italic="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="ExpressionValidatorAss02" runat="server" ControlToValidate="txtBoxAss02" CssClass="auto-style39" ErrorMessage="*Mark between 0 - 20" Font-Italic="True" ForeColor="#CC0000" ValidationExpression="^[0-9]$|^0[1-9]$|^1[0-9]$|^20$"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Assessment_02_Mark") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Exam Mark" SortExpression="Exam_Mark">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBoxMark" runat="server" Text='<%# Bind("Exam_Mark") %>' Height="16px" Width="60px"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="FieldValidatorExam" runat="server" ControlToValidate="txtBoxMark" CssClass="auto-style39" ErrorMessage="*Exam Mark cannot be blank" Font-Italic="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="ExpressionValidatorExam" runat="server" ControlToValidate="txtBoxMark" CssClass="auto-style39" ErrorMessage="*Mark between 0 - 60" Font-Italic="True" ForeColor="#CC0000" ValidationExpression="^[0-9]$|^0[1-9]$|^1[0-9]$|^2[0-9]$|^3[0-9]$|^4[0-9]$|^5[0-9]$|^60$"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Exam_Mark") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete Result" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <span class="auto-style52"><strong><em>No Records Added..</em></strong></span>
                </EmptyDataTemplate>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <br />
        <br />
    
        </div>
    
    
    </form>
</body>
</html>

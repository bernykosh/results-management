<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Units.aspx.cs" Inherits="Add_Units" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Units</title>
    <style type="text/css">
        .auto-style1 {
            width: 16%;
        }
        .auto-style2 {
            width: 61px;
            font-family: Arial;
            height: 25px;
        }
        .auto-style6 {
            color: #660033;
            font-size: large;
            font-family: Arial;
        }
        .auto-style8 {
            width: 23%;
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
        .auto-style22 {
            width: 216px;
            text-align: right;
            color: #000099;
            height: 26px;
        }
        .auto-style24 {
            width: 216px;
        }
        .auto-style25 {
            font-size: small;
        }
        .auto-style26 {
            width: 117px;
            }
        .auto-style28 {
            text-align: left;
        }
        .auto-style29 {
            font-size: large;
            color: #660033;
        }
        .auto-style30 {
            height: 23px;
            width: 447px;
            text-align: left;
        }
        .auto-style31 {
            width: 447px;
            text-align: left;
        }
        .auto-style32 {
            width: 447px;
            text-align: left;
            height: 26px;
        }
        .auto-style33 {
            font-weight: bold;
        }
        .auto-style34 {
            width: 216px;
            text-align: right;
            color: #000099;
            height: 29px;
        }
        .auto-style35 {
            width: 447px;
            text-align: left;
            height: 29px;
        }
        .auto-style36 {
            color: #CC0000;
        }
        .auto-style37 {
            width: 216px;
            text-align: right;
            color: #660033;
            height: 29px;
        }
    </style>
    <h1 class="auto-style8">Add Units</h1>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2"><strong>
                <asp:HyperLink ID="Home" runat="server" CssClass="auto-style37" style="font-size: large" NavigateUrl="~/Home_Admin.aspx">Home</asp:HyperLink>
                </strong></td>
            <td class="auto-style29"><strong>&gt;</strong></td>
            <td class="auto-style26"><strong>
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="auto-style6" NavigateUrl="~/View_Units.aspx">View Units</asp:HyperLink>
                </strong></td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp;
</head>
    <hr />
<body>
    <form id="form1" runat="server">
    <div style="font-family:Arial" class="auto-style28">
    
        <asp:SqlDataSource ID="SqlDataSourceAddUnits" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" DeleteCommand="DELETE FROM [Units] WHERE [Unit_Code] = @original_Unit_Code AND (([Unit_Title] = @original_Unit_Title) OR ([Unit_Title] IS NULL AND @original_Unit_Title IS NULL)) AND (([Unit_Coordinator] = @original_Unit_Coordinator) OR ([Unit_Coordinator] IS NULL AND @original_Unit_Coordinator IS NULL)) AND (([Unit_outline_pdf_document] = @original_Unit_outline_pdf_document) OR ([Unit_outline_pdf_document] IS NULL AND @original_Unit_outline_pdf_document IS NULL))" InsertCommand="INSERT INTO [Units] ([Unit_Code], [Unit_Title], [Unit_Coordinator], [Unit_outline_pdf_document]) VALUES (@Unit_Code, @Unit_Title, @Unit_Coordinator, @Unit_outline_pdf_document)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Units]" UpdateCommand="UPDATE [Units] SET [Unit_Title] = @Unit_Title, [Unit_Coordinator] = @Unit_Coordinator, [Unit_outline_pdf_document] = @Unit_outline_pdf_document WHERE [Unit_Code] = @original_Unit_Code AND (([Unit_Title] = @original_Unit_Title) OR ([Unit_Title] IS NULL AND @original_Unit_Title IS NULL)) AND (([Unit_Coordinator] = @original_Unit_Coordinator) OR ([Unit_Coordinator] IS NULL AND @original_Unit_Coordinator IS NULL)) AND (([Unit_outline_pdf_document] = @original_Unit_outline_pdf_document) OR ([Unit_outline_pdf_document] IS NULL AND @original_Unit_outline_pdf_document IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Unit_Code" Type="String" />
                <asp:Parameter Name="original_Unit_Title" Type="String" />
                <asp:Parameter Name="original_Unit_Coordinator" Type="String" />
                <asp:Parameter Name="original_Unit_outline_pdf_document" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TextBox_UnitCode" Name="Unit_Code" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox_UnitTitle" Name="Unit_Title" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TextBox_UnitCoord" Name="Unit_Coordinator" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_UnitOutline" Name="Unit_outline_pdf_document" PropertyName="Text" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Unit_Title" Type="String" />
                <asp:Parameter Name="Unit_Coordinator" Type="String" />
                <asp:Parameter Name="Unit_outline_pdf_document" Type="String" />
                <asp:Parameter Name="original_Unit_Code" Type="String" />
                <asp:Parameter Name="original_Unit_Title" Type="String" />
                <asp:Parameter Name="original_Unit_Coordinator" Type="String" />
                <asp:Parameter Name="original_Unit_outline_pdf_document" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <table class="auto-style9">
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style30">
                    <asp:Label ID="LabelExists" runat="server" CssClass="auto-style25" ForeColor="#CC0000"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <h3 class="auto-style16"><strong>Unit Code:</strong></h3>
                </td>
                <td class="auto-style30">
                    <asp:TextBox ID="TextBox_UnitCode" runat="server" Width="180px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorUC" runat="server" ControlToValidate="TextBox_UnitCode" CssClass="auto-style25" ErrorMessage="*Unit Code must be in format of aaa111" ForeColor="#CC0000" ValidationExpression="^[a-z]{3}[0-9]{4}$" ValidationGroup="AddingUnits"></asp:RegularExpressionValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_UnitCode" CssClass="auto-style25" ErrorMessage="*Unit Code cannot be Blank" ForeColor="#CC0000" ValidationGroup="AddingUnits"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style34">
                    <h3 class="auto-style16"><strong>Unit Title:</strong></h3>
                </td>
                <td class="auto-style35">
                    <asp:TextBox ID="TextBox_UnitTitle" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUT" runat="server" ControlToValidate="TextBox_UnitTitle" CssClass="auto-style25" ErrorMessage="*Unit Title cannot be Blank" ForeColor="#CC0000" ValidationGroup="AddingUnits"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
                    <h3 class="auto-style16"><strong>Unit Coordinator:</strong></h3>
                </td>
                <td class="auto-style32">
                    <asp:TextBox ID="TextBox_UnitCoord" runat="server" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCoord" runat="server" ControlToValidate="TextBox_UnitCoord" CssClass="auto-style25" ErrorMessage="*Please enter the Unit Coordinator" ForeColor="#CC0000" ValidationGroup="AddingUnits"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style15">
                    <h3 class="auto-style16"><strong>Unit Outline Document:</strong></h3>
                </td>
                <td class="auto-style31">
                    <asp:FileUpload ID="FileUpload_UnitOutline" runat="server" Width="180px" />
                  
                    &nbsp;<asp:TextBox ID="TB_UnitOutline" runat="server" Visible="False" Width="16px"></asp:TextBox>
&nbsp;
                    <asp:Label ID="LabelBrowse" runat="server" CssClass="auto-style25" Text="Upload your file here."></asp:Label>
                   
                </td>
            </tr>
            <tr>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style31">
                    <strong>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add" Width="95px" CssClass="auto-style18" Height="26px" ValidationGroup="AddingUnits" />
                    &nbsp;
                    <asp:Label ID="LabelAdd" runat="server" CssClass="auto-style25"></asp:Label>
                    </strong>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <strong>
                    <asp:Button ID="Button2" runat="server" CssClass="auto-style33" Height="26px" OnClick="Button2_Click" Text="Reset" Width="62px" />
                    </strong></td>
            </tr>
        </table>
        </div>
        <br />
        <hr />
        <div style="text-align:center; font-family:Arial" class="auto-style28">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Unit_Code" DataSourceID="SqlDataSourceAddUnits" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="Edit Details" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton OnClientClick="return confirm('Are you sure you want to update?');" ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Unit_Code" HeaderText="Unit_Code" ReadOnly="True" SortExpression="Unit_Code" />
                    <asp:TemplateField HeaderText="Unit_Title" SortExpression="Unit_Title">
                        <EditItemTemplate>
                            <asp:TextBox ID="TBUnitTitle" runat="server" Text='<%# Bind("Unit_Title") %>'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="FieldValidatorUT" runat="server" ControlToValidate="TBUnitTitle" CssClass="auto-style25" ErrorMessage="*Unit Title cannot be blank" Font-Italic="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Unit_Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit_Coordinator" SortExpression="Unit_Coordinator">
                        <EditItemTemplate>
                            <asp:TextBox ID="TBUnitCoord" runat="server" Text='<%# Bind("Unit_Coordinator") %>'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="FieldValidatorUcoord" runat="server" ControlToValidate="TBUnitCoord" CssClass="auto-style25" ErrorMessage="*Please enter a Unit Coordinator" Font-Italic="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Unit_Coordinator") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit_outline_pdf_document" SortExpression="Unit_outline_pdf_document">
                        <EditItemTemplate>
                            <asp:TextBox ID="TBPDF" runat="server" Text='<%# Bind("Unit_outline_pdf_document") %>'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="FieldValidatorFILE" runat="server" ControlToValidate="TBPDF" CssClass="auto-style25" ErrorMessage="*File field cannot be blank" Font-Italic="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Unit_outline_pdf_document") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <span class="auto-style36"><strong><em>No Unit Records Added..</em></strong></span>
                </EmptyDataTemplate>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
        <br />
    
        </div>
    
    
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View_Units.aspx.cs" Inherits="ManageUnits" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Units</title>
    <style type="text/css">
        .auto-style1 {
            width: 25%;
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
            text-align: center;
            font-size: large;
            color: #660033;
        }
        .auto-style9 {
            color: #CC0000;
            font-size: small;
        }
        .auto-style10 {
            text-align: left;
        }
        </style>
    <h1 class="auto-style7">View Units</h1>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2"><strong>
                <asp:HyperLink ID="Home" runat="server" CssClass="auto-style34" style="font-size: large; font-family: Arial; color: #660033;" NavigateUrl="~/Home_Admin.aspx">Home</asp:HyperLink>
                </strong></td>
            <td class="auto-style8"><strong>&gt;</strong></td>
            <td class="auto-style10"><strong>
                <asp:HyperLink ID="HyperLinkUnits" runat="server" CssClass="auto-style6" NavigateUrl="~/Add_Units.aspx">Add Units</asp:HyperLink>
                </strong></td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp;
    <hr />
</head>
<body>

    <form id="form1" runat="server">
     <div style="text-align:center; font-family:Arial">
    </br>
        <asp:SqlDataSource ID="SqlDataSourceViewUnits" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" DeleteCommand="DELETE FROM [Units] WHERE [Unit_Code] = @original_Unit_Code AND (([Unit_Title] = @original_Unit_Title) OR ([Unit_Title] IS NULL AND @original_Unit_Title IS NULL)) AND (([Unit_Coordinator] = @original_Unit_Coordinator) OR ([Unit_Coordinator] IS NULL AND @original_Unit_Coordinator IS NULL)) AND (([Unit_outline_pdf_document] = @original_Unit_outline_pdf_document) OR ([Unit_outline_pdf_document] IS NULL AND @original_Unit_outline_pdf_document IS NULL))" InsertCommand="INSERT INTO [Units] ([Unit_Code], [Unit_Title], [Unit_Coordinator], [Unit_outline_pdf_document]) VALUES (@Unit_Code, @Unit_Title, @Unit_Coordinator, @Unit_outline_pdf_document)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Units]" UpdateCommand="UPDATE [Units] SET [Unit_Title] = @Unit_Title, [Unit_Coordinator] = @Unit_Coordinator, [Unit_outline_pdf_document] = @Unit_outline_pdf_document WHERE [Unit_Code] = @original_Unit_Code AND (([Unit_Title] = @original_Unit_Title) OR ([Unit_Title] IS NULL AND @original_Unit_Title IS NULL)) AND (([Unit_Coordinator] = @original_Unit_Coordinator) OR ([Unit_Coordinator] IS NULL AND @original_Unit_Coordinator IS NULL)) AND (([Unit_outline_pdf_document] = @original_Unit_outline_pdf_document) OR ([Unit_outline_pdf_document] IS NULL AND @original_Unit_outline_pdf_document IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Unit_Code" Type="String" />
                <asp:Parameter Name="original_Unit_Title" Type="String" />
                <asp:Parameter Name="original_Unit_Coordinator" Type="String" />
                <asp:Parameter Name="original_Unit_outline_pdf_document" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Unit_Code" Type="String" />
                <asp:Parameter Name="Unit_Title" Type="String" />
                <asp:Parameter Name="Unit_Coordinator" Type="String" />
                <asp:Parameter Name="Unit_outline_pdf_document" Type="String" />
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
   
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Unit_Code" DataSourceID="SqlDataSourceViewUnits" OnRowDataBound="GridView2_RowDataBound" OnRowDeleting="GridView2_RowDeleting">
             <Columns>
                 <asp:BoundField DataField="Unit_Code" HeaderText="Unit Code" ReadOnly="True" SortExpression="Unit_Code" />
                 <asp:BoundField DataField="Unit_Title" HeaderText="Unit Title" SortExpression="Unit_Title" />
                 <asp:BoundField DataField="Unit_Coordinator" HeaderText="Unit Coordinator" SortExpression="Unit_Coordinator" />
                 <asp:BoundField DataField="Unit_outline_pdf_document" HeaderText="Unit Outline Document" SortExpression="Unit_outline_pdf_document" />
                 <asp:TemplateField HeaderText="Remove" ShowHeader="False">
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
             <EmptyDataTemplate>
                 <span class="auto-style9"><strong>No Unit Records Available..</strong></span>
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
   
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Unit_Code" DataSourceID="SqlDataSourceViewUnits" OnRowCommand="GridView1_RowCommand1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
             <Columns>
                 <asp:TemplateField HeaderText="Download_pdf_document">
                     <ItemTemplate>
                         <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Unit_outline_pdf_document") %>' CommandName="Download" Text='<%# Eval("Unit_outline_pdf_document") %>'></asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
             <EmptyDataTemplate>
                 <span class="auto-style9"><strong><em>No Files Available to Download..</em></strong></span>
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
    <p>
        &nbsp;</p>
    </form>
    </body>
</html>

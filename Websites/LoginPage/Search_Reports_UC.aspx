<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search_Reports_UC.aspx.cs" Inherits="Search_Reports_UC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Reports of Units</title>
    <style type="text/css">
        .auto-style1 {
            width: 25%;
        }
        .auto-style8 {
            width: 51%;
            color: #000099;
            font-family: Arial;
        }
        .auto-style34 {
            color: #000080;
            font-size: medium;
            font-family: Arial;
        }
        .auto-style17 {
            font-weight: bold;
        }
        .auto-style6 {
            width: 421px;
            text-align: left;
        }
        .auto-style36 {
            height: 572px;
        }
        .auto-style37 {
            color: #000099;
            font-size: medium;
            font-family: Arial;
        }
        .auto-style39 {
            font-size: large;
            color: #CC0000;
            font-family: Arial;
            text-align: right;
            height: 26px;
        }
        .auto-style45 {
            font-size: medium;
            color: #009933;
            font-family: Arial;
        }
        .auto-style47 {
            color: #CC0000;
        }
        .auto-style49 {
            font-size: large;
            color: #CC0000;
            font-family: Arial;
            text-align: left;
            height: 26px;
            width: 617px;
        }
        .auto-style50 {
            width: 617px;
            text-align: left;
        }
        .auto-style51 {
            width: 263px;
        }
        .auto-style54 {
            width: 421px;
            text-align: right;
        }
        .auto-style58 {
            width: 628px;
        }
        .auto-style59 {
            width: 105%;
        }
        .auto-style60 {
            width: 136px;
        }
        .auto-style61 {
            width: 223px;
        }
        .auto-style64 {
            width: 592px;
            text-align: right;
        }
        .auto-style65 {
            font-size: large;
            color: #CC0000;
            font-family: Arial;
            text-align: left;
            height: 26px;
            width: 158px;
        }
        .auto-style66 {
            width: 158px;
            text-align: left;
        }
        .auto-style67 {
            font-size: medium;
            color: #CC0000;
            font-family: Arial;
            text-align: left;
            height: 26px;
            width: 158px;
        }
        .auto-style68 {
            font-size: medium;
            color: #0000CC;
            font-family: Arial;
            text-align: left;
            height: 26px;
            width: 158px;
        }
        .auto-style69 {
            font-size: small;
            color: #CC0000;
            font-family: Arial;
            text-align: left;
            height: 26px;
            width: 158px;
        }
        </style>
    <h1 class="auto-style8">View Reports of Units</h1>
    <table class="auto-style1">
        <tr>
            <td class="auto-style46"><strong>
                <asp:HyperLink ID="Home" runat="server" CssClass="auto-style34" style="font-size: x-large; font-family: Arial; color: #660033;" NavigateUrl="~/Home_Page.aspx">Home</asp:HyperLink>
                </strong></td>
        </tr>
    </table>
    <hr />
</head>
<body>
    <form id="form1" runat="server" class="auto-style36">
    <div>
    
                    <strong>
                    <asp:SqlDataSource ID="SqlDataSourceUnitCode" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT [Unit_Code] FROM [Units]"></asp:SqlDataSource>
                    </strong><table class="auto-style64">
            <tr>
                <td class="auto-style39">
                    <h4>
                    <strong>
                    <asp:Label ID="Label4" runat="server" Text="Unit Code:" CssClass="auto-style37"></asp:Label>
                    </strong>
                    </h4>
                    </td>
                <td class="auto-style65">
                    <asp:DropDownList ID="DDLUnitCode" runat="server" Height="26px" OnSelectedIndexChanged="Search2_Click" Width="153px" DataSourceID="SqlDataSourceUnitCode" DataTextField="Unit_Code" DataValueField="Unit_Code">
                    </asp:DropDownList>
                </td>
                <td class="auto-style49">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style54">
                    <h4>
                    <strong>
                    <asp:Label ID="Label5" runat="server" Text="Select Semester:" CssClass="auto-style37"></asp:Label>
                    </strong>
                    </h4>
                    </td>
                <td class="auto-style66">
                    <asp:DropDownList ID="DDLSemester" runat="server" Height="26px" OnSelectedIndexChanged="Search2_Click" Width="153px">
                        <asp:ListItem Value="Select Semester" Text="Select Semester"></asp:ListItem>
                        <asp:ListItem Value="1" Text="1"></asp:ListItem>
                        <asp:ListItem Value="2" Text="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style50">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style54">
                    <h4>
                    <strong>
                    <asp:Label ID="Label6" runat="server" Text="Enter Year:" CssClass="auto-style37"></asp:Label>
                    </strong>
                    </h4>
                    </td>
                <td class="auto-style66">
                    <asp:TextBox ID="TxtBoxYear" runat="server" Height="20px" Width="150px" ValidationGroup="SearchGroup"></asp:TextBox>
                </td>
                <td class="auto-style50">
                    <em>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtBoxYear" CssClass="auto-style69" ErrorMessage="*Year must be in the format of [yyyy]" ValidationExpression="^[0-9]{4}$" ValidationGroup="SearchGroup"></asp:RegularExpressionValidator>
                    </em>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style66">
        <strong>
        <asp:Button ID="Search2" runat="server" Height="32px" OnClick="Search2_Click" Text="Search" Width="82px" CssClass="auto-style17" ValidationGroup="SearchGroup" />
        </strong>
                </td>
                <td class="auto-style50">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
        <hr />
        <table class="auto-style59">
            <tr>
                <td class="auto-style51"><strong>
                    <br />
                    <br />
            <asp:Label ID="labelTxtID" runat="server" CssClass="auto-style45" Visible="False"></asp:Label>
                    <br />
                    <br />
            <asp:Label ID="labelTxtName" runat="server" CssClass="auto-style45" Visible="False"></asp:Label>
                    <br />
            </strong></td>
                <td class="auto-style60"><strong>
                    <br />
                    <br />
            <asp:Label ID="labelTxtSemes" runat="server" CssClass="auto-style45" Visible="False"></asp:Label>
                    <br />
                    <br />
            <asp:Label ID="labelTxtYear" runat="server" CssClass="auto-style45" Visible="False"></asp:Label>
            </strong></td>
                <td class="auto-style61">
                    <strong>
                    <br />
                    <br />
                    <asp:Label ID="labelCount" runat="server" Visible="False" CssClass="auto-style37"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="labelUnitAvg" runat="server" Visible="False" CssClass="auto-style37"></asp:Label>
                    </strong>
                    </td>
                <td>
                    <br />
                    <strong>
                    <asp:Label ID="LabelDownload" runat="server" Visible="False" CssClass="auto-style67"></asp:Label>
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="auto-style68" Visible="False"></asp:LinkButton>
                    </strong>
                    <br />
                    </td>
            </tr>
        </table>
        <br />
        <div style="text-align:center; font-family:Arial" class="auto-style58">
        <asp:GridView ID="gvSearch" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <EmptyDataTemplate>
                <span class="auto-style47"><strong><em>No Results Found..</em></strong></span>
            </EmptyDataTemplate>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
           &nbsp;</div>
    </form>
</body>
</html>


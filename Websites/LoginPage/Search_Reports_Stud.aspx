<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search_Reports_Stud.aspx.cs" Inherits="Search_Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Reports of Students</title>
    <style type="text/css">
        .auto-style1 {
            width: 25%;
        }

        .auto-style8 {
            width: 61%;
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

        .auto-style4 {
            width: 644px;
            height: 26px;
            text-align: left;
        }

        .auto-style35 {
            text-align: right;
        }

        .auto-style36 {
            height: 572px;
        }

        .auto-style37 {
            color: #000099;
            font-size: medium;
            font-family: Arial;
        }

        .auto-style38 {
            width: 530px;
            text-align: right;
        }

        .auto-style44 {
            width: 644px;
            color: #000099;
            font-family: Arial;
        }

        .auto-style45 {
            font-size: medium;
            color: #009933;
            font-family: Arial;
        }

        .auto-style46 {
            width: 126px;
        }

        .auto-style47 {
            color: #CC0000;
        }

        .auto-style51 {
            width: 270px;
        }

        .auto-style52 {
            font-size: large;
            color: #CC0000;
            font-family: Arial;
            text-align: left;
            height: 26px;
            width: 384px;
        }

        .auto-style53 {
            width: 384px;
            text-align: left;
        }

        .auto-style58 {
            width: 628px;
        }

        .auto-style59 {
            width: 128%;
        }

        .auto-style60 {
            width: 136px;
        }
        .newStyle1 {
            font-family: Arial;
            color: #CC0000;
        }
        .auto-style61 {
            width: 644px;
            color: #000099;
            font-family: Arial;
            height: 48px;
        }
        .auto-style62 {
            width: 384px;
            text-align: left;
            height: 48px;
        }
        .auto-style63 {
            width: 644px;
            color: #CC0000;
            font-family: Arial;
            font-size: small;
        }
        .auto-style64 {
            font-size: large;
            color: #CC0000;
            font-family: Arial;
            text-align: left;
            height: 26px;
            width: 184px;
        }
        .auto-style65 {
            width: 184px;
            text-align: left;
        }
        .auto-style66 {
            width: 184px;
            text-align: left;
            height: 48px;
        }
    </style>
    <h1 class="auto-style8">View Reports of Students</h1>
    <table class="auto-style1">
        <tr>
            <td class="auto-style46"><strong>
                <asp:HyperLink ID="Home" runat="server" CssClass="auto-style34" style="font-size: x-large; font-family: Arial; color: #660033;" NavigateUrl="~/Home_Page.aspx">Home</asp:HyperLink>
            </strong></td>
        </tr>
    </table>
</head>
<hr />
<body>
    <form id="form1" runat="server" class="auto-style36">
        <div>

            <strong>
                <asp:SqlDataSource ID="SqlDataSourceStudentID" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT [Student_ID], [Student_Photo] FROM [Students]"></asp:SqlDataSource>
            </strong>
            <table class="auto-style38">
                <tr>
                    <td class="auto-style4">
                        <h3 class="auto-style35">
                            <strong>
                                <asp:Label ID="Label1" runat="server" Text="Select Student ID:" CssClass="auto-style37"></asp:Label>
                            </strong>
                        </h3>
                    </td>
                    <td class="auto-style64">
                        <asp:DropDownList ID="DDLStudent" runat="server" Height="26px" OnSelectedIndexChanged="Search1_Click" Width="153px" DataSourceID="SqlDataSourceStudentID" DataTextField="Student_ID" DataValueField="Student_ID">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style52">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style44">
                        <h4>
                            <strong>
                                <asp:Label ID="Label2" runat="server" Text="Select Semester:" CssClass="auto-style18"></asp:Label>
                            </strong>
                        </h4>
                    </td>
                    <td class="auto-style65">
                        <asp:DropDownList ID="DDLSemester" runat="server" Height="26px" OnSelectedIndexChanged="Search1_Click" Width="153px">
                            <asp:ListItem Value="Select Semester" Text="Select Semester"></asp:ListItem>
                            <asp:ListItem Value="1" Text="1"></asp:ListItem>
                            <asp:ListItem Value="2" Text="2"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style53">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style61">
                        <h4>
                            <strong>
                                <asp:Label ID="Label3" runat="server" Text="Enter Year:" CssClass="auto-style18"></asp:Label>
                            </strong>
                        </h4>
                    </td>
                    <td class="auto-style66">
                        <asp:TextBox ID="TxtBoxYear" runat="server" Height="20px" Width="150px" ValidationGroup="SearchGroup"></asp:TextBox>
                    </td>
                    <td class="auto-style62">
                        <em>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtBoxYear" CssClass="auto-style63" ErrorMessage="*Year must be in the format of [yyyy]" ValidationExpression="^[0-9]{4}$" ValidationGroup="SearchGroup"></asp:RegularExpressionValidator>
                        </em>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style44">&nbsp;</td>
                    <td class="auto-style65">
                        <strong>
                            <asp:Button ID="Search1" runat="server" Height="32px" OnClick="Search1_Click" Text="Search" Width="82px" CssClass="auto-style17" ValidationGroup="SearchGroup" />
                        </strong>
                    </td>
                    <td class="auto-style53">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
        <hr />
        <table class="auto-style59">
            <tr>
                <td class="auto-style46">
                    <div style="text-align: center; font-family: Arial">
                        <asp:Image ID="ImageStud" runat="server" Height="115px" Visible="False" Width="120px" />
                    </div>
                </td>
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
                <td>
                    <strong>
                        <br />
                        <br />
                        <asp:Label ID="labelCount" runat="server" Visible="False" CssClass="auto-style37"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="labelCourseAvg" runat="server" Visible="False" CssClass="auto-style37"></asp:Label>
                    </strong>
                </td>
            </tr>
        </table>
        <br />
        <div style="text-align: center; font-family: Arial" class="auto-style58">
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
            &nbsp;
        </div>
    </form>
</body>
</html>

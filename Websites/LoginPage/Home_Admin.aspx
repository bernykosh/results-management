<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home_Admin.aspx.cs" Inherits="Home_Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main Menu</title>
    <style type="text/css">
        .auto-style8 {
            width: 99%;
            color: #000099;
            font-family: Arial;
        }

        .auto-style36 {
            height: 431px;
            margin-top: 0px;
        }

        .auto-style40 {
            width: 100%;
        }

        .newStyle1 {
            font-family: Arial;
            color: #990033;
        }

        .auto-style59 {
            width: 464px;
            height: 41px;
        }

        .auto-style61 {
            font-weight: bold;
            font-size: medium;
            color: #CC0000;
        }

        .auto-style62 {
            width: 53%;
            margin-left: 69px;
        }

        .auto-style66 {
            width: 216px;
            height: 41px;
            text-align: right;
        }

        .auto-style69 {
            width: 105px;
            text-align: left;
            font-family: Arial;
            color: #000080;
            font-size: large;
        }

        .newStyle2 {
            font-family: Arial;
            color: #000080;
        }

        .auto-style74 {
            width: 105px;
            text-align: left;
            font-family: Arial;
            color: #000080;
            font-size: large;
            text-decoration: underline;
        }
        .newStyle3 {
            font-family: Arial;
        }
        .auto-style75 {
            font-family: Arial;
            color: #660033;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style36">
        <div>

            <h1 class="auto-style8">
                <table class="auto-style40">
                    <tr>
                        <td class="auto-style59">Main Menu</td>
                        <td class="auto-style66"><strong>
                            <asp:Button ID="Button1" runat="server" CssClass="auto-style61" Height="28px" Text="Logout" Width="87px" OnClick="Button1_Click" />
                        </strong></td>
                    </tr>
                </table>
            </h1>
            <h3>
                <asp:Label ID="LabelAdmin" runat="server" CssClass="auto-style75" Text="Logged in as"></asp:Label>
            </h3>
            <hr />
            <br /><br />
            <table class="auto-style62">
                <tr>
                    <td>
                        <h2 class="newStyle1">
                            <strong>Manage Units: </strong>
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong class="auto-style69">1.</strong>&nbsp;&nbsp;&nbsp; <strong>
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style74" NavigateUrl="~/Add_Units.aspx">Add Units</asp:HyperLink>
                        <br />
                    </strong>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style69"><strong>&nbsp;2.</strong></span>&nbsp;&nbsp;&nbsp; <strong>
                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="auto-style74" NavigateUrl="~/View_Units.aspx">View Units</asp:HyperLink>
                        </strong>
                        <br />
                        <br />
                    </td>
                </tr>

                </table>
            <br />
            <br />
            <br />
        </div>
        <hr />
        <br />
    </form>
</body>
</html>

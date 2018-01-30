<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home_Page.aspx.cs" Inherits="Home_Page" %>

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

        .auto-style67 {
            font-family: Arial;
            color: #990033;
            font-size: x-large;
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

        .auto-style71 {
            width: 75%;
            margin-left: 86px;
        }

        .auto-style72 {
            margin-left: 0px;
        }

        .auto-style73 {
            font-weight: bold;
            font-size: medium;
            color: #000099;
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
                <asp:Label ID="labelTxt" runat="server" CssClass="auto-style75" Text="Logged in as "></asp:Label>
            </h3>
            <hr />
            <table class="auto-style62">
                <tr>
                    <td>
                        <h2 class="newStyle1">
                            <strong>Manage Results: </strong>
                        </h2>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong class="auto-style69">1.</strong>&nbsp;&nbsp;&nbsp; <strong>
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style74" NavigateUrl="~/Add_Student.aspx">Add / View Students</asp:HyperLink>
                        <br />
                    </strong>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style69"><strong>&nbsp;2.</strong></span>&nbsp;&nbsp;&nbsp; <strong>
                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="auto-style74" NavigateUrl="~/Add_Results.aspx">Add Results</asp:HyperLink>
                            <br />
                        </strong>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong class="auto-style69">3.&nbsp; </strong><strong>&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" CssClass="auto-style74" NavigateUrl="~/View_Results.aspx">View Results</asp:HyperLink>
                        </strong>
                        <br />
                        <br />
                    </td>
                </tr>

                <tr>
                    <td class="auto-style67">
                        <strong>Manage Reprots: </strong>
                    </td>
                </tr>

            </table>
            <br />
            <table class="auto-style71">
                <tr>
                    <td class="auto-style69"><strong>Search By:</strong></td>
                    <td>

                        <asp:DropDownList ID="DDLGo" runat="server" Height="26px" Width="174px" CssClass="auto-style72">

                            <asp:ListItem Text="Select Search Criteria" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Student ID" Value="SID"></asp:ListItem>
                            <asp:ListItem Text="Unit Code" Value="UC"></asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp; <strong>
                            <asp:Button ID="ButtonGo" runat="server" CssClass="auto-style73" Text="Go" Width="56px" OnClick="ButtonGo_Click" />
                        </strong></td>
                </tr>
            </table>
            <br />
            <br />
            <br />

            <br />
            <br />
            <br />
            <br />
        </div>
        <hr />
        <br />
    </form>
</body>
</html>


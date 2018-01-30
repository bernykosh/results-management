<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
            text-align: center;
            color: #000066;
            font-family: Arial;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            text-align: right;
            color: #000099;
            font-family: Arial;
        }
        .auto-style4 {
            text-align: left;
        }
        .auto-style5 {
            color: #000099;
        }
        .auto-style6 {
            width: 197px;
        }
        .auto-style7 {
            font-weight: bold;
            font-size: medium;
        }
        .auto-style8 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <h1>
    
            <strong>Login</strong></h1>
        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="LabelUN" runat="server" CssClass="auto-style8"></asp:Label>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <h3 class="auto-style5">UserEmail:</h3>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox_Username" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Username" ErrorMessage="*Please enter Username" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <h3 class="auto-style5">Password:</h3>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox_Password" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Password" ErrorMessage="*Please enter password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="LabelPW" runat="server" CssClass="auto-style8"></asp:Label>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style6">
                    <h3><strong>
                    <asp:Button ID="Button_Login" runat="server" OnClick="Button_Login_Click" Text="Login" Width="124px" CssClass="auto-style7" ForeColor="#000099" />
                        </strong></h3>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>

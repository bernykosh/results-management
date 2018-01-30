<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <style type="text/css">
        .auto-style1 {
            width: 63%;
        }
        .auto-style2 {
            text-align: right;
            width: 132px;
        }
        .auto-style3 {
            width: 132px;
        }
        .auto-style5 {
            width: 67px;
            text-align: center;
        }
        .auto-style6 {
            width: 233px;
        }
        .newStyle1 {
            font-family: "Arial Black";
            font-size: medium;
            color: #000080;
            text-decoration: underline overline;
            font-style: normal;
            font-variant: normal;
        }
        .newStyle2 {
            text-decoration: underline;
            font-family: "Arial Black";
            color: #000080;
        }
        .auto-style9 {
            width: 67px;
            text-align: left;
        }
        .auto-style10 {
            text-decoration: underline;
            text-align: center;
            color: #000080;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-weight: bold;
            font-size: xx-large;
        }
        .newStyle3 {
            color: #000080;
            font-family: "Arial Black";
        }
        .newStyle4 {
            color: #000080;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            font-weight: bold;
        }
    </style>
</head>
<body style="height: 372px">
    <h1 class="auto-style10">Registration Page</h1>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
    <div style="height: 290px">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">User ID:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox_UID" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_UID" ErrorMessage="*User ID is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">User Email:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox_Email" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Email" ErrorMessage="*User Email is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_Email" ErrorMessage="*Email must be a valid adress" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">User Password:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox_UP" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_UP" ErrorMessage="*User Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Confirm Password:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox_CP" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox_CP" ErrorMessage="*Confirm Password is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox_UP" ControlToValidate="TextBox_CP" ErrorMessage="*Both Passwords must Match" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">User Type:</td>
                <td class="auto-style9">
                    <asp:DropDownList ID="DropDownList_UT" runat="server" Width="180px">
                        <asp:ListItem>Select User Type</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Manager</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList_UT" ErrorMessage="*User Type is required" ForeColor="Red" InitialValue="Select User Type"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" Width="70px" />
                </td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Excel_File_Upload.aspx.cs" Inherits="Excel_File_Upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Excel File Upload</title>
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
            width: 42%;
            color: #000099;
            font-family: Arial;
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
        .auto-style55 {
            width: 100%;
        }
        .auto-style56 {
            width: 172px;
        }
        .auto-style57 {
            width: 172px;
            color: #000099;
            font-family: Arial;
        }
        .newStyle1 {
            font-family: Arial;
        }
        .auto-style58 {
            font-family: Arial;
            font-size: small;
        }
        .auto-style59 {
            text-align: left;
        }
        </style>
    <h1 class="auto-style8">Excel File Upload</h1>
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
                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="auto-style34" NavigateUrl="~/Add_Results.aspx">Add Results</asp:HyperLink>
                </strong></td>
        </tr>
    </table>
&nbsp;
    <hr />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style55">
            <tr>
                <td class="auto-style57">
                    <h3>Upload Excel File:</h3>
                </td>
                <td class="auto-style59">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="222px" />
                    <strong>
                    <asp:Label ID="labelUpload" runat="server" CssClass="auto-style58" Text="Upload your file here."></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style56">&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save to Database" Width="140px" />
                    <asp:Label ID="labelSuccess" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

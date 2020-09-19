<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Dashboard.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" type="text/css" media="screen" href="/CSS/login.css" />

    <style type="text/css">

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;

}

        .auto-style1 {
            text-align: center;
            color: #FFFFFF;
            background-color: #A84849;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <table id="tbSignup" class="auto-style5">
                <tr>
                    <td class="auto-style1" colspan="2">Sign Up for New Account</td>
                </tr>
                <tr>
                    <td class="auto-style10">Username</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tbUsername" runat="server" Width="200px"></asp:TextBox>
                        <span class="auto-style13">*</span></td>
                </tr>
                <tr>
                    <td class="auto-style10">Password</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tbPassword" runat="server" Width="200px"></asp:TextBox>
                        <span class="auto-style13">*</span></td>
                </tr>
                <tr>
                    <td class="auto-style10">Confirm Password</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tbCFPassword" runat="server" Width="200px"></asp:TextBox>
                        <span class="auto-style13">*</span></td>
                </tr>
                <tr>
                    <td class="auto-style10">Email</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tbEmail" runat="server" Width="200px"></asp:TextBox>
                        <span class="auto-style13">*</span></td>
                </tr>
                <tr>
                    <td class="auto-style10">&nbsp;</td>
                    <td class="auto-style14">
                        <asp:Button ID="btnInsertUser" runat="server" OnClick="btnInsertUser_Click" Text="Create Account" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15" colspan="2"><strong>
                        <asp:Label ID="lblSignUpMessage" runat="server" CssClass="auto-style13" Text=""></asp:Label>
                        </strong></td>
                </tr>
            </table>
        </div>
    </form>
    </body>
</html>

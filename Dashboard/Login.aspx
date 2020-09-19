<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Dashboard.Webpages.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboards</title>
    <%--<link rel="stylesheet" type="text/css" media="screen" href="/CSS/login.css" />--%>

    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 248px;
        }
        .auto-style3 {
            width: 248px;
            text-align: left;
        }
        .auto-style6 {
            width: 357px;
            height: 327px;
        }
    </style>

    <style type="text/css">
        .auto-style6 {
            text-align: center;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <img alt="" class="auto-style6" src="Images/Logos/WhiteLogo.png" /><table align="center">
                <tr>
                    <td>
                        <strong>
                        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtUserName" runat="server" Width="240px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>
                        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                        </strong>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="240px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="auto-style2">
                        <asp:Button ID="btnLogin" runat="server" class="mybtn" Height="25px" OnClick="btnLogin_Click" Text="Login" Width="115px" />
                    &nbsp;<asp:Button ID="btnSignUp" runat="server" Height="25px" OnClick="btnSignUp_Click" Text="Sign Up" Width="115px" Font-Bold="True" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"></td>
                    <td class="auto-style3">
                        <strong>
                        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
                        </strong>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

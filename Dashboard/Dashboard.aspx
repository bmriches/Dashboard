<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Dashboard.Webpages.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" media="screen" href="css/dashboard.css" />
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style3 {
            width: 229px;
        }
        .auto-style4 {
            width: 172px;
        }
        .auto-style5 {
            text-align: center;
            color: #FFFFFF;
            background-color: #A84849;
        }
        .auto-style6 {
            font-size: x-large;
            text-decoration: underline;
        }
        .auto-style7 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
        }
        .auto-style8 {
            text-align: center;
            color: #FFFFFF;
            background-color: #A84849;
            width: 405px;
        }
        .auto-style9 {
            width: 405px;
            text-align: left;
        }
        .auto-style10 {
            text-align: center;
            color: #FFFFFF;
            background-color: #A84849;
            width: 247px;
        }
        .auto-style11 {
            width: 247px;
        }
        .auto-style12 {
            height: 22px;
        }
        .auto-style13 {
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="auto-style1">
            <asp:Label ID="lblWelcome" runat="server" Text="Welcome: " CssClass="auto-style6"></asp:Label>
            <asp:Label ID="lblUserDetails" runat="server" Text="" CssClass="auto-style6"></asp:Label>
            <br />
            <asp:Button ID="btnLogout" runat="server" OnClick="Button1_Click" Text="Logout" />
            <br />
        <table id="tbFileUploader" class="auto-style7">
            <tr>
                <td class="auto-style5" colspan="2">

                    <strong>File Uploader</strong></td>
            </tr>
            <tr>
                <td class="auto-style4">

                    Select Category</td>
                <td class="auto-style3">

                    <asp:DropDownList ID="ddlUploadTypes" runat="server" Height="16px" Width="229px" DataSourceID="LoginDB" DataTextField="HeaderDesc" DataValueField="HeaderDesc">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="LoginDB" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT
	HeaderDesc
FROM LoginDB.dbo.PickHead"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style12">

                    <asp:FileUpload ID="FileUpload1" runat="server" Width="391px" />

                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style5">

                    Custom File Name<span class="auto-style13">(</span><em><span class="auto-style13">Not Required</span></em>)</td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:TextBox ID="tbCustomFileName" runat="server" Width="388px"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:Button ID="btnUpload" runat="server" Height="22px" OnClick="btnUpload_Click" Text="Upload Photo" Width="393px" />

                </td>
            </tr>
            <tr>
                <td colspan="2">

                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

                </td>
            </tr>
        </table>
        </div>
        <table id="tbFileUploader0" class="auto-style7">
            <tr>
                <td class="auto-style8">

                    &nbsp;Select on of your images to view</td>
                <td class="auto-style10">

                    Image</td>
            </tr>
            <tr>
                <td class="auto-style9">

        <asp:ListBox ID="ListBox1" runat="server" Height="281px" Width="417px" DataSourceID="ImageList" DataTextField="FileName" DataValueField="ImageID" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                    <asp:SqlDataSource ID="ImageList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 
    ImageID
   ,COALESCE(CustomName + ' - (' + FileName + ')',FileName) AS FileName
   ,SizeBytes / 1000 / 1000 AS SizeMB
   ,Username
   ,CreatedDate
FROM LoginDB.dbo.Images
WHERE Username = @username">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblUserDetails" Name="username" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </td>
                <td class="auto-style11">

        <asp:Image ID="Image1" runat="server" Width="246px" />

                </td>
            </tr>
            </table>
        <br />
        <br />


    </form>
</body>
</html>

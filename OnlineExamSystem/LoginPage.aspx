<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="OnlineExamSystem.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <title>Cybermarine Annual Event 2k23</title>
    <style type="text/css">
        body {
            height: 100%;
            width: 100%;
            /*background-image: url("https://img.freepik.com/premium-vector/retro-science-wallpaper_23-2148557501.jpg?w=2000");*/
            background-image: url("Images/Wallpaper6.jpg");
            background-size: cover;
            z-index: -2;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        #cover {
            height: 100%;
            width: 100%;
            background-color: rgb(243, 237, 247);
            opacity: 0.2;
            position: absolute;
            z-index: -1
        }

        #headerPanel1 {
            height: 100px;
            width: 100%;
            background-color: rgba(21, 252, 148, 0.7);
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
        }

        #labelHeading {
            height: auto;
            width: auto;
            font-size: 60px;
        }

            #labelHeading > p {
                color: black;
            }

        #Menu {
            height: 25px;
            width: 100%;
            background-color: rgba(21, 252, 148, 0.3);
        }

            #Menu > ul {
                display: flex;
                list-style: none;
                justify-content: flex-end;
            }

                #Menu > ul > li {
                    margin-right: 18px;
                    margin-left: 18px;
                }

                    #Menu > ul > li > a {
                        text-decoration: none;
                    }

                #Menu > ul :last-child {
                    padding-right: 5px;
                    padding-left: 10px;
                }

        .auto-style1 {
            width: 100%;
            justify-content: center;
            text-align: center;
            margin-top: 100px;
        }

        .auto-style2 {
            height: 96px;
        }

        .auto-style4 {
            height: 23px;
        }

        .auto-style11 {
            height: 100px;
        }

        .auto-style9 {
            height: 50px;
        }

        .auto-style10 {
            height: 45px;
        }

        .auto-style12 {
            height: 89px;
        }

        .auto-style13 {
            margin-left: 52px;
        }

        .auto-style14 {
            margin-left: 4px;
        }

        #AccountTypeDB {
            align-items: center;
            margin-bottom: 20px;
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            padding: 10px; /* Adjust padding as needed */
            text-align: center;
            font-size:larger;
        }

        .HyperLink {
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);
            color: white;
            font-size: larger;
            font-weight: bold;
        }
        .HyperLink:hover
        {
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="cover">
        </div>
        <div>
            <div>
                <asp:Panel ID="headerPanel1" runat="server">
                    <div id="labelHeading">
                        <p>
                            Admin Login
                        </p>
                    </div>
                </asp:Panel>
            </div>
            <div id="Menu">
                <ul>
                    <li>
                        <asp:HyperLink Class="HyperLink" runat="server" href="ScoreBoard.aspx">ScoreBoard</asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink Class="HyperLink" runat="server" href="Dashboard.aspx">Dashboard</asp:HyperLink>
                    </li>
                </ul>
            </div>
            <table class="auto-style1" runat="server">
                <tr>
                    <td class="auto-style9">
                        <asp:DropDownList ID="AccountTypeDB" runat="server" CssClass="auto-style13" Font-Size="Medium" Height="30px" Width="250px">
                            <asp:ListItem>Select Account Type</asp:ListItem>
                            <%-- <asp:ListItem>Student</asp:ListItem>--%>
                            <asp:ListItem>Admin</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="userNameLabel" runat="server" ForeColor="Black" BorderStyle="None" BorderWidth="5px" Font-Bold="True" Font-Size="X-Large" Height="27px" Text="User Name" Width="124px"></asp:Label>
                        <asp:TextBox ID="userTextBox" runat="server" BorderStyle="Groove" BorderWidth="2px" CssClass="auto-style14" Font-Size="Medium" Height="30px" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="passwordLabel" runat="server" ForeColor="Black" BorderStyle="None" BorderWidth="5px" Font-Bold="True" Font-Size="X-Large" Height="31px" Text="Password" Width="124px"></asp:Label>
                        <asp:TextBox ID="passTextBox" runat="server" BorderStyle="Groove" BorderWidth="2px" Font-Size="Medium" Height="30px" TextMode="Password" Width="250px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12">
                        <asp:Button ID="loginButton" BackColor="#99FFCC" runat="server" CssClass="auto-style14" Font-Bold="True" Font-Size="X-Large" Height="50px" OnClick="loginButton_Click" Text="Login" Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
    <footer>
        <asp:Label runat="server" ID="footerLabel" BorderStyle="none" Font-Bold="true" ForeColor="whiteSmoke" Text="Developed By CM Software Department"></asp:Label>
    </footer>
</body>
</html>

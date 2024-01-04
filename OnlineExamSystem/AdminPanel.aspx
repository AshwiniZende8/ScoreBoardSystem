<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="OnlineExamSystem.AdminPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
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

        .center-label-container {
            text-align: center;
            padding: 10px;
        }

        .add-Game-container {
            text-align: center;
            padding: 10px;
        }

        .update-score-container {
            text-align: center;
            padding: 10px;
        }

        .Edit-score-container {
            text-align: center;
            padding: 10px;
        }

        /*
        #welcome_message {
            text-align: center;
            font-size: 50px;
            height: 70px;
            width: 100%;
        }*/

        /*        #exam_btn {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 400px;
        }

        #sExamB {
            height: 100px;
            width: 200px;
            font-size: 25px;
        }*/

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

            .HyperLink:hover {
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
                            ScoreBoard Management
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
            <div>
                <asp:Label ID="TestDateTime"  runat="server" Text=""  Font-Bold="True" Font-Size="Medium" ForeColor="Black"></asp:Label>
            </div>
            <div>
                <div class="center-label-container">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black" Text="Welcome To Admin Panel"></asp:Label>
                </div>
                <div class="add-Game-container">
                    <asp:Button ID="sExamB" Enabled="false" runat="server" BackColor="#99FFCC" Font-Bold="True" Font-Size="X-Large" Height="90px" OnClick="Add_Btn" Text="Add Games" Width="200px" />
                </div>
                <div class="update-score-container">
                    <asp:Button ID="Button1" runat="server" BackColor="#99FFCC" Font-Bold="True" Font-Size="X-Large" Height="90px" OnClick="UpdateScore_Btn" Text="Update Score" Width="200px" />
                </div>
                <div class="Edit-score-container">
                    <asp:Button ID="eExamB" Enabled="false" runat="server" BackColor="#99FFCC" Font-Bold="True" Font-Size="X-Large" Height="90px" OnClick="Edit_Btn" Text="Edit" Width="200px" />
                </div>
                <%--<tr>
                    <td class="auto-style4">
                        <asp:Panel ID="signUpPanel1" runat="server" BackColor="#99FFCC" Height="37px" Visible="false">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="homeB" runat="server" BackColor="#00CC99" CssClass="auto-style17" Font-Bold="True" Font-Size="Medium" Height="34px" OnClick="homeB_Click" Text="Panel" Width="100px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="profileB" runat="server" BackColor="#00CC99" CssClass="auto-style18" Font-Bold="True" Font-Size="Medium" Height="34px" OnClick="profileB_Click" Text="Queue" Width="90px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="LeaderboardB" runat="server" BackColor="#00CC99" CssClass="auto-style18" Font-Bold="True" Font-Size="Medium" Height="34px" OnClick="LeaderboardB_Click" Text="Leaderboard" Width="120px" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="logoutB" runat="server" CssClass="auto-style19" Font-Bold="True" Font-Size="Medium" Height="34px" OnClick="logoutB_Click" Text="Log Out" Width="140px" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style20"></td>
                </tr>
                <tr>
                    <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" CssClass="auto-style13" Font-Bold="True" Font-Size="XX-Large" ForeColor="Black" Height="43px" Text="Welcome To Admin Panel" Style="margin-left: 0px; margin-bottom: 0px; margin-top: 100px;"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="sExamB" Enabled="false" runat="server" BackColor="#99FFCC" Font-Bold="True" Font-Size="X-Large" Height="90px" OnClick="Add_Btn" Text="Add Games" Width="200px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:Button ID="Button1" runat="server" BackColor="#99FFCC" Font-Bold="True" Font-Size="X-Large" Height="90px" OnClick="UpdateScore_Btn" Text="Update Score" Width="200px" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <asp:Button ID="eExamB" Enabled="false" runat="server" BackColor="#99FFCC" Font-Bold="True" Font-Size="X-Large" Height="90px" OnClick="Edit_Btn" Text="Edit" Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>--%>
            </div>
        </div>
    </form>
    <footer>
        <asp:Label runat="server" ID="footerLabel" BorderStyle="none" Font-Bold="true"  ForeColor="whiteSmoke" Text="Developed By CM Software Department"></asp:Label>
    </footer>
</body>
</html>

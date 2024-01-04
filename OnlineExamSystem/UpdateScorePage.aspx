<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateScorePage.aspx.cs" Inherits="OnlineExamSystem.UpdateScorePage" %>

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
            height: 80px;
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

        #welcome_message {
            text-align: center;
            font-size: 50px;
            height: 70px;
            width: 100%;
        }

        #exam_btn {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 400px;
        }

        .center-container {
            text-align: center;
            margin-top: 100px;
        }

        .centered-button {
            display: inline-block;
        }

        .auto-style1 {
            width: 100%;
            justify-content: center;
            text-align: center;
            margin-top: 100px;
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            padding: 10px; /* Adjust padding as needed */
            text-align: center;
            font-size:larger;
        }

        .Center-container {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .scoreContainer {
            padding: 10px 0px 10px 0px;
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
                            Update Score
                        </p>
                    </div>
                </asp:Panel>
            </div>

            <div id="Menu">
                <ul>
                    <li>
                        <asp:HyperLink Class="HyperLink" ID="ScoreBoard_link" runat="server" href="ScoreBoard.aspx">ScoreBoard</asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink Class="HyperLink" ID="Home" runat="server" href="Dashboard.aspx">Dashboard</asp:HyperLink>
                    </li>
                </ul>
            </div>

            <div class="Center-container">
                <div>
                    <asp:Label ID="enterNameOfGameLabel" runat="server" BorderStyle="none" Font-Bold="true" Font-Size="xx-large" ForeColor="Black" Text="Name of Game" Width="300px"></asp:Label>

                    <%--<asp:Label ID="selectTeamLabel" runat="server" BorderStyle="none" Font-Bold="true" Font-Size="xx-large" ForeColor="#006666" Height="39px" Style="margin-left: 388px; margin-bottom: 0px; margin-top: 43px;" Text="Select Team" Width="580px"></asp:Label>--%>
                    <asp:DropDownList AutoPostBack="true" ID="GameDropDownList" OnSelectedIndexChanged="GameDropDownList_SelectedIndexChanged" runat="server" Font-Size="Medium" Width="300px">
                    </asp:DropDownList>
                </div>
                <div>
                    <asp:Label ID="Label1" runat="server" BorderStyle="none" Font-Bold="true" Font-Size="xx-large" ForeColor="Black" Text="Select Team" Width="300px"></asp:Label>

                    <%--<asp:Label ID="selectTeamLabel" runat="server" BorderStyle="none" Font-Bold="true" Font-Size="xx-large" ForeColor="#006666" Height="39px" Style="margin-left: 388px; margin-bottom: 0px; margin-top: 43px;" Text="Select Team" Width="580px"></asp:Label>--%>
                    <asp:DropDownList AutoPostBack="true" ID="TeamDropDownList" OnSelectedIndexChanged="TeamDropDownList_SelectedIndexChanged" runat="server" Font-Size="Medium" Width="300px">
                    </asp:DropDownList>
                </div>
                <div class="scoreContainer">

                    <asp:Label ID="Label2" runat="server" BorderStyle="none" Font-Bold="true" Font-Size="xx-large" ForeColor="Black" Text="Enter Score" Width="300px"></asp:Label>

                    <asp:TextBox ID="ScoreTextBox" runat="server" BorderStyle="none" Font-Bold="true" Font-Size="xx-large" ForeColor="#006666" Width="300px"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="Label3" runat="server" BorderStyle="none" Font-Bold="true" Font-Size="xx-large" ForeColor="Black" Text="Current Score" Width="300px"></asp:Label>

                    <asp:TextBox ID="CurrentTextBox" ReadOnly="true" runat="server" BorderStyle="none" Font-Bold="true" Font-Size="xx-large" ForeColor="#006666" Width="300px"></asp:TextBox>
                </div>
            </div>
            <div class="center-container">
                <asp:Button ID="UpdateBtn" BackColor="#99FFCC" CssClass="centered-button" runat="server" Font-Bold="True" Font-Size="Large" Height="50px" OnClick="UpdateScore_Click" Text="Add Score" Width="124px" />

                <asp:Button ID="DeletBtn" Visible="false" runat="server" Font-Bold="True" Font-Size="Large" Height="34px" OnClick="DeleteScore_Click" Text="Delete" Width="124px" />
            </div>
    </form>
    <footer>
        <asp:Label runat="server" ID="footerLabel" BorderStyle="none" Font-Bold="true"  ForeColor="whiteSmoke" Text="Developed By CM Software Department"></asp:Label>
    </footer>
</body>
</html>

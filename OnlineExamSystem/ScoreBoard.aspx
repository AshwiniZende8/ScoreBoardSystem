<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScoreBoard.aspx.cs" Inherits="OnlineExamSystem.ScoreBoard" %>

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
            opacity: 0.25;
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

        #GridView2 {
            text-align: center;
            background-color: white;
            width: 100%; /* Make the GridView take up the full width of its container */
        }

            #GridView2 th {
                font-size: 20px;
            }

            #GridView2 td {
                font-size: 30px;
            }

        .container {
            width: 100%; /* Make the container div take up the full width of its parent */
            overflow-x: auto;
        }

        .header-with-borders th {
            border: 1px solid black; /* Set your desired border style and width */
            /*font-size:20px;*/
        }

        .row-with-borders td {
            border: 1px solid black; /* Set your desired border style and width */
            /*font-size: 40px;*/
        }

            .row-with-borders td + td, .header-with-borders th + th {
                border-left: 1px solid black; /* Set your desired border style and width between columns */
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
        .highlight-cell {
            background-color: powderblue;
            font-weight: bold;
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
                            ScoreBoard 
                        </p>
                    </div>
                </asp:Panel>
            </div>
            <div id="Menu">
                <ul>
                    <li>
                        <asp:HyperLink  ID="login_link" Class="HyperLink" runat="server" href="LoginPage.aspx">Login</asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink  ID="Home" runat="server" Class="HyperLink" href="Dashboard.aspx">Dashboard</asp:HyperLink>
                    </li>
                </ul>
            </div>
            <asp:Button Visible="false" ID="addBtn" runat="server" Font-Bold="True" Font-Size="Large" Height="34px" OnClick="Refresh_ScoreBoardBtn" Text="Refresh" Width="124px" />
            <table class="container">
                <td>
                    <tr>
                        <!-- Your grid and other content here -->
                        <asp:GridView runat="server" ID="GridView2" OnDataBound="GridView2_DataBound" RowStyle-ForeColor="Black" HeaderStyle-ForeColor="#003300" HeaderStyle-Font-Size="Larger" GridLines="Both" OnRowDataBound="GridView1_RowDataBound">
                            <RowStyle CssClass="row-with-borders" />
                            <HeaderStyle CssClass="header-with-borders" />
                        </asp:GridView>
                    </tr>
                </td>
            </table>
        </div>
    </form>
    <footer>
        <asp:Label runat="server" ID="footerLabel" BorderStyle="none" Font-Bold="true" ForeColor="whiteSmoke" Text="Developed By CM Software Department"></asp:Label>
    </footer>
</body>
</html>

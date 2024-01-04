<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OnlineExamSystem.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <title>Cybermarine Annual Event 2k23</title>
    <style type="text/css">
        body {
            /*background-image: url("https://img.freepik.com/premium-vector/retro-science-wallpaper_23-2148557501.jpg?w=2000");*/
            background-image: url("Images/Wallpaper5.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        #headerPanel1 {
            height: 50%;
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
            background-color: rgba(21, 252, 148, 0.5);
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

        iframe {
            width: 100%;
            height: 800px;
            border: none; /* Remove the default border for a cleaner appearance */
            text-align: center;
            justify-content: center;
            margin-top: 10px;
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            padding: 10px; /* Adjust padding as needed */
            text-align: center;
            font-size:larger;
        }

        #LastUpdatedDate {
            text-align: right;
            color: lightgrey;
            opacity: 0.8;
            margin-right: 5px;
        }

        .ScoreBoard_link {
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);
            color: white;
            font-weight: bold;
            font-size: larger;
        }

            .ScoreBoard_link:hover {
                color: white;
            }
    </style>
</head>
<body>


    <form id="form2" runat="server">

        <%-- <div id="cover">
        </div>--%>

        <div>
            <asp:Panel ID="headerPanel1" runat="server">
                <div id="labelHeading">
                    <p>
                        Cybermarine Annual Event 2k23
             
                    </p>
                </div>
            </asp:Panel>
        </div>

        <div id="Menu">
            <ul>
                <li>
                    <asp:HyperLink class="ScoreBoard_link" runat="server" href="ScoreBoard.aspx">ScoreBoard</asp:HyperLink>
                </li>
            </ul>
        </div>
        <div id="LastUpdatedDate">
            <p>
                Last Updated Date: 
                <asp:Label ID="LastUpdatedDateLabel" runat="server" CssClass="align-right" Text=""></asp:Label>
            </p>
        </div>

        <iframe src="PointSummaryPage.aspx" runat="server"></iframe>
        <%--        <div id="exam_btn">
            <asp:Button ID="sExamB" runat="server" Text="Overall Game Points" class="btn btn-primary" OnClick="sExamB_Click" />
        </div>--%>
    </form>
    <footer>
        <asp:Label ID="Pagefooter" runat="server" BorderStyle="none" Font-Bold="true"  ForeColor="whiteSmoke" Text="Developed By CM Software Department"></asp:Label>
    </footer>
</body>
</html>

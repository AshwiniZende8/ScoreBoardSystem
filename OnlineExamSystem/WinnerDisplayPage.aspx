<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WinnerDisplayPage.aspx.cs" Inherits="OnlineExamSystem.WinnerDisplayPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        body {
            /*height: 100%;
            width: 100%;*/
            background-image: url("Images/BlastBgGif.gif");
            background-size: cover;
/*            z-index: -2;*/
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center; 
        }

        #cover {
            height: 100%;
            width: 100%;
            background-color: rgb(243, 237, 247);
            opacity: 0.5;
            position: absolute;
            z-index: -1
        }

        #headerPanel1 {
            height: 50px;
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
            font-size: 40px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);
            font-weight: bold;
        }

            #labelHeading > p {
                color: white;
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

        #sExamB {
            height: 100px;
            width: 200px;
            font-size: 25px;
        }

        .DivAddGame {
            text-align: center;
        }

        .HyperLink {
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.9);
            color: white;
            font-size: large;
            font-weight: bold;
        }

            .HyperLink:hover {
                color: white;
            }
            #divLabel
            {
                text-align:center;
                justify-content:center;
                align-items:center;
                position: center;
            }
            #WinnerNameLabel
            {
                font-size:100px;
                color:whitesmoke;
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Panel ID="headerPanel1" runat="server">
                    <div id="labelHeading">
                        <p>
                            Cybermarine Annual Event 2k23 Winner
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
            <div id="divLabel">
                <img  src="Images/Trophy.png" width="100px" height="100px" alt="img">
                <asp:Label ID="WinnerNameLabel" runat="server" Text=""></asp:Label>
                <img  src="Images/Trophy.png" width="100px" height="100px"  alt="img">
            </div>
        </div>
    </form>
</body>
</html>

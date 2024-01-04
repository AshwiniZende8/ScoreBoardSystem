<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PointSummaryPage.aspx.cs" Inherits="OnlineExamSystem.PointSummaryChart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            background-color: transparent;
            color: black;
            font-weight: normal;
        }

        .rounded-box {
            border: 5px solid rgba(21, 252, 148, 0.9);
            padding: 10px;
            position: center;
            border-radius: 2%;
            font-size: 50px;
            align-items: center;
            justify-content: center;
            display: flex;
        }

        .team-item {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            background-color: rgba(21, 252, 148, 0.9);
            border-radius: 20px;
            padding: 0px 100px 0px 50px;
            justify-content: space-between;
            height: 100%;
        }

        .team-details {
            /* Optional: Center-align content within each team item */
            /* Optional: Add some spacing between logo and details */
            padding: 0;
            justify-content: center;
            margin: 0px 30px 0px 40px;
        }

        .team-logo {
            width: 10%;
            height: 8%;
            padding: 0;
            align-items: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%-- <div class="rounded-box box1" runat="server">
            <asp:Label ID="Label2" Font-Size="X-Large" Font-Bold="true" runat="server" ForeColor="#073ae3" Text="LEADERBOARD"></asp:Label>
        </div>--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="rounded-box" runat="server">
                    <div class="team-list">
                        <asp:Repeater ID="TeamRepeater" runat="server">
                            <ItemTemplate>
                                <div class="team-item">
                                    <%# RenderImage(Eval("MedalLogoUrl") ,Eval("TeamNumber"))%>
                                    <div class="team-details">
                                        <p><%# Eval("TeamName") %></p>
                                        <!-- Add other details as needed -->
                                    </div>
                                    <div class="team-score">
                                        <p><%# Eval("TeamScore") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Timer ID="Timer1" runat="server" Interval="300000" OnTick="Timer1_Tick"></asp:Timer>
    </form>
</body>
</html>

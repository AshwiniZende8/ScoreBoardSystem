using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamSystem
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DateTime lastUpdatedUtcDate = DateTime.UtcNow;//DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            //TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");

            //DateTime localTime = TimeZoneInfo.ConvertTimeFromUtc(lastUpdatedUtcDate, timeZoneInfo);

            //TestDateTime.Text = localTime.ToString("yyyy-MM-dd HH:mm:ss");
        }

        protected void homeB_Click(object sender, EventArgs e)
        {

        }

        protected void profileB_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdminQueue.aspx", true);
        }

        protected void LeaderboardB_Click(object sender, EventArgs e)
        {
           Server.Transfer("AdminLeaderboard.aspx", true);
        }

        protected void sExamB_Click(object sender, EventArgs e)
        {
            Server.Transfer("SetExam.aspx", true);
        }        
        protected void eExamB_Click(object sender, EventArgs e)
        {
            Server.Transfer("EditExam.aspx", true);
        }
        protected void logoutB_Click(object sender, EventArgs e)
        {
            Server.Transfer("LoginPage.aspx", true);
        }
        protected void Add_Btn(object sender, EventArgs e)
        {
            Server.Transfer("AddScorePage.aspx", true);
        }
        protected void Edit_Btn(object sender, EventArgs e)
        {
            Server.Transfer("EditScorePage.aspx", true);
        }
        protected void UpdateScore_Btn(object sender, EventArgs e)
        {
            Server.Transfer("UpdateScorePage.aspx", true);
        }
    }
}
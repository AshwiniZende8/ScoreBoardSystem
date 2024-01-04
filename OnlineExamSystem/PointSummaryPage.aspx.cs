using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamSystem
{
    public partial class PointSummaryChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefershDashBoard();
            }
        }
        protected string RenderImage(object medalLogoUrl, object TeamNumber)
        {
            string url = medalLogoUrl as string;
            if (IsValidImage(url))
            {
                return $"<img src='{url}' alt='{TeamNumber}' class='team-logo'/>";
            }
            return TeamNumber.ToString();
        }
        protected bool IsValidImage(string url)
        {
            if (!string.IsNullOrEmpty(url))
            {
                // Check if the URL is well-formed and ends with a valid image extension
                return
                       (url.EndsWith(".jpg", StringComparison.OrdinalIgnoreCase) ||
                        url.EndsWith(".png", StringComparison.OrdinalIgnoreCase) ||
                        url.EndsWith(".gif", StringComparison.OrdinalIgnoreCase));
            }
            return false;
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            RefershDashBoard();
            UpdatePanel1.Update();
        }
        private void RefershDashBoard()
        {
            List<ScoreModel> ScoreTableList = DAL.DataProvider.ScoreList();

            List<LeaderBoardModel> DataGridList = new List<LeaderBoardModel>();
            int prevSCore = ScoreTableList[0].ListOfGame.Where(t => t.GamesPointDict.ContainsKey("TOTAL")).FirstOrDefault().GamesPointDict.FirstOrDefault().Value;
            int Rank= 1;
            for (int i = 0; i < ScoreTableList.Count(); i++)
            {
                LeaderBoardModel leaderBoardModel = new LeaderBoardModel();
               
                leaderBoardModel.TeamName = ScoreTableList[i].TeamName;
                leaderBoardModel.TeamScore = ScoreTableList[i].ListOfGame.Where(t => t.GamesPointDict.ContainsKey("TOTAL")).FirstOrDefault().GamesPointDict.FirstOrDefault().Value;
                if (leaderBoardModel.TeamScore == prevSCore)
                    leaderBoardModel.MedalLogoUrl = "Images/GloldMedal.png";
                else
                {
                    leaderBoardModel.MedalLogoUrl = i.ToString();
                    Rank++;
                }
                leaderBoardModel.TeamNumber = Rank;
                prevSCore = leaderBoardModel.TeamScore;
                DataGridList.Add(leaderBoardModel);               
            }
            // Bind the data to the GridView

            TeamRepeater.DataSource = DataGridList;
            TeamRepeater.DataBind();
        }
    }
    public class LeaderBoardModel
    {
        public string MedalLogoUrl { get; set; }
        public string TeamLogoUrl { get; set; }
        public string TeamName { get; set; }
        public int TeamScore { get; set; }
        public int TeamNumber { get; set; }
    }
}
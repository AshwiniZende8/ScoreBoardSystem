using OnlineExamSystem.DAL.Mapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineExamSystem
{
    public partial class UpdateScorePage : System.Web.UI.Page
    {
        List<string> teamNameList = new List<string>();
        public string SelectedTeam { get; set; }
        public string SelectedGame { get; set; }

        public int TotalMarksOfTeam { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string CS = "Data Source=cybermarine.database.windows.net; Initial Catalog=CyberMarineAnnualEvent2023; User id=cybermarine; Password=India1237$;";
                SqlConnection con = new SqlConnection(CS);
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM ScoreTable", con);
                    var datareader = cmd.ExecuteReader();
                    List<ScoreModel> GameList = datareader.ToScoreDataList();
                    GameDropDownList.DataSource = GameList.Select(t => t.ListOfGame).FirstOrDefault().Select(t => t.GamesPointDict).ToList().SelectMany(t => t.Keys);
                    GameDropDownList.DataBind();
                    teamNameList = GameList.Select(x => x.TeamName).ToList();
                    TeamDropDownList.DataSource = teamNameList;
                    TeamDropDownList.DataBind();
                    ScoreTextBox.Text = "0";
                    GetScore();
                    con.Close();
                }
                catch
                {

                }
            }
        }
        protected void UpdateScore_Click(object sender, EventArgs e)
        {

            if (String.IsNullOrWhiteSpace(ScoreTextBox.Text))
            {
                Response.Write("<script>alert('Score Cannot be Blank!');</script>");
                return;
            }
            TotalMarksOfTeam = GetTotalScoreOfTeam(Convert.ToInt32(ScoreTextBox.Text));
            string CS = "Data Source=cybermarine.database.windows.net; Initial Catalog=CyberMarineAnnualEvent2023; User id=cybermarine; Password=India1237$;";
            SqlConnection con = new SqlConnection(CS);
            try
            {
                con.Open();
                SqlCommand UpdateScoreCmd = new SqlCommand("Update ScoreTable SET  [" + GameDropDownList.SelectedValue + "] = [" + GameDropDownList.SelectedValue + "] + " + ScoreTextBox.Text + ", [Total] = " + TotalMarksOfTeam + " Where Teams = '" + TeamDropDownList.SelectedValue + "' ", con);
                UpdateScoreCmd.ExecuteNonQuery();
                Response.Write("<script>alert('Updated!');</script>");
                
                GetScore();

                DateTime lastUpdatedUtcDate = DateTime.UtcNow;//DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                TimeZoneInfo timeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");

                DateTime localTime = TimeZoneInfo.ConvertTimeFromUtc(lastUpdatedUtcDate, timeZoneInfo);

                // Now, 'localTime' contains the datetime in your local timezone

                SqlCommand UpdateLastDateTimeCmd = new SqlCommand("UPDATE LastUpdatedInfo SET LastUpdatedDateTime = '"+ localTime.ToString("yyyy-MM-dd HH:mm:ss") + "' WHERE ID = 1", con);
                UpdateLastDateTimeCmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {

            }

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        private int GetTotalScoreOfTeam(int NewScore)
        {
            int totalMarks = 0;
            string CS = "Data Source=cybermarine.database.windows.net; Initial Catalog=CyberMarineAnnualEvent2023; User id=cybermarine; Password=India1237$;";
            SqlConnection con = new SqlConnection(CS);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT Total FROM ScoreTable Where Teams = '" + TeamDropDownList.SelectedValue + "' ", con);
                var dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {
                    totalMarks = dataReader["Total"].FromDBNullable(Convert.ToInt32);
                }
                con.Close();

                return totalMarks += NewScore;
            }
            catch
            {
                return totalMarks;
            }
        }
        protected void DeleteScore_Click(object sender, EventArgs e)
        {
            string CS = "Data Source=cybermarine.database.windows.net; Initial Catalog=CyberMarineAnnualEvent2023; User id=cybermarine; Password=India1237$;";
            SqlConnection con = new SqlConnection(CS);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM ScoreTable Where GameName = '" + GameDropDownList.SelectedValue + "' ", con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Deleted!');</script>");
                con.Close();
            }
            catch
            {

            }
        }

        protected void GameDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //SelectedGame = GameDropDownList.SelectedItem.Text;
            GetScore();
        }

        protected void TeamDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetScore();
        }
        private void GetScore()
        {
            string CS = "Data Source=cybermarine.database.windows.net; Initial Catalog=CyberMarineAnnualEvent2023; User id=cybermarine; Password=India1237$;";
            SqlConnection con = new SqlConnection(CS);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT [" + GameDropDownList.SelectedValue + "] FROM ScoreTable Where Teams = '" + TeamDropDownList.SelectedValue + "' ", con);
                var dataReader = cmd.ExecuteReader();

                while (dataReader.Read())
                {
                    CurrentTextBox.Text = dataReader[GameDropDownList.SelectedValue].FromDBNullable(Convert.ToString);
                }
                con.Close();

            }
            catch
            {

            }
        }
    }
}
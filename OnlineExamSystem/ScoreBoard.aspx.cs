using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Runtime.Remoting.Messaging;
using OnlineExamSystem.DAL.Mapper;

namespace OnlineExamSystem
{
    public partial class ScoreBoard : System.Web.UI.Page
    {
        public List<ScoreModel> ScoreDataList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
                RefershScoreBoard();
            }
        }
        protected void Refresh_ScoreBoardBtn(object sender, EventArgs e)
        {
            RefershScoreBoard();
        }
        private void RefershScoreBoard()
        {
            //string CS = "Data Source=cybermarine.database.windows.net; Initial Catalog=CyberMarineAnnualEvent2023; User id=cybermarine; Password=India1237$;";
            //SqlConnection con = new SqlConnection(CS);
            try
            {
                //con.Open();
                //SqlCommand cmd = new SqlCommand("Select * From ScoreTable order by Total desc", con);
                //IDataReader dataReader = cmd.ExecuteReader();
                //ScoreDataList = dataReader.ToScoreDataList();
                ScoreDataList = DAL.DataProvider.ScoreList();
                //con.Close();
                FillScoreTable(ScoreDataList);
            }
            catch (Exception ex)
            {

            }
        }
        private void FillScoreTable(List<ScoreModel> ScoreDataList)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("Teams", typeof(string));

            foreach (string nameOfTeam in ScoreDataList.Select(t => t.TeamName))
            {
                dr = dt.NewRow();
                dr[0] = nameOfTeam;
                dt.Rows.Add(dr);
            }

            for (int row = 0; row < ScoreDataList.Count; row++)
            {
                for (int i = 0; i < ScoreDataList[row].ListOfGame.Count; i++)
                {
                    string columnName = ScoreDataList[row].ListOfGame[i].GamesPointDict.FirstOrDefault().Key.ToString();
                    int value = ScoreDataList[row].ListOfGame[i].GamesPointDict.FirstOrDefault().Value;

                    if (row == 0)
                        dt.Columns.Add(columnName, typeof(string));
                    dt.Rows[row][columnName] = value;
                }
            }

            GridView2.DataSource = dt;

            GridView2.DataBind();
        }

        //protected void Timer1_Tick(object sender, EventArgs e)
        //{
        //    RefershScoreBoard();
        //    //UpdatePanel1.Update();
        //}
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
            {
                //Assuming you want to highlight the third column(index 2)
                TableCell cellToHighlight = e.Row.Cells[e.Row.Cells.Count - 1];

                // Apply your highlighting styles              
                cellToHighlight.BackColor = System.Drawing.Color.Yellow;
                cellToHighlight.ForeColor = System.Drawing.Color.Black;
                cellToHighlight.Width = 100;
                cellToHighlight.Font.Size = 20;

                int maxTotalMarks = ScoreDataList.Select(t => t.ListOfGame.LastOrDefault()).Max(t => t.GamesPointDict.Values.Max());
                if (maxTotalMarks > 0 && maxTotalMarks.ToString() == e.Row.Cells[e.Row.Cells.Count - 1].Text)
                {
                    TableCell TrophyToAddCell = e.Row.Cells[0];
                    TrophyToAddCell.Text = TrophyToAddCell.Text + " " + $"<img src='Images/Trophy.png' alt='icon'";
                }

                int maxCellValue = int.MinValue;
                TableCell maxCell = null;
                for (int i = 0; i < e.Row.Cells.Count - 1; i++)
                {
                    TableCell cell = e.Row.Cells[i];
                    // Set the width for each cell based on the total number of columns
                    cell.Width = Unit.Pixel(100);
                    cell.Height = Unit.Pixel(100);
                    int cellValue;
                    if (int.TryParse(cell.Text, out cellValue))
                    {
                        if (cellValue == GetMaxValueInColumn(e.Row, i))
                        {
                            // Highlight the cell containing the maximum value (change the style as needed)
                            cell.BackColor = System.Drawing.Color.Yellow; // Change the color as needed
                                                                          // You can apply additional styling here
                        }
                        //    // Check if the current cell value is greater than the current max value
                        //    if (cellValue > maxCellValue)
                        //    {
                        //        maxCellValue = cellValue;
                        //        maxCell = cell;
                        //    }
                    }
                }

                //if (maxCell != null)
                //{
                //    maxCell.BackColor = System.Drawing.Color.PowderBlue; // Change the color as needed
                //                                                    // You can apply additional styling here
                //}
            }
            //if (e.Row.RowType == DataControlRowType.Header)
            //{
            //    foreach (TableCell cell in e.Row.Cells)
            //    {
            //        //cell.CssClass = "equalColumnWidth";
            //        cell.Width = 200;
            //    }
            //}
        }
        private int GetMaxValueInColumn(GridViewRow row, int columnIndex)
        {
            int maxCellValue = int.MinValue;

            // Loop through each row to find the maximum value in the specified column
            foreach (GridViewRow currentRow in GridView2.Rows)
            {
                int cellValue;
                if (int.TryParse(currentRow.Cells[columnIndex].Text, out cellValue))
                {
                    if (cellValue > maxCellValue)
                    {
                        maxCellValue = cellValue;
                    }
                }
            }

            return maxCellValue;
        }
    }
    public static class Extension
    {
        //public static List<ScoreModel> ToScoreDataList(this IDataReader reader)
        //{
        //    List<ScoreModel> scoreDataList = new List<ScoreModel>();
        //    //DataTable Table = reader.GetSchemaTable();
        //    while (reader.Read())
        //    {
        //        ScoreModel scoreData = new ScoreModel();
        //        scoreData.TeamName = reader["Teams"].ToString();

        //        for (byte ColumnNo = 2; ColumnNo < reader.FieldCount; ColumnNo++)
        //        {
        //            Games games = new Games();
        //            int value = string.IsNullOrWhiteSpace(reader[ColumnNo].ToString()) ? 0 : reader[ColumnNo].FromDBNullable(Convert.ToInt32);
        //            games.GamesPointDict = new Dictionary<string, int> { { reader.GetName(ColumnNo).ToString(), value } };
        //            scoreData.ListOfGame.Add(games);
        //        }

        //        scoreDataList.Add(scoreData);
        //    }
        //    reader.Close();
        //    return scoreDataList;
        //}

        //public delegate T ConvertValue<T, V>(V value);

        //public static T FromDBNullable<T>(this object value, ConvertValue<T, object> convert)
        //{
        //    return Convert.IsDBNull(value) ? default(T) : convert(value);
        //}
    }
}
using OnlineExamSystem.DAL.Mapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OnlineExamSystem.DAL
{
    public class DataProvider
    {
        public static List<ScoreModel> ScoreList()
        {
            List<ScoreModel>  ScoreDataList = new List<ScoreModel>();
            string CS = "Data Source=cybermarine.database.windows.net; Initial Catalog=CyberMarineAnnualEvent2023; User id=cybermarine; Password=India1237$;";
            SqlConnection con = new SqlConnection(CS);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * From ScoreTable order by Total desc", con);
                IDataReader dataReader = cmd.ExecuteReader();
                ScoreDataList = dataReader.ToScoreDataList();
                con.Close();                       
            }
            catch (Exception ex)
            {

            }
            return ScoreDataList;
        }
        public static string LastUpdatedDateAndTime()
        {
            string lastUpdatedDate = "";
            string CS = "Data Source=cybermarine.database.windows.net; Initial Catalog=CyberMarineAnnualEvent2023; User id=cybermarine; Password=India1237$;";
            SqlConnection con = new SqlConnection(CS);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * From LastUpdatedInfo Where ID = 1", con);
                SqlDataReader dataReader = cmd.ExecuteReader();
                while (dataReader.Read())
                {
                    lastUpdatedDate = dataReader["LastUpdatedDateTime"].FromDBNullable(Convert.ToString);
                }
                con.Close();
            }
            catch (Exception ex)
            { 

            }
            return lastUpdatedDate;
        }
    }
}
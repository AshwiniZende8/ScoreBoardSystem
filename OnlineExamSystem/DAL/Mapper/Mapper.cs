using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OnlineExamSystem.DAL.Mapper
{
    public static class Mapper
    {
        public static List<ScoreModel> ToScoreDataList(this IDataReader reader)
        {
            List<ScoreModel> scoreDataList = new List<ScoreModel>();
            //DataTable Table = reader.GetSchemaTable();
            while (reader.Read())
            {
                ScoreModel scoreData = new ScoreModel();
                scoreData.TeamName = reader["Teams"].ToString();

                for (byte ColumnNo = 2; ColumnNo < reader.FieldCount; ColumnNo++)
                {
                    Games games = new Games();
                    int value = string.IsNullOrWhiteSpace(reader[ColumnNo].ToString()) ? 0 : reader[ColumnNo].FromDBNullable(Convert.ToInt32);
                    games.GamesPointDict = new Dictionary<string, int> { { reader.GetName(ColumnNo).ToString(), value } };
                    scoreData.ListOfGame.Add(games);
                }

                scoreDataList.Add(scoreData);
            }
            reader.Close();
            return scoreDataList;
        }       
    }
    public static class Extension
    {
        public delegate T ConvertValue<T, V>(V value);

        public static T FromDBNullable<T>(this object value, ConvertValue<T, object> convert)
        {
            return Convert.IsDBNull(value) ? default(T) : convert(value);
        }
    }

}
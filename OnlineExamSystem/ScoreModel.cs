using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace OnlineExamSystem
{
    public class ScoreModel
    {
        public ScoreModel()
        {
            ListOfGame = new List<Games>();
        }
        private string _teamName;
        public string TeamName
        {
            get { return _teamName; }
            set
            {
                if (_teamName != value)
                {
                    _teamName = value;
                    //RaisePropertyChanged("TeamName");
                }
            }
        }
        public List<Games> ListOfGame { get; set; }
    }
    public class Games
    {
        public Games() { GamesPointDict = new Dictionary<string, int>(); }
        public Dictionary<string, int> GamesPointDict { get; set; }
    }
}
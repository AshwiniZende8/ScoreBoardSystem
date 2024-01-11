using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace OnlineExamSystem
{
    public partial class WinnerDisplayPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<ScoreModel> scoreBoardList = DAL.DataProvider.ScoreList();
                
                WinnerNameLabel.Text =  scoreBoardList.FirstOrDefault().TeamName;
            }
        }
    }
}

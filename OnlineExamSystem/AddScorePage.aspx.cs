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
    public partial class AddScorePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void AddScore_Click(object sender, EventArgs e)
        {
            string CS = "Data Source=cybermarine.database.windows.net; Initial Catalog=CyberMarineAnnualEvent2023; User id=cybermarine; Password=India1237$;";
            SqlConnection con = new SqlConnection(CS);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Score ([GameName],[A],[B],[C],[D]) values ('"+ nameOfGameTextBox.Text + "',"+0+","+0+","+0+","+0+")", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                cmd.ExecuteNonQuery();
            }
            catch
            {

            }
        }
    }
}

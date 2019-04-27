using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HeroicAccess;

namespace HeroicApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var heroicData = new HeroicData();

                //var dataAccess = new DataAccess(connectionString: "YOUR_CONNECTION_STRING");  

                //this.lv.DataSource = dataAccess.ExecuteTable<User>("SELECT * FROM [User]"); 
                //this.lv.DataBind();

                var users = heroicData.ExecuteTable("SELECT * FROM [User]");
                var count = heroicData.ExecuteScalar("SELECT COUNT(*) FROM [User]");

                litCount.Text = $"Showing {count} entries";

                this.lv.DataSource = users;
                this.lv.DataBind();
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            var heroicData = new HeroicData();

            var dataSet = heroicData.ExecuteStoredProcedure(
                name: "usp_SearchUser", 
                parameters: new List<HeroicData.Parameters>
                {
                    new HeroicData.Parameters { Name = "@search", Value = txtSearch.Text }
                }
            );

            var users = heroicData.ToList<User>(dataSet.Tables[0]);
            var filterCount = Convert.ToInt32(dataSet.Tables[1].Rows[0][0]);
            var totalCount = Convert.ToInt32(dataSet.Tables[2].Rows[0][0]);

            litCount.Text = $"Showing {filterCount} of {totalCount} entries";

            this.lv.DataSource = users;
            this.lv.DataBind();
        }
    }
}
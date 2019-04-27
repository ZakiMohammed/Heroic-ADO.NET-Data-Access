using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HeroicAccess;

namespace HeroicApp
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                var dataAccess = new HeroicData();
                var result = dataAccess.ExecuteNonQuery(
                    query: "INSERT INTO [User] (UserName, Email, Mobile, Password) VALUES (@userName, @email, @mobile, @password);",
                    parameters: new List<HeroicData.Parameters>
                    {
                        new HeroicData.Parameters { Name = "@userName", Value = txtUserName.Text },
                        new HeroicData.Parameters { Name = "@email",    Value = txtEmail.Text },
                        new HeroicData.Parameters { Name = "@mobile",   Value = txtMobile.Text },
                        new HeroicData.Parameters { Name = "@password", Value = txtPassword.Text },
                    });

                if (result == 0)
                {
                    lbl.Text = "Record not added";
                    lbl.Visible = true;
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }
            }
            catch (Exception ex)
            {
                lbl.Text = "Something went wrong, Message: " + ex.Message;
                lbl.Visible = true;
            }
        }
    }
}
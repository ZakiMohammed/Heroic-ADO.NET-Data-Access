using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HeroicAccess;

namespace HeroicApp
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var id = string.IsNullOrEmpty(Request.QueryString["id"]) ? 0 : Convert.ToInt32(Request.QueryString["id"]);
                if (id == 0)
                    Response.Redirect("~/Default.aspx");

                var dataAccess = new HeroicData();
                var user = dataAccess.ExecuteTable<User>(
                    query: "SELECT * FROM [User] WHERE ID = @id",
                    parameters: new List<HeroicData.Parameters>
                    {
                        new HeroicData.Parameters { Name = "@id", Value = id }
                    }).FirstOrDefault();

                if (user == null)
                    Response.Redirect("~/Default.aspx");

                hidID.Value = user.ID.ToString();
                txtUserName.Text = user.UserName;
                txtPassword.Text = user.Password;
                txtEmail.Text = user.Email;
                txtMobile.Text = user.Mobile;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                var dataAccess = new HeroicData();
                var result = dataAccess.ExecuteNonQuery(
                    query: "UPDATE [User] SET UserName = @userName, Email = @email, Mobile = @mobile, Password = @password WHERE ID = @id;",
                    parameters: new List<HeroicData.Parameters>
                    {
                        new HeroicData.Parameters { Name = "@id",       Value = hidID.Value },
                        new HeroicData.Parameters { Name = "@userName", Value = txtUserName.Text },
                        new HeroicData.Parameters { Name = "@email",    Value = txtEmail.Text },
                        new HeroicData.Parameters { Name = "@mobile",   Value = txtMobile.Text },
                        new HeroicData.Parameters { Name = "@password", Value = txtPassword.Text },
                    });

                if (result == 0)
                {
                    lbl.Text = "Record not updated";
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                var dataAccess = new HeroicData();
                var result = dataAccess.ExecuteNonQuery(
                    query: "DELETE FROM [User] WHERE ID = @id;",
                    parameters: new List<HeroicData.Parameters>
                    {
                        new HeroicData.Parameters { Name = "@id",       Value = hidID.Value }
                    });

                if (result == 0)
                {
                    lbl.Text = "Record not deleted";
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
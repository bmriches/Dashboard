using System;

namespace Dashboard.Webpages
{
    public partial class LoginPage : System.Web.UI.Page
    {
        //DB CONNECTOR REFERENCE
        private DBConnector con;
        protected void Page_Load(object sender, EventArgs e)
        {
            //HIDE MESSAGE LABLE
            lblErrorMessage.Visible = false;
        }


        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            //OPEN POP-UP REGISTRATION PAGE
            string url = "SignUp.aspx";
            string s = "window.open('" + url + "', 'popup_window', 'width=400,height=200,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
            Session["username"] = txtUserName.Text.Trim();
        }

        
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //CONNECT TO DB
            con = new DBConnector();
            con.SqlQuery("EXEC LoginDB.dbo.UserLogin_Get @Username = @usrnme, @Password = @pwrd");
            con.Cmd.Parameters.AddWithValue("@usrnme", txtUserName.Text.Trim());
            con.Cmd.Parameters.AddWithValue("@pwrd", txtPassword.Text.Trim());
            con.QueryEx();

            //CHECK IF USER EXISTS
            int count = Convert.ToInt32(con.Cmd.ExecuteScalar());
            if (count == 1)
            {
                Session["username"] = txtUserName.Text.Trim();
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblErrorMessage.Text = "Login Failed";
                lblErrorMessage.Visible = true;
            };
        }
    }
}
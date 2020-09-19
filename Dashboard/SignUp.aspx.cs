using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dashboard
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //CHECK ACTIVE SESSION
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        private DBConnector connu;
        protected void btnInsertUser_Click(object sender, EventArgs e)
        {
            //CHECK ACTIVE SESSION
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            //DB CONNECTOR
            connu = new DBConnector();

            //SET INSERT USER IN OT USERS TABLE
            connu.SqlQuery("EXEC LoginDB.dbo.User_Ins @UN = @username, @PW = @password");
            connu.Cmd.Parameters.AddWithValue("@username", tbUsername.Text.Trim());
            connu.Cmd.Parameters.AddWithValue("@password", tbPassword.Text.Trim());
            connu.NonQueryEx();

            //SET LABLE FOR NEW UER
            connu.SqlQuery("SELECT Username FROM LoginDB.dbo.Users WHERE Username = @username");
            connu.Cmd.Parameters.AddWithValue("@username", tbUsername.Text.Trim());
            connu.QueryEx();

            lblSignUpMessage.Text = "Acccount created, please close this windows and login";
            lblSignUpMessage.ForeColor = System.Drawing.Color.Green;

            //SHOW PANEL WITH MESSAGE
            lblSignUpMessage.Visible = true;

            //END SESSION AFTER USER CREATION TO AVOID SPAMMING
            Session.Abandon();
        }
    }
}
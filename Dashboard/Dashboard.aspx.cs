using System;
using System.Web;
using System.IO;


namespace Dashboard.Webpages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        private DBConnector conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            { 
                Response.Redirect("Login.aspx");
            }
            else
            { 
                lblUserDetails.Text = Session["username"].ToString();
            }

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(fileName);
            int fileSize = postedFile.ContentLength;

            if (fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif" || fileExtension.ToLower() == ".nef" || fileExtension.ToLower() == ".xlsx")
            {
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                //OPEN SQL CONNECTION
                conn = new DBConnector();

                //STORE SESSION TO WRITE TO DB
                string username = (string)Session["username"];
                {
                    conn.SqlQuery("EXEC LoginDB.dbo.spUploadImage @Username = @username, @FileName = @filename, @SizeBytes = @size, @ImageData = @imagedata, @CustomFileName = @customfilename, @Ext = @ext");
                    conn.Cmd.Parameters.AddWithValue("@filename", postedFile.FileName.ToString());
                    conn.Cmd.Parameters.AddWithValue("@customfilename", tbCustomFileName.Text);
                    conn.Cmd.Parameters.AddWithValue("@username", username.ToString());
                    conn.Cmd.Parameters.AddWithValue("@size", postedFile.ContentLength.ToString());
                    conn.Cmd.Parameters.Add("@imagedata", System.Data.SqlDbType.VarBinary, -1).Value = bytes;
                    conn.Cmd.Parameters.AddWithValue("@ext", fileExtension.ToString());
                    conn.NonQueryEx();


                    lblMessage.Visible = true;
                    lblMessage.Text = "Upload Successful";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    ListBox1.DataBind();


                }
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Non supported file type";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}
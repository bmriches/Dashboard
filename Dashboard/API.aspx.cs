using System;
using System.IO;
using System.Net;

namespace Dashboard
{
    public partial class API : System.Web.UI.Page
    {

        private DBConnector conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            conn = new DBConnector();
            string sturltest = string.Format("http://jsonplaceholder.typicode.com/posts/1/comments");
            WebRequest requestObjGet = WebRequest.Create(sturltest);
            requestObjGet.Method = "GET";
            HttpWebResponse responseObjGet = null;
            responseObjGet = (HttpWebResponse)requestObjGet.GetResponse();

            string strresulttest = null;
            using (Stream stream = responseObjGet.GetResponseStream())
            {
                StreamReader sr = new StreamReader(stream);
                strresulttest = sr.ReadToEnd();
                sr.Close();

                conn.SqlQuery("INSERT INTO LoginDB.dbo.APICollection (String) VALUES(@APIString)");
                conn.Cmd.Parameters.AddWithValue("@APIString", strresulttest.ToString());
                conn.QueryEx();
                //TextBox1.Text = strresulttest.ToString();
            }

        }
    }
}
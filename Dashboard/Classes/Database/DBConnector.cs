using System.Data;
using System.Data.SqlClient;

namespace Dashboard
{
    public class DBConnector
    {
        private SqlConnection _con;
        public SqlCommand Cmd;
        private SqlDataAdapter _da;
        private DataTable _dt;


        public DBConnector(string connectionstring = null)
        {
            _con = new SqlConnection(connectionstring ?? @"Data Source=UTHMSSQL01;initial catalog=LoginDB;integrated security=true;");
            _con.Open();
        }

        public void SqlQuery(string queryText)
        {
            Cmd = new SqlCommand(queryText, _con);
        }

        public DataTable QueryEx()
        {
            _da = new SqlDataAdapter(Cmd);
            _dt = new DataTable();
            _da.Fill(_dt);
            //_con.Close();
            return _dt;
        }

        public void NonQueryEx()
        {
            Cmd.ExecuteNonQuery();
            //_con.Close();
        }
    }
}
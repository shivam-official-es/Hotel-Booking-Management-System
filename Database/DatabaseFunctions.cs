using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Hotel_Booking_Management_System.Database
{
    public class DatabaseFunctions
    {
        public SqlConnection con = new SqlConnection();
        public SqlCommand cmd = new SqlCommand();
        public SqlDataReader rdr;
        public SqlDataAdapter da = new SqlDataAdapter();
        public DataSet ds = new DataSet();

        public void DBConnection()
        {

            string CS = ConfigurationManager.ConnectionStrings["HotelBookingManagementSystemConnectionString"].ConnectionString;
            con = new SqlConnection(CS);
            con.Open();
        }
    }
}
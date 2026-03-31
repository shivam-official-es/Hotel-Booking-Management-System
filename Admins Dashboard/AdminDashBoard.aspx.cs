using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Hotel_Booking_Management_System.Admins_Dashboard
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                roleSession_lbl.Text = "Welcome " + Session["AdminName"].ToString().ToUpper() + ", admin";

                TotalRoomsUsersBookings();
            }
        }

        protected void TotalRoomsUsersBookings()
        {
            Database.DatabaseFunctions myDB = new Database.DatabaseFunctions();
            myDB.DBConnection();
            using (myDB.cmd = new SqlCommand("Sp_AdminTotalRoomsUsersBookings", myDB.con))
            {
                myDB.cmd.CommandType = CommandType.StoredProcedure;
                myDB.rdr = myDB.cmd.ExecuteReader();
                if (myDB.rdr.Read())
                {
                    displayTotalRooms_lbl.Text = myDB.rdr["Total_Rooms"].ToString();
                    displayTotalUsers_lbl.Text = myDB.rdr["Total_Users"].ToString();
                    displayTotalBookings_lbl.Text = myDB.rdr["Total_Bookings"].ToString();
                }
                myDB.rdr.Close();
                myDB.con.Close();
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Hotel_Booking_Management_System
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRooms();
            }
        }

        protected void LoadRooms()
        {
            Database.DatabaseFunctions myDB = new Database.DatabaseFunctions();
            myDB.DBConnection();
            using (myDB.cmd = new SqlCommand("Sp_HomePageCard", myDB.con))
            {
                myDB.cmd.CommandType = System.Data.CommandType.StoredProcedure;
                myDB.da = new SqlDataAdapter(myDB.cmd);
                myDB.da.Fill(myDB.ds);
                HomePageRepeater.DataSource = myDB.ds;
                HomePageRepeater.DataBind();
            }
        }

        protected void HomePageRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void viewDetails_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login Page/LoginUser.aspx");
        }
    }
}
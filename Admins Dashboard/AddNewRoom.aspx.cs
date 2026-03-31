using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Hotel_Booking_Management_System.Admins_Dashboard
{
    public partial class AddNewRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void add_btn_Click(object sender, EventArgs e)
        {
            string imagePath = "";
            if (RoomImageUpload.HasFile)
            {
                string fileName = RoomImageUpload.FileName;
                string folderPath = Server.MapPath("~/Images/Rooms/");
                string fullPath = folderPath + fileName;
                RoomImageUpload.SaveAs(fullPath);
                imagePath = "Images/Rooms/" + fileName;
            }

            Bind.Rooms myRoom = new Bind.Rooms();
            myRoom.RoomNumber = Convert.ToInt32(roomNumber_txt.Text);
            myRoom.RoomType = roomType_txt.Text;
            myRoom.RoomDescription = roomDescription_txt.Text;
            myRoom.RoomPrice = Convert.ToDecimal(roomPrice_txt.Text);
            myRoom.GuestsCount = Convert.ToInt32(guestsCount_txt.Text);
            myRoom.Amenities = amenities_txt.Text;
            myRoom.RoomImagePath = imagePath;

            Database.DatabaseFunctions myDb = new Database.DatabaseFunctions();
            myDb.cmd = new SqlCommand("Sp_InsertRooms", myDb.con);
            myDb.cmd.CommandType = CommandType.StoredProcedure;
            myDb.cmd.Parameters.AddWithValue("@RoomNumber", myRoom.RoomNumber);
            myDb.cmd.Parameters.AddWithValue("@RoomType", myRoom.RoomType);
            myDb.cmd.Parameters.AddWithValue("@RoomDescription", myRoom.RoomDescription);
            myDb.cmd.Parameters.AddWithValue("@Price", myRoom.RoomPrice);
            myDb.cmd.Parameters.AddWithValue("@Guests", myRoom.GuestsCount);
            myDb.cmd.Parameters.AddWithValue("@Amenities", myRoom.Amenities);
            myDb.cmd.Parameters.AddWithValue("@ImagePath", myRoom.RoomImagePath);

            myDb.DBConnection();
            myDb.cmd.ExecuteNonQuery();
            myDb.con.Close();

            roomAddedSuccessMessage_lbl.Visible = true;
            roomAddedSuccessMessage_lbl.Text = "Room added successfully";
            Response.AddHeader("REFRESH", "2;URL=ManageRooms.aspx");
        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admins Dashboard/ManageRooms");
        }
    }
}
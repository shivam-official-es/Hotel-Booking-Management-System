using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Antlr.Runtime.Tree;
using System.IO;
using System.Data;

namespace Hotel_Booking_Management_System.Admins_Dashboard
{
    public partial class ManageRooms : System.Web.UI.Page
    {

        Database.DatabaseFunctions myDb = new Database.DatabaseFunctions();
        Bind.Rooms myRooms = new Bind.Rooms();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRooms();
            }
        }

        protected void BindRooms()
        {
            myDb.DBConnection();
            myDb.cmd = new SqlCommand("Sp_AdminGetAllRooms", myDb.con);
            myDb.cmd.CommandType = CommandType.StoredProcedure;

            myDb.rdr = myDb.cmd.ExecuteReader();
            AdminRoomsGridView.DataSource = myDb.rdr;
            AdminRoomsGridView.DataBind();
            myDb.con.Close();
        }

        protected void AddNewRoom_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admins Dashboard/AddNewRoom");
        }

        protected void AdminRoomsGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            AdminRoomsGridView.EditIndex = e.NewEditIndex;
            BindRooms();
        }

        protected void AdminRoomsGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            AdminRoomsGridView.EditIndex = -1;
            BindRooms();
        }

        protected void AdminRoomsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int roomId = Convert.ToInt32(AdminRoomsGridView.DataKeys[e.RowIndex].Value);

            GridViewRow row = AdminRoomsGridView.Rows[e.RowIndex];
            FileUpload myFileUpload = (FileUpload)row.FindControl("roomImageUpload");

            string filePath = "";

            if (myFileUpload.HasFile)
            {
                string fileName = Path.GetFileName(myFileUpload.FileName);
                string folderPath = Server.MapPath("~/Images/Rooms");
                myFileUpload.SaveAs(folderPath + "/" + fileName);
                filePath = "Images/Rooms/" + fileName;
            }
            else
            {
                filePath = ((Image)row.FindControl("imagePreview")).ImageUrl;
            }
            myRooms.RoomId = roomId;
            myRooms.RoomNumber = Convert.ToInt32(((TextBox)row.FindControl("roomNumber_txt")).Text);
            myRooms.RoomType = ((TextBox)row.FindControl("roomType_txt")).Text;
            myRooms.RoomDescription = ((TextBox)row.FindControl("roomDescription_txt")).Text;
            myRooms.RoomPrice = Convert.ToDecimal(((TextBox)row.FindControl("price_txt")).Text);
            myRooms.GuestsCount = Convert.ToInt32(((TextBox)row.FindControl("guests_txt")).Text);
            myRooms.Amenities = ((TextBox)row.FindControl("amenities_txt")).Text;
            myRooms.RoomImagePath = filePath;

            myDb.DBConnection();
            myDb.cmd = new SqlCommand("Sp_UpdateRooms", myDb.con);
            myDb.cmd.CommandType = CommandType.StoredProcedure;
            myDb.cmd.Parameters.AddWithValue("@RoomId", myRooms.RoomId);
            myDb.cmd.Parameters.AddWithValue("@RoomNumber", myRooms.RoomNumber);
            myDb.cmd.Parameters.AddWithValue("@RoomType", myRooms.RoomType);
            myDb.cmd.Parameters.AddWithValue("@RoomDescription", myRooms.RoomDescription);
            myDb.cmd.Parameters.AddWithValue("@Price", myRooms.RoomPrice);
            myDb.cmd.Parameters.AddWithValue("@Guests", myRooms.GuestsCount);
            myDb.cmd.Parameters.AddWithValue("@Amenities", myRooms.Amenities);
            myDb.cmd.Parameters.AddWithValue("@ImagePath", myRooms.RoomImagePath);

            myDb.cmd.ExecuteNonQuery();
            myDb.con.Close();

            AdminRoomsGridView.EditIndex = -1;
            BindRooms();
        }

        protected void AdminRoomsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int roomId = Convert.ToInt32(AdminRoomsGridView.DataKeys[e.RowIndex].Value);
            
            myDb.DBConnection();
            myDb.cmd = new SqlCommand("Sp_DeleteRooms", myDb.con);
            myDb.cmd.CommandType = CommandType.StoredProcedure;

            myDb.cmd.Parameters.AddWithValue("@RoomId", roomId);

            myDb.cmd.ExecuteNonQuery();
            myDb.con.Close();

            BindRooms();
        }
    }
}
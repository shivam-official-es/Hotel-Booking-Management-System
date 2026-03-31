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
    public partial class EnquiryAndUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Update_btn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            int Contactid = Convert.ToInt32(EnquiriesDetailsGridView.DataKeys[row.RowIndex].Value);

            DropDownList myDDL = (DropDownList)row.FindControl("ddlStatus");
            string Status = myDDL.SelectedValue;

            Database.DatabaseFunctions myDb = new Database.DatabaseFunctions();
            myDb.DBConnection();
            myDb.cmd = new SqlCommand("Sp_UpdateContactMessages", myDb.con);
            myDb.cmd.CommandType = CommandType.StoredProcedure;
            myDb.cmd.Parameters.AddWithValue("@ContactId", Contactid);
            myDb.cmd.Parameters.AddWithValue("@ProcessStatus", Status);

            myDb.cmd.ExecuteNonQuery();
            myDb.con.Close();

            SuccessUpdateMessage.Visible = true;
            UpdateSuccessMessage_lbl.Text = "Status Updated Succesfully";

            EnquiriesDetailsGridView.DataBind();
        }
    }
}
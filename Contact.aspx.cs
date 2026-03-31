using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Booking_Management_System
{
    public partial class Contact : Page
    {
        Database.DatabaseFunctions myDB = new Database.DatabaseFunctions();
        Bind.ContactBind myC = new Bind.ContactBind();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void send_button_Click(object sender, EventArgs e)
        {
            myC.CustomerName = name_txt.Text;
            myC.CustomerEmail = email_txt.Text;
            myC.CustomerNumber = phoneNumber_txt.Text;
            myC.CustomerMessage = message_txt.Text;

            myDB.DBConnection();
            myDB.cmd = new SqlCommand("Sp_ContactUs", myDB.con);
            myDB.cmd.CommandType = System.Data.CommandType.StoredProcedure;
            myDB.cmd.Parameters.AddWithValue("@CustomerName", myC.CustomerName);
            myDB.cmd.Parameters.AddWithValue("@CustomerEmail", myC.CustomerEmail);
            myDB.cmd.Parameters.AddWithValue("@CustomerNumber", myC.CustomerNumber);
            myDB.cmd.Parameters.AddWithValue("@CustomerMessage", myC.CustomerMessage);

            myDB.cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Message sent successfully, our team will reach you soon')</script>");
        }
    }
}
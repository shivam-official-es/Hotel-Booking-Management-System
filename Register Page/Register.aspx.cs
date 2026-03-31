using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Booking_Management_System.Register_Page
{
    public partial class Register : System.Web.UI.Page
    {
        Database.DatabaseFunctions myDB = new Database.DatabaseFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void create_btn_Click(object sender, EventArgs e)
        {
            Bind.RegisterBind myB = new Bind.RegisterBind();
            myB.UserName = name_txt.Text;
            myB.Email = email_txt.Text;
            myB.PhoneNumber = phoneNumber_txt.Text;
            myB.UserRole = roleList.SelectedValue;
            myB.Password = password_txt.Text;

            string CS = ConfigurationManager.ConnectionStrings["DB"].ConnectionString;
            myDB.DBConnection();
            myDB.cmd = new SqlCommand("Sp_Register", myDB.con);
            myDB.cmd.CommandType = System.Data.CommandType.StoredProcedure;
            myDB.cmd.Parameters.AddWithValue("@UserName", myB.UserName);
            myDB.cmd.Parameters.AddWithValue("@Email", myB.Email);
            myDB.cmd.Parameters.AddWithValue("@PhoneNumber", myB.PhoneNumber);
            myDB.cmd.Parameters.AddWithValue("@UserRole", myB.UserRole);
            myDB.cmd.Parameters.AddWithValue("@UserPassword", myB.Password);
            myDB.cmd.Parameters.AddWithValue("@Option", 1);

            myDB.cmd.ExecuteNonQuery();
            Response.Write("<script>alert('New Account Created Successfully')</script>");
        }
    }
}

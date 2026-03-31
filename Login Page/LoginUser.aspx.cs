using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Hotel_Booking_Management_System.Login_Page
{
    public partial class LoginUser : System.Web.UI.Page
    {
        Database.DatabaseFunctions myDB = new Database.DatabaseFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            Bind.RegisterBind myB = new Bind.RegisterBind();
            myB.UserRole = roleList.SelectedValue;
            myB.Email = email_txt.Text;
            myB.Password = password_txt.Text;

            myDB.DBConnection();

            myDB.cmd = new SqlCommand("Sp_Login", myDB.con);
            myDB.cmd.CommandType = System.Data.CommandType.StoredProcedure;
            myDB.cmd.Parameters.AddWithValue("@Email", myB.Email);
            myDB.cmd.Parameters.AddWithValue("@UserPassword", myB.Password);
            myDB.cmd.Parameters.AddWithValue("@UserRole", myB.UserRole);

            myDB.rdr = myDB.cmd.ExecuteReader();

            if (myDB.rdr.Read())
            {
                string name = myDB.rdr["UserName"].ToString();
                int Id = Convert.ToInt32(myDB.rdr["UserId"]);
                string dbRole = myDB.rdr["UserRole"].ToString();
                string selectedRole = roleList.SelectedValue;

                if (dbRole.Equals(selectedRole, StringComparison.OrdinalIgnoreCase))
                {
                    if (selectedRole=="Admin")
                    {
                        Session["AdminName"] = name.ToString();
                        Response.Redirect("~/Admins Dashboard/AdminDashBoard.aspx");
                    }
                    else
                    {
                        Session["UserName"] = name.ToString();
                        Session["UserId"] = Convert.ToInt32(Id);
                        Response.Redirect("~/Users Dashboard/UserDashBoard.aspx");
                    }
                }
            }
            else
            {
                alertPlaceholder.Visible = true;
                lblAlert.Text = "Invalid credentials";
            }


        }
    }
}

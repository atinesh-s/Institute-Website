using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class studentnStaff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Student/Staff/Admin Login";
        if(!Page.IsPostBack)
        {
            drpdwnrole.Items.Add("Student");
            drpdwnrole.Items.Add("Staff");
            drpdwnrole.Items.Add("Admin");

            lblmsg.Visible = false;
            pnlmsg.Visible = false;
            imgalert.Visible = false;
        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(4000);
        ClsConnection obj=new ClsConnection();
        SqlCommand cmd=new SqlCommand();
        DataSet ds=new DataSet();

        if (drpdwnrole.SelectedItem.Text == "Student")
        {
            cmd =
                new SqlCommand("SELECT S_ID, Name FROM Student_Table WHERE S_ID='" + txtuserid.Text + "' and Password='" +
                               txtpassword.Text + "'");
            Session["Role"] = "Student";
        }
        else if (drpdwnrole.SelectedItem.Text == "Staff")
        {
            cmd =
                new SqlCommand("SELECT SF_ID, Name FROM Staff_Table WHERE SF_ID='" + txtuserid.Text + "' and Password='" +
                               txtpassword.Text + "'");
            Session["Role"] = "Staff";
        }
        else
        {
            cmd =
                new SqlCommand("SELECT A_ID, Name FROM Admin_Table WHERE A_ID='" + txtuserid.Text + "' and Password='" +
                               txtpassword.Text + "'");
            Session["Role"] = "Admin";
        }

        ds = obj.retdata(cmd);
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["ID"] = Convert.ToString(ds.Tables[0].Rows[0][0]);
            Session["Name"] = Convert.ToString(ds.Tables[0].Rows[0][1]);
            lblmsg.Visible = false;
            pnlmsg.Visible = false;
            imgalert.Visible = false;
            Response.Redirect("default.aspx");
        }
        else
        {
            lblmsg.Visible = true;
            pnlmsg.Visible = true;
            imgalert.Visible = true;
            pnlmsg.CssClass = "error";
            imgalert.ImageUrl = "~/Images/alert red.png";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Invalid Credentials, Try Again";
        }
    }
}
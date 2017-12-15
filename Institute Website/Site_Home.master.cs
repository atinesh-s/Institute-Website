using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Site : System.Web.UI.MasterPage
{
    ClsConnection obj = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["ID"]) != "")
        {
            imgloggedin.Visible = true;
            lblloginname.Text = Convert.ToString(Session["Name"]);
            lblloggedin.Visible = true;
            lnkbtnlogout.Visible = true;
            btnvisit.Visible = true;
            if (Convert.ToString(Session["Role"]) == "Student")
            {
                btnvisit.Text = "Visit Student Section";
                btnvisit.PostBackUrl = "~/student.aspx";
            }
            else if (Convert.ToString(Session["Role"]) == "Staff")
            {
                btnvisit.Text = "Visit Staff Section";
                btnvisit.PostBackUrl = "~/staff.aspx";
            }
            else
            {
                btnvisit.Text = "Visit Admin Section";
                btnvisit.PostBackUrl = "~/admin.aspx";
            }
        }
        else
        {
            imgloggedin.Visible = false;
            lblloggedin.Visible = false;
            lblloginname.Visible = false;
            lnkbtnlogout.Visible = false;
            btnvisit.Text = "";
            btnvisit.PostBackUrl = "";
            btnvisit.Visible = false;
        }
        
        if(!Page.IsPostBack)
        {
            this.count();    
        }

        SqlCommand cmd = new SqlCommand("SELECT visitors FROM Visitors_Table WHERE V_ID=100");
        DataSet ds=new DataSet();
        ds = obj.retdata(cmd);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblvis.Text = ds.Tables[0].Rows[0]["visitors"].ToString();
        }
    }

    protected void count()
    {
        int count;
        SqlCommand cmd =new SqlCommand("SELECT visitors FROM Visitors_Table WHERE V_ID=100");
        DataSet ds=new DataSet();
        ds = obj.retdata(cmd);
        if (ds.Tables[0].Rows.Count > 0)
        {
            count = Convert.ToInt16(ds.Tables[0].Rows[0]["visitors"]);
            count += 1;
            string str = "UPDATE Visitors_Table SET visitors=" + count + " WHERE V_ID=100";
            obj.ExecuteQueries(str);
        }
    }

    protected void lnkbtnlogout_Click(object sender, EventArgs e)
    {
        Session["Name"] = "";
        Session["ID"] = "";
        Session["Role"] = "";
        lblloginname.Text = "";
        lblloginname.Visible = false;
        lblloggedin.Visible = false;
        imgloggedin.Visible = false;
        lnkbtnlogout.Visible = false;
        btnvisit.Text = "";
        btnvisit.PostBackUrl = "";
        btnvisit.Visible = false;

        Response.Redirect("default.aspx");
    }
}

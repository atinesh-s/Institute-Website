using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class forgotPassword : System.Web.UI.Page
{
    private ClsConnection obj = new ClsConnection();
    SqlCommand cmd=new SqlCommand();
    string seqans = null;
    string pass = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Forgot Password ?";
        if(!Page.IsPostBack)
        {
            lblmsg.Visible = false;
            pnlmsg.Visible = false;
            imgalert.Visible = false;

            lblsecques.Visible = false;
            txtsecques.Visible = false;
            lblsecans.Visible = false;
            txtsecans.Visible = false;
            btnchkans.Visible = false;
        }
    }

    protected void btnchkemail_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        bool emailmatched = false;
        cmd = new SqlCommand("SELECT EmailAdd,SecQues,SecAns,Password FROM Student_Table");
        ds = new DataSet();
        ds = obj.retdata(cmd);
        for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
        {
            if (txtemailadd.Text == ds.Tables[0].Rows[i]["EmailAdd"].ToString())
            {
                emailmatched = true;
                lblsecques.Visible = true;
                txtsecques.Visible = true;
                lblsecans.Visible = true;
                txtsecans.Visible = true;
                btnchkans.Visible = true;

                txtsecques.Text = ds.Tables[0].Rows[i]["SecQues"].ToString();
                seqans = ds.Tables[0].Rows[i]["Secans"].ToString();
                ViewState["Secans"] = seqans;
                pass = ds.Tables[0].Rows[i]["Password"].ToString();
                ViewState["pass"] = pass;
            }
        }
        if (!emailmatched)
        {
            cmd = new SqlCommand("SELECT EmailAdd,SecQues,SecAns,Password FROM Staff_Table");
            ds = obj.retdata(cmd);
            for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
            {
                if (txtemailadd.Text == ds.Tables[0].Rows[i]["EmailAdd"].ToString())
                {
                    emailmatched = true;
                    lblsecques.Visible = true;
                    txtsecques.Visible = true;
                    lblsecans.Visible = true;
                    txtsecans.Visible = true;
                    btnchkans.Visible = true;

                    txtsecques.Text = ds.Tables[0].Rows[i]["SecQues"].ToString();
                    seqans = ds.Tables[0].Rows[i]["Secans"].ToString();
                    ViewState["Secans"] = seqans;
                    pass = ds.Tables[0].Rows[i]["Password"].ToString();
                    ViewState["pass"] = pass;
                }
            }
        }
        if (!emailmatched)
        {
            cmd = new SqlCommand("SELECT Email,SecQues,SecAns,Password FROM Admin_Table");
            ds = obj.retdata(cmd);
            for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
            {
                if (txtemailadd.Text == ds.Tables[0].Rows[i]["Email"].ToString())
                {
                    emailmatched = true;
                    lblsecques.Visible = true;
                    txtsecques.Visible = true;
                    lblsecans.Visible = true;
                    txtsecans.Visible = true;
                    btnchkans.Visible = true;

                    txtsecques.Text = ds.Tables[0].Rows[i]["SecQues"].ToString();
                    seqans = ds.Tables[0].Rows[i]["Secans"].ToString();
                    ViewState["Secans"] = seqans;
                    pass = ds.Tables[0].Rows[i]["Password"].ToString();
                    ViewState["pass"] = pass;
                }
            }
        }

        imgalert.Visible = true;
        lblmsg.Visible = true;
        pnlmsg.Visible = true;

        if (emailmatched)
        {
            lblmsg.ForeColor = System.Drawing.Color.DarkGreen;
            lblmsg.Text = "Email Address Matched";
            pnlmsg.CssClass = "correct";
            imgalert.ImageUrl = "~/Images/alert green.png";
        }
        else
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Email Address Doesn't Matched";
            pnlmsg.CssClass = "error";
            imgalert.ImageUrl = "~/Images/alert red.png";
        }
    }
    protected void btnchkans_Click(object sender, EventArgs e)
    {
        if (ViewState["Secans"].ToString() == txtsecans.Text)
        {
            lblmsg.ForeColor = System.Drawing.Color.DarkGreen;
            lblmsg.Text = "Your Password is '" + ViewState["pass"].ToString() + "'";
            pnlmsg.CssClass = "correct";
            imgalert.ImageUrl = "~/Images/alert green.png";
        }
        else
        {
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Security Answer Doesn't Matched, Try Again";
            pnlmsg.CssClass = "error";
            imgalert.ImageUrl = "~/Images/alert red.png";   
        }
    }
}
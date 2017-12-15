using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Student : System.Web.UI.Page
{
    ClsConnection obj=new ClsConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["Role"]) == "Student")
        {
            Page.Title = "Student Section";
            txtstdid.Text = Convert.ToString(Session["ID"]);
            if (!Page.IsPostBack)
            {
                rdbtnlstgender.Items.Add("Male");
                rdbtnlstgender.Items.Add("Female");
                lblnewpass.Visible = false;
                txtnewpass.Visible = false;
                lblcnfrmpass.Visible = false;
                txtconfrmpass.Visible = false;
                btndone.Visible = false;
                reqfldvalnewpass.Visible = false;
                cmpvalpass.Visible = false;
                btnsubmit.Visible = false;
                pnlpass.Visible = false;

                lblmsg.Visible = false;
                pnlmsg.Visible = false;
                imgalert.Visible = false;
                lblmsg.Text = "";

                drpdwnsecques.Items.Add("What is your favourite pets name?");
                drpdwnsecques.Items.Add("What is the name of your best friend?");
                drpdwnsecques.Items.Add("What was the name of your 1st teacher?");
                drpdwnsecques.Items.Add("What was your first phone no.?");
                drpdwnsecques.Items.Add("What is your vehicle registration no.?");
                drpdwnsecques.Items.Add("What is your favourite colour?");

                SqlCommand cmd =
                    new SqlCommand(
                        "SELECT Name, PName, DOB, MobNo, EmailAdd, Address, SecAns FROM Student_Table WHERE S_ID='" +
                        Convert.ToString(Session["ID"] + "'"));
                DataSet ds=new DataSet();
                ds = obj.retdata(cmd);
                if(ds.Tables[0].Rows.Count > 0)
                {
                    txtfullname.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                    txtparentname.Text = ds.Tables[0].Rows[0]["PName"].ToString();
                    txtdob.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                    txtmobileno.Text = ds.Tables[0].Rows[0]["MobNo"].ToString();
                    txtemailadd.Text = ds.Tables[0].Rows[0]["EmailAdd"].ToString();
                    txtadd.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    txtsecans.Text = ds.Tables[0].Rows[0]["SecAns"].ToString();
                }
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void btndone_Click(object sender, EventArgs e)
    {
        lblnewpass.Visible = false;
        txtnewpass.Visible = false;
        lblcnfrmpass.Visible = false;
        txtconfrmpass.Visible = false;
        btndone.Visible = false;
        reqfldvalnewpass.Visible = false;
        cmpvalpass.Visible = false;
        btndone.Visible = false;
        btnsubmit.Visible = false;
        lblmsg.Visible = false;
        pnlmsg.Visible = false;
        imgalert.Visible = false;
        pnlmsg.Visible = false;
        lblmsg.Text = "";
        pnlpass.Visible = false;
    }

    protected void btnchngpass_Click(object sender, EventArgs e)
    {
        lblnewpass.Visible = true;
        txtnewpass.Visible = true;
        lblcnfrmpass.Visible = true;
        txtconfrmpass.Visible = true;
        btndone.Visible = true;
        reqfldvalnewpass.Visible = true;
        cmpvalpass.Visible = true;
        btndone.Visible = true;
        btnsubmit.Visible = true;
        pnlpass.Visible = true;

        lblmsg.Visible = false;
        pnlmsg.Visible = false;
        imgalert.Visible = false;
        lblmsg.Text = "";
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(4000);
        string ques = null;
        ques = drpdwnsecques.SelectedItem.Text.ToString();
        string str =
            "UPDATE Student_Table SET Name='" + txtfullname.Text + "',PName='" + txtparentname.Text + "',Gender='" +
            rdbtnlstgender.SelectedItem.Text + "',DOB='" + txtdob.Text + "',MobNo='" + txtmobileno.Text + "',EmailAdd='" +
            txtemailadd.Text + "',Address='" + txtadd.Text + "',SecQues='" + ques + "',SecAns='" + txtsecans.Text +
            "' WHERE S_ID='" + txtstdid.Text + "'";
        int x;
        lblmsg.Visible = true;
        pnlmsg.Visible = true;
        imgalert.Visible = true;
        
        try
        {
            x = obj.ExecuteQueries(str);
        }
        catch (Exception ex)
        {
            pnlmsg.CssClass = "error";
            imgalert.ImageUrl = "~/Images/alert red.png";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = ex.Message.ToString();
            return;
        }

        if (x > 0)
        {
            pnlmsg.CssClass = "correct";
            imgalert.ImageUrl = "~/Images/alert green.png";
            lblmsg.ForeColor = System.Drawing.Color.DarkGreen;
            lblmsg.Text = "Personal Details Updated";
        }
        else
        {
            pnlmsg.CssClass = "error";
            imgalert.ImageUrl = "~/Images/alert red.png";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Invalid ID, Try Again";
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(4000);
        string str =
            "UPDATE Student_Table SET Password='" + txtnewpass.Text + "' WHERE S_ID='" + txtstdid.Text + "'";
        int x;
        lblmsg.Visible = true;
        pnlmsg.Visible = true;
        imgalert.Visible = true;

        try
        {
            x = obj.ExecuteQueries(str);
        }
        catch (Exception ex)
        {
            pnlmsg.CssClass = "error";
            imgalert.ImageUrl = "~/Images/alert red.png";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = ex.Message.ToString();
            return;
        }
        
        if (x > 0)
        {
            pnlmsg.CssClass = "correct";
            imgalert.ImageUrl = "~/Images/alert green.png";
            lblmsg.ForeColor = System.Drawing.Color.DarkGreen;
            lblmsg.Text = "Password Changed Successfully";
        }
        else
        {
            pnlmsg.CssClass = "error";
            imgalert.ImageUrl = "~/Images/alert red.png";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Invalid ID, Try Again";
        }
    }
}
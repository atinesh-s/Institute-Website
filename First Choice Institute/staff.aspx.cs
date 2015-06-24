using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff : System.Web.UI.Page
{
    private ClsConnection obj = new ClsConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["Role"]) == "Staff")
        {
            Page.Title = "Staff Section";
            sqldtsrcqual.SelectParameters["sf_id"].DefaultValue = Convert.ToString(Session["ID"]);
            txtstdid.Text = Convert.ToString(Session["ID"]);            

            if(!Page.IsPostBack)
            {
                grdviewqual.Attributes.Add("style", "word-break:break-all;word-wrap:break-word");

                rdbtnlstgender.Items.Add("Male");
                rdbtnlstgender.Items.Add("Female");

                for(int i=1995; i<=2013; i++)
                {
                 drpdwnlstbatch.Items.Add(i.ToString());   
                }

                drpdwnlstdegree.Items.Add("DCA");
                drpdwnlstdegree.Items.Add("PGDCA");
                drpdwnlstdegree.Items.Add("BCA");
                drpdwnlstdegree.Items.Add("MCA");
                drpdwnlstdegree.Items.Add("BSC");
                drpdwnlstdegree.Items.Add("MSC");
                drpdwnlstdegree.Items.Add("BBA");
                drpdwnlstdegree.Items.Add("MBA");
                drpdwnlstdegree.Items.Add("B.COM.");
                drpdwnlstdegree.Items.Add("M.COM");
                drpdwnlstdegree.Items.Add("BA");
                drpdwnlstdegree.Items.Add("MA");
                drpdwnlstdegree.Items.Add("BE");
                drpdwnlstdegree.Items.Add("ME");
                drpdwnlstdegree.Items.Add("B.Tech");
                drpdwnlstdegree.Items.Add("M.Tech");
                drpdwnlstdegree.Items.Add("MS");
                drpdwnlstdegree.Items.Add("Other");

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

                drpdwnlstques.Items.Add("What is your favourite pets name?");
                drpdwnlstques.Items.Add("What is the name of your best friend?");
                drpdwnlstques.Items.Add("What is the name of your 1st teacher?");
                drpdwnlstques.Items.Add("What was your first phone no.?");
                drpdwnlstques.Items.Add("What is your vehicle registration no.?");
                drpdwnlstques.Items.Add("What is your favourite colour?");

                SqlCommand cmd =
                    new SqlCommand(
                        "SELECT Name, PName, DOB, MobNo, EmailAdd, Address, SecAns FROM Staff_Table WHERE SF_ID='" +
                        Convert.ToString(Session["ID"] + "'"));
                DataSet ds = new DataSet();
                ds = obj.retdata(cmd);
                if (ds.Tables[0].Rows.Count > 0)
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
        pnlpass.Visible = false;

        lblmsg.Visible = false;
        pnlmsg.Visible = false;
        imgalert.Visible = false;
        lblmsg.Text = "";
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
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(4000);
        string str =
            "UPDATE Staff_Table SET Password='" + txtnewpass.Text + "' WHERE SF_ID='" + txtstdid.Text + "'";
        
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

    protected void btnsave_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(4000);
        string ques = null;
        ques = drpdwnlstques.SelectedItem.Text.ToString();
        string str =
            "UPDATE Staff_Table SET Name='" + txtfullname.Text + "',PName='" + txtparentname.Text + "',Gender='" +
            rdbtnlstgender.SelectedItem.Text + "',DOB='" + txtdob.Text + "',MobNo='" + txtmobileno.Text + 
            "',EmailAdd='" + txtemailadd.Text + "',Address='" + txtadd.Text + "',SecQues='" + ques +
            "',SecAns='" + txtsecans.Text + "'";

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
            lblmsg.Text = "Record Updated";
        }
        else
        {
            pnlmsg.CssClass = "error";
            imgalert.ImageUrl = "~/Images/alert red.png";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Invalid ID, Try Again";
        }
    }
    protected void btnaddqual_Click(object sender, EventArgs e)
    {
        string str = "INSERT INTO Qualification_Table(sf_id,Degree,Branch,ColOrUni,Batch,PerOfMarks,OutOff) VALUES('" +
                     txtstdid.Text + "','" + drpdwnlstdegree.SelectedItem.Text + "','" + txtbranch.Text + "','" +
                     txtclgoruni.Text + "'," + Convert.ToInt16(drpdwnlstbatch.SelectedItem.Text) + "," +
                     Convert.ToInt16(txtpermarks.Text) + "," + Convert.ToInt16(txtoutoff.Text) + ")";

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
        
        grdviewqual.DataBind();
    }
    protected void imgbtnrefresh_Click(object sender, ImageClickEventArgs e)
    {
        grdviewqual.DataBind();
    }
    protected void btnremove_Click(object sender, EventArgs e)
    {
        int id;
        for (int i = 0; i < grdviewqual.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)grdviewqual.Rows[i].FindControl("chkselect");
            if (chk.Checked)
            {
                id = Convert.ToInt16(grdviewqual.Rows[i].Cells[0].Text);
                string str = "DELETE FROM Qualification_Table WHERE Q_ID=" + id;
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
                
            }
        }
        grdviewqual.DataBind();
    }
}
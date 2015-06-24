using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin : System.Web.UI.Page
{
    private ClsConnection obj = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["Role"]) == "Admin")
        {
            Page.Title = "Admin Section";
            if(!Page.IsPostBack)
            {
                grdviewnews.Attributes.Add("style", "word-break:break-all;word-wrap:break-word");
                grdviewfeedback.Attributes.Add("style", "word-break:break-all;word-wrap:break-word");

                drpdwnlststudorstafforadmin.Items.Add("Student");
                drpdwnlststudorstafforadmin.Items.Add("Staff");
                drpdwnlststudorstafforadmin.Items.Add("Admin");

                drpdwnlstrole4.Items.Add("Student");
                drpdwnlstrole4.Items.Add("Staff");
                drpdwnlstrole4.Items.Add("Admin");

                lblid2.Visible = false;
                txtid2.Visible = false;
                lblname2.Visible = false;
                txtname2.Visible = false;
                lblparentname.Visible = false;
                txtparentname.Visible = false;
                lbldob.Visible = false;
                txtdob.Visible = false;
                lblmobno.Visible = false;
                txtmobno.Visible = false;
                lblemailadd.Visible = false;
                txtemailadd.Visible = false;
                lbladd.Visible = false;
                txtadd.Visible = false;
                btnhide.Visible = false;
                pnldt.Visible = false;

                lblmsg0.Visible = false;
                pnlmsg0.Visible = false;
                imgalert0.Visible = false;
                lblmsg0.Text = "";

                lblmsg1.Visible = false;
                pnlmsg1.Visible = false;
                imgalert1.Visible = false;
                lblmsg1.Text = "";

                lblmsg2.Visible = false;
                pnlmsg2.Visible = false;
                imgalert2.Visible = false;
                lblmsg2.Text = "";

                lblmsg4.Visible = false;
                pnlmsg4.Visible = false;
                imgalert4.Visible = false;
                lblmsg4.Text = "";

                rdbtnlstgenderf.Items.Add("Male");
                rdbtnlstgenderf.Items.Add("Female");

                drpdwnlstsecquesf.Items.Add("What is your favourite pets name?");
                drpdwnlstsecquesf.Items.Add("What is the name of your best friend?");
                drpdwnlstsecquesf.Items.Add("What is the name of your 1st teacher?");
                drpdwnlstsecquesf.Items.Add("What is your first phone no.?");
                drpdwnlstsecquesf.Items.Add("What is your vehicle registration no.?");
                drpdwnlstsecquesf.Items.Add("What is your favourite colour?");
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        if (txtid.Text == "")
        {
            lblmsg0.Visible = true;
            pnlmsg0.Visible = true;
            imgalert0.Visible = true;
            pnlmsg0.CssClass = "error";
            imgalert0.ImageUrl = "~/Images/alert red.png";
            lblmsg0.ForeColor = System.Drawing.Color.Red;
            lblmsg0.Text = "Please Enter The ID.";
        }
        else
        {
            lblmsg0.Visible = false;
            pnlmsg0.Visible = false;
            imgalert0.Visible = false;
            lblmsg0.Text = "";
            if (drpdwnlststudorstafforadmin.SelectedItem.Text == "Admin")
            {
                lblmsg0.Visible = true;
                pnlmsg0.Visible = true;
                imgalert0.Visible = true;
                pnlmsg0.CssClass = "error";
                imgalert0.ImageUrl = "~/Images/alert red.png";
                lblmsg0.ForeColor = System.Drawing.Color.Red;
                lblmsg0.Text = "Can'nt show admin details.";
            }
            else
            {
                SqlCommand cmd = new SqlCommand();
                DataSet ds = new DataSet();
                if (drpdwnlststudorstafforadmin.SelectedItem.Text == "Student")
                {
                    cmd =
                        new SqlCommand(
                            "SELECT S_ID, Name, PName, DOB, MobNo, EmailAdd, Address FROM Student_Table WHERE S_ID='" +
                            txtid.Text + "'");
                    ds = obj.retdata(cmd);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        lblid2.Visible = true;
                        txtid2.Visible = true;
                        lblname2.Visible = true;
                        txtname2.Visible = true;
                        lblparentname.Visible = true;
                        txtparentname.Visible = true;
                        lbldob.Visible = true;
                        txtdob.Visible = true;
                        lblmobno.Visible = true;
                        txtmobno.Visible = true;
                        lblemailadd.Visible = true;
                        txtemailadd.Visible = true;
                        lbladd.Visible = true;
                        txtadd.Visible = true;
                        btnhide.Visible = true;
                        pnldt.Visible = true;

                        txtid2.Text = ds.Tables[0].Rows[0]["S_ID"].ToString();
                        txtname2.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                        txtparentname.Text = ds.Tables[0].Rows[0]["PName"].ToString();
                        txtdob.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                        txtmobno.Text = ds.Tables[0].Rows[0]["MobNo"].ToString();
                        txtemailadd.Text = ds.Tables[0].Rows[0]["EmailAdd"].ToString();
                        txtadd.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    }
                    else
                    {
                        lblid2.Visible = false;
                        txtid2.Visible = false;
                        lblname2.Visible = false;
                        txtname2.Visible = false;
                        lblparentname.Visible = false;
                        txtparentname.Visible = false;
                        lbldob.Visible = false;
                        txtdob.Visible = false;
                        lblmobno.Visible = false;
                        txtmobno.Visible = false;
                        lblemailadd.Visible = false;
                        txtemailadd.Visible = false;
                        lbladd.Visible = false;
                        txtadd.Visible = false;
                        btnhide.Visible = false;
                        pnldt.Visible = false;

                        txtid2.Text = "";
                        txtname2.Text = "";
                        txtparentname.Text = "";
                        txtdob.Text = "";
                        txtmobno.Text = "";
                        txtemailadd.Text = "";
                        txtadd.Text = "";

                        lblmsg0.Visible = true;
                        pnlmsg0.Visible = true;
                        imgalert0.Visible = true;
                        pnlmsg0.CssClass = "error";
                        imgalert0.ImageUrl = "~/Images/alert red.png";
                        lblmsg0.ForeColor = System.Drawing.Color.Red;
                        lblmsg0.Text = "Invalid ID, Try Again.";
                    }
                }
                else
                {
                    cmd =
                        new SqlCommand(
                            "SELECT SF_ID, Name, PName, DOB, MobNo, EmailAdd, Address FROM Staff_Table WHERE SF_ID='" +
                            txtid.Text + "'");
                    ds = obj.retdata(cmd);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        lblid2.Visible = true;
                        txtid2.Visible = true;
                        lblname2.Visible = true;
                        txtname2.Visible = true;
                        lblparentname.Visible = true;
                        txtparentname.Visible = true;
                        lbldob.Visible = true;
                        txtdob.Visible = true;
                        lblmobno.Visible = true;
                        txtmobno.Visible = true;
                        lblemailadd.Visible = true;
                        txtemailadd.Visible = true;
                        lbladd.Visible = true;
                        txtadd.Visible = true;
                        btnhide.Visible = true;
                        pnldt.Visible = true;

                        txtid2.Text = ds.Tables[0].Rows[0]["SF_ID"].ToString();
                        txtname2.Text = ds.Tables[0].Rows[0]["Name"].ToString();
                        txtparentname.Text = ds.Tables[0].Rows[0]["PName"].ToString();
                        txtdob.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                        txtmobno.Text = ds.Tables[0].Rows[0]["MobNo"].ToString();
                        txtemailadd.Text = ds.Tables[0].Rows[0]["EmailAdd"].ToString();
                        txtadd.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                    }
                    else
                    {
                        lblid2.Visible = false;
                        txtid2.Visible = false;
                        lblname2.Visible = false;
                        txtname2.Visible = false;
                        lblparentname.Visible = false;
                        txtparentname.Visible = false;
                        lbldob.Visible = false;
                        txtdob.Visible = false;
                        lblmobno.Visible = false;
                        txtmobno.Visible = false;
                        lblemailadd.Visible = false;
                        txtemailadd.Visible = false;
                        lbladd.Visible = false;
                        txtadd.Visible = false;
                        btnhide.Visible = false;
                        pnldt.Visible = false;

                        txtid2.Text = "";
                        txtname2.Text = "";
                        txtparentname.Text = "";
                        txtdob.Text = "";
                        txtmobno.Text = "";
                        txtemailadd.Text = "";
                        txtadd.Text = "";

                        lblmsg0.Visible = true;
                        pnlmsg0.Visible = true;
                        imgalert0.Visible = true;
                        pnlmsg0.CssClass = "error";
                        imgalert0.ImageUrl = "~/Images/alert red.png";
                        lblmsg0.ForeColor = System.Drawing.Color.Red;
                        lblmsg0.Text = "Invalid ID, Try Again";
                    }
                }
            }
        } 
    }

    protected void btnhide_Click(object sender, EventArgs e)
    {
        lblid2.Visible = false;
        txtid2.Visible = false;
        lblname2.Visible = false;
        txtname2.Visible = false;
        lblparentname.Visible = false;
        txtparentname.Visible = false;
        lbldob.Visible = false;
        txtdob.Visible = false;
        lblmobno.Visible = false;
        txtmobno.Visible = false;
        lblemailadd.Visible = false;
        txtemailadd.Visible = false;
        lbladd.Visible = false;
        txtadd.Visible = false;
        btnhide.Visible = false;
        pnldt.Visible = false;

        lblmsg0.Visible = false;
        pnlmsg0.Visible = false;
        imgalert0.Visible = false;
        lblmsg0.Text = "";
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(4000);
        SqlCommand cmd=new SqlCommand();
        bool idexist = false;
        DataSet ds =new DataSet();
        string str;

        if (drpdwnlststudorstafforadmin.SelectedItem.Text == "Student")
        {
            cmd = new SqlCommand("SELECT S_ID FROM Student_Table");
            ds = obj.retdata(cmd);

            for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
            {
                if (txtid.Text == ds.Tables[0].Rows[i]["S_ID"].ToString())
                {
                    idexist = true;
                }
            }
            str = "INSERT INTO Student_Table(S_ID,Name,Password) VALUES('" + txtid.Text + "','" + txtname.Text +
                         "','" + txttmppass.Text + "')";
        }
        else if (drpdwnlststudorstafforadmin.SelectedItem.Text == "Staff")
        {
            cmd = new SqlCommand("SELECT SF_ID FROM Staff_Table");
            ds = obj.retdata(cmd);

            for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
            {
                if (txtid.Text == ds.Tables[0].Rows[i]["SF_ID"].ToString())
                {
                    idexist = true;
                }
            }
            str = "INSERT INTO Staff_Table(SF_ID,Name,Password) VALUES('" + txtid.Text + "','" + txtname.Text +
                         "','" + txttmppass.Text + "')";
        }
        else
        {
            cmd = new SqlCommand("SELECT A_ID FROM Admin_Table");
            ds = obj.retdata(cmd);

            for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
            {
                if (txtid.Text == ds.Tables[0].Rows[i]["A_ID"].ToString())
                {
                    idexist = true;
                }
            }
            str = "INSERT INTO Admin_Table(A_ID,Name,Password) VALUES('" + txtid.Text + "','" + txtname.Text +
                         "','" + txttmppass.Text + "')";
        }

        lblmsg0.Visible = true;
        pnlmsg0.Visible = true;
        imgalert0.Visible = true;

        if (idexist != true)
        {
            int x;
            try
            {
                x = obj.ExecuteQueries(str);
            }
            catch (Exception ex)
            {
                pnlmsg0.CssClass = "error";
                imgalert0.ImageUrl = "~/Images/alert red.png";
                lblmsg0.ForeColor = System.Drawing.Color.Red;
                lblmsg0.Text = ex.Message.ToString();
                return;
            }
            
            if (x > 0)
            {
                pnlmsg0.CssClass = "correct";
                imgalert0.ImageUrl = "~/Images/alert green.png";
                lblmsg0.ForeColor = System.Drawing.Color.DarkGreen;
                lblmsg0.Text = "Data Inserted Successfully.";
            }
        }
        else
        {
            pnlmsg0.CssClass = "error";
            imgalert0.ImageUrl = "~/Images/alert red.png";
            lblmsg0.ForeColor = System.Drawing.Color.Red;
            lblmsg0.Text = "ID already in use.";
        }
    }
    protected void btnsubmit3_Click(object sender, EventArgs e)
    {
        string aid = Convert.ToString(Session["ID"]);
        string str =
            "UPDATE Admin_Table SET Password='" + txtnewpass.Text + "' WHERE A_ID='" + aid + "'";

        int x;
        lblmsg4.Visible = true;
        pnlmsg4.Visible = true;
        imgalert4.Visible = true;

        try
        {
            x = obj.ExecuteQueries(str);
        }
        catch (Exception ex)
        {
            pnlmsg4.CssClass = "error";
            imgalert4.ImageUrl = "~/Images/alert red.png";
            lblmsg4.ForeColor = System.Drawing.Color.Red;
            lblmsg4.Text = ex.Message.ToString();
            return;
        }
        
        if (x > 0)
        {
            pnlmsg4.CssClass = "correct";
            imgalert4.ImageUrl = "~/Images/alert green.png";
            lblmsg4.ForeColor = System.Drawing.Color.DarkGreen;
            lblmsg4.Text = "Password Changed Successfully";
        }
        else
        {
            pnlmsg4.CssClass = "error";
            imgalert4.ImageUrl = "~/Images/alert red.png";
            lblmsg4.ForeColor = System.Drawing.Color.Red;
            lblmsg4.Text = "Invalid ID, Try Again";
        }
    }
    protected void btnsubmit2_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(4000);
        string str = "INSERT INTO NewsFeed_Table(NewsFeed) VALUES('" + txtnewsupdate.Text + "')";

        int x;
        lblmsg2.Visible = true;
        pnlmsg2.Visible = true;
        imgalert2.Visible = true;

        try
        {
            x = obj.ExecuteQueries(str);
        }
        catch (Exception ex)
        {
            pnlmsg2.CssClass = "error";
            imgalert2.ImageUrl = "~/Images/alert red.png";
            lblmsg2.ForeColor = System.Drawing.Color.Red;
            lblmsg2.Text = ex.Message.ToString();
            return;
        }
        
        if (x > 0)
        {
            pnlmsg2.CssClass = "correct";
            imgalert2.ImageUrl = "~/Images/alert green.png";
            lblmsg2.ForeColor = System.Drawing.Color.DarkGreen;
            lblmsg2.Text = "News Updated Successfully";
        }
        else
        {
            pnlmsg2.CssClass = "error";
            imgalert2.ImageUrl = "~/Images/alert red.png";
            lblmsg2.ForeColor = System.Drawing.Color.Red;
            lblmsg2.Text = "Some Error Occours";
        }

        grdviewnews.DataBind();
    }
    protected void imgbtnrefresh_Click(object sender, ImageClickEventArgs e)
    {
        grdviewnews.DataBind();
    }

    protected void btnremove4_Click(object sender, EventArgs e)
    {
        string str = null;
        if (drpdwnlstrole4.SelectedItem.Text == "Student")
        {
            str = "DELETE FROM Student_Table WHERE S_ID='" + txtid4.Text + "'";
        }
        else if (drpdwnlstrole4.SelectedItem.Text == "Staff")
        {
            str = "DELETE FROM Staff_Table WHERE SF_ID='" + txtid4.Text + "'";
        }
        else
        {
            str = "DELETE FROM Admin_Table WHERE A_ID='" + txtid4.Text + "'";
        }

        int x;
        lblmsg1.Visible = true;
        pnlmsg1.Visible = true;
        imgalert1.Visible = true;

        try
        {
            x = obj.ExecuteQueries(str);
        }
        catch (Exception ex)
        {
            pnlmsg1.CssClass = "error";
            imgalert1.ImageUrl = "~/Images/alert red.png";
            lblmsg1.ForeColor = System.Drawing.Color.Red;
            lblmsg1.Text = ex.Message.ToString();
            return;
        }
        
        if (x > 0)
        {
            pnlmsg1.CssClass = "correct";
            imgalert1.ImageUrl = "~/Images/alert green.png";
            lblmsg1.ForeColor = System.Drawing.Color.DarkGreen;
            lblmsg1.Text = "User Removed Successfully";
        }
        else
        {
            pnlmsg1.CssClass = "error";
            imgalert1.ImageUrl = "~/Images/alert red.png";
            lblmsg1.ForeColor = System.Drawing.Color.Red;
            lblmsg1.Text = "Invalid ID, Try Again";
        }
    }
    protected void btncheckname4_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(4000);
        if(txtname4.Text=="")
        {
            pnlmsg1.CssClass = "error";
            imgalert1.ImageUrl = "~/Images/alert red.png";
            lblmsg1.ForeColor = System.Drawing.Color.Red;
            lblmsg1.Text = "Please enter ID first";
            txtname4.Text = "";   
        }
        else
        {
            ClsConnection obj=new ClsConnection();
            SqlCommand cmd=new SqlCommand();
            DataSet ds=new DataSet();

            if (drpdwnlstrole4.SelectedItem.Text == "Student")
            {
                cmd = new SqlCommand("SELECT Name FROM Student_Table WHERE S_ID='" + txtid4.Text + "'");
            }
            else if (drpdwnlstrole4.SelectedItem.Text == "Staff")
            {
                cmd = new SqlCommand("SELECT Name FROM Staff_Table WHERE SF_ID='" + txtid4.Text + "'");
            }
            else
            {
                cmd = new SqlCommand("SELECT Name FROM Admin_Table WHERE A_ID='" + txtid4.Text + "'");
            }

            ds = obj.retdata(cmd);
            if (ds.Tables[0].Rows.Count > 0)
            {
                txtname4.Text = ds.Tables[0].Rows[0][0].ToString();
            }
            else
            {
                pnlmsg1.CssClass = "error";
                imgalert1.ImageUrl = "~/Images/alert red.png";
                lblmsg1.ForeColor = System.Drawing.Color.Red;
                lblmsg1.Text = "Invalid ID, Try Again";
                txtname4.Text = "";
            }
        }
    }
    protected void imgbtnrefresh5_Click(object sender, ImageClickEventArgs e)
    {
        grdviewfeedback.DataBind();
    }
    protected void btndelete5_Click(object sender, EventArgs e)
    {
        int id;
        for (int i = 0; i < grdviewfeedback.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox) grdviewfeedback.Rows[i].FindControl("chkselect");
            if(chk.Checked)
            {
                id = Convert.ToInt16(grdviewfeedback.Rows[i].Cells[0].Text);
                string str = "DELETE FROM FeedBack_Table WHERE F_ID=" + id;
                int x = obj.ExecuteQueries(str);
            }
        }
        grdviewfeedback.DataBind();
    }

    protected void btnremove2_Click(object sender, EventArgs e)
    {
        int id;
        for (int i = 0; i < grdviewnews.Rows.Count; i++)
        {
            CheckBox chk = (CheckBox)grdviewnews.Rows[i].FindControl("chkselect");
            if (chk.Checked)
            {
                id = Convert.ToInt16(grdviewnews.Rows[i].Cells[0].Text);
                string str = "DELETE FROM NewsFeed_Table WHERE N_ID=" + id;
                int x;
                lblmsg2.Visible = true;
                pnlmsg2.Visible = true;
                imgalert2.Visible = true;

                try
                {
                    x = obj.ExecuteQueries(str);
                }
                catch (Exception ex)
                {
                    pnlmsg2.CssClass = "error";
                    imgalert2.ImageUrl = "~/Images/alert red.png";
                    lblmsg2.ForeColor = System.Drawing.Color.Red;
                    lblmsg2.Text = ex.Message.ToString();
                    return;
                }
                
            }
        }
        grdviewnews.DataBind();
    }

    protected void btnsubmitf_Click(object sender, EventArgs e)
    {
        string ques = null;
        string id = Convert.ToString(Session["ID"]);
        int x;
        ques = drpdwnlstsecquesf.SelectedItem.Text.ToString();
        
        string str = "UPDATE Admin_Table SET Email='" + txtemailf.Text + "',Gender='" +
                     rdbtnlstgenderf.SelectedItem.Text + "',SecQues='" + ques + "',SecAns='" + txtsecansf.Text +
                     "' WHERE A_ID='" + id + "'";
        
        lblmsg4.Visible = true;
        pnlmsg4.Visible = true;
        imgalert4.Visible = true;

        try
        {
            x = obj.ExecuteQueries(str);
        }
        catch (Exception ex)
        {
            pnlmsg4.CssClass = "error";
            imgalert4.ImageUrl = "~/Images/alert red.png";
            lblmsg4.ForeColor = System.Drawing.Color.Red;
            lblmsg4.Text = ex.Message.ToString();
            return;
        }

        if (x > 0)
        {
            pnlmsg4.CssClass = "correct";
            imgalert4.ImageUrl = "~/Images/alert green.png";
            lblmsg4.ForeColor = System.Drawing.Color.DarkGreen;
            lblmsg4.Text = "Record Updated";
        }
        else
        {
            pnlmsg4.CssClass = "error";
            imgalert4.ImageUrl = "~/Images/alert red.png";
            lblmsg4.ForeColor = System.Drawing.Color.Red;
            lblmsg4.Text = "Invalid ID, Try Again";
        }
    }
}
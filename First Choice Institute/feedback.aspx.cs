using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Feedback";
        if(!Page.IsPostBack)
        {
            lblmsg.Visible = false;
            pnlmsg.Visible = false;
            imgalert.Visible = false;
            lblmsg.Text = "";
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(4000);
        ClsConnection obj=new ClsConnection();
        string str = "INSERT INTO FeedBack_Table(Name, Email, Subject, Comment) VALUES('" + txtname.Text + "','" +
                     txtemail.Text + "','" + txtsubject.Text + "','" + txtcomment.Text + "')";
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
            lblmsg.Text = "Thank you for your feedback";
        }
        else
        {
            pnlmsg.CssClass = "error";
            imgalert.ImageUrl = "~/Images/alert red.png";
            lblmsg.ForeColor = System.Drawing.Color.Red;
            lblmsg.Text = "Some Error Occurs";
        }
    }
}
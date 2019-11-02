using System;
using System.Net.Mail;

public partial class WebPages_Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object Sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {

               
                // get values from form 

                // stuff to format body
                

                // then call sendEmail
           

                txtName.Enabled = false;
                txtEmail.Enabled = false;
                txtComments.Enabled = false;
                txtSubject.Enabled = false;
                Button1.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            
            //Label1.ForeColor = System.Drawing.Color.Red;
            //Label1.Text = "There is an unkwon problem. Please try later";
        }

    }

}
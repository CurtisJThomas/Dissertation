using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Input;
using System.Windows.Forms;



public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (((UserClass)Session["User"]) != null)
        {
            Response.Redirect("LoggedInHome.aspx");
        }

    }


    protected void UmixMasterImage_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void HomeLogInButton_Click(object sender, EventArgs e)
    {
        MasterEmailAndUserNameValidationLabel.Text = "";
        MasterPasswordValidationLabel.Text = "";
        MasterUserDoesNotExistValidaionLabel.Text = "";

        if (MasterSignInEmailOrUserNameTextBox.Text.Trim().Length != 0 && MasterSignInPasswordTextBox.Text.Trim().Length == 0 )
        {
            MasterPasswordValidationLabel.Text = "Please enter a password";
        }
        else if (MasterSignInEmailOrUserNameTextBox.Text.Trim().Length == 0 && MasterSignInPasswordTextBox.Text.Trim().Length != 0)
        {
            MasterEmailAndUserNameValidationLabel.Text = "Please enter user name or email";
        }
        else
        {
            SignInClass signInClass = new SignInClass();
            signInClass.signIn(MasterSignInEmailOrUserNameTextBox.Text.Trim(), MasterSignInPasswordTextBox.Text.Trim());

            if (Session["Incorrect Email Or User Name"] != null)
            {
                MasterEmailAndUserNameValidationLabel.Text = Session["Incorrect Email Or User Name"].ToString();
            }

            if (Session["Incorrect Password"] != null)
            {
                MasterPasswordValidationLabel.Text = Session["Incorrect Password"].ToString();
            }

            if(Session["User Does Not Exist"] != null)
            {
                MasterUserDoesNotExistValidaionLabel.Text = Session["User Does Not Exist"].ToString();
            }
        }

        string pageName = this.ContentPlaceHolder1.Page.GetType().FullName;
        if (pageName.Equals("ASP.loginpage_aspx") && MasterSignInEmailOrUserNameTextBox.Text.Length == 0 && MasterSignInPasswordTextBox.Text.Length == 0)
        {
            MasterUserDoesNotExistValidaionLabel.Text = "Please enter details";
        }
        else if (MasterSignInEmailOrUserNameTextBox.Text.Trim().Length == 0 && MasterSignInPasswordTextBox.Text.Trim().Length == 0)
        {
            Response.Redirect("LogInPage.aspx");
        }

    }

}

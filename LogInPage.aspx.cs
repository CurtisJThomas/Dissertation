using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogInPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LogInPageButton_Click(object sender, EventArgs e)
    {
        SignInAllDetailsIncorrectValidaion.Text = "";
        LogInEmailOrUsernameIncorrectValidation.Text = "";
        LogInPasswordIncorrectValidation.Text = "";

        if (LogInPageUsernameOrEmailTB.Text.Trim().Length == 0 && LogInPagePasswordTB.Text.Trim().Length == 0)
        {
            //Change this label name
            SignInAllDetailsIncorrectValidaion.Text = "Please enter details";
        }
        if (LogInPageUsernameOrEmailTB.Text.Trim().Length == 0 && LogInPagePasswordTB.Text.Trim().Length != 0)
        {
            LogInEmailOrUsernameIncorrectValidation.Text = "Please enter a user name or email";
        }
        if (LogInPageUsernameOrEmailTB.Text.Trim().Length != 0 && LogInPagePasswordTB.Text.Trim().Length == 0)
        {
            LogInPasswordIncorrectValidation.Text = "Please enter a password";
        }
        else if (LogInPageUsernameOrEmailTB.Text.Trim().Length != 0 && LogInPagePasswordTB.Text.Trim().Length != 0)
        {
            SignInClass signInClass = new SignInClass();
            signInClass.signIn(LogInPageUsernameOrEmailTB.Text.Trim(), LogInPagePasswordTB.Text.Trim());
            if (Session["Incorrect Email Or User Name"] != null)
            {
                LogInEmailOrUsernameIncorrectValidation.Text = Session["Incorrect Email Or User Name"].ToString();
            }

            if (Session["Incorrect Password"] != null)
            {
                LogInPasswordIncorrectValidation.Text = Session["Incorrect Password"].ToString();
            }

            if (Session["User Does Not Exist"] != null)
            {
                //Change this label name
                SignInAllDetailsIncorrectValidaion.Text = Session["User Does Not Exist"].ToString();
            }
        }
       
    }
}
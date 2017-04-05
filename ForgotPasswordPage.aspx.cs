using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPasswordPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void forgotPasswordSubmitEmailButton_Click(object sender, EventArgs e)
    {
        forgotPasswordEnterEmailValidation.Text = "";
        forgotPasswordEnterEmailValidationTwo.Text = "";
        if (Page.IsValid && forgotPasswordEmailTB.Text.Length > 0)
        {
            ForgotPassword.sendForgotPasswordCode(forgotPasswordEmailTB.Text, forgotPasswordEnterEmailValidation, forgotPasswordEnterEmailValidationTwo);
        }
        if (forgotPasswordEmailTB.Text.Length < 1)
        {
        }
    }
}
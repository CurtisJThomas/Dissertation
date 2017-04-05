using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPasswordEnterCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (enterCodeDiv.Visible == true)
        {
            enterNewPasswordDiv.Visible = false;
        }

    }

    protected void forgotPasswordCodeButton_Click(object sender, EventArgs e)
    {
       string email = Request.QueryString["email"];
        enterCodeValidation.Text = "";
        if (forgotPasswordCodeTB.Text.All(char.IsDigit) && forgotPasswordCodeTB.Text.Length > 0)
        {
            ForgotPassword.enterChangePasswordCode(email, forgotPasswordCodeTB.Text, enterCodeDiv, enterCodeValidation);
        }
        else {
            if (!forgotPasswordCodeTB.Text.All(char.IsDigit) && forgotPasswordCodeTB.Text.Length > 0)
            {
                enterCodeValidation.Text = "Incorrect format";
            }
            else
            {
                enterCodeValidation.Text = "Please enter your code";
            }
        }


        if (enterCodeDiv.Visible == true)
        {
            enterNewPasswordDiv.Visible = false;
        }
        else
        {
            enterNewPasswordDiv.Visible = true;
        }

    }

    protected void SubmitNewPasswordButton_Click(object sender, EventArgs e)
    {
        string email = Request.QueryString["email"];
        enterNewPasswordValidation.Text = "";
        if (EnterNewPasswordTBOne.Text.Equals(EnterNewPasswordTBTwo.Text))
        {
            if(EnterNewPasswordTBTwo.Text.Any(char.IsUpper) && EnterNewPasswordTBTwo.Text.Any(char.IsLower) && EnterNewPasswordTBTwo.Text.Any(char.IsDigit) && EnterNewPasswordTBTwo.Text.Length > 6)
            {
                ForgotPassword.enterNewPassword(EncryptionClass.encryptText(EnterNewPasswordTBTwo.Text), email);
            }
            else
            {
                //not a correct password
                enterNewPasswordValidation.Text = "Password must be 6 characters long and include at least one upper case character and number ";
            }
        }
        else
        {
            //passwords do not match validation
            enterNewPasswordValidation.Text = "The passwords do not match";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class RegisterPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       

    }

    protected void RegisterButton_Click(object sender, EventArgs e)
    {
        Session["Email Exists"] = null;
        Session["User Name Exists"] = null;
        UserNameRegisteredValidation.Text = "";
        EmailRegisteredValidation.Text = "";
        registerPasswordValidator.Text = "";


        if (Session["User Name Exists"] == null && Session["Email Exists"] == null)
        {

            if (Page.IsValid && RegisterPasswordTB.Text.Any(char.IsUpper) && RegisterPasswordTB.Text.Any(char.IsLower) && RegisterPasswordTB.Text.Any(char.IsDigit) && RegisterPasswordTB.Text.Length > 6)
            {
                RegisterClass register = new RegisterClass();
                register.insertUser(RegisterUserNameTB.Text, RegisterFirstNameTB.Text.Trim(), RegisterLastNameTB.Text.Trim(), RegisterEmailTB.Text.Trim(), RegisterPasswordTB.Text.Trim(), RegisterMobileNumberTB.Text.Trim());

                if (Session["User Name Exists"] != null)
                {
                    UserNameRegisteredValidation.Text = Session["User Name Exists"].ToString();
                }

                if (Session["Email Exists"] != null)
                {
                    EmailRegisteredValidation.Text = Session["Email Exists"].ToString();
                }
            }
            else
            {
                registerPasswordValidator.Text = " Password must be 6 characters long and include at least one upper case <br> <br> character and number ";
            }
        }
    }
}
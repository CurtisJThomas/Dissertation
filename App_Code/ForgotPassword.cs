using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Web.UI.WebControls;
using System.Collections;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for ForgotPassword
/// </summary>
public class ForgotPassword
{
    public ForgotPassword()
    {

      
    }

    public static void sendForgotPasswordCode(string email,Label validation,  Label validationTwo)
    {
        validationTwo.Text = "";
        UsersTableAdapters.Users_TableTableAdapter userTable = new UsersTableAdapters.Users_TableTableAdapter();
        Users.Users_TableDataTable userData = userTable.GetData();
        foreach (DataRow row in userData.Rows)
        {

            if (email == System.Convert.ToString(row["Email"]))
            {
                Random rand = new Random();
                List<String> codeArray = new List<String>();
                codeArray.Add(rand.Next(0, 9).ToString());
                codeArray.Add(rand.Next(0, 9).ToString());
                codeArray.Add(rand.Next(0, 9).ToString());
                codeArray.Add(rand.Next(0, 9).ToString());
                codeArray.Add(rand.Next(0, 9).ToString());
                codeArray.Add(rand.Next(0, 9).ToString());
                codeArray.Add(rand.Next(0, 9).ToString());
                codeArray.Add(rand.Next(0, 9).ToString());
               string finalCode = string.Join("", codeArray);
                try
                {
                    var client = new SmtpClient("smtp.gmail.com", 587)
                    {
                        Credentials = new NetworkCredential("umixteam@gmail.com", "s1u2b3w4f5c#"),
                        EnableSsl = true
                    };
                    Users.Users_TableDataTable nameData = userTable.SelectAName(email);
                    client.Send("umixteam@gmail.com", email.ToLower(), "Umix forgot password", "Hello " + nameData.Rows[0]["FirstName"] +
                  ", the following email contains the code you can use to reset your password.\n\nCODE: \n\n" + finalCode + "\n\nplease Naviagte to http://localhost:49282/ForgotPasswordEnterCode.aspx?email=" + email +
                  " to reset your password \nregards, the Umix team");

                }
                catch
                {
                }
                validation.Text = "We have sent your code and a link to " + email + ", follow the link and enter the<br><br>code to reset your password";
                userTable.AddForgotPasswordCode(EncryptionClass.encryptText(finalCode), email.ToLower());
                validationTwo.Text = "";
                break;
            }
            else
            {
                
                validationTwo.Text = "The email you have provided does not match with any registered user of Umix, please try again";
                
            }
        }
    }


    public static void enterChangePasswordCode(string email, string code, HtmlGenericControl enterCodeDiv, Label enterCodeValidation)
    {
        UsersTableAdapters.Users_TableTableAdapter userTable = new UsersTableAdapters.Users_TableTableAdapter();
        Users.Users_TableDataTable userData = userTable.GetData();
        foreach (DataRow row in userData.Rows)
        {
            if (email == System.Convert.ToString(row["Email"]) && EncryptionClass.encryptText(code) == System.Convert.ToString(row["ForgotPasswordCode"]))
            {
                enterCodeDiv.Visible = false;
                break;

            }
            else
            {
                enterCodeValidation.Text = "The code you have entered is incorrect, please try again";
            }

        }
    }

    public static void enterNewPassword(string password, string email)
    {
        UsersTableAdapters.Users_TableTableAdapter userTable = new UsersTableAdapters.Users_TableTableAdapter();
        userTable.UpdatePassword(password, email);
        HttpContext.Current.Response.Redirect("LogInPage.aspx");
    }

}
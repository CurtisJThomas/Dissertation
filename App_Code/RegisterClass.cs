using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Data;
using System.IO;

/// <summary>
/// Summary description for RegisterClass
/// </summary>
public class RegisterClass
{
    public RegisterClass()
    {
 
    }


    public void insertUser(string userName, string firstName, string lastName, string email, string password, string mobileNumber)
    {
        UsersTableAdapters.Users_TableTableAdapter userTable = new UsersTableAdapters.Users_TableTableAdapter();
        Users.Users_TableDataTable userData = userTable.GetData();
        foreach (DataRow row in userData.Rows)
        {
            if (userName == System.Convert.ToString(row["UserName"]))
            {
                HttpContext.Current.Session["User Name Exists"] = "User name already exists";
            } 

            if (email == System.Convert.ToString(row["Email"]))
            {
                HttpContext.Current.Session["Email Exists"] = "Email belongs to an existing account ";
            }
        }


            if (HttpContext.Current.Session["User Name Exists"] == null && HttpContext.Current.Session["Email Exists"] == null)
            {
            UsersTableAdapters.Users_TableTableAdapter userTableInsert = new UsersTableAdapters.Users_TableTableAdapter();
                userTableInsert.InsertQuery(userName, firstName, lastName, email.ToLower(), EncryptionClass.encryptText(password), EncryptionClass.encryptText(mobileNumber), "/images/DefaultProfileImage.jpg", "Default", "");
                registerComplete(firstName, email);
                EditProfileTableAdapters.EditProfileTableAdapter insertInfo = new EditProfileTableAdapters.EditProfileTableAdapter();
                insertInfo.editProfileQuery(email.ToLower());
                SignInClass signIn = new SignInClass();
                signIn.signIn(userName, password);
        }
        
             
    }

    public void registerComplete(string firstName, string email)
    {
            try
            {
                var client = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new NetworkCredential("umixteam@gmail.com", "s1u2b3w4f5c#"),
                    EnableSsl = true
                };
                client.Send("umixteam@gmail.com", email.ToLower(), "Umix registration", "Hello " + firstName +
                ", you have successfully registered for Umix. You can now log in and get sharing! \n\n Once you’re online you will be " +
               "able to: \n\n • Search for friends \n • View updates \n • Add content to profile \n • Post updates  \n • Create custom feeds from 'My account' \nRegards, The Umix Team. ");
            }
            catch
            {

            }
        }
}
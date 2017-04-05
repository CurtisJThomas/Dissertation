using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SignInClass
/// </summary>
public class SignInClass
{
    public SignInClass()
    {
    }

    public void signIn(string userNameOrEmail, string password)
    {
        HttpContext.Current.Session["Incorrect Password"] = null;
        HttpContext.Current.Session["Incorrect Email Or User Name"] = null;
        HttpContext.Current.Session["User Does Not Exist"] = null;

        UsersTableAdapters.Users_TableTableAdapter userTable = new UsersTableAdapters.Users_TableTableAdapter();
        Users.Users_TableDataTable userData = userTable.GetData();
        foreach (DataRow row in userData.Rows)
        {

            if ((userNameOrEmail == System.Convert.ToString(row["Email"]) || userNameOrEmail == System.Convert.ToString(row["UserName"])))
            {
              if (EncryptionClass.encryptText(password) == System.Convert.ToString(row["Password"]))
                {
                    HttpContext.Current.Session["User"] = new UserClass(row);
                    if ("Admin" == System.Convert.ToString(row["Roles"]))
                    {
                       HttpContext.Current.Response.Redirect("Admin/AdminPage.aspx");

                    }
                    else
                    {
                        HttpContext.Current.Response.Redirect("LoggedInHome.aspx");
                    }
                }
                else
                {
                        HttpContext.Current.Session["Incorrect Password"] = "Password is incorrect";
                        HttpContext.Current.Session["User Does Not Exist"] = null;
                        break;
                }
            }
            else
            {
                HttpContext.Current.Session["User Does Not Exist"] = "This user does not exist";
            }
            
        }
    }

}
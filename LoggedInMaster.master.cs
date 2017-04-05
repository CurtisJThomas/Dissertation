using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoggedInMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Session["User"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            if (((UserClass)Session["User"]).role == "Admin")
            {
                backToAdminLink.Visible = true;
            }
            else
            {
                backToAdminLink.Visible = false;
            }
            userNameLabel.Text = ((UserClass)Session["User"]).userName;
        }
    }

    protected void UmixMasterImageLoggedIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoggedInHome.aspx");
    }

    protected void LogOut_Click(object sender, EventArgs e)
    {
        SignOutClass signOutClass = new SignOutClass();
        signOutClass.signOut();
        Response.Redirect("Default.aspx");
    }

    protected void Home_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoggedInHome.aspx");
    }

    protected void Profile_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserProfile.aspx");
    }

    protected void Chat_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChatPage.aspx");
    }


    protected void searchIcon_Click(object sender, ImageClickEventArgs e)
    {

        //Session["Search"] = searchTB.Text.ToString();
        //Response.Redirect("SearchPage.aspx");
        string[] split = searchTB.Text.ToString().Split(' ');

        Session["SearchFirstWord"] = split[0];
        Session["SearchSecondWord"] = " ";

        if (split.Length > 1)

        {

            Session["SearchSecondWord"] = split[1];

        }
        Response.Redirect("SearchPage.aspx");
    }
}

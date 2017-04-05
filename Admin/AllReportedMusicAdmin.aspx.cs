using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AllReportedMusicAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void deleteMusicAdminAllReportedButton_Click(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        AdminControls.deleteMusic(b1.CommandArgument.ToString());
        adminViewAllReportedMusicListView.DataBind();
    }

    protected void viewProfileMusicAdminAllReportedButton_Click(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        Session["ProfileID"] = b1.CommandArgument.ToString();
        Response.Redirect("../OtherUsersProfile.aspx");
    }
}
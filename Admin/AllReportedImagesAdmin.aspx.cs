using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AllReportedImagesAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void deleteImagesAdminAllReportedButton_Click(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        AdminControls.deleteImage(b1.CommandArgument.ToString());
        adminViewAllReportedImageListView.DataBind();
    }

    protected void viewProfileImagesAdminAllReportedButton_Click(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        Session["ProfileID"] = b1.CommandArgument.ToString();
        Response.Redirect("../OtherUsersProfile.aspx");
    }
}
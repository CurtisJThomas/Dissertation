using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OtherUsersProfile : System.Web.UI.Page
{    

    protected void Page_Load(object sender, EventArgs e)
    {
        addFriendButton.Visible = true;
        cancelRequest.Visible = false;
        acceptRequestButtonProfile.Visible = false;
        viewDetailsDiv.Visible = false;
        hideDetails.Visible = false;
        if (Session["User"] != null)
        {
            addFriendButton.CommandArgument = Session["ProfileID"].ToString();
            otherUserDropDownOptions.Visible = false;
            FriendClass.displayOptions(addFriendButton, cancelRequest, acceptRequestButtonProfile, otherUserDropDownOptions, Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(Session["ProfileID"]));
            otherUserImageUploadsListView.Visible = false;
            otherUserVideoUploadsListView.Visible = false;
            otherUserMusicUploadsListView.Visible = false;
            OtherUserAllFriendsSQL.SelectParameters.Add("?", (Session["ProfileID"].ToString()));
            OtherUserMusicDataSource.SelectParameters.Add("?", (Session["ProfileID"].ToString()));
            OtherUserVideosDataSource.SelectParameters.Add("?", (Session["ProfileID"].ToString()));
        }

    }

    protected void OtherUserDetailsListView_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label userName = (Label)e.Item.FindControl("OtherUserNameLabel");
        Session["OtherUserProfile"] = userName.Text.ToString();
    }


    protected void OtherUserStatusListView_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
       Label otherUserStatusName = (Label)e.Item.FindControl("OtherUserStatusName");
        otherUserStatusName.Text = Session["OtherUserProfile"].ToString();
    }

      protected void OtherUserPhotoListView_ItemDataBound(object sender, ListViewItemEventArgs e)
     {
        Label otherUserImageName = (Label)e.Item.FindControl("OtherUserPhotoName");
        otherUserImageName.Text = Session["OtherUserProfile"].ToString();
    }


    protected void OtherUserVideoListView_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label otherUserVideoName = (Label)e.Item.FindControl("UserNameLabel");
        otherUserVideoName.Text = Session["OtherUserProfile"].ToString();
    }

    protected void OtherUserMusicListView_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label otherUserMusicName = (Label)e.Item.FindControl("UserName_Label");
        otherUserMusicName.Text = Session["OtherUserProfile"].ToString();
    }


    protected void OtherUserStatusFeedButton_Click(object sender, EventArgs e)
    {
        otherUserImageUploadsListView.Visible = false;
        otherUserStatusUploadsListView.Visible = true;
        otherUserVideoUploadsListView.Visible = false;
        otherUserMusicUploadsListView.Visible = false;
    }

    protected void OtherUserImagesFeedButton_Click(object sender, EventArgs e)
    {
        otherUserImageUploadsListView.Visible = true;
        otherUserStatusUploadsListView.Visible = false;
        otherUserVideoUploadsListView.Visible = false;
        otherUserMusicUploadsListView.Visible = false;
    }

    protected void OtherUserVideosFeedButton_Click(object sender, EventArgs e)
    {
        otherUserImageUploadsListView.Visible = false;
        otherUserStatusUploadsListView.Visible = false;
        otherUserVideoUploadsListView.Visible = true;
        otherUserMusicUploadsListView.Visible = false;
    }

    protected void OtherUserMusicFeedButton_Click(object sender, EventArgs e)
    {
        otherUserImageUploadsListView.Visible = false;
        otherUserStatusUploadsListView.Visible = false;
        otherUserVideoUploadsListView.Visible = false;
        otherUserMusicUploadsListView.Visible = true;
    }

    protected void AddFriend_OnClick(object sender, EventArgs e)
    {
        FriendClass.insertFriend(Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(addFriendButton.CommandArgument.ToString()));
        Response.Redirect("OtherUsersProfile.aspx");
    }

    protected void AcceptRequest_OnClick(object sender, EventArgs e)
    {
        FriendClass.acceptRequestProfile(Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(Session["ProfileID"]));
        Response.Redirect("OtherUsersProfile.aspx");
    }


    protected void CancelRequest_OnClick(object sender, EventArgs e)
    {
        FriendClass.removeFriend(Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(Session["ProfileID"]));
        Response.Redirect("OtherUsersProfile.aspx");
    }

    protected void BlockUser_OnClick(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        FriendClass.blockUser(Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(b1.CommandArgument.ToString()));
        Response.Redirect("OtherUsersProfile.aspx");
    }

    protected void otherUserDropDownOptions_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (otherUserDropDownOptions.SelectedValue == "Block User")
        {
            FriendClass.blockUser(Convert.ToInt32(((UserClass)Session["User"]).ID),Convert.ToInt32(Session["ProfileID"].ToString()));
            Response.Redirect("LoggedInHome.aspx");
        }
        if (otherUserDropDownOptions.SelectedValue == "Remove User")
        {
            FriendClass.removeFriend(Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(Session["ProfileID"]));
        }
        Response.Redirect("OtherUsersProfile.aspx");
    }

    protected void viewAllOtherFriendsProfileButton_OnClick(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        Session["ProfileID"] = b1.CommandArgument.ToString();
        if (Session["ProfileID"].ToString() == ((UserClass)Session["User"]).ID){
            Response.Redirect("UserProfile.aspx");
        }
        else
        {
            Response.Redirect("OtherUsersProfile.aspx");
        }

    }

    protected void OtherUserProfileReportStatusButton_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b1 = (ImageButton)sender;
        DeleteOrReportStatus.reportStatus(Convert.ToInt32(b1.CommandArgument.ToString()));
        foreach (ListViewItem item in otherUserStatusUploadsListView.Items)
        {
            Label mylabel = (Label)item.FindControl("OtherUserProfileReportStatusLabel");
            if (mylabel.ToolTip.ToString() == b1.CommandArgument.ToString())
            {
                mylabel.Visible = true;
            }
        }
    }

    protected void OtherUserProfileReportImageButton_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b1 = (ImageButton)sender;
        DeleteOrReportImage.reportImage(Convert.ToInt32(b1.CommandArgument.ToString()));
        foreach (ListViewItem item in otherUserImageUploadsListView.Items)
        {
            Label mylabel = (Label)item.FindControl("OtherUserProfileReportImageLabel");
            if (mylabel.ToolTip.ToString() == b1.CommandArgument.ToString())
            {
                mylabel.Visible = true;
            }
        }
    }

    protected void OtherUserReportVideoButton_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b1 = (ImageButton)sender;
        DeleteOrReportVideo.reportVideo(Convert.ToInt32(b1.CommandArgument.ToString()));
        foreach (ListViewItem item in otherUserVideoUploadsListView.Items)
        {
            Label mylabel = (Label)item.FindControl("OtherUserReportVideoLabel");
            if (mylabel.ToolTip.ToString() == b1.CommandArgument.ToString())
            {
                mylabel.Visible = true;
            }
        }
    }

    protected void OtherUserProfileReportMusicButton_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b1 = (ImageButton)sender;
        DeleteOrReportMusic.reportMusic(Convert.ToInt32(b1.CommandArgument.ToString()));
        foreach (ListViewItem item in otherUserMusicUploadsListView.Items)
        {
            Label mylabel = (Label)item.FindControl("OtherUserProfileReportMusicButtonLabel");
            if (mylabel.ToolTip.ToString() == b1.CommandArgument.ToString())
            {
                mylabel.Visible = true;
            }
        }
    }

    protected void viewDetailsButtom_Click(object sender, EventArgs e)
    {
        viewDetailsDiv.Visible = true;
        viewDetailsButtom.Visible = false;
        hideDetails.Visible = true;
    }

    protected void hideDetails_Click(object sender, EventArgs e)
    {
        viewDetailsDiv.Visible = false;
        viewDetailsButtom.Visible = true;
        hideDetails.Visible = false;
    }
}

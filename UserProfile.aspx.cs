using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserProfile : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        System.Globalization.CultureInfo.CurrentCulture.ClearCachedData();

        if (((UserClass)Session["User"]) != null)
        {
            ProfilePicture.ImageUrl = ((UserClass)Session["User"]).profilePic;
            ProfileUserNameLabel.Text = ((UserClass)Session["User"]).userName;
            ProfileFullNameLabel.Text = ((UserClass)Session["User"]).firstName + " " + ((UserClass)Session["User"]).lastName;
            StatusProfileSQL.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            AllFriendsSQL.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            AllBlockedUsers.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            PhotoProfileSQL.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            MusicProfileDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            videosProfileDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            myCustomFeedsDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            editProfileDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());


            StatusListView.DataBind();
            PhotoListView.DataBind();

        }
        else
        {
            Response.Redirect("LogInPage.aspx");
        }

        if (!IsPostBack)
        {
            EditProfileDiv.Visible = false;
            CancelEditButton.Visible = false;
            fileUploadProfileButton.Visible = false;
            imageOrMusicOrVideoUploadProfileDescription.Visible = false;
            PhotoListView.Visible = false;
            videoProfileFeed.Visible = false;
            musicProfileFeed.Visible = false;
            uploadTypeLabel.Visible = false;
        }
        panelDangerImage.Visible = false;
        panelDangerProfilePic.Visible = false;
        customFeedValidation.Visible = false;


        foreach (ListViewItem item in editProfileListView.Items)
        {

        }
    }

    protected void SubmitProfileChanges_Click(object sender, EventArgs e)
    {
        FileUpload profilePic = UploadNewProfilePicture;
        if (profilePic.FileName.Contains(".jpg") || profilePic.FileName.Contains(".png") && profilePic.HasFile)
        {
            UpdateProfile.updateProfilePicture(Int32.Parse(((UserClass)Session["User"]).ID), "ProfilePictures/" + ((UserClass)Session["User"]).userName + "/" + UploadNewProfilePicture.FileName);
            UpdateProfile.saveProfileImage(profilePic);
            Response.Redirect("UserProfile.aspx");
            panelDangerProfilePic.Visible = false;
        }
        else if (!profilePic.HasFile)
        {
            UploadNewProfilePictureValidation.Text = "Please select an image";
            panelDangerProfilePic.Visible = true;
        }
        else
        {
            UploadNewProfilePictureValidation.Text = "Image type must be .jpg or .png";
            panelDangerProfilePic.Visible = true;
        }
    }

    protected void EditProfileButton_Click(object sender, EventArgs e)
    {
        EditProfileDiv.Visible = true;
        CancelEditButton.Visible = true;
        EditProfileButton.Visible = false;
    }

    protected void CancelEditButton_Click(object sender, EventArgs e)
    {
        EditProfileDiv.Visible = false;
        CancelEditButton.Visible = false;
        EditProfileButton.Visible = true;
    }


    protected void SubmitStatusOrImageOrMusicOrVideoProfile_Click(object sender, EventArgs e)
    {
        panelDangerImage.Visible = false;
        if (StatusTextBoxProfile.Text.Length > 0)
        {
            var britishTimeZone = TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time");
            var newTimeDate = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, britishTimeZone);
            InsertStatus.uploadStatus(Int32.Parse(((UserClass)Session["User"]).ID), StatusTextBoxProfile.Text, newTimeDate.ToString());
            StatusListView.DataBind();
            fileUploadProfileButton.Visible = false;
            imageOrMusicOrVideoUploadProfileDescription.Visible = false;
            PhotoListView.Visible = false;
            StatusListView.Visible = true;
            videoProfileFeed.Visible = false;
            musicProfileFeed.Visible = false;
            StatusTextBoxProfile.Visible = true;
        }

        if (StatusTextBoxProfile.Visible == true && StatusTextBoxProfile.Text.Length < 1)
        {
            profileValidationLabel.Text = "Update appears to be blank";
            panelDangerImage.Visible = true;
        }
        StatusTextBoxProfile.Text = "";
        if (imageOrMusicOrVideoUploadProfile.HasFile)
        {
            int fileFound = 0;
            if (uploadTypeLabel.Text.Contains("picture") && imageOrMusicOrVideoUploadProfile.FileName.Contains(".jpg") || imageOrMusicOrVideoUploadProfile.FileName.Contains(".png"))
            {
                var britishTimeZone = TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time");
                var newTimeDate = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, britishTimeZone);
                InsertImage.uploadImage(Int32.Parse(((UserClass)Session["User"]).ID), imageOrMusicOrVideoUploadProfile.FileName, newTimeDate.ToString(), imageOrMusicOrVideoUploadProfileDescription.Text);
                PhotoListView.DataBind();
                FileUpload imageSave = imageOrMusicOrVideoUploadProfile;
                InsertImage.saveImage(imageSave);
                imageOrMusicOrVideoUploadProfileDescription.Text = "";
                fileUploadProfileButton.Visible = true;
                imageOrMusicOrVideoUploadProfileDescription.Visible = true;
                PhotoListView.Visible = true;
                StatusListView.Visible = false;
                videoProfileFeed.Visible = false;
                musicProfileFeed.Visible = false;
                StatusTextBoxProfile.Visible = false;
                uploadTypeLabel.Text = "Upload a picture";
                fileFound++;
            }

            string[] videoFormats = { "MP4", "3G2", "3GP", "3GPP",
            "ASF", "AVI", "WMV", "DAT", "DIVX", "DV",
            "F4V", "FLV", "MTS", "M2TS", "TS",
            "M4V", "MOV", "MKV", "MOD", "TOD",
            "MPE", "MPEG", "MPEG4", "MPG",
            "NSV", "OGM", "OGV", "QT", "VOB"};
            foreach (string videoFormat in videoFormats)
            {
                if (uploadTypeLabel.Text.Contains("video") && imageOrMusicOrVideoUploadProfile.HasFile && imageOrMusicOrVideoUploadProfile.FileName.Contains(videoFormat.ToLower()))
                {
                    var britishTimeZone = TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time");
                    var newTimeDate = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, britishTimeZone);
                    InsertVideo.uploadVideo(Int32.Parse(((UserClass)Session["User"]).ID), imageOrMusicOrVideoUploadProfile.FileName, newTimeDate.ToString(), imageOrMusicOrVideoUploadProfileDescription.Text);
                    InsertVideo.saveVideo(imageOrMusicOrVideoUploadProfile);
                    fileFound++;
                    StatusTextBoxProfile.Visible = false;
                    fileUploadProfileButton.Visible = true;
                    imageOrMusicOrVideoUploadProfileDescription.Visible = true;
                    PhotoListView.Visible = false;
                    StatusListView.Visible = false;
                    videoProfileFeed.Visible = true;
                    musicProfileFeed.Visible = false;
                    uploadTypeLabel.Text = "Upload a video";
                }
            }

            string[] musicFormats = { "MP3", "AVI", "MP4", "RMVB", "FLV", "MPG", "WMA", "WMV", "M4A" };
            foreach (string musicFormat in musicFormats)
            {
                if (uploadTypeLabel.Text.Contains("song") && imageOrMusicOrVideoUploadProfile.HasFile && imageOrMusicOrVideoUploadProfile.FileName.Contains(musicFormat.ToLower()))
                {
                    var britishTimeZone = TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time");
                    var newTimeDate = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, britishTimeZone);
                    InsertMusic.uploadMusic(Int32.Parse(((UserClass)Session["User"]).ID), imageOrMusicOrVideoUploadProfile.FileName.Replace(musicFormat.ToLower(), "mp3"), newTimeDate.ToString(), imageOrMusicOrVideoUploadProfileDescription.Text);
                    InsertMusic.saveMusic(imageOrMusicOrVideoUploadProfile, musicFormat.ToLower());
                    fileFound++;
                    StatusTextBoxProfile.Visible = false;
                    fileUploadProfileButton.Visible = true;
                    imageOrMusicOrVideoUploadProfileDescription.Visible = true;
                    PhotoListView.Visible = false;
                    StatusListView.Visible = false;
                    videoProfileFeed.Visible = false;
                    musicProfileFeed.Visible = true;
                    uploadTypeLabel.Text = "Upload a song";
                }
            }

            if (fileFound == 0)
            {
                profileValidationLabel.Text = "Sorry, we do not accept this file format";
                panelDangerImage.Visible = true;
            }

        }
        else if (imageOrMusicOrVideoUploadProfile.Visible == true)
        {
            profileValidationLabel.Text = "Please select a file to upload";
            panelDangerImage.Visible = true;
        }

    }


    protected void ImageUploadIconButton_Click(object sender, ImageClickEventArgs e)
    {
        fileUploadProfileButton.Visible = true;
        imageOrMusicOrVideoUploadProfileDescription.Visible = true;
        StatusTextBoxProfile.Visible = false;
        uploadTypeLabel.Text = "Upload a picture";
        uploadTypeLabel.Visible = true;

    }

    protected void StatusUploadIconButton_Click(object sender, EventArgs e)
    {
        fileUploadProfileButton.Visible = false;
        imageOrMusicOrVideoUploadProfileDescription.Visible = false;
        StatusTextBoxProfile.Visible = true;
        uploadTypeLabel.Visible = false;
        uploadTypeLabel.Text = "";
    }

    protected void VideoUploadIconButton_Click(object sender, ImageClickEventArgs e)
    {
        fileUploadProfileButton.Visible = true;
        imageOrMusicOrVideoUploadProfileDescription.Visible = true;
        StatusTextBoxProfile.Visible = false;
        uploadTypeLabel.Text = "Upload a video";
        uploadTypeLabel.Visible = true;
    }

    protected void MusicUploadIconButton_Click(object sender, ImageClickEventArgs e)
    {
        fileUploadProfileButton.Visible = true;
        imageOrMusicOrVideoUploadProfileDescription.Visible = true;
        StatusTextBoxProfile.Visible = false;
        uploadTypeLabel.Text = "Upload a song";
        uploadTypeLabel.Visible = true;
    }

    protected void ProfileStatusUpdateFeedButton_Click(object sender, EventArgs e)
    {
        PhotoListView.Visible = false;
        StatusListView.Visible = true;
        musicProfileFeed.Visible = false;
        videoProfileFeed.Visible = false;
    }

    protected void ProfileImagesUpdateFeedButton_Click(object sender, EventArgs e)
    {
        StatusListView.Visible = false;
        PhotoListView.Visible = true;
        musicProfileFeed.Visible = false;
        videoProfileFeed.Visible = false;
    }

    protected void ProfileVideosUpdateFeedButton_Click(object sender, EventArgs e)
    {
        StatusListView.Visible = false;
        PhotoListView.Visible = false;
        musicProfileFeed.Visible = false;
        videoProfileFeed.Visible = true;
    }

    protected void ProfileMusicUpdateFeedButton_Click(object sender, EventArgs e)
    {
        StatusListView.Visible = false;
        PhotoListView.Visible = false;
        musicProfileFeed.Visible = true;
        videoProfileFeed.Visible = false;
    }

    protected void StatusListView_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label statusName = (Label)e.Item.FindControl("StatusName");
        statusName.Text = ((UserClass)Session["User"]).userName;
        Image statusProfilePic = (Image)e.Item.FindControl("statusProfilePic");
        statusProfilePic.ImageUrl = ((UserClass)Session["User"]).profilePic;
    }

    protected void ProfileDeleteStatus_OnClick(object sender, EventArgs e)
    {
        LinkButton b1 = (LinkButton)sender;
        DeleteOrReportStatus.deleteStatus(Convert.ToInt32(b1.CommandArgument.ToString()));
        StatusListView.DataBind();
    }

    protected void PhotoListView_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label photoName = (Label)e.Item.FindControl("PhotoName");
        photoName.Text = ((UserClass)Session["User"]).userName;
        Image imageProfilePic = (Image)e.Item.FindControl("imageProfilePic");
        imageProfilePic.ImageUrl = ((UserClass)Session["User"]).profilePic;
    }

    protected void ProfileDeleteImage_OnClick(object sender, EventArgs e)
    {
        LinkButton b1 = (LinkButton)sender;
        DeleteOrReportImage.deleteImage(Convert.ToInt32(b1.CommandArgument.ToString()));
        PhotoListView.DataBind();
    }

    protected void viewAllFriendsProfileButton_OnClick(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        Session["ProfileID"] = b1.CommandArgument.ToString();
        Response.Redirect("OtherUsersProfile.aspx");
    }

    protected void UnblockUserButton_OnClick(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        FriendClass.unblockUser(Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(b1.CommandArgument.ToString()));
        BlockedUsersListView.DataBind();
    }

    protected void VideoListView_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label videoName = (Label)e.Item.FindControl("UserNameLabel");
        videoName.Text = ((UserClass)Session["User"]).userName;
        Image videoUploadProfPic = (Image)e.Item.FindControl("VideoProfilePicture");
        videoUploadProfPic.ImageUrl = ((UserClass)Session["User"]).profilePic;
    }


    protected void MusicListView_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Label musicName = (Label)e.Item.FindControl("UserName_Label");
        musicName.Text = ((UserClass)Session["User"]).userName;
        Image musicUploadProfPic = (Image)e.Item.FindControl("musicUploadProfPic");
        musicUploadProfPic.ImageUrl = ((UserClass)Session["User"]).profilePic;
    }


    protected void profileDeleteMusic_Click(object sender, EventArgs e)
    {
        LinkButton b1 = (LinkButton)sender;
        DeleteOrReportMusic.deleteMusic(Convert.ToInt32(b1.CommandArgument.ToString()));
        musicProfileFeed.DataBind();
    }

    protected void profileDeleteVideo_Click(object sender, EventArgs e)
    {
        LinkButton b1 = (LinkButton)sender;
        DeleteOrReportVideo.deleteVideo(Convert.ToInt32(b1.CommandArgument.ToString()));
        videoProfileFeed.DataBind();

    }

    protected void customFeedSubmitButton_Click(object sender, EventArgs e)
    {
        string statusValue;
        string imageValue;
        string videoValue;
        string musicValue;
        customFeedValidation.Visible = false;
        customFeedValidationLabel.Text = "";
        if (selectStatusRadio.Checked)
        {
            statusValue = "Yes";
        }
        else
        {
            statusValue = "No";
        }
        if (selectImageRadio.Checked)
        {
            imageValue = "Yes";
        }
        else
        {
            imageValue = "No";
        }
        if (selectVideoRadio.Checked)
        {
            videoValue = "Yes";
        }
        else
        {
            videoValue = "No";
        }
        if (selectMusicRadio.Checked)
        {
            musicValue = "Yes";
        }
        else
        {
            musicValue = "No";
        }
        if (customFeedNameTB.Text.Length > 0 && (statusValue == "Yes" || imageValue == "Yes" || videoValue == "Yes" || musicValue == "Yes"))
        {
            PreferancesClass.insertPreferance(statusValue, imageValue, videoValue, musicValue, customFeedNameTB.Text);
            myCustomFeedsListView.DataBind();
            ((UserClass)Session["User"]).addPreference(new PreferancesClass(statusValue, imageValue, videoValue, musicValue, customFeedNameTB.Text));
            customFeedNameTB.Text = "";
        }
        else
        {
            if (customFeedNameTB.Text.Length < 1)
            {
                customFeedValidation.Visible = true;
                customFeedValidationLabel.Text = "Please add a name for your custom feed";
            }
            else
            {
                customFeedValidation.Visible = true;
                customFeedValidationLabel.Text = "At least one content type must be selected ";
            }

        }
    }

    protected void deleteCustomFeedButton_Click(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        PreferancesClass.removePreferance(Convert.ToInt32(b1.CommandArgument.ToString()));
        myCustomFeedsListView.DataBind();
    }


    protected void editProfileListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            editProfileDataSource.UpdateCommand = editProfileDataSource.UpdateCommand.Replace("?", ((UserClass)Session["User"]).ID.ToString());
        }
    }

}

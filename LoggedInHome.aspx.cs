using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class css_LoggedInHome : System.Web.UI.Page
{

    List<GenericClass> temp;

    protected void Page_Load(object sender, EventArgs e)
    {

        System.Globalization.CultureInfo.CurrentCulture.ClearCachedData();
        if (!IsPostBack)
        {
            fileUploadHomeButton.Visible = false;
            imageOrMusicOrVideoUploadHomeDescription.Visible = false;
            photosListViewHome.Visible = false;
            videoHomeFeed.Visible = false;
            musicHomeFeed.Visible = false;
            uploadTypeLabel.Visible = false;
            if (Session["User"] != null)
            {
                foreach (PreferancesClass preference in ((UserClass)Session["User"]).preferancesArray)
                {
                    feedPreferenceDropDown.Items.Add(new ListItem(preference.feedName, ((UserClass)Session["User"]).preferancesArray.IndexOf(preference).ToString()));
                }
            }
        }
      

        panelDanger.Visible = false;
        if (Session["User"] != null)
        {
            notficationsUserFeed.SelectParameters.Add("@Friend", ((UserClass)Session["User"]).ID.ToString());
            photosHomeFeedSqlDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            statusHomeFeedSqlDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            photosHomeFeedSqlDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            statusHomeFeedSqlDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            videoHomeFeedDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            videoHomeFeedDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            musicHomeFeedDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
            musicHomeFeedDataSource.SelectParameters.Add("?", ((UserClass)Session["User"]).ID.ToString());
        }


    }

    protected void SubmitStatusOrVideoOrMusicOrImageHome_Click(object sender, EventArgs e)
    {
        panelDanger.Visible = false;
        if (StatusTextBoxHome.Text.Length > 0)
        {
            var britishTimeZone = TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time");
            var newTimeDate = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, britishTimeZone);
            InsertStatus.uploadStatus(Int32.Parse(((UserClass)Session["User"]).ID), StatusTextBoxHome.Text, newTimeDate.ToString());
            statusHomeFeed.DataBind();
            fileUploadHomeButton.Visible = false;
            imageOrMusicOrVideoUploadHomeDescription.Visible = false;
            StatusTextBoxHome.Visible = true;
            if (customListView.Visible == true)
            {
                customListView.Visible = true;
            }
            else
            {
                photosListViewHome.Visible = false;
                statusHomeFeed.Visible = true;
                videoHomeFeed.Visible = false;
                musicHomeFeed.Visible = false;
                customListView.Visible = false;
            }
        }

        if (StatusTextBoxHome.Visible == true && StatusTextBoxHome.Text.Length < 1)
        {
            loggedInHomeValidationLabel.Text = "Update appears to be blank";
            panelDanger.Visible = true;
        }

        StatusTextBoxHome.Text = "";

        if (imageOrMusicOrVideoUploadHome.HasFile) {
            int fileFound = 0;
            if (uploadTypeLabel.Text.Contains("picture") && imageOrMusicOrVideoUploadHome.FileName.Contains(".jpg") || imageOrMusicOrVideoUploadHome.FileName.Contains(".png"))
        {
            var britishTimeZone = TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time");
            var newTimeDate = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, britishTimeZone);
            InsertImage.uploadImage(Int32.Parse(((UserClass)Session["User"]).ID), imageOrMusicOrVideoUploadHome.FileName, newTimeDate.ToString(), imageOrMusicOrVideoUploadHomeDescription.Text);
            FileUpload imageSave = imageOrMusicOrVideoUploadHome;
            InsertImage.saveImage(imageSave);
            imageOrMusicOrVideoUploadHomeDescription.Text = "";
            photosListViewHome.DataBind();
            fileUploadHomeButton.Visible = true;
            imageOrMusicOrVideoUploadHomeDescription.Visible = true;
            StatusTextBoxHome.Visible = false;
            if(customListView.Visible == true)
             {
                    customListView.Visible = true;

             }
             else
             {
                    statusHomeFeed.Visible = false;
                    photosListViewHome.Visible = true;
                    videoHomeFeed.Visible = false;
                    musicHomeFeed.Visible = false;
                    customListView.Visible = false;
             }
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
              if (uploadTypeLabel.Text.Contains("video") && imageOrMusicOrVideoUploadHome.HasFile && imageOrMusicOrVideoUploadHome.FileName.Contains(videoFormat.ToLower()))
                 {
                    var britishTimeZone = TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time");
                    var newTimeDate = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, britishTimeZone);
                    InsertVideo.uploadVideo(Int32.Parse(((UserClass)Session["User"]).ID), imageOrMusicOrVideoUploadHome.FileName, newTimeDate.ToString(), imageOrMusicOrVideoUploadHomeDescription.Text);
                    InsertVideo.saveVideo(imageOrMusicOrVideoUploadHome);
                    videoHomeFeed.DataBind();
                    fileFound++;
                    fileUploadHomeButton.Visible = true;
                    imageOrMusicOrVideoUploadHomeDescription.Visible = true;
                    StatusTextBoxHome.Visible = false;
                    if(customListView.Visible == true)
                    {
                        customListView.Visible = true;
                    }
                    {
                        customListView.Visible = false;
                        photosListViewHome.Visible = false;
                        statusHomeFeed.Visible = false;
                        videoHomeFeed.Visible = true;
                        musicHomeFeed.Visible = false;
                    }
                    uploadTypeLabel.Text = "Upload a video";
                }
            }

       string[] musicFormats = { "MP3", "AVI", "MP4", "RMVB", "FLV", "MPG", "WMA", "WMV", "M4A" };

      foreach (string musicFormat in musicFormats)
           {
                if (uploadTypeLabel.Text.Contains("song") && imageOrMusicOrVideoUploadHome.HasFile && imageOrMusicOrVideoUploadHome.FileName.Contains(musicFormat.ToLower()))
                   {
                    var britishTimeZone = TimeZoneInfo.FindSystemTimeZoneById("GMT Standard Time");
                    var newTimeDate = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, britishTimeZone);
                    InsertMusic.uploadMusic(Int32.Parse(((UserClass)Session["User"]).ID), imageOrMusicOrVideoUploadHome.FileName.Replace(musicFormat.ToLower(), "mp3"), newTimeDate.ToString(), imageOrMusicOrVideoUploadHomeDescription.Text);
                      InsertMusic.saveMusic(imageOrMusicOrVideoUploadHome, musicFormat.ToLower());
                      musicHomeFeed.DataBind();
                      fileFound++;
                      fileUploadHomeButton.Visible = true;
                      imageOrMusicOrVideoUploadHomeDescription.Visible = true;
                      StatusTextBoxHome.Visible = false;
                    if(customListView.Visible == true)
                    {
                        customListView.Visible = true;
                    }
                    else
                    {
                        photosListViewHome.Visible = false;
                        statusHomeFeed.Visible = false;
                        videoHomeFeed.Visible = false;
                        musicHomeFeed.Visible = true;
                        customListView.Visible = false;
                    }
                      uploadTypeLabel.Text = "Upload a song";

                }
            }

            if (fileFound == 0)
            {
                loggedInHomeValidationLabel.Text = "Sorry, we do not accept this file format";
                panelDanger.Visible = true;
            }
        }
        else if (imageOrMusicOrVideoUploadHome.Visible == true)
        {
            loggedInHomeValidationLabel.Text = "Please select a file to upload";
            panelDanger.Visible = true;
        }
    }


    protected void ImageUploadIconButton_Click(object sender, ImageClickEventArgs e)
    {
        StatusTextBoxHome.Visible = false;
        fileUploadHomeButton.Visible = true;
        imageOrMusicOrVideoUploadHomeDescription.Visible = true;
        uploadTypeLabel.Visible = true;
        uploadTypeLabel.Text = "Upload a picture";
    }

    protected void StatusUploadIconButton_Click(object sender, ImageClickEventArgs e)
    {
        StatusTextBoxHome.Visible = true;
        fileUploadHomeButton.Visible = false;
        imageOrMusicOrVideoUploadHomeDescription.Visible = false;
        uploadTypeLabel.Visible = false;
        uploadTypeLabel.Text = "";
    }


    protected void VideoUploadIconButton_Click(object sender, ImageClickEventArgs e)
    {
        StatusTextBoxHome.Visible = false;
        fileUploadHomeButton.Visible = true;
        imageOrMusicOrVideoUploadHomeDescription.Visible = true;
        uploadTypeLabel.Visible = true;
        uploadTypeLabel.Text = "Upload a video";
    }

    protected void MusicUploadIconButton_Click(object sender, ImageClickEventArgs e)
    {
        StatusTextBoxHome.Visible = false;
        fileUploadHomeButton.Visible = true;
        imageOrMusicOrVideoUploadHomeDescription.Visible = true;
        uploadTypeLabel.Visible = true;
        uploadTypeLabel.Text = "Upload a song";
    }

    protected void AcceptFriendButton_OnClick(object sender, EventArgs e)
    {
        ImageButton b1 = (ImageButton)sender;
        FriendClass.acceptRequest(Convert.ToInt32(b1.CommandArgument.ToString()));
        notficationsListView.DataBind();
    }

    protected void DeclineFriendButton_OnClick(object sender, EventArgs e)
    {
        ImageButton b1 = (ImageButton)sender;
        FriendClass.declineRequest(Convert.ToInt32(b1.CommandArgument.ToString()));
        notficationsListView.DataBind();

    }

    protected void viewProfileButton_OnClick(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        Session["ProfileID"] = Convert.ToInt32(b1.CommandArgument.ToString());
        Response.Redirect("OtherUsersProfile.aspx");

    }

    protected void LoggedInHomeStatusFeedButton_Click(object sender, EventArgs e)
    {
        statusHomeFeed.Visible = true;
        photosListViewHome.Visible = false;
        videoHomeFeed.Visible = false;
        musicHomeFeed.Visible = false;
        customListView.Visible = false;
        feedPreferenceDropDown.SelectedIndex = 0;
    }


    protected void LoggedInHomeImagesFeedButton_Click(object sender, EventArgs e)
    {
        statusHomeFeed.Visible = false;
        photosListViewHome.Visible = true;
        videoHomeFeed.Visible = false;
        musicHomeFeed.Visible = false;
        customListView.Visible = false;
        feedPreferenceDropDown.SelectedIndex = 0;
    }

    protected void loggedInHomeVideoFeedButton_Click(object sender, EventArgs e)
    {
        statusHomeFeed.Visible = false;
        photosListViewHome.Visible = false;
        videoHomeFeed.Visible = true;
        musicHomeFeed.Visible = false;
        customListView.Visible = false;
        feedPreferenceDropDown.SelectedIndex = 0;

    }


    protected void loggedInHomeMusicFeedButton_Click(object sender, EventArgs e)
    {
        statusHomeFeed.Visible = false;
        photosListViewHome.Visible = false;
        videoHomeFeed.Visible = false;
        musicHomeFeed.Visible = true;
        customListView.Visible = false;
        feedPreferenceDropDown.SelectedIndex = 0;
    }


    protected void  LoggedInHomeDeleteStatus_OnClick(object sender, EventArgs e)
    {
        LinkButton b1 = (LinkButton)sender;
        DeleteOrReportStatus.deleteStatus(Convert.ToInt32(b1.CommandArgument.ToString()));
        statusHomeFeed.DataBind();
        customListView.Visible = true;
        deleteOutOfCustomFeed(Convert.ToInt32(b1.CommandArgument.ToString()));
        customListView.DataSource = ((List<GenericClass>)Session["temp"]);
        customListView.DataBind();
    }

    protected void LoggedInHomeDeleteImage_OnClick(object sender, EventArgs e)
    {
        LinkButton b1 = (LinkButton)sender;
        DeleteOrReportImage.deleteImage(Convert.ToInt32(b1.CommandArgument.ToString()));
        photosListViewHome.DataBind();
        customListView.Visible = true;
        deleteOutOfCustomFeed(Convert.ToInt32(b1.CommandArgument.ToString()));
        customListView.DataSource = ((List<GenericClass>)Session["temp"]);
        customListView.DataBind();
    }


    protected void LoggedInHomeReportImageButton_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b1 = (ImageButton)sender;
        DeleteOrReportImage.reportImage(Convert.ToInt32(b1.CommandArgument.ToString()));
        foreach (ListViewItem item in photosListViewHome.Items)
        {
            Label mylabel = (Label)item.FindControl("LoggedInHomeReportImageLabel");
            if (mylabel.ToolTip.ToString() == b1.CommandArgument.ToString())
            {
                mylabel.Visible = true;
            }
        }

    }

    protected void LoggedInHomeReportStatusButton_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b1 = (ImageButton)sender;
        DeleteOrReportStatus.reportStatus(Convert.ToInt32(b1.CommandArgument.ToString()));
        foreach (ListViewItem item in statusHomeFeed.Items)
        {
            Label mylabel = (Label)item.FindControl("LoggedInHomeReportStatusLabel");
            if (mylabel.ToolTip.ToString() == b1.CommandArgument.ToString())
            {
                mylabel.Visible = true;
            }
           
        }
    }


    protected void LoggedInHomeReportMusicButton_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b1 = (ImageButton)sender;
        DeleteOrReportMusic.reportMusic(Convert.ToInt32(b1.CommandArgument.ToString()));
        foreach (ListViewItem item in musicHomeFeed.Items)
        {
            Label mylabel = (Label)item.FindControl("LoggedInHomeReportMusicLabel");
            if (mylabel.ToolTip.ToString() == b1.CommandArgument.ToString())
            {
                mylabel.Visible = true;
            }
        }
    }

    protected void homeDeleteMusic_Click(object sender, EventArgs e)
    {
        LinkButton b1 = (LinkButton)sender;
        DeleteOrReportMusic.deleteMusic(Convert.ToInt32(b1.CommandArgument.ToString()));
        musicHomeFeed.DataBind();
        customListView.Visible = true;
        deleteOutOfCustomFeed(Convert.ToInt32(b1.CommandArgument.ToString()));
        customListView.DataSource = ((List<GenericClass>)Session["temp"]);
        customListView.DataBind();
    }

    protected void LoggedInHomeReportVideoButton_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton b1 = (ImageButton)sender;
        DeleteOrReportVideo.reportVideo(Convert.ToInt32(b1.CommandArgument.ToString()));
        foreach (ListViewItem item in videoHomeFeed.Items)
        {
            Label mylabel = (Label)item.FindControl("LoggedInHomeReportVideoLabel");
            if (mylabel.ToolTip.ToString() == b1.CommandArgument.ToString())
            {
                mylabel.Visible = true;
            }
        }
    }

    protected void homeDeleteVideo_Click(object sender, EventArgs e)
    {
        LinkButton b1 = (LinkButton)sender;
        DeleteOrReportVideo.deleteVideo(Convert.ToInt32(b1.CommandArgument.ToString()));
        videoHomeFeed.DataBind();
        customListView.Visible = true;
        deleteOutOfCustomFeed(Convert.ToInt32(b1.CommandArgument.ToString()));
        customListView.DataSource = ((List<GenericClass>)Session["temp"]);
        customListView.DataBind(); ;
    }

    protected void deleteOutOfCustomFeed(int id_delete)
    {
        GenericClass g_temp = null;
        List<GenericClass> temp = ((List<GenericClass>)Session["temp"]);
        if (temp != null)
        {
            foreach (GenericClass gClass in temp)
            {
                if (gClass.id == id_delete.ToString())
                {
                    // found  
                    g_temp = gClass;
                }
            }
            if (g_temp != null)
            {
                // delete
                temp.Remove(g_temp);
            }
        }
    }

    protected List<GenericClass> createPreferenceFeed(PreferancesClass preference)
    {
        List<GenericClass> listViewArray = new List<GenericClass>();
        if (preference.status == "Yes")
        {
            StatusTableAdapters.Status_sTableAdapter statusCustomFeed = new StatusTableAdapters.Status_sTableAdapter();
            Status._Status_sDataTable getStatusCustomFeed = statusCustomFeed.GetStatusCustomData(Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(((UserClass)Session["User"]).ID));
            foreach (DataRow row in getStatusCustomFeed.Rows)
            {
                listViewArray.Add(new GenericClass(row["Status"].ToString(), row["User Name"].ToString(), row["User ID"].ToString(), row["Profile Picture"].ToString(), "STATUS", row["Time-Stamp"].ToString(), row["ID"].ToString()));
            }
        }
        if (preference.image == "Yes")
        {
            PhotoTableAdapters.PhotosTableAdapter imageCustomFeed = new PhotoTableAdapters.PhotosTableAdapter();
            Photo.PhotosDataTable getImageCustomFeed = imageCustomFeed.GetPhotosCustomFeedData(Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(((UserClass)Session["User"]).ID));
            foreach (DataRow row in getImageCustomFeed.Rows)
            {
                listViewArray.Add(new GenericClass(row["Photo"].ToString(), row["User Name"].ToString(), row["User ID"].ToString(), row["Profile Picture"].ToString(), "PHOTOS", row["Time-Stamp"].ToString(), row["ID"].ToString(), row["Description"].ToString()));
            }
        }
        if (preference.video == "Yes")
        {
            VideoTableAdapters.Video_sTableAdapter videoCustomFeed = new VideoTableAdapters.Video_sTableAdapter();
            Video._Video_sDataTable getVideoCustomFeed = videoCustomFeed.GetVidoesCustomFeedData(Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(((UserClass)Session["User"]).ID));
            foreach (DataRow row in getVideoCustomFeed.Rows)
            {
                listViewArray.Add(new GenericClass(row["Video"].ToString(), row["User Name"].ToString(), row["User ID1"].ToString(), row["Profile Picture"].ToString(), "VIDEO", row["Time-Stamp"].ToString(), row["ID"].ToString(), row["Description"].ToString()));
            }
        }
        if (preference.music == "Yes")
        {
            MusicTableAdapters.MusicTableAdapter musicCustomFeed = new MusicTableAdapters.MusicTableAdapter();
            Music.MusicDataTable getMusicCustomFeed = musicCustomFeed.GetMusicCustomFeedData(Convert.ToInt32(((UserClass)Session["User"]).ID), Convert.ToInt32(((UserClass)Session["User"]).ID));
            foreach (DataRow row in getMusicCustomFeed.Rows)
            {
                listViewArray.Add(new GenericClass(row["Song"].ToString(),row["User Name"].ToString(), row["User ID1"].ToString(), row["Profile Picture"].ToString(),"MUSIC", row["Time-Stamp"].ToString(), row["ID"].ToString(), row["Description"].ToString()));
            }
        }
        listViewArray.Sort(new DataRowCompare());
        Session["temp"] = listViewArray;
        return listViewArray;
    }


    protected void feedPreferenceDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        PreferancesClass pref = ((UserClass)Session["User"]).preferancesArray[Int32.Parse(feedPreferenceDropDown.SelectedValue)];
        customListView.DataSource = createPreferenceFeed(pref);
        photosListViewHome.Visible = false;
        statusHomeFeed.Visible = false;
        videoHomeFeed.Visible = false;
        musicHomeFeed.Visible = false;
        customListView.Visible = true;
        customListView.DataBind();
    }

}
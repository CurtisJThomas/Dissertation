using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PreferancesClass
/// </summary>
public class PreferancesClass
{
    public string status { get; set; }
    public string image { get; set; }
    public string video { get; set; }
    public string music { get; set; }
    public string feedName { get; set; }


    public PreferancesClass(string status, string image, string video, string music, string feedName)
    {
        this.status = status;
        this.image = image;
        this.video = video;
        this.music = music;
        this.feedName = feedName;
    }

    public static void insertPreferance(string statusValue, string imageValue, string videoValue, string musicValue, string name)
    {
        PreferancesTableAdapters.CustomFeedsTableAdapter customFeed = new PreferancesTableAdapters.CustomFeedsTableAdapter();
        customFeed.Insert(Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID), statusValue, imageValue, videoValue, musicValue, name);
    }

    public static void removePreferance(int ID)
    {
        PreferancesTableAdapters.CustomFeedsTableAdapter deleteFeed = new PreferancesTableAdapters.CustomFeedsTableAdapter();
        deleteFeed.DeleteCustomFeed(ID);
    }
}
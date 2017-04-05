using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for InsertVideo
/// </summary>
public class InsertVideo
{
    public InsertVideo()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void uploadVideo(int userID, string video, string timeStamp, string description)
    {
        int nullFound = 0;
        int formatFound = 0;
        string[] videoFormats = { "MP4", "3G2", "3GP", "3GPP",
        "ASF", "AVI", "WMV", "DAT", "DIVX", "DV",
        "F4V", "FLV", "MTS", "M2TS", "TS",
        "M4V", "MOV", "MKV", "MOD", "TOD",
        "MPE", "MPEG", "MPEG4", "MPG",
        "NSV", "OGM", "OGV", "QT", "VOB"};
        foreach (string videoFormat in videoFormats)
        {
            if (video != null)
            {
                if (video.Contains(videoFormat.ToLower()))
                {
                    VideoTableAdapters.Video_sTableAdapter videoInsert = new VideoTableAdapters.Video_sTableAdapter();
                    videoInsert.Insert(userID, video, timeStamp, description, "False", "False");
                    formatFound++;
                    break;
                }
            }
            else
            {
                nullFound++;
            }
        }

        if (nullFound > 0)
        {
            Debug.WriteLine("video is null");
        }

        if (formatFound > 0)
        {
            Debug.WriteLine("video uploaded to database");
        }
        else
        {
            Debug.WriteLine("incorrect video type");
        }
    }

    public static void saveVideo(FileUpload video)
    {
        string subPath = HttpContext.Current.Server.MapPath("/VideoUploads/" + ((UserClass)HttpContext.Current.Session["User"]).userName + "/");
        if (!Directory.Exists(subPath))
        {
            Directory.CreateDirectory(subPath);
        }
        video.SaveAs(subPath + video.FileName);
        Debug.WriteLine("video saved into direcotry");
    }
}
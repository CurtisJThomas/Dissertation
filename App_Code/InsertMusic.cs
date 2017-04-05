using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for InsertMusic
/// </summary>
public class InsertMusic
{
    public InsertMusic()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void uploadMusic(int userID, string music, string timeStamp, string description)
    {
       int  formatFound = 0;
        int nullFound = 0;
        string[] musicFormats = { "MP3", "AVI", "MP4", "RMVB", "FLV", "MPG", "WMA", "WMV", "M4A" };

        foreach (string musicFormat in musicFormats)
        {
            if (music != null)
            {
                if (music.Contains(musicFormat.ToLower()))
                {
                    MusicTableAdapters.MusicTableAdapter musicInsert = new MusicTableAdapters.MusicTableAdapter();
                    musicInsert.Insert(userID, music, timeStamp, description, "False", "False");
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
            Debug.WriteLine("music is null");
        }

        if (formatFound > 0)
        {
            Debug.WriteLine("song uploaded to database");
        }
        else
        {
            Debug.WriteLine("incorrect song type");
        }
    }

    public static void saveMusic(FileUpload music, string musicFormat)
    {
        string subPath = HttpContext.Current.Server.MapPath("/MusicUploads/" + ((UserClass)HttpContext.Current.Session["User"]).userName + "/");
        if (!Directory.Exists(subPath))
        {
            Directory.CreateDirectory(subPath);
        }
        music.SaveAs(subPath + music.FileName.Replace(musicFormat, "mp3"));
        Debug.WriteLine("music saved");

    }
}
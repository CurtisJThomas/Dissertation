using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for UnitTests
/// </summary>
/// 
public class UnitTests
{
    public UnitTests()
    {
        testStatusUpload();
        testReportAndDeleteStatusUpload();
        testImageUpload();
        testReportAndDeleteImageUpload();
        testVideoUpload();
        testReportAndDeleteVideoUpload();
        testSongUpload();
        testReportAndDeleteSongUpload();
    }

    public void testStatusUpload()
    {
        InsertStatus.uploadStatus(Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID), null, "dd / MM / yyyy H: mm:ss");
        InsertStatus.uploadStatus(Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID),"test status", "dd / MM / yyyy H: mm:ss");
    }

    public void testReportAndDeleteStatusUpload()
    {
        DeleteOrReportStatus.reportStatus(196);
        DeleteOrReportStatus.deleteStatus(196);
    }

    public void testImageUpload()
    {
        InsertImage.uploadImage((Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID)),null, "dd / MM / yyyy H: mm:ss","description");
        InsertImage.uploadImage((Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID)), "image.txt", "dd / MM / yyyy H: mm:ss", "description");
        InsertImage.uploadImage((Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID)), "image.jpg", "dd / MM / yyyy H: mm:ss", "description");
        Image image = new Image();
    }

    public void testReportAndDeleteImageUpload()
    {
        DeleteOrReportImage.reportImage(71);
        DeleteOrReportImage.deleteImage(71);
    }

    public void testVideoUpload()
    {
        InsertVideo.uploadVideo((Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID)), null, "dd / MM / yyyy H: mm:ss", "description");
        InsertVideo.uploadVideo((Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID)), "video.txt", "dd / MM / yyyy H: mm:ss", "description");
        InsertVideo.uploadVideo((Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID)), "video.mp4", "dd / MM / yyyy H: mm:ss", "description");
    }

    public void testReportAndDeleteVideoUpload()
    {
        DeleteOrReportVideo.reportVideo(10);
        DeleteOrReportVideo.deleteVideo(10);
    }

    public void testSongUpload()
    {
        InsertMusic.uploadMusic((Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID)), null, "dd / MM / yyyy H: mm:ss", "description");
        InsertMusic.uploadMusic((Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID)), "song.txt", "dd / MM / yyyy H: mm:ss", "description");
        InsertMusic.uploadMusic((Convert.ToInt32(((UserClass)HttpContext.Current.Session["User"]).ID)), "song.mp3", "dd / MM / yyyy H: mm:ss", "description");
    }

    public void testReportAndDeleteSongUpload()
    {
        DeleteOrReportMusic.reportMusic(11);
        DeleteOrReportMusic.deleteMusic(11);
    }
}
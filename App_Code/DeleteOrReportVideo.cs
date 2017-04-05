using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DeleteOrReportVideo
/// </summary>
public class DeleteOrReportVideo
{
    public DeleteOrReportVideo()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void deleteVideo(int ID)
    {
        VideoTableAdapters.Video_sTableAdapter videoDelete = new VideoTableAdapters.Video_sTableAdapter();
        videoDelete.UpdateQuery(ID);
        Debug.WriteLine("video deleted");

    }

    public static void reportVideo(int ID)
    {
        VideoTableAdapters.Video_sTableAdapter reportVideo = new VideoTableAdapters.Video_sTableAdapter();
        reportVideo.ReportVideoQuery(ID);
        Debug.WriteLine("video reported");

    }
}
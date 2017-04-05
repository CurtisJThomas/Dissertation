using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DeleteOrReportMusic
/// </summary>
public class DeleteOrReportMusic
{
    public DeleteOrReportMusic()
    {

    }

    public static void deleteMusic(int ID)
    {
        MusicTableAdapters.MusicTableAdapter deleteMusic = new MusicTableAdapters.MusicTableAdapter();
        deleteMusic.UpdateQuery(ID);
        Debug.WriteLine("song deleted");

    }

    public static void reportMusic(int ID)
    {
        MusicTableAdapters.MusicTableAdapter reportMusic = new MusicTableAdapters.MusicTableAdapter();
        reportMusic.ReportMusicQuery(ID);
        Debug.WriteLine("song reported");

    }
}
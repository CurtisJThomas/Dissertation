using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminControls
/// </summary>
public class AdminControls
{
    public AdminControls()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void promoteUser(string ID)
    {
        UsersTableAdapters.Users_TableTableAdapter usersTable = new UsersTableAdapters.Users_TableTableAdapter();
        usersTable.PromoteToAdmin(Convert.ToInt32(ID));
    }

    public static void demoteUser(string ID)
    {
        UsersTableAdapters.Users_TableTableAdapter usersTable = new UsersTableAdapters.Users_TableTableAdapter();
        usersTable.DemoteAdmin(Convert.ToInt32(ID));
    }

    public static void deleteUser(string ID)
    {
        UsersTableAdapters.Users_TableTableAdapter usersTable = new UsersTableAdapters.Users_TableTableAdapter();
        usersTable.DeleteQuery(Convert.ToInt32(ID));
    }

    public static void deleteStatus(string ID)
    {
        StatusTableAdapters.Status_sTableAdapter deleteStatus = new StatusTableAdapters.Status_sTableAdapter();
        deleteStatus.Delete(Convert.ToInt32(ID));
    }

    public static void deleteImage(string ID)
    {
        PhotoTableAdapters.PhotosTableAdapter deletePhoto = new PhotoTableAdapters.PhotosTableAdapter();
        deletePhoto.Delete(Convert.ToInt32(ID));
    }

    public static void deleteVideo(string ID)
    {
        VideoTableAdapters.Video_sTableAdapter deleteVideo = new VideoTableAdapters.Video_sTableAdapter();
        deleteVideo.Delete(Convert.ToInt32(ID));
    }

    public static void deleteMusic(string ID)
    {
        MusicTableAdapters.MusicTableAdapter deleteMusic = new MusicTableAdapters.MusicTableAdapter();
        deleteMusic.Delete(Convert.ToInt32(ID));
    }
}
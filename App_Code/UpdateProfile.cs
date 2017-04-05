using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;



/// <summary>
/// Summary description for Update
/// </summary>
public class UpdateProfile
{
    public UpdateProfile()
    {

    }

    public static void updateProfilePicture(int ID, string photo)
    {
        if (photo.Contains(".jpg") || photo.Contains(".png") && photo != null)
        {
            UsersTableAdapters.Users_TableTableAdapter userTable = new UsersTableAdapters.Users_TableTableAdapter();
            userTable.UpdateProfilePic(photo, ID);
            Console.Write("profile pic uploaded to database");
        }
        else if (photo == null)
        {
            Console.Write("please upload a prof pic");
        }
        else
        {
            Console.Write("incorrect image type (profPic)");

        }
    }
         

    public static void saveProfileImage(FileUpload profilePic)
    {
        string subPath = HttpContext.Current.Server.MapPath("/ProfilePictures/" + ((UserClass)HttpContext.Current.Session["User"]).userName + "/");
        if (!Directory.Exists(subPath))
        {
            Directory.CreateDirectory(subPath);
        }
        profilePic.SaveAs(subPath + "temp" + profilePic.FileName);
        string a = profilePic.FileName;
        using (System.Drawing.Image image1 = System.Drawing.Image.FromFile(subPath + "temp" + profilePic.FileName))
        using (System.Drawing.Image newImage = scaleImage(image1, 175, 175))
        {
            if (File.Exists(subPath + a))
            {
                File.Delete(subPath + a);
            }
            newImage.Save(subPath + a);
        }

        if (File.Exists(subPath + "temp" + a))
        {
            File.Delete(subPath + "temp" + a);
        }
        ((UserClass)HttpContext.Current.Session["User"]).profilePic = "/ProfilePictures/" + ((UserClass)HttpContext.Current.Session["User"]).userName + "/" + profilePic.FileName;
        Console.Write("profile pic saved into directory");
    }


    protected static System.Drawing.Image scaleImage(System.Drawing.Image image, int maxWidth, int maxHeight)
    {
        double x = (double)maxWidth / image.Width;
        double y = (double)maxHeight / image.Height;
        double ratio = Math.Min(x, y);

        int newWidth = (int)(image.Width * ratio);
        int newHeight = (int)(image.Height * ratio);

        Bitmap newImage = new Bitmap(newWidth, newHeight);

        using (Graphics graphics = Graphics.FromImage(newImage))
        {
            graphics.DrawImage(image, 0, 0, newWidth, newHeight);
        }

        return newImage;
    }

}
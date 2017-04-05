using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for InsertImage
/// </summary>
public class InsertImage
{
    public InsertImage()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void uploadImage(int userID, string image, string timeStamp, string description)
    {
        if(image != null)
        {
            if (image.Contains(".jpg") || image.Contains(".png"))
            {
                PhotoTableAdapters.PhotosTableAdapter photoInsert = new PhotoTableAdapters.PhotosTableAdapter();
                photoInsert.Insert(userID, image, timeStamp, description, "False", "False");
                Debug.WriteLine("image uploaded to database");
            }
            else
            {
                Debug.WriteLine("incorrect image format");
            }
        }
        else
        {
            Debug.WriteLine("image is null");
        }
       

    }

    public static void saveImage(FileUpload image)
    {
        string subPath = HttpContext.Current.Server.MapPath("/ImageUploads/" + ((UserClass)HttpContext.Current.Session["User"]).userName + "/");
        if (!Directory.Exists(subPath))
        {
            Directory.CreateDirectory(subPath);
        }
        image.SaveAs(subPath + "temp" + image.FileName);
        string a = image.FileName;
        using (System.Drawing.Image image1 = System.Drawing.Image.FromFile(subPath + "temp" + image.FileName))
        using (System.Drawing.Image newImage = scaleImage(image1, 400, 400))
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
        Debug.WriteLine("image saved into directory");

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
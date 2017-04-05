using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DeleteOrReportImage
/// </summary>
public class DeleteOrReportImage
{
    public DeleteOrReportImage()
    {

    }

    public static void deleteImage(int ID)
    {
        PhotoTableAdapters.PhotosTableAdapter PhotoDelete = new PhotoTableAdapters.PhotosTableAdapter();
        PhotoDelete.UpdateQuery(ID);
        Debug.WriteLine("image deleted");
    }

    public static void reportImage(int ID)
    {
        PhotoTableAdapters.PhotosTableAdapter photoReport = new PhotoTableAdapters.PhotosTableAdapter();
        photoReport.PhotoReportQuery(ID);
        Debug.WriteLine("image reported");
    }
}
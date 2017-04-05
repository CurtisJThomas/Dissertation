using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for InsertStatus
/// </summary>
public class InsertStatus
{
    public InsertStatus()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void uploadStatus(int userID, string Status, string timeStamp)
    {
        if(Status != null)
        {
            StatusTableAdapters.Status_sTableAdapter statusInsert = new StatusTableAdapters.Status_sTableAdapter();
            statusInsert.Insert(userID, Status, timeStamp, "False", "False");
            Debug.WriteLine("StatusUploaded");
        }
        else
        {
            Debug.WriteLine("status is null");
        }

    }
}
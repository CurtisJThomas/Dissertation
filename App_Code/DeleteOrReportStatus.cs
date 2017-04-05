using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DeleteOrReportStatus
/// </summary>
public class DeleteOrReportStatus
{
    public DeleteOrReportStatus()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void deleteStatus(int ID)
    {
        StatusTableAdapters.Status_sTableAdapter statusDelete = new StatusTableAdapters.Status_sTableAdapter();
        statusDelete.UpdateQuery(ID);
        Debug.WriteLine("status deleted");
    }

    public static void reportStatus(int ID)
    {
        StatusTableAdapters.Status_sTableAdapter statusReport = new StatusTableAdapters.Status_sTableAdapter();
        statusReport.ReportStatusQuery(ID);
        Debug.WriteLine("status reported");
    }
}
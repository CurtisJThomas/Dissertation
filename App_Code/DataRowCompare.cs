using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataRowCompare
/// </summary>
public class DataRowCompare : IComparer<GenericClass>
{
    public int Compare(GenericClass x, GenericClass y)
    {
        long x_ticks = DateTime.Parse(x.timestamp).Ticks;
        long y_ticks = DateTime.ParseExact(y.timestamp, "dd/MM/yyyy H:mm:ss", null).Ticks;
        // convert to unix for x and y timestqmps 
        if (x_ticks == y_ticks)
        {
            return 0;
        }
        if(x_ticks < y_ticks)
        {
            return 1;
        }
        return -1;
    }
}
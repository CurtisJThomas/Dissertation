using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SignOutClass
/// </summary>
public class SignOutClass
{
    public SignOutClass()
    {
       
    }

    public void signOut()
    {
        HttpContext.Current.Session.Abandon();
    }
}
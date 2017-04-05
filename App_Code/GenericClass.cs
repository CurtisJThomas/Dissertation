using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GenericClass
/// </summary>
public class GenericClass : IEnumerable<GenericClass>
{
    public string data { get; set; }
    public string username { get; set; }
    public string userID { get; set; }
    public string profilePic { get; set; }
    public string type { get; set; }
    public string timestamp { get; set; }
    public string id { get; set; }
    public string description { get; set; }
    public GenericClass(string d, string user,string usersID,  string profile,string typ, string time, string _id, string desc = "")
    {
        data = d;
        username = user;
        userID = usersID;
        profilePic = profile;
        type = typ;
        timestamp = time;
        id = _id;
        description = desc;
        
        //
        // TODO: Add constructor logic here
        //
    }

    public IEnumerator<GenericClass> GetEnumerator()
    {
        throw new NotImplementedException();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        throw new NotImplementedException();
    }
}
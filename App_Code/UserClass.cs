using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserClass
/// </summary>
public class UserClass
{
              
    public string ID { get; set; }
    public string userName { get; set; }
    public string firstName { get; set; }
    public string lastName { get; set; }
    public string email { get; set; }
    public string mobileNumber { get; set; }
    public string profilePic {  get; set; }
    public string role { get; set; }
    public  List<PreferancesClass> preferancesArray = new List<PreferancesClass>();


    public UserClass(DataRow data)
    {
        this.ID = System.Convert.ToString(data["ID"]);
        this.userName = System.Convert.ToString(data["UserName"]);
        this.firstName = System.Convert.ToString(data["FirstName"]);
        this.lastName = System.Convert.ToString(data["Last Name"]);
        this.email = System.Convert.ToString(data["Email"]);
        this.mobileNumber = System.Convert.ToString(data["Mobile Number"]);
        this.profilePic = System.Convert.ToString(data["ProfilePicture"]);
        this.role = System.Convert.ToString(data["Roles"]);

        PreferancesTableAdapters.CustomFeedsTableAdapter customFeed = new PreferancesTableAdapters.CustomFeedsTableAdapter();
        Preferances.CustomFeedsDataTable customFeedData = customFeed.GetPreferenceDataBy(Convert.ToInt32(ID));
        foreach (DataRow row in customFeedData.Rows)
        {
          preferancesArray.Add(new PreferancesClass(row["Status's"].ToString(), row["Images"].ToString(), row["Video's"].ToString(), row["Music"].ToString(), row["FeedName"].ToString()));
        }
    }

    public PreferancesClass getPreference(int i)
    {
        return preferancesArray[i];
    }

    public void addPreference(PreferancesClass p)
    {
        preferancesArray.Add(p);
    }
}
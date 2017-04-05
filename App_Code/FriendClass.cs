using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;



/// <summary>
/// Summary description for FollowFriend
/// </summary>
public class FriendClass
{
    public FriendClass()
    {
        
    }

    public static void acceptRequest(int ID) {
        FriendsTableAdapters.FriendsTableAdapter accept = new FriendsTableAdapters.FriendsTableAdapter();
        accept.AcceptQuery("Accepted", ID);
        accept.AcceptQuery("Accepted", ID + 1);
        //+1 finds the request after it
    }

    public static void acceptRequestProfile(int friendID, int userID)
    {
        FriendsTableAdapters.FriendsTableAdapter accept = new FriendsTableAdapters.FriendsTableAdapter();
        accept.AcceptQueryProfile("Accepted", friendID, userID, friendID, userID);
    }

    public static void declineRequest(int ID)
    {
        FriendsTableAdapters.FriendsTableAdapter decline = new FriendsTableAdapters.FriendsTableAdapter();
        decline.DeclineQuery(ID);
        decline.DeclineQuery(ID + 1);

    }

    public static void insertFriend(int userID, int friendID)
    {
        FriendsTableAdapters.FriendsTableAdapter addFriend = new FriendsTableAdapters.FriendsTableAdapter();
        addFriend.InsertQueryOne(userID, friendID, "Pending");
        addFriend.InsertQueryTwo(userID, friendID, "Requesting");
    }

   public static void removeFriend(int userID, int friendID)
   {
        FriendsTableAdapters.FriendsTableAdapter remove = new FriendsTableAdapters.FriendsTableAdapter();
        remove.DeleteQuery(userID, friendID, userID, friendID);
    }

    public static void blockUser(int userID, int friendID)
    {
        FriendsTableAdapters.FriendsTableAdapter block = new FriendsTableAdapters.FriendsTableAdapter();
        block.BlockQuery("Blocked", userID, friendID, userID, friendID);
    }


    public static void unblockUser(int userID, int friendID)
    {
        FriendsTableAdapters.FriendsTableAdapter block = new FriendsTableAdapters.FriendsTableAdapter();
        block.BlockQuery("Accepted", userID, friendID, userID, friendID);
    }

    public static void displayOptions(Button addButton,Button deleteRequestButton, Button acceptRequestProfileButton, DropDownList settingsDropDown, int userID, int friendID)
    {
        FriendsTableAdapters.FriendsTableAdapter friendsTable = new FriendsTableAdapters.FriendsTableAdapter();
        Friends.FriendsDataTable friendsData = friendsTable.getButtonData(userID, friendID);
        foreach (DataRow row in friendsData.Rows)
        {

            if (("Pending" == System.Convert.ToString(row["Status"])))
            {
                addButton.Visible = false;
                deleteRequestButton.Visible = true;
            }
            if (("Accepted" == System.Convert.ToString(row["Status"])))
            {

                addButton.Visible = false;
                deleteRequestButton.Visible = false;
                settingsDropDown.Visible = true;
            }

            if (("Requesting" == System.Convert.ToString(row["Status"])))
            {

                addButton.Visible = false;
                deleteRequestButton.Visible = false;
                settingsDropDown.Visible = false;
                acceptRequestProfileButton.Visible = true;

            }

        }
    }


}
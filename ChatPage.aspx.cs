using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChatPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            Session["username"] = ((UserClass)Session["User"]).userName.ToString();
            FriendsChatListData.SelectParameters.Add("@Friend", ((UserClass)Session["User"]).ID.ToString());
        }

    }

}
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchPage : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            resultDataSource.SelectCommand = resultDataSource.SelectCommand.Replace("@ID", ((UserClass)Session["User"]).ID);
            string x = resultDataSource.SelectCommand;
            resultDataSource.DataBind();
        }
    }

    protected void searchViewProfile_OnClick(object sender, EventArgs e) {
        Button b1 = (Button)sender;
        Session["ProfileID"] = Convert.ToInt32(b1.CommandArgument.ToString());
        Response.Redirect("OtherUsersProfile.aspx");
    }

}
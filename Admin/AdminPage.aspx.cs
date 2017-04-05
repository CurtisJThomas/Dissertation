using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            adminViewAllUsersSearchListView.Visible = false;
            searchAllUsersAdminBack.Visible = false;
        }
    }

    protected void promoteUserButtonAll_Click(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        AdminControls.promoteUser(b1.CommandArgument.ToString());
        adminViewAllUsersListView.DataBind();
        adminViewAllUsersSearchListView.DataBind();
    }

    protected void demoteUserButtonAll_Click(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        AdminControls.demoteUser(b1.CommandArgument.ToString());
        adminViewAllUsersListView.DataBind();
        adminViewAllUsersSearchListView.DataBind();
    }

    protected void deleteUserButtonAll_Click(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        AdminControls.deleteUser(b1.CommandArgument.ToString());
        adminViewAllUsersListView.DataBind();
        adminViewAllUsersSearchListView.DataBind();
    }

    protected void promoteUserButtonSearch_Click(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        AdminControls.promoteUser(b1.CommandArgument.ToString());
        adminViewAllUsersListView.DataBind();
        adminViewAllUsersSearchListView.DataBind();
    }

    protected void demoteUserButtonSearch_Click(object sender, EventArgs e)
    { 
        Button b1 = (Button)sender;
        AdminControls.demoteUser(b1.CommandArgument.ToString());
        adminViewAllUsersListView.DataBind();
        adminViewAllUsersSearchListView.DataBind();
    }

    protected void deleteUserButtonSearch_Click(object sender, EventArgs e)
    {
        Button b1 = (Button)sender;
        AdminControls.deleteUser(b1.CommandArgument.ToString());
        adminViewAllUsersListView.DataBind();
        adminViewAllUsersSearchListView.DataBind();
    }

    protected void searchAllUsersAdmin_Click(object sender, EventArgs e)
    {
        Session["AdminUserSearch"] = searchAllUsersAdminTB.Text.ToString();
        adminViewAllUsersSearchListView.DataBind();
        adminViewAllUsersSearchListView.Visible = true;
        searchAllUsersAdminBack.Visible = true;
        adminViewAllUsersListView.Visible = false;
    }

    protected void searchAllUsersAdminBack_Click(object sender, EventArgs e)
    {
        adminViewAllUsersSearchListView.Visible = false;
        searchAllUsersAdminBack.Visible = false;
        adminViewAllUsersListView.Visible = true;
    }
}
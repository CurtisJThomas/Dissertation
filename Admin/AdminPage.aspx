<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="Admin_AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="adminUserHeader" CssClass="adminHeader" runat="server" Text="Users" ></asp:Label>
     <div class="adminListViews">
         <div class="row">
         <div class="adminSearchDiv col-md-3">
          <asp:Button ID="searchAllUsersAdminBack" CssClass="btn btn-primary" runat="server" OnClick="searchAllUsersAdminBack_Click" Text="Back" /><asp:TextBox ID="searchAllUsersAdminTB" CssClass="form-control searchAllUsersAdminTB" runat="server"></asp:TextBox><asp:Button ID="searchAllUsersAdmin" CssClass="btn btn-primary searchAllUsersAdmin" runat="server"  OnClick="searchAllUsersAdmin_Click" Text="Seach" />
         </div>
        </div>
        <asp:ListView ID="adminViewAllUsersListView"  runat="server" DataKeyNames="ID" DataSourceID="allUsersDataSource">
            <ItemTemplate>
                <div class="row usersRow">
                     <div class="col-md-8">
                         <div class="col-md-8">
                         <div>
                        <asp:Label ID="userNameLabel" runat="server" Text="User Name: "></asp:Label>
                        <asp:Label ID="User_NameLabel" runat="server" Text='<%# Eval("[User Name]") %>' />
                        </div>

                         <div>
                        <asp:Label ID="nameLabel" runat="server" Text="Name: "></asp:Label>
                        <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("[First Name]") %>' />
                        <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("[Last Name]") %>' />
                        </div>

                         <div>
                        <asp:Label ID="emailLabel" runat="server" Text="Email: "></asp:Label>
                        <asp:Label ID="Email_Label" runat="server" Text='<%# Eval("Email") %>' />
                        </div>
                
                         <div>
                        <asp:Label ID="roles_Label" runat="server" Text="Role: "></asp:Label>
                        <asp:Label ID="RolesLabel" runat="server" Text='<%# Eval("Roles") %>' />
                        </div>
                       </div>
                         <div class="col-md-4">
                              <asp:Image ID="Profile_PictureLabel" CssClass="adminProfPic" runat="server" ImageUrl='<%# Eval("[Profile Picture]").ToString().Contains("ProfilePictures") ? "../" + Eval("[Profile Picture]")  :  Eval("[Profile Picture]") %>' />
                         </div>
                       </div>
                <div class="col-md-4">
                    <asp:Button ID="promoteUserButtonAll" CssClass="btn btn-primary" CommandArgument='<%# Eval("ID") %>' OnClick="promoteUserButtonAll_Click" runat="server" Text="Promote" />
                    <asp:Button ID="demoteUserButtonAll" CssClass="btn btn-primary" CommandArgument='<%# Eval("ID") %>' OnClick="demoteUserButtonAll_Click" runat="server" Text="Demote" />
                    <asp:Button ID="deleteUserButtonAll" CssClass="btn btn-primary" CommandArgument='<%# Eval("ID") %>' OnClick="deleteUserButtonAll_Click" runat="server" Text="Delete" />
               </div>
              </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:ListView ID="adminViewAllUsersSearchListView" runat="server" DataKeyNames="ID" DataSourceID="allUsersSearchDataSource">
            <ItemTemplate>
                  <div class="row usersRow">
                     <div class="col-md-8">
                         <div class="col-md-8">
                         <div>
                        <asp:Label ID="userNameLabel" runat="server" Text="User Name: "></asp:Label>
                        <asp:Label ID="User_NameLabel" runat="server" Text='<%# Eval("[User Name]") %>' />
                        </div>

                         <div>
                        <asp:Label ID="nameLabel" runat="server" Text="Name: "></asp:Label>
                        <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("[First Name]") %>' />
                        <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("[Last Name]") %>' />
                        </div>

                         <div>
                        <asp:Label ID="emailLabel" runat="server" Text="Email: "></asp:Label>
                        <asp:Label ID="Email_Label" runat="server" Text='<%# Eval("Email") %>' />
                        </div>
                
                         <div>
                        <asp:Label ID="roles_Label" runat="server" Text="Role: "></asp:Label>
                        <asp:Label ID="RolesLabel" runat="server" Text='<%# Eval("Roles") %>' />
                        </div>
                       </div>
                         <div class="col-md-4">
                              <asp:Image ID="Profile_PictureLabel" CssClass="adminProfPic" runat="server" ImageUrl='<%# Eval("[Profile Picture]").ToString().Contains("ProfilePictures") ? "../" + Eval("[Profile Picture]")  :  Eval("[Profile Picture]") %>' />
                         </div>
                       </div>
                <div class="col-md-4">
                     <asp:Button ID="promoteUserButtonSearch" CssClass="btn btn-primary" CommandArgument='<%# Eval("ID") %>' OnClick="promoteUserButtonSearch_Click" runat="server" Text="Promote" />
                    <asp:Button ID="demoteUserButtonSearch"  CssClass="btn btn-primary" CommandArgument='<%# Eval("ID") %>' OnClick="demoteUserButtonSearch_Click" runat="server" Text="Demote" />
                    <asp:Button ID="deleteUserButtonSearch"  CssClass="btn btn-primary" CommandArgument='<%# Eval("ID") %>' OnClick="deleteUserButtonSearch_Click" runat="server" Text="Delete" />
                </div>
             </div>
                </ItemTemplate>
        </asp:ListView>
    </div>

    <asp:SqlDataSource ID="allUsersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Users Table]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="allUsersSearchDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT ID, [User Name], [First Name], [Last Name], Email, [Password], [Mobile Number], [Profile Picture], Roles, ForgotPasswordCode FROM [Users Table] WHERE ([First Name] LIKE '%' &amp; ? &amp; '%') OR ([First Name] LIKE '%' &amp; ?) OR ([First Name] LIKE ? &amp; '%') OR ([Last Name] LIKE '%' &amp; ? &amp; '%') OR ([Last Name] LIKE '%' &amp; ?) OR ([Last Name] LIKE ? &amp; '%') OR ([User Name] LIKE '%' &amp; ? &amp; '%') OR ([User Name] LIKE '%' &amp; ?) OR ([User Name] LIKE ? &amp; '%') OR ([First Name] LIKE '%' &amp; ? &amp; '%' OR [First Name] LIKE '%' &amp; ? OR [First Name] LIKE ? &amp; '%') AND ([Last Name] LIKE '%' &amp; ? &amp; '%' OR [Last Name] LIKE '%' &amp; ? OR [Last Name] LIKE ? &amp; '%')">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
            <asp:SessionParameter Name="?" SessionField="AdminUserSearch" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


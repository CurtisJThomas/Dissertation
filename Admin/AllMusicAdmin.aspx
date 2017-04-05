<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AllMusicAdmin.aspx.cs" Inherits="Admin_AllMusicAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Label ID="adminMusicHeader" CssClass="adminHeader" runat="server" Text="All music" ></asp:Label>
        <div class="adminListViews">
            <asp:ListView ID="adminViewAllMusicListView" runat="server" DataSourceID="allMusicDataSource">
                <ItemTemplate>
            <div class="row usersRow">
                     <div class="col-md-6">
                         <div class="col-md-6">
                         <div>
                        <asp:Label ID="userNameLabel" runat="server" Text="User Name: "></asp:Label>
                        <asp:Label ID="userName_Label" runat="server" Text='<%# Eval("[User Name]") %>' />
                        </div>

                         <div>
                        <asp:Label ID="nameLabel" runat="server" Text="Name: "></asp:Label>
                        <asp:Label ID="firstName_Label" runat="server" Text='<%# Eval("[First Name]") %>' />
                        <asp:Label ID="lastName_Label" runat="server" Text='<%# Eval("[Last Name]") %>' />
                        </div>

                         <div>
                        <asp:Label ID="deletedLabel" runat="server" Text="Deleted: "></asp:Label>
                        <asp:Label ID="Deleted_Label" runat="server" Text='<%# Eval("Deleted") %>' />
                        </div>
                
                         <div>
                        <asp:Label ID="reported_Label" runat="server" Text="Reported: "></asp:Label>
                        <asp:Label ID="reportedLabel" runat="server" Text='<%# Eval("Reported") %>' />
                        </div>

                        <div>
                              <asp:Label ID="descriptionLabel" runat="server" Text="Description: "></asp:Label>
                              <asp:Label ID="description_Label" runat="server" Text='<%# Eval("Description") %>' />
                        </div>

                        <div>
                          <asp:Label ID="timestampLabel" runat="server" Text="Timestamp: "></asp:Label>
                         <asp:Label ID="timestamp_Label" runat="server" Text='<%# Eval("[Time-Stamp]") %>' />
                        </div>

                       </div>
                         <div class="col-md-6 musicAdmin">
                               <audio controls>
	                            <source src='<%#"../MusicUploads/" + Eval("[User Name]") + "/" + Eval("Song") %>' type="audio/mpeg" />
                                 <a href='<%#"../MusicUploads/" + Eval("[User Name]") + "/" + Eval("Song") %>'></a>
                               </audio>
                         </div>
                       </div>
                <div class="col-md-4">
                        <asp:Button ID="deleteMusicAdminAllButton" CssClass="btn btn-primary"  CommandArgument='<%# Eval("MusicID") %>' OnClick="deleteMusicAdminAllButton_Click" runat="server" Text="Delete" />
                        <asp:Button ID="viewProfileMusicAdminAllButton" CssClass="btn btn-primary" CommandArgument='<%# Eval("UsersTableID") %>' OnClick="viewProfileMusicAdminAllButton_Click" runat="server" Text="View profile" />
                </div>
               </div>              
                </ItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="allMusicDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT Music.ID AS MusicID, Music.[User ID], Music.Song, Music.[Time-Stamp], Music.Description, Music.Deleted, Music.Reported, [Users Table].ID AS UsersTableID, [Users Table].[User Name], [Users Table].[First Name], [Users Table].[Last Name] FROM (Music INNER JOIN [Users Table] ON Music.[User ID] = [Users Table].ID)"></asp:SqlDataSource>
        </div>
</asp:Content>


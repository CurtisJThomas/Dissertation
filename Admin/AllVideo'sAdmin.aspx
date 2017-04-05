<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AllVideo'sAdmin.aspx.cs" Inherits="Admin_AllVideo_sAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Label ID="adminVideosHeader" CssClass="adminHeader" runat="server" Text="All videos" ></asp:Label>
        <div class="adminListViews">
            <asp:ListView ID="adminViewAllVideoListView" runat="server" DataSourceID="allVideoDataSource">
                <ItemTemplate>
                   <div class="row usersRow videoRow">
                     <div class="col-md-8">
                         <div class="col-md-4">
                         <div>
                        <asp:Label ID="userNameLabel" runat="server" Text="User Name: "></asp:Label>
                        <asp:Label ID="userName_Label" runat="server" Text='<%# Eval("[UserName]") %>' />
                        </div>

                         <div>
                        <asp:Label ID="nameLabel" runat="server" Text="Name: "></asp:Label>
                        <asp:Label ID="firstName_Label" runat="server" Text='<%# Eval("[FirstName]") %>' />
                        <asp:Label ID="lastName_Label" runat="server" Text='<%# Eval("[LastName]") %>' />
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
                         <div class="col-md-8 ">
                              <div class="embed-responsive embed-responsive-4by3 ">
                                    <video controls class="embed-responsive-item videoUploadIframeAdmin" src='<%#"../VideoUploads/" + Eval("[UserName]") + "/" + Eval("Video") %>'></video>
                              </div>
                         </div>
                       </div>
                <div class="col-md-4">
                         <asp:Button ID="deleteVideoAdminAllButton" CssClass="btn btn-primary"  CommandArgument='<%# Eval("VideosID") %>' OnClick="deleteVideoAdminAllButton_Click" runat="server" Text="Delete" />
                        <asp:Button ID="viewProfileVideoAdminAllButton" CssClass="btn btn-primary" CommandArgument='<%# Eval("UserID") %>' OnClick="viewProfileVideoAdminAllButton_Click" runat="server" Text="View profile" />
                </div>
              </div>             
                </ItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="allVideoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Video's].ID AS VideosID, [Video's].[User ID], [Video's].Video, [Video's].[Time-Stamp], [Video's].Description, [Video's].Deleted, [Video's].Reported, [Users Table].ID AS UserID, [Users Table].[User Name] AS UserName, [Users Table].[First Name] AS FirstName, [Users Table].[Last Name] AS LastName FROM ([Video's] INNER JOIN [Users Table] ON [Video's].[User ID] = [Users Table].ID)"></asp:SqlDataSource>
         </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AllReportedImagesAdmin.aspx.cs" Inherits="Admin_AllReportedImagesAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Label ID="adminAllReportedImagesHeader" CssClass="adminHeader" runat="server" Text="All reported images" ></asp:Label>
        <div class="adminListViews">
            <asp:ListView ID="adminViewAllReportedImageListView" runat="server" DataSourceID="allReportedImageDataSource">
                <ItemTemplate>
                      <div class="row usersRow">
                     <div class="col-md-6">
                         <div class="col-md-4">
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
                         <div class="col-md-6">
                            <asp:Image ID="photoLabel" CssClass="adminPhotos" runat="server" ImageUrl='<%#"../ImageUploads/" + Eval("[User Name]")  + "/" +  Eval("Photo") %>'/>
                         </div>
                       </div>
                <div class="col-md-4">
                        <asp:Button ID="deleteImagesAdminAllReportedButton"  CommandArgument='<%# Eval("PhotosID") %>' OnClick="deleteImagesAdminAllReportedButton_Click" runat="server" Text="Delete" />
                        <asp:Button ID="viewProfileImagesAdminAllReportedButton" CommandArgument='<%# Eval("UsersTableID") %>' OnClick="viewProfileImagesAdminAllReportedButton_Click" runat="server" Text="View profile" />
                </div>
               </div>
                 </ItemTemplate>
            </asp:ListView>
           <asp:SqlDataSource ID="allReportedImageDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT Photos.ID AS PhotosID, Photos.[User ID], Photos.Photo, Photos.[Time-Stamp], Photos.Description, Photos.Deleted, Photos.Reported, [Users Table].ID AS UsersTableID, [Users Table].[User Name], [Users Table].[First Name], [Users Table].[Last Name] FROM (Photos INNER JOIN [Users Table] ON Photos.[User ID] = [Users Table].ID) WHERE (Photos.Reported = 'MarkedAsReported')"></asp:SqlDataSource>
       </div>
</asp:Content>


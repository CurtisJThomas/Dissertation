<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedInMaster.master" AutoEventWireup="true" CodeFile="OtherUsersProfile.aspx.cs" Inherits="OtherUsersProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="otherUserDetailsListView" runat="server" OnItemDataBound="OtherUserDetailsListView_ItemDataBound" DataSourceID="otherUserDetailsDataSource">
    <ItemTemplate>
            <div class="profileHeader">
        <div class="ProfileHeaderContent">
            <div>
                <asp:Image ID="OtherProfilePictureLabel" CssClass="ProfilePicture" runat="server" ImageURL='<%# Eval("[Profile Picture]") %>' />
            </div>
            <div>
                <asp:Label ID="OtherUserNameLabel" CssClass="OtherUserNameLabel" runat="server" Text='<%# Eval("[User Name]") %>' />
            </div>
            <div>
                <asp:Label ID="OtherUserFirstNameLabel" CssClass="OtherUserFullName" runat="server" Text='<%# Eval("[First Name]") %>' />
                <asp:Label ID="OtherUserLastNameLabel"  CssClass="OtherUserFullName" runat="server" Text='<%# Eval("[Last Name]") %>' />
            </div>
        </div>
    </div>

    </ItemTemplate>
</asp:ListView>
            <asp:Button ID="addFriendButton" class="btn btn-primary" runat="server" Text="Add" CommandArgument='<%# Session["ProfileID"] %>'  OnClick="AddFriend_OnClick"/>
             <asp:Button ID="acceptRequestButtonProfile" class="btn btn-primary" runat="server" Text="Accept request"  OnClick="AcceptRequest_OnClick"/> 
            <asp:Button ID="cancelRequest" class="btn btn-primary" runat="server" Text="Cancel Request"  OnClick="CancelRequest_OnClick"/> 
                <asp:DropDownList ID="otherUserDropDownOptions" CssClass="btn btn-primary" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="otherUserDropDownOptions_SelectedIndexChanged" >
                <asp:ListItem  Text="Settings" disabled="disabled" ></asp:ListItem>
                <asp:ListItem Text="Block User" Value="Block User"   ></asp:ListItem>
                <asp:ListItem Text="Remove User" Value="Remove User" ></asp:ListItem>
            </asp:DropDownList>
          
          <asp:Button ID="viewDetailsButtom" CssClass="btn viewDetailsButtom" Text="View Details" OnClick="viewDetailsButtom_Click" runat="server" />
          <asp:Button ID="hideDetails" CssClass="btn hideDetails" Text="Close" OnClick="hideDetails_Click" runat="server" />

          <div runat="server" id="viewDetailsDiv" class="viewDetailsDiv">
              <div class="viewDetailsLabelDiv">
                    <asp:Label ID="viewDetailsLabel" runat="server" CssClass="viewDetailsLabel" Text="Details"></asp:Label>
              </div>
              <asp:ListView ID="viewDetailsListView" runat="server" DataSourceID="OtherUserViewDetails">
                                  <ItemTemplate >
                                   <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                       <asp:Label ID="ageLabel" runat="server" Text="Age:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                           <asp:Label Text='<%# Eval("Age") %>' runat="server" ID="AgeDisplayLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="schoolLabel" runat="server" Text="School:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                          <asp:Label Text='<%# Eval("School") %>' MaxLength="35" runat="server" ID="SchoolDisplayLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                          <asp:Label ID="collegeLabel" runat="server" Text="College:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                           <asp:Label Text='<%# Eval("Collage") %>'  MaxLength="35" runat="server" ID="CollageViewLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="universityLabel"  runat="server" Text="University:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                         <asp:Label Text='<%# Eval("University") %>'  MaxLength="35" runat="server" ID="UniversityDisplayLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="relationshipLabel" runat="server" Text="Relationship status:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                           <asp:Label ID="relationshipTB" runat="server"  MaxLength="20" Text='<%# Eval("RelationshipStatus")%>'/>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="bioLabel" runat="server" Text="Bio:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                         <asp:Label Text='<%# Eval("Bio") %>' runat="server" ID="BioDisplayLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                          <asp:Label ID="employerLabel" runat="server" Text="Employer:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                          <asp:Label Text='<%# Eval("Employer") %>' MaxLength="40" runat="server" ID="EmployerDisplayLabel" />
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="contactnumLabel" runat="server" Text="Contact number:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                         <asp:Label Text='<%# Eval("[Contact_number]") %>' MaxLength="15" type="number" runat="server" ID="Contact_numberDisplayLabel" /></td>
                                      </div>
                                  </div>
                              </ItemTemplate>
              </asp:ListView>
          </div>
     <div class="col-md-3 col-lg-3 col-xs-3 FriendsDiv FriendsDivMob">
                <div class="friendsLabelDiv">
                  <asp:Label id="freindsLabel" CssClass="FriendsLabel" runat="server" >Friends</asp:Label>
                </div>
        <asp:ListView ID="allFriendsListView" runat="server" DataSourceID="OtherUserAllFriendsSQL">
            <EmptyDataTemplate>
           <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 OtherUserNoFriendsViewDiv" >
                 <asp:Label ID="OtherUserNoFriendsView" runat="server" Text="This user currently has no friends, add them and become their first"></asp:Label>
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-xs-12">
                      <div class="FriendsDetailsDiv">
                        <div >
                           <asp:Label ID="User_NameLabel" runat="server" Text='<%# Eval("[User Name]") %>' />
                            <asp:Button ID="viewProfileAllFriendsButton" CssClass="btn viewProfileAllFriendsButton" runat="server" CommandArgument='<%#Eval("[Friend ID]")%>'  OnClick="viewAllOtherFriendsProfileButton_OnClick" Text="View Profile" />
                            <asp:Image ID="Profile_PictureLabel" CssClass="smallProfPicFriends" runat="server" ImageURL='<%# Eval("[Profile Picture]") %>' />

                        </div>
                        <div >
                           <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("[First Name]") %>'/>
                           <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("[Last Name]") %>' />
                        </div>
                       </div>
                    </div>
                </div>              
                  <hr />
            </ItemTemplate>
        </asp:ListView>
    </div>

       
    <div class="OtherUserProfileFeedButtons">
                  <asp:Button ID="OtherUserStatusFeedButton" CssClass="btn OtherUserStatusFeedButton" runat="server" Text="Status Updates" OnClick="OtherUserStatusFeedButton_Click" ></asp:Button>
                   <asp:Button ID="OtherUserImagesFeedButton" CssClass="btn OtherUserImagesFeedButton" runat="server" Text="Image Updates" OnClick="OtherUserImagesFeedButton_Click" ></asp:Button>
                   <asp:Button ID="OtherUserVideosFeedButton" CssClass="btn OtherUserVideosFeedButton" runat="server" Text="Video Updates" OnClick="OtherUserVideosFeedButton_Click" ></asp:Button>
                   <asp:Button ID="OtherUserMusicFeedButton" CssClass="btn OtherUserMusicFeedButton" runat="server" Text="Music Updates" OnClick="OtherUserMusicFeedButton_Click" ></asp:Button>
          </div>

    <asp:ListView ID="otherUserStatusUploadsListView" OnItemDataBound="OtherUserStatusListView_ItemDataBound" runat="server" DataSourceID="otherUserStatusUploadDataSource">
        <EmptyDataTemplate>
           <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 OtherUserNoStatusViewDiv">
                 <asp:Label ID="OtherUserNoStatusView" runat="server" Text="This user currently has no status's"></asp:Label>
             </div>
        </EmptyDataTemplate>
        <ItemTemplate>
         <div class="row">
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 otherUserProfileStatus" >
                 <blockquote class="quote-box" >
                <div>
                 <asp:Label ID="OtherUserStatusName" CssClass="OtherUserStatusName" runat="server" Text=""></asp:Label>
                 <asp:Image ID="otherUserStatusProfilePic" CssClass="smallProfPic" runat="server" ImageUrl='<%# Eval("OtherUsersProfilePic") %>' />
                </div>
                <br />
                <div>
                 <asp:Label ID="OtherUserStatus" runat="server" Text='<%# Eval("Status") %>' />
                </div>
                <hr>
                <div class="blog-post-actions row">
                     <div class="blog-post-bottom pull-left">
                        <asp:Label ID="OtherUserTimeStamp" runat="server" Text='<%# Eval("[StatusTimeStamp]") %>' />
                     </div>
                   <asp:ImageButton ID="OtherUserProfileReportStatusButton" ImageUrl="~/images/Report.png" CssClass="ReportButton" runat="server"  CommandArgument='<%#Eval("ID")%>' OnClick="OtherUserProfileReportStatusButton_Click" ></asp:ImageButton>
                    <asp:Label ID="OtherUserProfileReportStatusLabel" ToolTip='<%#Eval("ID")%>' Visible="false" runat="server" ForeColor="red" Text="Reported"></asp:Label>
              </div>
         </blockquote>         
             </div>
            </div>
        </ItemTemplate>
</asp:ListView>

    <asp:ListView ID="otherUserImageUploadsListView" runat="server" OnItemDataBound="OtherUserPhotoListView_ItemDataBound" DataSourceID="otherUserImageUploadDataSource">
        <EmptyDataTemplate>
           <div class="col-md-4 col-xs-4 col-lg-4" ></div>
             <div class="col-md-4 col-xs-4 col-lg-4 OtherUserNoImagesViewDiv" >
                 <asp:Label ID="OtherUserNoImageView" runat="server" Text="This user currently has no photos"></asp:Label>
             </div>
           <div class="col-md-4 col-xs-4 col-lg-4"></div>
        </EmptyDataTemplate>
        <ItemTemplate>
           <div class="row">
            <div class="col-md-3 col-xs-3 col-lg-3"></div>
             <div class="col-md-5 col-xs-5 col-lg-5">
                 <blockquote class="quoteImage-box" >
                <div>
                 <asp:Label ID="OtherUserPhotoName" CssClass="OtherUserPhotoName" runat="server" Text=""></asp:Label>
                 <asp:Image ID="otherUserImageProfilePic" CssClass="smallProfPic" runat="server" ImageUrl='<%# Eval("OtherUsersProfilePic") %>' />
                </div>
                <br />
                <div style="text-align:center;">
                 <asp:Image ID="OtherUserPhotoLabel" CssClass="PhotoLabelProfile" runat="server" ImageURL='<%#"/ImageUploads/"+ Session["OtherUserProfile"].ToString() + "/" + Eval("Photo") %>' />
                </div>
                <div>
                <asp:Label ID="OtherUserDescriptionLabel" runat="server" Text='<%# Eval("PhotoDescription") %>' />
                </div>
                <hr>
                <div class="blog-post-actions row">
               <div class="blog-post-bottom pull-left">
                <asp:Label ID="OtherUserTimeStampLabel" CssClass="OtherUserTimetampLabel" runat="server" Text='<%# Eval("[TimeStamp]") %>' />
               </div>
                 <asp:ImageButton ID="OtherUserProfileReportImageButton" ImageUrl="~/images/Report.png" CssClass="ReportButton" runat="server"  CommandArgument='<%#Eval("ID")%>' OnClick="OtherUserProfileReportImageButton_Click" ></asp:ImageButton>
                 <asp:Label ID="OtherUserProfileReportImageLabel" ToolTip='<%#Eval("ID")%>' Visible="false" runat="server" ForeColor="red" Text="Reported"></asp:Label>
                </div>
         </blockquote>         
             </div>
            </div>
        </ItemTemplate>
</asp:ListView>
<asp:ListView ID="otherUserVideoUploadsListView" runat="server" DataSourceID="OtherUserVideosDataSource">
    <EmptyDataTemplate>
     <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 OtherUserNoVideoViewDiv">
                 <asp:Label ID="OtherUserNoVideoView" runat="server" Text="This user currently has no Video's"></asp:Label>
             </div>
    </EmptyDataTemplate>
    <ItemTemplate>
              <div class="row">
            <div class="col-md-3 col-xs-3 col-lg-3"></div>
             <div class="col-md-5 col-xs-5 col-lg-5 videoProfile">
                 <blockquote class="quoteImage-box" >
                <div>
                 <asp:Label ID="UserNameLabel" runat="server" Text="" />
                <asp:Image ID="VideoProfilePicture" runat="server" CssClass="smallProfPic" ImageUrl='<%# Eval("OtherUsersProfilePic") %>' />
                </div>
                <br />
                <div style="text-align:center;">
                 <div class="embed-responsive embed-responsive-4by3">
                 <video controls class="embed-responsive-item videoUploadIframe" src='<%#"VideoUploads/" + Session["OtherUserProfile"].ToString() + "/" + Eval("Video") %>'></video>
                 </div>              
                </div>
                <div>
                   <asp:Label ID="videoDescription" runat="server" Text='<%# Eval("Description") %>' />
                </div>
                <hr>
                <div class="blog-post-actions row">
               <div class="blog-post-bottom pull-left">
                  <asp:Label ID="videoTimeStamp" runat="server" Text='<%# Eval("[VidoesTimeStamp]") %>' />
               </div>
               <asp:ImageButton ID="OtherUserReportVideoButton" ImageUrl="~/images/Report.png" CssClass="ReportButton" runat="server"  CommandArgument='<%#Eval("ID")%>' OnClick="OtherUserReportVideoButton_Click" ></asp:ImageButton>
              <asp:Label ID="OtherUserReportVideoLabel" CssClass="OtherUserReportVideoLabel" ToolTip='<%#Eval("ID")%>' runat="server" Visible="false" Text="Reported"></asp:Label>
          </div>
         </blockquote>         
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
            </div>
    </ItemTemplate>
    </asp:ListView>

<asp:ListView ID="otherUserMusicUploadsListView" runat="server" DataSourceID="OtherUserMusicDataSource">
    <EmptyDataTemplate>
           <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 OtherUserNoMusicViewDiv">
                 <asp:Label ID="OtherUserNoMusicView" runat="server" Text="This user currently has no music"></asp:Label>
             </div>
    </EmptyDataTemplate>
    <ItemTemplate>
          <div class="row">
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 musicProfile">
                 <blockquote class="quote-box" >
                <div>
                     <asp:Label ID="UserName_Label" runat="server" Text="" />
                     <asp:Image ID="musicUploadProfPic"  CssClass="smallProfPic" runat="server" ImageUrl='<%# Eval("[OtherUsersProfilePic]") %>'/>
                </div>
                <br />
                <div>
                  <audio controls>
	              <source src='<%#"MusicUploads/" + Session["OtherUserProfile"].ToString() + "/" + Eval("Song") %>' type="audio/mpeg" />
                  <a href='<%#"MusicUploads/" + Session["OtherUserProfile"].ToString() + "/" + Eval("Song") %>'></a>
                  </audio>  
                 <asp:Label ID="musicDescriptionLabel" runat="server" Text='<%# Eval("[Description]") %>' />
                </div>
                <hr>
                <div class="blog-post-actions row">
                  <div class="blog-post-bottom pull-left">
                     <asp:Label ID="TimeStamp_Label" CssClass="Time_StampLabel" runat="server" Text='<%# Eval("[MusicTimeStamp]") %>' />
                  </div>
                     <asp:ImageButton ID="OtherUserProfileReportMusicButton" ImageUrl="~/images/Report.png" CssClass="ReportButton" runat="server"  CommandArgument='<%#Eval("ID")%>' OnClick="OtherUserProfileReportMusicButton_Click" ></asp:ImageButton>
                     <asp:Label ID="OtherUserProfileReportMusicButtonLabel" ToolTip='<%#Eval("ID")%>' CssClass="OtherUserProfileReportMusicButtonLabel" Visible="false" runat="server" Text="Reported"></asp:Label>
               </div>
             </blockquote>         
            </div>
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
           </div>
    </ItemTemplate>
    </asp:ListView>





<asp:SqlDataSource ID="otherUserDetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [User Name], [First Name], [Last Name], [Profile Picture] FROM [Users Table] WHERE ([ID] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="ProfileID" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="otherUserStatusUploadDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Users Table].[Profile Picture] AS OtherUsersProfilePic, [Status's].Status, [Status's].[Time-Stamp] AS StatusTimeStamp, [Status's].ID, [Status's].Deleted FROM ([Status's] INNER JOIN [Users Table] ON [Status's].[User ID] = [Users Table].ID) WHERE ([Status's].[User ID] = ?) AND ([Status's].Deleted &lt;&gt; 'True') ORDER BY [Status's].[Time-Stamp] DESC">
        <SelectParameters>
            <asp:SessionParameter Name="User_ID" SessionField="ProfileID" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="otherUserImageUploadDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Users Table].[Profile Picture] AS OtherUsersProfilePic, Photos.ID, Photos.Description AS PhotoDescription, Photos.[User ID] AS UserID, Photos.Photo, Photos.[Time-Stamp] AS [TimeStamp], Photos.Deleted FROM (Photos INNER JOIN [Users Table] ON Photos.[User ID] = [Users Table].ID) WHERE (Photos.[User ID] = ?) AND (Photos.Deleted &lt;&gt; 'True') ORDER BY Photos.[Time-Stamp] DESC">
        <SelectParameters>
            <asp:SessionParameter Name="User_ID" SessionField="ProfileID" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="OtherUserAllFriendsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT Friends.ID, Friends.[User ID], Friends.[Friend ID], [Users Table].[Profile Picture], [Users Table].[User Name], [Users Table].[First Name], [Users Table].[Last Name] FROM ([Users Table] INNER JOIN Friends ON [Users Table].ID = Friends.[Friend ID]) WHERE (Friends.Status = 'Accepted') AND (Friends.[User ID] = ?)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="OtherUserVideosDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Users Table].[Profile Picture] AS OtherUsersProfilePic, [Video's].Video, [Video's].Description, [Video's].[Time-Stamp] AS VidoesTimeStamp, [Video's].ID, [Video's].Deleted FROM ([Video's] INNER JOIN [Users Table] ON [Video's].[User ID] = [Users Table].ID) WHERE ([Video's].[User ID] = ?) AND ([Video's].Deleted &lt;&gt; 'True') ORDER BY [Video's].[Time-Stamp] DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="OtherUserMusicDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Users Table].[Profile Picture] AS OtherUsersProfilePic, Music.Song, Music.[Time-Stamp] AS MusicTimeStamp, Music.ID, Music.Deleted, Music.Description FROM (Music INNER JOIN [Users Table] ON Music.[User ID] = [Users Table].ID) WHERE (Music.[User ID] = ?) AND (Music.Deleted &lt;&gt; 'True') ORDER BY Music.[Time-Stamp] DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="OtherUserViewDetails" runat="server" ConnectionString='<%$ ConnectionStrings:UmixDBConnectionString %>' ProviderName='<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>' SelectCommand="SELECT [Age], [School], [Collage], [University], [RelationshipStatus], [Contact number] AS Contact_number, [Bio], [Employer] FROM [EditProfile] WHERE ([UserID] = ?)">
        <SelectParameters>
            <asp:SessionParameter SessionField="ProfileID" Name="UserID" Type="Int32"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


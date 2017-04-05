<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedInMaster.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="profileHeader">
        <div class="ProfileHeaderContent">
            <div>
                 <asp:Image ID="ProfilePicture" CssClass="ProfilePicture" runat="server" />
            </div>
            <div>
                <asp:Label ID="ProfileUserNameLabel" CssClass="ProfileUserNameLabel" runat="server" Text=""></asp:Label>
            </div>
            <div>
               <asp:Label ID="ProfileFullNameLabel" CssClass="ProfileFullNameLabel" runat="server" Text=""></asp:Label>
            </div>
                <asp:Button ID="EditProfileButton" CssClass="btn EditProfileButton" runat="server" Text="My account" OnClick="EditProfileButton_Click" />
                <asp:Button ID="CancelEditButton" CssClass="btn CancelEditButton" runat="server" Text="Cancel" OnClick="CancelEditButton_Click" />
        </div>
    </div>
    <!-- have edit text boxes appear here -->
    <div class="EditProfileDiv" id="EditProfileDiv" runat="server">
        <div class="row">
            <div class="col-md-6 col-xs-6 col-lg-6 editProfileObjects">
                <div class="editProfDiv">
                   <asp:Label ID="editProfLabelOne" CssClass="" runat="server" Text="Edit Profile"></asp:Label>
                </div>
                <div class="EditProfileHeaderDiv">
                    <asp:Label ID="editProfileLabel" CssClass="editProfileLabel" runat="server" Text="Change profile picture"></asp:Label>
                </div>
                  <div id="profilePicUploadDiv" class="fileUpload btn btn-primary" runat="server">
                        <span class="uploadSpan glyphicon  glyphicon-download-alt"></span> Upload
                         <asp:FileUpload ID="UploadNewProfilePicture" CssClass="UploadNewProfilePicture upload"  runat="server" />
                    </div>
                      <div>
                         <asp:Button ID="SubmitProfileChanges" class="btn btn-primary SubmitProfileChanges" OnClick="SubmitProfileChanges_Click" runat="server" Text="Save Changes" />
                       </div>
                     <div class="panel panel-danger" style="width:40%;" id="panelDangerProfilePic" runat="server">
                     <div class="panel-heading">
                     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> <asp:Label ID="UploadNewProfilePictureValidation" runat="server" Text=""></asp:Label>
                     </div>
                     </div>
                     
                <div class="MyInformationLabelDiv">
                    <asp:Label ID="MyInformationLabel" CssClass="MyInformationLabel" runat="server" Text="My information"></asp:Label>
                </div>
                 <div id="editDetailsDiv" class="editDetailsDiv" runat="server">
                          <asp:ListView ID="editProfileListView" runat="server" OnItemCommand="editProfileListView_ItemCommand" EditIndex="1" DataSourceID="editProfileDataSource" DataKeyNames="ID">
                              <EditItemTemplate >
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                       <asp:Label ID="ageLabel" runat="server" Text="Age:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9">
                                           <asp:TextBox Text='<%# Bind("Age") %>' CssClass="form-control" runat="server" ID="AgeTB" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="schoolLabel" runat="server" Text="School:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9">
                                          <asp:TextBox Text='<%# Bind("School") %>' CssClass="form-control" MaxLength="35" runat="server" ID="SchoolViewLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3  col-lg-3 col-xs-3 editProfileLabelDiv">
                                          <asp:Label ID="collegeLabel" runat="server" Text="College:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9">
                                           <asp:TextBox Text='<%# Bind("Collage") %>' CssClass="form-control"  MaxLength="35" runat="server" ID="CollageViewLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="universityLabel"  runat="server" Text="University:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9">
                                         <asp:TextBox Text='<%# Bind("University") %>' CssClass="form-control"  MaxLength="35" runat="server" ID="UniversityTViewLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="relationshipLabel" runat="server" Text="Relationship status:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9">
                                           <asp:TextBox ID="relationshipTB" runat="server"  MaxLength="20" CssClass="form-control" Text='<%# Bind("RelationshipStatus")%>'></asp:TextBox>
                                      </div>
                                  </div>
                                  <br />
                                     <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv" >
                                         <asp:Label ID="bioLabel" runat="server" Text="Bio:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9">
                                         <asp:TextBox Text='<%# Bind("Bio") %>' CssClass="form-control" runat="server" ID="BioViewLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                          <asp:Label ID="employerLabel" runat="server" Text="Employer:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9">
                                          <asp:TextBox Text='<%# Bind("Employer") %>' CssClass="form-control" MaxLength="40" runat="server" ID="EmployerViewLabel" />
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="contactnumLabel" runat="server" Text="Contact number:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9">
                                         <asp:TextBox Text='<%# Bind("[Contact number]") %>' CssClass="form-control" MaxLength="15" type="number" runat="server" ID="Contact_numberViewLabel" /></td>
                                      </div>
                                  </div>
                               <div class="editButtonsDiv">
                                    <asp:Button runat="server" CssClass="btn btn-primary" CommandName="Update" Text="Update" ID="UpdateButton" />
                                    <asp:Button runat="server" CssClass="btn btn-primary" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                               </div>
                                   
                           
                              </EditItemTemplate>
                              <ItemTemplate >
                                   <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                       <asp:Label ID="ageLabel" runat="server" Text="DOB:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                           <asp:Label Text='<%# Bind("Age") %>' runat="server" ID="AgeDisplayLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="schoolLabel" runat="server" Text="School:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                          <asp:Label Text='<%# Bind("School") %>' MaxLength="35" runat="server" ID="SchoolDisplayLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                          <asp:Label ID="collegeLabel" runat="server" Text="College:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                           <asp:Label Text='<%# Bind("Collage") %>'  MaxLength="35" runat="server" ID="CollageViewLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="universityLabel"  runat="server" Text="University:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                         <asp:Label Text='<%# Bind("University") %>'  MaxLength="35" runat="server" ID="UniversityDisplayLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="relationshipLabel" runat="server" Text="Relationship status:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                           <asp:Label ID="relationshipTB" runat="server"  MaxLength="20" Text='<%# Bind("RelationshipStatus")%>'/>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="bioLabel" runat="server" Text="Bio:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                         <asp:Label Text='<%# Bind("Bio") %>' runat="server" ID="BioDisplayLabel" /></td>
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                          <asp:Label ID="employerLabel" runat="server" Text="Employer:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                          <asp:Label Text='<%# Bind("Employer") %>' MaxLength="40" runat="server" ID="EmployerDisplayLabel" />
                                      </div>
                                  </div>
                                  <br />
                                  <div class="row">
                                      <div class="col-md-3 col-lg-3 col-xs-3 editProfileLabelDiv">
                                         <asp:Label ID="contactnumLabel" runat="server" Text="Contact number:"></asp:Label>
                                      </div>
                                      <div class="col-md-9 col-lg-9 col-xs-9 editProfileViewLabelDiv">
                                         <asp:Label Text='<%# Bind("[Contact number]") %>' MaxLength="15" type="number" runat="server" ID="Contact_numberDisplayLabel" /></td>
                                      </div>
                                  </div>
                                  <div class="editButtonDiv">
                                     <asp:LinkButton ID="EditButton" runat="Server" Text="Edit" CommandName="Edit" />
                                  </div>
                              </ItemTemplate>
                          </asp:ListView>
                       </div>
            </div>
           <div class="col-md-5 col-lg-5 col-xs-5 blockedAndCustomDiv">
                 <div class="col-md-3 col-lg-3 col-xs-3 BlockedDiv">
                <div class="BlockedLabelDiv">
                  <asp:Label id="BlockedLabel" CssClass="BlockedLabel" runat="server" >Blocked users</asp:Label>
                </div>
              <asp:ListView ID="BlockedUsersListView" runat="server" DataSourceID="AllBlockedUsers">
               <EmptyDataTemplate>
           <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 UserProfileNoBlockedViewDiv" >
                 <asp:Label ID="UserProfileNoBlockedUsersView" runat="server" Text="You have not blocked any users"></asp:Label>
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-xs-12">
                      <div class="BlockedDetailsDiv">
                        <div >
                           <asp:Label ID="User_NameLabel" runat="server" Text='<%# Eval("[User Name]") %>' />
                            <asp:Button ID="UnblockUserButton" CssClass="btn UnblockUserButton" runat="server" CommandArgument='<%#Eval("[Friend ID]")%>'  OnClick="UnblockUserButton_OnClick" Text="Unblock" />
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
                <div class="customFeedHeaderDiv">
                    <asp:Label ID="customFeedLabel" CssClass="customFeedLabel" runat="server" Text="Create custom feed"></asp:Label>
                </div>
               <div class="customFeedDiv">
                   <div>
                       <asp:TextBox ID="customFeedNameTB" placeholder="Enter custom feed name" CssClass="form-control" runat="server"></asp:TextBox>
                   </div>
                   <div class="customRadioButtonDiv">
                        <asp:RadioButton ID="selectStatusRadio"  Text="Status" runat="server" />
                        <asp:RadioButton ID="selectImageRadio" Text="Pictures" runat="server" />
                        <asp:RadioButton ID="selectVideoRadio" Text="Video's" runat="server" />
                        <asp:RadioButton ID="selectMusicRadio" Text="Music" runat="server" />
                   </div>
                     <div class="panel panel-danger" style="width:70%;" id="customFeedValidation" runat="server">
                     <div class="panel-heading">
                     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> <asp:Label ID="customFeedValidationLabel" runat="server" Text=""></asp:Label>
                     </div>
                     </div>
                   <div class="customFeedSubmitButtonDiv">
                       <asp:Button ID="customFeedSubmitButton" runat="server" CssClass="btn btn-primary" OnClick="customFeedSubmitButton_Click" Text="Submit selection" />
                   </div>
                      <div class="customFeedHeaderDivTwo">
                    <asp:Label ID="myFeedLabel" CssClass="customFeedLabel" runat="server" Text="My feeds"></asp:Label>
                </div>
                   <div class="myCustomFeeds ">
                       <asp:ListView ID="myCustomFeedsListView" runat="server" DataSourceID="myCustomFeedsDataSource">
                           <EmptyDataTemplate>
                              <div class="col-md-4 col-xs-4 col-lg-4"></div>
                             <div class="col-md-4 col-xs-4 col-lg-4 customFeedEmptyDiv" >
                               <asp:Label ID="UserProfileNoCustomFeedView" runat="server" Text="You have not added a custom feed"></asp:Label>
                            </div>
                             <div class="col-md-4 col-xs-4 col-lg-4"></div>
                           </EmptyDataTemplate>
                           <ItemTemplate>
                             <div class="row">
                                 <div class="col-md-8 col-lg-8 col-xs-8 customFeedNameDiv">
                                    <asp:Label ID="FeedNameLabel" runat="server" Text='<%# Eval("FeedName") %>' />
                                 </div>
                                 <div class="col-md-4  col-lg-4 col-xs-4">
                                     <asp:Button ID="deleteCustomFeedButton" CssClass="btn deleteCustomFeedButton" CommandArgument='<%# Eval("ID") %>' OnClick="deleteCustomFeedButton_Click" runat="server" Text="Delete feed" />
                                 </div>
                             </div>
                               
                           </ItemTemplate>
                       </asp:ListView>
                   </div>
               </div>
        </div>
    </div> 
        <hr />
   </div> 
    
    
     <div class="container">
	<div class="row">
		<div class="col-md-4 col-xs-4 col-lg-4 profileUploadBox ">
            <div class="panel panel-default">
                <div class="panel-body">
                    <asp:TextBox ID="StatusTextBoxProfile" CssClass="form-control StatusTextBoxProfile" placeholder="What are you up to?" runat="server"></asp:TextBox>
                      <div class="uploadTypeLabelDiv">
                        <asp:Label ID="uploadTypeLabel" CssClass="uploadTypeLabel" Text="" runat="server"></asp:Label>
                      </div>
                      <div id="fileUploadProfileButton" class="fileUpload btn btn-primary" runat="server">
                        <span class="uploadSpan glyphicon  glyphicon-download-alt"></span> Upload
                      <asp:FileUpload ID="imageOrMusicOrVideoUploadProfile" CssClass="upload"  runat="server" />
                    </div>
                     <asp:TextBox ID="imageOrMusicOrVideoUploadProfileDescription" CssClass="form-control imageOrMusicOrVideoUploadProfileDescription" placeholder="Add description" runat="server"></asp:TextBox>
                     <div class="panel panel-danger" id="panelDangerImage" runat="server">
                     <div class="panel-heading">
                     <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> <asp:Label ID="profileValidationLabel" runat="server" Text=""></asp:Label>
                     </div>
                     </div>
                </div>
              <div class="panel-footer">
                  <div class="btn-group">
                      <div class="col-md-3 col-xs-3 col-lg-3" >
                           <asp:ImageButton ID="StatusUploadIconButton" CssClass="StatusUploadIconButton" ImageUrl="~/images/StatusUpdate.png" runat="server" OnClick="StatusUploadIconButton_Click" />
                      </div>
                      <div class="col-md-3 col-xs-3 col-lg-3">
                           <asp:ImageButton ID="ImageUploadIconButton" CssClass="ImageUploadIconButton" ImageUrl="~/images/ImageUpload.png" runat="server" OnClick="ImageUploadIconButton_Click" />
                      </div>
                      <div class="col-md-3 col-xs-3 col-lg-3">
                             <asp:ImageButton ID="VideoUploadIconButton" CssClass="VideoUploadIconButton" ImageUrl="~/images/video.png" runat="server" OnClick="VideoUploadIconButton_Click" />
                      </div>
                      <div class="col-md-3 col-xs-3 col-lg-3">
                             <asp:ImageButton ID="MusicUploadIconButton" CssClass="MusicUploadIconButton" ImageUrl="~/images/music.png" runat="server" OnClick="MusicUploadIconButton_Click" />
                      </div>
                    </div>

                  <div class="SubmitStatusDiv pull-right">
                    <asp:Button ID="SubmitStatusOrImageOrMusicOrVideoProfile" CssClass="btn btn-primary SubmitStatusOrImageOrMusicOrVideoProfile" runat="server" Text="Post" onClick="SubmitStatusOrImageOrMusicOrVideoProfile_Click" />
                  </div> 

                </div> 
            </div>
          </div>
        <div class="col-md-5 col-lg-5 col-xs-5"></div>
            <div class="col-md-3 col-lg-3 col-xs-3 FriendsDiv">
                <div class="friendsLabelDiv">
                  <asp:Label id="freindsLabel" CssClass="FriendsLabel" runat="server" >Friends</asp:Label>
                </div>
        <asp:ListView ID="allFriendsListView" runat="server" DataSourceID="AllFriendsSQL">
            <EmptyDataTemplate>
           <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 UserProfileNoFriendsViewDiv" >
                 <asp:Label ID="UserProfileNoFriendsView" runat="server" Text="You currently have no friends"></asp:Label>
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div
            </EmptyDataTemplate>
            <ItemTemplate>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-xs-12">
                      <div class="FriendsDetailsDiv">
                        <div >
                           <asp:Label ID="User_NameLabel" runat="server" Text='<%# Eval("[User Name]") %>' />
                            <asp:Button ID="viewProfileAllFriendsButton" CssClass="btn viewProfileAllFriendsButton" runat="server" CommandArgument='<%#Eval("[Friend ID]")%>'  OnClick="viewAllFriendsProfileButton_OnClick" Text="View Profile" />
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
	</div>
  </div>

           <div class="ProfileFeedButtons">
                  <asp:Button ID="ProfileStatusUpdateFeedButton" CssClass="btn ProfileStatusUpdateFeedButton" runat="server" Text="Status Updates" OnClick="ProfileStatusUpdateFeedButton_Click"></asp:Button>
                   <asp:Button ID="ProfileImagesUpdateFeedButton" CssClass="btn ProfileImagesUpdateFeedButton" runat="server" Text="Image Updates" OnClick="ProfileImagesUpdateFeedButton_Click"></asp:Button>
                   <asp:Button ID="ProfileVideosUpdateFeedButton" CssClass="btn ProfileVideosUpdateFeedButton" runat="server" Text="Video Updates" OnClick="ProfileVideosUpdateFeedButton_Click"></asp:Button>
                   <asp:Button ID="ProfileMusicUpdateFeedButton" CssClass="btn ProfileMusicUpdateFeedButton" runat="server" Text="Music Updates" OnClick="ProfileMusicUpdateFeedButton_Click"></asp:Button>
          </div>

    <asp:ListView ID="StatusListView" runat="server" DataSourceID="StatusProfileSQL" OnItemDataBound="StatusListView_ItemDataBound" style="text-align:center;" DataKeyNames="ID">
        <EmptyDataTemplate>
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 UserProfileNoStatusViewDiv" >
                 <asp:Label ID="UserProfileNoStatusView" runat="server" Text="You currently have no status's"></asp:Label>
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
        </EmptyDataTemplate>
        <ItemTemplate>
            <div class="row">
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 statusProfileDiv">
                 <blockquote class="quote-box" >
                <div>
                 <asp:Label ID="StatusName" CssClass="StatusName" runat="server" Text=""></asp:Label>
                 <asp:Image ID="statusProfilePic" CssClass="smallProfPic" runat="server" />
                </div>
                <br />
                <div>
                 <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status")%>' />
                </div>
                <hr>
                <div class="blog-post-actions row">
                     <div class="blog-post-bottom pull-left">
                        <asp:Label ID="Time_StampLabel" CssClass="Time_StampLabel" runat="server" Text='<%# Eval("StatusTimeStamp") %>' />
                     </div>
                     <div class="pull-right">
                        <asp:LinkButton ID="ProfileDeleteStatus" CssClass="btn deleteButton" runat="server" Text="Delete"  CommandArgument='<%#Eval("ID")%>' OnClick="ProfileDeleteStatus_OnClick" ><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                    </div>
          </div>
         </blockquote>         
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
            </div>
        </ItemTemplate>
    </asp:ListView>


    <asp:ListView ID="PhotoListView" runat="server" DataKeyNames="ID" OnItemDataBound="PhotoListView_ItemDataBound" DataSourceID="PhotoProfileSQL">
        <EmptyDataTemplate>
         <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4  col-lg-4 UserProfileNoImageViewDiv" >
                 <asp:Label ID="UserProfileNoImageView" runat="server" Text="You currently have no image uploads"></asp:Label>
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
        </EmptyDataTemplate>
        <ItemTemplate>
             <div class="row">
            <div class="col-md-3 col-xs-3 col-lg-3"></div>
             <div class="col-md-5 col-xs-5 col-lg-5">
                 <blockquote class="quoteImage-box" >
                <div>
                 <asp:Label ID="PhotoName" CssClass="PhotoName" runat="server" Text=""></asp:Label>
                 <asp:Image ID="imageProfilePic" CssClass="smallProfPic" runat="server" />
                </div>
                <br />
                <div style="text-align:center;">
                 <asp:Image ID="PhotoLabelProfile" CssClass="PhotoLabelProfile" runat="server" ImageURL='<%#"/ImageUploads/"+ ((UserClass)Session["User"]).userName +"/" + Eval("Photo") %>' />
                </div>
                <div>
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("PhotoDescription") %>' />
                </div>
                <hr>
                <div class="blog-post-actions row">
               <div class="blog-post-bottom pull-left">
                <asp:Label ID="TimeStampLabel" cssClaas="TimeStampLabel" runat="server" Text='<%# Eval("[TimeStamp]") %>' />
               </div>
               <div class="pull-right">
                  <asp:LinkButton ID="ProfileDeleteImage" CssClass="btn deleteButton" runat="server" CommandArgument='<%#Eval("[ID]")%>' OnClick="ProfileDeleteImage_OnClick" ><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
               <div>
          </div>
         </blockquote>         
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
            </div>
        </ItemTemplate>
</asp:ListView>
<asp:ListView ID="videoProfileFeed" runat="server" DataKeyNames="ID"  OnItemDataBound="VideoListView_ItemDataBound" DataSourceID="videosProfileDataSource">
    <EmptyDataTemplate>
               <div class="col-md-4 col-xs-4 col-lg-4"></div>
                  <div class="col-md-4 col-xs-4 col-lg-4 ProfileNoVideosViewDiv" >
                 <asp:Label ID="ProfileNoVideosPostsLabel" runat="server" Text="You currently have no video uploads"></asp:Label>
                 </div>
                 <div class="col-md-4 col-xs-4 col-lg-4"></div>
    </EmptyDataTemplate>
    <ItemTemplate>
    <div class="row">
            <div class="col-md-3 col-xs-3 col-lg-3"></div>
             <div class="col-md-5 col-xs-5 col-lg-5 VideoProfile">
                 <blockquote class="quoteImage-box" >
                <div>
                 <asp:Label ID="UserNameLabel" runat="server" />
                <asp:Image ID="VideoProfilePicture" runat="server" CssClass="smallProfPic" />
                </div>
                <br />
                <div style="text-align:center;">
                 <div class="embed-responsive embed-responsive-4by3">
                 <video controls class="embed-responsive-item videoUploadIframe"  src='<%#"VideoUploads/" + ((UserClass)Session["User"]).userName + "/" + Eval("Video") %>'></video>
                 </div>              
                </div>
                <div>
                   <asp:Label ID="videoDescription" runat="server" Text='<%# Eval("VideoDescription") %>' />
                </div>
                <hr>
                <div class="blog-post-actions row">
               <div class="blog-post-bottom pull-left">
                  <asp:Label ID="videoTimeStamp" runat="server" Text='<%# Eval("[TimeStamp]") %>' />
               </div>
               <div class="pull-right">
                  <asp:LinkButton ID="profileDeleteVideo" CssClass="btn deleteButton" runat="server" CommandArgument='<%#Eval("[ID]")%>' OnClick="profileDeleteVideo_Click" ><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
               <div>
          </div>
         </blockquote>         
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
            </div>
    </ItemTemplate>
    </asp:ListView>
<asp:ListView ID="musicProfileFeed" runat="server" DataKeyNames="ID" OnItemDataBound="MusicListView_ItemDataBound" DataSourceID="MusicProfileDataSource">
    <EmptyDataTemplate>
                <div class="col-md-4 col-xs-4 col-lg-4"></div>
                  <div class="col-md-4 col-xs-4 col-lg-4 ProfileNoMusicViewDiv" >
                 <asp:Label ID="ProfileNoMusicPostsLabel" runat="server" Text="You currently have no music uploads"></asp:Label>
                 </div>
                 <div class="col-md-4 col-xs-4 col-lg-4"></div>
    </EmptyDataTemplate>
    <ItemTemplate>
            <div class="row">
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 musicProfile">
                 <blockquote class="quote-box" >
                <div>
                     <asp:Label ID="UserName_Label" runat="server"  />
                     <asp:Image ID="musicUploadProfPic"  CssClass="smallProfPic" runat="server"/>
                </div>
                <br />
                <div>
                  <audio controls>
	              <source src='<%#"MusicUploads/" + ((UserClass)Session["User"]).userName + "/" + Eval("Song") %>' type="audio/mpeg" />
                  <a href='<%#"MusicUploads/" + ((UserClass)Session["User"]).userName + "/" + Eval("Song") %>'></a>
                  </audio>  
                 <asp:Label ID="musicDescriptionLabel" runat="server" Text='<%# Eval("[MusicDescription]") %>' />
                </div>
                <hr>
                <div class="blog-post-actions row">
                  <div class="blog-post-bottom pull-left">
                     <asp:Label ID="TimeStamp_Label" CssClass="Time_StampLabel" runat="server" Text='<%# Eval("[TimeStamp]") %>' />
                  </div>
                  <div class="pull-right">
                     <asp:LinkButton ID="profileDeleteMusic" CssClass="btn deleteButton" runat="server" Text="Delete"  CommandArgument='<%#Eval("ID")%>' OnClick="profileDeleteMusic_Click" ><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                  </div>
               </div>
             </blockquote>         
            </div>
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
           </div>
    </ItemTemplate>
    </asp:ListView>


<asp:SqlDataSource ID="PhotoProfileSQL" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT ID, Description AS PhotoDescription, [User ID] AS UserID, Photo, [Time-Stamp] AS [TimeStamp], Deleted FROM Photos WHERE ([User ID] = ?) AND (Deleted &lt;&gt; 'True') ORDER BY [Time-Stamp] DESC">
</asp:SqlDataSource>
<asp:SqlDataSource ID="StatusProfileSQL" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT Status, [Time-Stamp] AS StatusTimeStamp, ID, Deleted FROM [Status's] WHERE ([User ID] = ?) AND (Deleted &lt;&gt; 'True') ORDER BY [Time-Stamp] DESC">
</asp:SqlDataSource>
    <asp:SqlDataSource ID="AllFriendsSQL" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT Friends.ID, Friends.[User ID], Friends.[Friend ID], [Users Table].[Profile Picture], [Users Table].[User Name], [Users Table].[First Name], [Users Table].[Last Name] FROM ([Users Table] INNER JOIN Friends ON [Users Table].ID = Friends.[Friend ID]) WHERE (Friends.Status = 'Accepted') AND (Friends.[User ID] = ?)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="AllBlockedUsers" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT Friends.ID, Friends.[User ID], Friends.[Friend ID], [Users Table].[Profile Picture], [Users Table].[User Name], [Users Table].[First Name], [Users Table].[Last Name] FROM ([Users Table] INNER JOIN Friends ON [Users Table].ID = Friends.[Friend ID]) WHERE (Friends.Status = 'Blocked') AND (Friends.[User ID] = ?)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="videosProfileDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT ID, Description AS VideoDescription, [User ID] AS UserID, Video, [Time-Stamp] AS [TimeStamp], Deleted FROM [Video's] WHERE ([User ID] = ?) AND (Deleted &lt;&gt; 'True') ORDER BY [Time-Stamp] DESC">
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="MusicProfileDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT ID, Description AS MusicDescription, [User ID] AS UserID, Song, [Time-Stamp] AS [TimeStamp], Deleted FROM Music WHERE ([User ID] = ?) AND (Deleted &lt;&gt; 'True') ORDER BY [Time-Stamp] DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="myCustomFeedsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [FeedName], ID FROM [CustomFeeds] WHERE ([User ID] = ?)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="editProfileDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:UmixDBConnectionString %>' ProviderName='<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>' SelectCommand="SELECT ID, Age, School, Collage, University, RelationshipStatus, Bio, Employer, [Contact number] FROM EditProfile WHERE (UserID = ? )" UpdateCommand="UPDATE [EditProfile] SET [Age] = @Age, [School] = @School, [Collage] = @Collage, [University] = @University, [RelationshipStatus] = @RelationshipStatus, [Bio] = @Bio, [Employer] = @Employer, [Contact number] = [@Contact number] WHERE (([UserID] = ?))">
    </asp:SqlDataSource>

    </asp:Content>




<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedInMaster.master" AutoEventWireup="true" CodeFile="LoggedInHome.aspx.cs" Inherits="css_LoggedInHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-xs-4 col-lg-4 myJumbotronTwo homeUploadBox" style="position: fixed">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <asp:TextBox ID="StatusTextBoxHome" CssClass="form-control StatusTextBoxHome" placeholder="What are you up to?" runat="server"></asp:TextBox>
                        <div class="uploadTypeLabelDiv">
                            <asp:Label ID="uploadTypeLabel" CssClass="uploadTypeLabel" Text="" runat="server"></asp:Label>
                        </div>
                        <div id="fileUploadHomeButton" class="fileUpload btn btn-primary" runat="server">
                            <span class="uploadSpan glyphicon  glyphicon-download-alt"></span>Upload
                         <asp:FileUpload ID="imageOrMusicOrVideoUploadHome" CssClass="upload" runat="server" />
                        </div>
                        <asp:TextBox ID="imageOrMusicOrVideoUploadHomeDescription" CssClass="form-control imageOrMusicOrVideoUploadHomeDescription" placeholder="Add description" runat="server"></asp:TextBox>
                        <div class="panel panel-danger" id="panelDanger" runat="server">
                            <div class="panel-heading">
                                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                <asp:Label ID="loggedInHomeValidationLabel" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <div class="btn-group">
                            <div class="col-md-3 col-xs-3 col-lg-3">
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
                            <asp:Button ID="SubmitStatusOrVideoOrMusicOrImageHome" CssClass="btn btn-primary SubmitStatusOrVideoOrMusicOrImageHome" runat="server" Text="Post" OnClick="SubmitStatusOrVideoOrMusicOrImageHome_Click" />
                        </div>

                    </div>
                </div>
                <div class="notificationDiv">
                    <div class="FriendRequestLabelDiv">
                        <asp:Label ID="FriendRequestLabel" CssClass="FriendRequestLabel" runat="server" Text="Friend Requests"></asp:Label>
                    </div>
                    <asp:ListView ID="notficationsListView" runat="server" DataSourceID="notficationsUserFeed">
                        <EmptyDataTemplate>
                            <div class="col-md-4 col-xs-4 col-lg-4"></div>
                            <div class="col-md-4 col-xs-4 col-lg-4 LoggedInHomeNoNotificationsViewDiv">
                                <asp:Label ID="LoggedInHomNoNotificationsLabel" runat="server" Text="You currently have no notifications"></asp:Label>
                            </div>
                            <div class="col-md-4 col-xs-4 col-lg-4"></div>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <div class="notificationsSection">
                                <div class="notificationDetails">
                                    <div>
                                        <asp:Label ID="NameLabel" CssClass="userNameNotifications" runat="server" Text='<%# Eval("Name") %>' />
                                    </div>
                                    <div class="row">
                                        <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                                        <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("[Last Name]") %>' />
                                    </div>
                                </div>
                                <asp:Image ID="smallProfPic" CssClass="smallProfPicNotifications" ImageUrl='<%# Eval("[ProfilePicture]") %>' runat="server" />
                                <asp:ImageButton ID="acceptFriendButton" ToolTip="Accept request" CssClass=" acceptFriendButton" ImageUrl="~/images/Tick.png" runat="server" CommandArgument='<%#Eval("ID")%>' OnClick="AcceptFriendButton_OnClick" />
                                <asp:ImageButton ID="declineFriendButton" ToolTip="Decline request" CssClass=" declineFriendButton" ImageUrl="~/images/Cross.png" runat="server" CommandArgument='<%#Eval("ID")%>' OnClick="DeclineFriendButton_OnClick" />
                                <asp:Button ID="viewProfileNotificationButton" CssClass="btn viewProfileNotificationButton" runat="server" CommandArgument='<%#Eval("[User ID]")%>' OnClick="viewProfileButton_OnClick" Text="View Profile" />
                                <div>
                                    <hr />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>

            <div class="LoggedInHomeFeedButtons row">
                <asp:Button ID="loggedInHomeStatusFeedButton" CssClass="btn loggedInHomeStatusFeedButton" runat="server" Text="Status Updates" OnClick="LoggedInHomeStatusFeedButton_Click"></asp:Button>
                <asp:Button ID="loggedInHomeImagesFeedButton" CssClass="btn loggedInHomeImagesFeedButton" runat="server" Text="Image Updates" OnClick="LoggedInHomeImagesFeedButton_Click"></asp:Button>
                <asp:Button ID="loggedInHomeVideoFeedButton" CssClass="btn loggedInHomeVideoFeedButton" runat="server" Text="Video Updates" OnClick="loggedInHomeVideoFeedButton_Click"></asp:Button>
                <asp:Button ID="loggedInHomeMusicFeedButton" CssClass="btn loggedInHomeMusicFeedButton" runat="server" Text="Music Updates" OnClick="loggedInHomeMusicFeedButton_Click"></asp:Button>
                <asp:DropDownList ID="feedPreferenceDropDown" ToolTip="Add a new custom feed from 'My account'" AutoPostBack="true" CssClass="btn feedPreferenceDropDown" OnSelectedIndexChanged="feedPreferenceDropDown_SelectedIndexChanged" runat="server">
                    <asp:ListItem disabled="disabled"  Text="Custom Feeds"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="col-md-8 col-xs-8 col-lg-8 HomeFeeds">
                <asp:ListView ID="statusHomeFeed" runat="server" DataSourceID="statusHomeFeedSqlDataSource">
                    <EmptyDataTemplate>
                        <div class="col-md-4 col-xs-4 col-lg-4"></div>
                        <div class="col-md-4 col-xs-4 col-lg-4 LoggedInHomeNoStatusViewDiv">
                            <asp:Label ID="LoggedInHomeNoStatusPostsLabel" runat="server" Text="Neither you or your friends have posted"></asp:Label>
                        </div>
                        <div class="col-md-4 col-xs-4 col-lg-4"></div>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-4 col-xs-4 col-lg-4"></div>
                            <div class="col-md-4 col-xs-4 col-lg-4 statusLoggedInHomeDiv">
                                <blockquote class="quote-box">
                                    <div>
                                        <asp:Label ID="UserName_Label" runat="server" Text='<%# Eval("[User Name]") %>' />
                                        <asp:Image ID="Profile_PictureLabel" CssClass="smallProfPic" runat="server" ImageUrl='<%# Eval("[Profile Picture]") %>' />
                                    </div>
                                    <br />
                                    <div>
                                        <asp:Label ID="Status_Label" runat="server" Text='<%# Eval("Status")%>' />
                                    </div>
                                    <hr>
                                    <div class="blog-post-actions row">
                                        <div class="blog-post-bottom pull-left">
                                            <asp:Label ID="TimeStamp_Label" CssClass="Time_StampLabel" runat="server" Text='<%# Eval("[Time-Stamp]") %>' />
                                        </div>
                                        <asp:ImageButton ID="LoggedInHomeReportStatusButton" ImageUrl="~/images/Report.png" CssClass="ReportButton" Visible='<%#Eval("[User ID]").ToString() != ((UserClass)Session["User"]).ID%>' runat="server" CommandArgument='<%#Eval("ID")%>' OnClick="LoggedInHomeReportStatusButton_Click"></asp:ImageButton>
                                        <asp:Label ID="LoggedInHomeReportStatusLabel" ToolTip='<%#Eval("ID")%>' CssClass="LoggedInHomeReportStatusLabel"  Visible="false" runat="server" Text="Reported"></asp:Label>
                                        <div class="pull-right">
                                            <asp:LinkButton ID="homeDeleteStatus" CssClass="btn deleteButton" Visible='<%#Eval("[User ID]").ToString() == ((UserClass)Session["User"]).ID%>' runat="server" Text="Delete" CommandArgument='<%#Eval("ID")%>' OnClick="LoggedInHomeDeleteStatus_OnClick"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                        </div>
                                    </div>
                                </blockquote>
                            </div>
                            <div class="col-md-4 col-xs-4 col-lg-4"></div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:ListView ID="photosListViewHome" runat="server" DataSourceID="photosHomeFeedSqlDataSource">
                    <EmptyDataTemplate>
                        <div class="col-md-4 col-xs-4 col-lg-4"></div>
                        <div class="col-md-4 col-xs-4 col-lg-4 LoggedInHomeNoImagesViewDiv">
                            <asp:Label ID="LoggedInHomeNoImagesViewLabel" runat="server" Text="Neither you or your friends have posted"></asp:Label>
                        </div>
                        <div class="col-md-4 col-xs-4 col-lg-4"></div>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-3 col-xs-3 col-lg-3"></div>
                            <div class="col-md-5 col-xs-5 col-lg-5 LoggedInImage">
                                <blockquote class="quoteImage-box">
                                    <div>
                                        <asp:Label ID="User_NameLabel" runat="server" Text='<%# Eval("[User Name]") %>' />
                                        <asp:Image ID="Profile_PictureLabel" runat="server" CssClass="smallProfPic" ImageUrl='<%# Eval("[Profile Picture]") %>' />
                                    </div>
                                    <br />
                                    <div style="text-align: center;">
                                        <asp:Image ID="PhotoLabel" CssClass="PhotoLabelHome" runat="server" ImageUrl='<%#"ImageUploads/" + Eval("[User Name]") + "/" + Eval("Photo") %>' />
                                    </div>
                                    <div>
                                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                    </div>
                                    <hr>
                                    <div class="blog-post-actions row">
                                        <div class="blog-post-bottom pull-left">
                                            <asp:Label ID="Time_StampLabel" runat="server" Text='<%# Eval("[Time-Stamp]") %>' />
                                        </div>
                                        <asp:ImageButton ID="LoggedInHomeReportImageButton" ImageUrl="~/images/Report.png" CssClass="ReportButton" Visible='<%#Eval("[User ID]").ToString() != ((UserClass)Session["User"]).ID%>' runat="server" CommandArgument='<%#Eval("ID")%>' OnClick="LoggedInHomeReportImageButton_Click"></asp:ImageButton>
                                        <asp:Label ID="LoggedInHomeReportImageLabel" ToolTip='<%#Eval("ID")%>' CssClass="LoggedInHomeReportImageLabel" runat="server" Visible="false" Text="Reported"></asp:Label>
                                        <div class="pull-right">
                                            <asp:LinkButton ID="homeDeleteImage" CssClass="btn deleteButton" runat="server" Visible='<%#Eval("[User ID]").ToString() == ((UserClass)Session["User"]).ID%>' CommandArgument='<%#Eval("[ID]")%>' OnClick="LoggedInHomeDeleteImage_OnClick"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                            <div>
                                            </div>
                                </blockquote>
                            </div>
                            <div class="col-md-4 col-xs-4 col-lg-4"></div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:ListView ID="videoHomeFeed" runat="server" DataSourceID="videoHomeFeedDataSource">
                    <EmptyDataTemplate>
                        <div class="col-md-4 col-xs-4 col-lg-4"></div>
                        <div class="col-md-4 col-xs-4 col-lg-4 LoggedInHomeNoVideosViewDiv">
                            <asp:Label ID="LoggedInHomeNoVideosPostsLabel" runat="server" Text="Neither you or your friends have posted"></asp:Label>
                        </div>
                        <div class="col-md-4 col-xs-4 col-lg-4"></div>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-3 col-xs-3 col-lg-3"></div>
                            <div class="col-md-5 col-xs-5 col-lg-5 LoggedInImage">
                                <blockquote class="quoteImage-box">
                                    <div>
                                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("[User Name]") %>' />
                                        <asp:Image ID="VideoProfilePicture" runat="server" CssClass="smallProfPic" ImageUrl='<%# Eval("[Profile Picture]") %>' />
                                    </div>
                                    <br />
                                    <div style="text-align: center;">
                                        <div class="embed-responsive embed-responsive-4by3">
                                            <video controls class="embed-responsive-item videoUploadIframe" src='<%#"VideoUploads/" + Eval("[User Name]") + "/" + Eval("Video") %>'></video>
                                        </div>
                                    </div>
                                    <div>
                                        <asp:Label ID="videoDescription" runat="server" Text='<%# Eval("Description") %>' />
                                    </div>
                                    <hr>
                                    <div class="blog-post-actions row">
                                        <div class="blog-post-bottom pull-left">
                                            <asp:Label ID="videoTimeStamp" runat="server" Text='<%# Eval("[Time-Stamp]") %>' />
                                        </div>
                                        <asp:ImageButton ID="LoggedInHomeReportVideoButton" ImageUrl="~/images/Report.png" CssClass="ReportButton" Visible='<%#Eval("[User ID]").ToString() != ((UserClass)Session["User"]).ID%>' runat="server" CommandArgument='<%#Eval("ID")%>' OnClick="LoggedInHomeReportVideoButton_Click"></asp:ImageButton>
                                        <asp:Label ID="LoggedInHomeReportVideoLabel" CssClass="LoggedInHomeReportVideoLabel" ToolTip='<%#Eval("ID")%>' runat="server" Visible="false" Text="Reported"></asp:Label>
                                        <div class="pull-right">
                                            <asp:LinkButton ID="homeDeleteVideo" CssClass="btn deleteButton" runat="server" Visible='<%#Eval("[User ID]").ToString() == ((UserClass)Session["User"]).ID%>' CommandArgument='<%#Eval("[ID]")%>' OnClick="homeDeleteVideo_Click"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                            <div>
                                            </div>
                                </blockquote>
                            </div>
                            <div class="col-md-4 col-xs-4 col-lg-4"></div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:ListView ID="musicHomeFeed" runat="server" DataSourceID="musicHomeFeedDataSource">
                    <EmptyDataTemplate>
                        <div class="col-md-4 col-xs-4 col-lg-4"></div>
                        <div class="col-md-4 col-xs-4 col-lg-4 LoggedInHomeNoMusicViewDiv">
                            <asp:Label ID="LoggedInHomeNoMusicPostsLabel" runat="server" Text="Neither you or your friends have posted"></asp:Label>
                        </div>
                        <div class="col-md-4 col-xs-4 col-lg-4"></div>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-4 col-xs-4 col-lg-4"></div>
                            <div class="col-md-4 col-xs-4 col-lg-4 musicLoggedInHomeDiv">
                                <blockquote class="quote-box">
                                    <div>
                                        <asp:Label ID="UserName_Label" runat="server" Text='<%# Eval("[User Name]") %>' />
                                        <asp:Image ID="musicUploadProfPic" CssClass="smallProfPic" runat="server" ImageUrl='<%# Eval("[Profile Picture]") %>' />
                                    </div>
                                    <br />
                                    <div>
                                        <audio controls>
	                                     <source src='<%#"MusicUploads/" + Eval("[User Name]") + "/" + Eval("Song") %>' type="audio/mpeg" />
                                         <a href='<%#"MusicUploads/" + Eval("[User Name]") + "/" + Eval("Song") %>'></a>
                                        </audio>
                                        <asp:Label ID="musicDescriptionLabel" runat="server" Text='<%# Eval("[Description]") %>' />
                                    </div>
                                    <hr>
                                    <div class="blog-post-actions row">
                                        <div class="blog-post-bottom pull-left">
                                            <asp:Label ID="TimeStamp_Label" CssClass="Time_StampLabel" runat="server" Text='<%# Eval("[Time-Stamp]") %>' />
                                        </div>
                                        <asp:ImageButton ID="LoggedInHomeReportMusicButton" ImageUrl="~/images/Report.png" CssClass="ReportButton" Visible='<%#Eval("[User ID]").ToString() != ((UserClass)Session["User"]).ID%>' runat="server" CommandArgument='<%#Eval("ID")%>' OnClick="LoggedInHomeReportMusicButton_Click"></asp:ImageButton>
                                        <asp:Label ID="LoggedInHomeReportMusicLabel" CssClass="LoggedInHomeReportMusicLabel" ToolTip='<%#Eval("ID")%>' Visible="false" runat="server" Text="Reported"></asp:Label>
                                        <div class="pull-right">
                                            <asp:LinkButton ID="homeDeleteMusic" CssClass="btn deleteButton" Visible='<%#Eval("[User ID]").ToString() == ((UserClass)Session["User"]).ID%>' runat="server" Text="Delete" CommandArgument='<%#Eval("ID")%>' OnClick="homeDeleteMusic_Click"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                                        </div>
                                    </div>
                                </blockquote>
                            </div>
                            <div class="col-md-4 col-xs-4 col-lg-4"></div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>




                <asp:ListView ID="customListView" runat="server">
                    <ItemTemplate>
                        <placeholder runat="server" visible='<%# Eval("type").ToString().Equals("STATUS") %>'>
              <div class="row"  >
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 statusLoggedInHomeDivCustom">
                 <blockquote class="quote-box" >
                <div>
                     <asp:Label ID="UserName_LabelStatusCustom" runat="server"  Text='<%# Eval("username") %>' visible='<%# Eval("type").ToString().Equals("STATUS") %>' />
                     <asp:Image ID="Profile_PictureLabelCustom"  CssClass="smallProfPic" runat="server" ImageUrl='<%# Eval("profilePic") %>' visible='<%# Eval("type").ToString().Equals("STATUS") %>'/>
                </div>
                <br />
                <div>
                 <asp:Label ID="Status_LabelCustom" runat="server" Text='<%# Eval("data") %>' visible='<%# Eval("type").ToString().Equals("STATUS") %>'/>
                </div>
                <hr>
                <div class="blog-post-actions row">
                  <div class="blog-post-bottom pull-left">
                     <asp:Label ID="TimeStamp_LabelCustom" CssClass="Time_StampLabel" runat="server" Text='<%# Eval("timestamp")%>' visible='<%# Eval("type").ToString().Equals("STATUS") %>'  />
                  </div>
                     <asp:ImageButton ID="LoggedInHomeReportStatusButtonCustom" ImageUrl="~/images/Report.png" CssClass="ReportButton" Visible='<%# Eval("userID").ToString() != ((UserClass)Session["User"]).ID && Eval("type").ToString().Equals("STATUS") %>'  runat="server"  CommandArgument='<%# Eval("id")  %>' OnClick="LoggedInHomeReportStatusButton_Click" ></asp:ImageButton>
                     <asp:Label ID="LoggedInHomeReportStatusLabelCustom" CssClass="LoggedInHomeReportStatusLabel" ToolTip='<%# Eval("id") %>' Visible="false" runat="server" Text="Reported"></asp:Label>
                  <div class="pull-right">
                     <asp:LinkButton ID="homeDeleteStatusCustom" CssClass="btn deleteButton" Visible='<%# Eval("userID").ToString() == ((UserClass)Session["User"]).ID  && Eval("type").ToString().Equals("STATUS") %>' runat="server" Text="Delete"  CommandArgument='<%# Eval("id") %>' OnClick="LoggedInHomeDeleteStatus_OnClick" ><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                  </div>
               </div>
             </blockquote>         
            </div>
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
           </div>
            </placeholder>
                        <!-- Images -->
               <placeholder runat="server" visible='<%# Eval("type").ToString().Equals("PHOTOS") %>'> 
            <div class="row">
            <div class="col-md-3 col-xs-3 col-lg-3"></div>
             <div class="col-md-5 col-xs-5 col-lg-5 LoggedInImageCustom">
                 <blockquote class="quoteImage-box" >
                <div>
                 <asp:Label ID="User_NameLabelCustom2" runat="server" Text='<%# Eval("username") %>' visible='<%# Eval("type").ToString().Equals("PHOTOS") %>' />
                <asp:Image ID="PhotoProfPic" runat="server" CssClass="smallProfPic" ImageUrl='<%# Eval("profilePic") %>' visible='<%# Eval("type").ToString().Equals("PHOTOS") %>' />
                </div>
                <br />
                <div style="text-align:center;">
                 <asp:Image ID="PhotoLabelCustom2" CssClass="PhotoLabelHome" runat="server" ImageUrl='<%# "ImageUploads/" + Eval("username") + "/" + Eval("data")%>' visible='<%# Eval("type").ToString().Equals("PHOTOS") %>' />
                </div>
                <div>
                   <asp:Label ID="DescriptionLabelCustom2" runat="server" Text='<%# Eval("description") %>'  visible='<%# Eval("type").ToString().Equals("PHOTOS") %>' />
                </div>
                <hr>
                <div class="blog-post-actions row">
               <div class="blog-post-bottom pull-left">
                  <asp:Label ID="Time_StampLabelCustom2" runat="server" Text='<%# Eval("timestamp") %>' visible='<%# Eval("type").ToString().Equals("PHOTOS") %>'  />
               </div>
               <asp:ImageButton ID="LoggedInHomeReportImageButtonCustom2" ImageUrl="~/images/Report.png" CssClass="ReportButton" Visible='<%# Eval("userID").ToString() != ((UserClass)Session["User"]).ID && Eval("type").ToString().Equals("PHOTOS") %> ' runat="server"  CommandArgument='<%# Eval("id")%>' OnClick="LoggedInHomeReportImageButton_Click" ></asp:ImageButton>
              <asp:Label ID="LoggedInHomeReportImageLabelCustom2" CssClass="LoggedInHomeReportImageLabel" ToolTip='<%# Eval("id") %>' runat="server" Visible="false" Text="Reported"></asp:Label>
               <div class="pull-right">
                  <asp:LinkButton ID="homeDeleteImageCustom2" CssClass="btn deleteButton" runat="server" Visible='<%# Eval("userID").ToString() == ((UserClass)Session["User"]).ID && Eval("type").ToString().Equals("PHOTOS") %>' CommandArgument='<%# Eval("id") %>' OnClick="LoggedInHomeDeleteImage_OnClick" ><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
               <div>
          </div>
         </blockquote>         
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
            </div>
          </placeholder>
                        <!-- Videos -->
                        <placeholder runat="server" visible='<%# Eval("type").ToString().Equals("VIDEO") %>'>
            <div class="row" >
            <div class="col-md-3 col-xs-3 col-lg-3"></div>
             <div class="col-md-5 col-xs-5 col-lg-5 LoggedInVideoCustom">
                 <blockquote class="quoteImage-box" >
                <div>
                 <asp:Label ID="UserNameLabelCustom3" runat="server" Text='<%#  Eval("username") %>' visible='<%# Eval("type").ToString().Equals("VIDEO") %>' />
                <asp:Image ID="VideoProfilePictureCustom3" runat="server" CssClass="smallProfPic" ImageUrl='<%#  Eval("profilePic") %>'  visible='<%# Eval("type").ToString().Equals("VIDEO") %>'/>
                </div>
                <br />
                <div style="text-align:center;">
                 <div class="embed-responsive embed-responsive-4by3">
                 <video controls class="embed-responsive-item videoUploadIframe" runat="server" src='<%# "VideoUploads/" + Eval("username") + "/" + Eval("data") %>' visible='<%# Eval("type").ToString().Equals("VIDEO") %>'></video>
                 </div>              
                </div>
                <div>
                   <asp:Label ID="videoDescriptionCustom3" runat="server" Text='<%# Eval("description") %>' visible='<%# Eval("type").ToString().Equals("VIDEO") %>' />
                </div>
                <hr>
                <div class="blog-post-actions row">
               <div class="blog-post-bottom pull-left">
                  <asp:Label ID="videoTimeStampCustom3" runat="server" Text='<%# Eval("timestamp") %>' visible='<%# Eval("type").ToString().Equals("VIDEO") %>' />
               </div>
               <asp:ImageButton ID="LoggedInHomeReportVideoButtonCustom3" ImageUrl="~/images/Report.png" CssClass="ReportButton" Visible='<%#   Eval("userID").ToString() != ((UserClass)Session["User"]).ID && Eval("type").ToString().Equals("VIDEO") %>' runat="server"  CommandArgument='<%# Eval("id")%>' OnClick="LoggedInHomeReportVideoButton_Click" ></asp:ImageButton>
              <asp:Label ID="LoggedInHomeReportVideoLabelCustom3" CssClass="LoggedInHomeReportVideoLabel" ToolTip='<%# Eval("id") %>' runat="server" Visible="false" Text="Reported"></asp:Label>
               <div class="pull-right">
                  <asp:LinkButton ID="homeDeleteVideoCustom3" CssClass="btn deleteButton" runat="server" Visible='<%#  Eval("userID").ToString() == ((UserClass)Session["User"]).ID && Eval("type").ToString().Equals("VIDEO")  %>' CommandArgument='<%# Eval("id") %>' OnClick="homeDeleteVideo_Click" ><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
               <div>
          </div>
         </blockquote>         
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
            </div>
           </placeholder>
                        <!-- Music -->
                        <placeholder runat="server" visible='<%# Eval("type").ToString().Equals("MUSIC") %>'>
              <div class="row">
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
             <div class="col-md-4 col-xs-4 col-lg-4 musicLoggedInHomeDivCustom">
                 <blockquote class="quote-box" >
                <div>
                     <asp:Label ID="userNameMusic" runat="server" Text='<%# Eval("username") %>' visible='<%# Eval("type").ToString().Equals("MUSIC") %>' />
                     <asp:Image ID="musicUploadProfPicCustom4"  CssClass="smallProfPic" runat="server" ImageUrl='<%# Eval("profilePic")  %>' visible='<%# Eval("type").ToString().Equals("MUSIC") %>'/>
                </div>
                <br />
                <div>
                  <audio controls>
	              <source src='<%# "MusicUploads/" + Eval("username") + "/" + Eval("data") %>' visible='<%# Eval("type").ToString().Equals("MUSIC") %>' type="audio/mpeg" />
                  <a href='<%# "MusicUploads/" + Eval("username") + "/" + Eval("data") %>' visible='<%# Eval("type").ToString().Equals("MUSIC") %>' runat="server"></a>
                  </audio>  
                 <asp:Label ID="musicDescriptionLabelCustom4" runat="server" Text='<%# Eval("description") %>' visible='<%# Eval("type").ToString().Equals("MUSIC") %>'/>
                </div>
                <hr>
                <div class="blog-post-actions row">
                  <div class="blog-post-bottom pull-left">
                     <asp:Label ID="Time_StampLabelCustom4" CssClass="Time_StampLabelCustom4" runat="server" Text='<%# Eval("timestamp") %>' visible='<%# Eval("type").ToString().Equals("MUSIC") %>' />
                  </div>
                     <asp:ImageButton ID="LoggedInHomeReportMusicButtonCustom4" ImageUrl="~/images/Report.png" CssClass="ReportButton" Visible='<%#  Eval("userID").ToString() != ((UserClass)Session["User"]).ID && Eval("type").ToString().Equals("MUSIC")  %>' runat="server"  CommandArgument='<%# Eval("id") %>' OnClick="LoggedInHomeReportMusicButton_Click" ></asp:ImageButton>
                     <asp:Label ID="LoggedInHomeReportMusicLabelCustom4" CssClass="LoggedInHomeReportMusicLabel" ToolTip='<%# Eval("id") %>' Visible="false" runat="server" Text="Reported"></asp:Label>
                  <div class="pull-right">
                     <asp:LinkButton ID="homeDeleteMusicCustom4" CssClass="btn deleteButton" Visible='<%#  Eval("userID").ToString() == ((UserClass)Session["User"]).ID && Eval("type").ToString().Equals("MUSIC")  %>' runat="server" Text="Delete"  CommandArgument='<%# Eval("id") %>' OnClick="homeDeleteMusic_Click" ><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                  </div>
               </div>
             </blockquote>         
            </div>
            <div class="col-md-4 col-xs-4 col-lg-4"></div>
           </div>
           </placeholder>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="statusHomeFeedSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Status's].ID, [Status's].[User ID], [Status's].Status, [Status's].[Time-Stamp], [Users Table].[User Name], [Users Table].[Profile Picture] FROM ([Status's] INNER JOIN [Users Table] ON [Status's].[User ID] = [Users Table].ID) WHERE ([Status's].[User ID] = ?) AND ([Status's].Deleted &lt;&gt; 'True') OR ([Status's].[User ID] IN (SELECT [Friend ID] FROM Friends WHERE ([User ID] = ?) AND (Status = 'Accepted') AND ([Status's].Deleted &lt;&gt; 'True')))  ORDER BY [Time-Stamp] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="notficationsUserFeed" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Users Table].[User Name] AS [Name],[Users Table].[Profile Picture] AS [ProfilePicture], [Users Table].[First Name] AS [fname], [Users Table].[Last Name], Friends.[ID] , Friends.[User ID], Friends.[Friend ID] FROM (Friends INNER JOIN [Users Table] ON Friends.[User ID] = [Users Table].ID) WHERE (Friends.[Status] = 'Pending') AND (Friends.[Friend ID] = @Friend)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="photosHomeFeedSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT Photos.ID, Photos.[User ID], Photos.Photo, Photos.[Time-Stamp], Photos.Description, [Users Table].[User Name], [Users Table].[Profile Picture] FROM (Photos INNER JOIN [Users Table] ON Photos.[User ID] = [Users Table].ID) WHERE (Photos.[User ID] = ?) AND (Photos.Deleted &lt;&gt; 'True') OR (Photos.[User ID] IN (SELECT [Friend ID] FROM Friends WHERE ([User ID] = ?) AND (Status = 'Accepted') AND (Photos.Deleted &lt;&gt; 'True')))  ORDER BY [Time-Stamp] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="videoHomeFeedDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Video's].ID,  [Video's].[User ID],  [Video's].Video,  [Video's].[Time-Stamp],  [Video's].Description, [Users Table].[User Name], [Users Table].[Profile Picture] FROM ( [Video's] INNER JOIN [Users Table] ON  [Video's].[User ID] = [Users Table].ID) WHERE ( [Video's].[User ID] = ?) AND ( [Video's].Deleted &lt;&gt; 'True') OR ( [Video's].[User ID] IN (SELECT [Friend ID] FROM Friends WHERE ([User ID] = ?) AND (Status = 'Accepted') AND ( [Video's].Deleted &lt;&gt; 'True')))  ORDER BY [Time-Stamp] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="musicHomeFeedDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT Music.ID,  Music.[User ID],  Music.Song,  Music.[Time-Stamp],  Music.Description, [Users Table].[User Name], [Users Table].[Profile Picture] FROM ( Music INNER JOIN [Users Table] ON  Music.[User ID] = [Users Table].ID) WHERE ( Music.[User ID] = ?) AND ( Music.Deleted &lt;&gt; 'True') OR ( Music.[User ID] IN (SELECT [Friend ID] FROM Friends WHERE ([User ID] = ?) AND (Status = 'Accepted') AND ( Music.Deleted &lt;&gt; 'True')))  ORDER BY [Time-Stamp] DESC"></asp:SqlDataSource>

</asp:Content>



<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedInMaster.master" AutoEventWireup="true" CodeFile="ChatPage.aspx.cs" Inherits="ChatPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" src="Scripts/jquery-1.6.4.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.signalR-1.1.4.js"></script>
    <script type="text/javascript" src="signalr/hubs"></script>
    <script type="text/javascript">

        var myConversations = [];
        var connectedUsers = [];

        $(document).ready(function () {
            document.getElementById("wantsToChatLabel").classList.add("hideMessageList");
        });

        var myUsername = '<%= Session["username"]%>';

        function createNewList(username) {

            var li = document.createElement('ul');
            li.setAttribute('id', "messagesList" + username);
            li.setAttribute('class', "messageList");
            document.getElementById('messagesDiv').appendChild(li);
        }

        function changeUserNameLabel(otherUserName) {
            document.getElementById("wantsToChatLabel").classList.remove("viewMessageList");
            document.getElementById("wantsToChatLabel").classList.add("hideMessageList");
                var conversation;
                if (otherUserName.length > myUsername.length) {
                    conversation = otherUserName + myUsername;
                }
                else {
                    conversation = myUsername + otherUserName;
                }

                // checks if its the first message sent.
                var doesExist = false;
                for (var b = 0; b < myConversations.length; b++) {
                    if (myConversations[b] == conversation) {
                        doesExist = true;
                    }
                }

                if (!doesExist) {
                    myConversations.push(conversation);
                    createNewList(conversation);
                }
                for (var a = 0; a < myConversations.length; a++) {
                    if (myConversations[a] == conversation) {
                        // set to visible
                        document.getElementById("messagesList" + myConversations[a]).classList.add("viewMessageList");
                        document.getElementById("messagesList" + myConversations[a]).classList.remove("hideMessageList");
                    } else {
                        // set to invisible 
                        document.getElementById("messagesList" + myConversations[a]).classList.add("hideMessageList");
                        document.getElementById("messagesList" + myConversations[a]).classList.remove("viewMessageList");
                    }

                }
                document.getElementById("ChatNameLabel").innerText = otherUserName;
        };

        $(function () {
            var chatService = $.connection.myChatHub;

            var usersTalkingToMe = [];

            chatService.client.addErrorMessage = function (otherUserName)
            {
                // set a lable to this person is not online.
                document.getElementById("wantsToChatLabel").classList.add("viewMessageList");
                document.getElementById("wantsToChatLabel").classList.remove("hideMessageList");
                document.getElementById("wantsToChatLabel").appendChild(document.createTextNode(otherUserName + " is currently offline."));
            }

            chatService.client.addMessage = function (username, conversation, message) {
                document.getElementById("wantsToChatLabel").appendChild(document.createTextNode(""));
                var doesExist = false;
                for (var b = 0; b < myConversations.length; b++) {
                    if (myConversations[b] == conversation) {
                        doesExist = true;
                    }
                }

                if (doesExist) {
                    var li = document.createElement('li');
                    var htmlMessage = document.createTextNode(username + ":" + message);
                    li.appendChild(htmlMessage);
                    document.getElementById("messagesList" + conversation).appendChild(li);
                } else
                {
                    document.getElementById("wantsToChatLabel").classList.add("viewMessageList");
                    document.getElementById("wantsToChatLabel").classList.remove("hideMessageList");
                    document.getElementById("wantsToChatLabel").innerText = username + " wants to chat with you";
                    myConversations.push(conversation);
                    createNewList(conversation);
                    var li = document.createElement('li');
                    var htmlMessage = document.createTextNode(username + ":" + message);
                    li.appendChild(htmlMessage);
                    document.getElementById("messagesList" + conversation).appendChild(li);
                    document.getElementById("messagesList" + conversation).classList.add("hideMessageList");
                }
                document.getElementById('tbMessage').value = "";
            };

            function createNewList(username)
            {
                usersTalkingToMe[username] = username;
                var li = document.createElement('ul');
                li.setAttribute('id', "messagesList" + username);
                li.setAttribute('class', "messageList");
                document.getElementById('messagesDiv').appendChild(li);
            }

            $('#sendMessage').click(function () {
                chatService.server.send($('#tbMessage').val(), document.getElementById('ChatNameLabel').innerText, myUsername);
            });

            $.connection.hub.start().done(function () {
                chatService.server.registerConId(myUsername);
            });
        });
    </script>
   

    <div class="row">
        <div class="alert alert-info alert-dismissible " id="wantsToChatLabel">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="col-md-5 col-lg-5 col-xs-5 ChatDiv">
            
            <asp:ListView ID="FriendsChatListView" runat="server" DataSourceID="FriendsChatListData">
                <EmptyDataTemplate>
                  <div class="col-md-4 col-xs-4 col-lg-4"></div>
                  <div class="col-md-4 col-xs-4 col-lg-4 ChatServiceNoFriendsDiv" >
                  <asp:Label ID="ChatServiceNoFriendsLabel" runat="server" Text="Add friends to chat"></asp:Label>
                  </div>
                  <div class="col-md-4 col-xs-4 col-lg-4"></div>
                </EmptyDataTemplate>
                <ItemTemplate>
               <div class="ChatSection">
                 <div class="ChatDetails">
                    <div>
                      <asp:Label ID="NameLabel" CssClass="userNameChat" runat="server" Text='<%# Eval("Name") %>' />
                   </div>
                  <div class="row">
                      <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                      <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("[Last Name]") %>' />
                 </div>
                   </div>
                     <div>
                        <asp:Image ID="smallProfPicChat" CssClass="smallProfPicChat" imageURL='<%# Eval("[ProfilePicture]") %>' runat="server" />
                     </div>
                     <div>
                         <asp:Button ID="chatButton" CssClass="chatButton btn btn-primary" runat="server"  onkeydown="chat()"  OnClientClick='<%# "changeUserNameLabel(\"" + Eval("Name") + "\"); return false;" %>' Text="Start Chat" />
                     </div>
                   <hr />
                   </div>
               </ItemTemplate>
            </asp:ListView>
          </div>

    <div class="col-md-7 col-lg-7 col-xs-7 MessagingDiv">
  
      <div >
          <div class="OtherChatUserDiv">
            <asp:Label ID="YoureChattingWithLabel" CssClass="YoureChattingWithLabel" runat="server" Text="You are chatting with:"></asp:Label>
            <label id="ChatNameLabel" class="ChatNameLabel"></label>
          </div>
          <div id="messagesDiv">
                 
              </div>
          <div class="row">
               <input type="text" class="tbMessage form-control" id="tbMessage" /> <input type="button" onkeydown="chat()" class="sendMessage btn btn-primary" id="sendMessage" value="Send" />

          </div>
         </div> 
        
  </div>
 </div>
<asp:SqlDataSource ID="FriendsChatListData" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Users Table].[User Name] AS [Name],[Users Table].[Profile Picture] AS [ProfilePicture], [Users Table].[First Name] AS [fname], [Users Table].[Last Name], Friends.[ID] , Friends.[User ID], Friends.[Friend ID] FROM (Friends INNER JOIN [Users Table] ON Friends.[User ID] = [Users Table].ID) WHERE (Friends.[Status] = 'Accepted') AND (Friends.[Friend ID] = @Friend)"></asp:SqlDataSource>
</asp:Content>


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR.Hubs;
using Microsoft.AspNet.SignalR;
using System.Collections;

namespace SignalRChat
{
    [HubName("myChatHub")]
    public class ChatHub : Hub
    {
        private static IDictionary htUsers_ConIds = new Dictionary<string, string>();
        public int numberOfLists = 0;

        public void Send(string message, string chatTo, string username)
        {
            if (chatTo.Length > 0)
            {
                try
                {
                    string connid = htUsers_ConIds[chatTo].ToString();
                    string conversation = "";

                    if (chatTo.Length > username.Length)
                    {
                        conversation = chatTo + username;
                    }
                    else
                    {
                        conversation = username + chatTo;
                    }
                        Clients.Client(connid).addMessage(username, conversation, message);
                        Clients.Caller.addMessage(username, conversation, message);

                }
                catch (Exception)
                {
                    Clients.Caller.addErrorMessage(chatTo);
                }
            }
           
        }

        // because Usernames are unique it takes the users UN and the other persons UN and combines them.
        // this will be added to the chat hub server. 
        
        public void registerConId(string userName)
        {
            bool alreadyExists = false;
            if (htUsers_ConIds.Count == 0)
            {
                htUsers_ConIds.Add(userName, Context.ConnectionId);
            }
            else
            {
                foreach (string key in htUsers_ConIds.Keys)
                {
                    if (key == userName)
                    {
                        htUsers_ConIds[key] = Context.ConnectionId;
                        alreadyExists = true;
                        break;
                    }
                }
                if (!alreadyExists)
                {
                    htUsers_ConIds.Add(userName, Context.ConnectionId);
                }
            }  
        }
    }
}


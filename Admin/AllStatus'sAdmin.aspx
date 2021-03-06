﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AllStatus'sAdmin.aspx.cs" Inherits="Admin_AllStatus_sAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Label ID="adminStatusHeader" CssClass="adminHeader" runat="server" Text="All status's" ></asp:Label>
        <div class="adminListViews">
            <asp:ListView ID="adminViewAllStatusListView" runat="server" DataSourceID="allStatusDataSource">
                <ItemTemplate>
                <div class="row usersRow">
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
                          <asp:Label ID="timestampLabel" runat="server" Text="Timestamp: "></asp:Label>
                         <asp:Label ID="timestamp_Label" runat="server" Text='<%# Eval("[Time-Stamp]") %>' />
                        </div>

                       </div>
                         <div class="col-md-8 ">
                           <asp:Label ID="status_Label" runat="server" Text="Status: "></asp:Label>
                           <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("[Status]") %>' />
                         </div>
                       </div>
                <div class="col-md-4">
                       <asp:Button ID="deleteStatusAdminAllButton" CssClass="btn btn-primary"  CommandArgument='<%# Eval("StatusID") %>' OnClick="deleteStatusAdminAllButton_Click" runat="server" Text="Delete" />
                        <asp:Button ID="viewProfileStatusAdminAllButton" CssClass="btn btn-primary" CommandArgument='<%# Eval("UserID") %>' OnClick="viewProfileStatusAdminAllButton_Click" runat="server" Text="View profile" />
                    </div></div>
                </ItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="allStatusDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Status's].ID AS StatusID, [Users Table].ID AS UserID, [User ID], Status, [Time-Stamp], Deleted, Reported, [Users Table].[User Name] AS UserName, [Users Table].[First Name] AS FirstName, [Users Table].[Last Name] AS LastName FROM [Status's] INNER JOIN [Users Table] ON [Status's].[User ID] = [Users Table].ID"></asp:SqlDataSource>
      </div>
</asp:Content>


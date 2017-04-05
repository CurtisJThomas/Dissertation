<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedInMaster.master" AutoEventWireup="true" CodeFile="SearchPage.aspx.cs" Inherits="SearchPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="resultsListView" runat="server" DataKeyNames="ID" DataSourceID="resultDataSource" >
        <EmptyDataTemplate>
            <div class="col-md-4 col-xs-4 col-lg-4" ></div>
             <div class="col-md-4 searchNoResultsDiv" >
                 <asp:Label ID="seachNoResultsMessage" runat="server" Text="No results"></asp:Label>
             </div>
             <div class="col-md-4 col-xs-4 col-lg-4"></div>
        </EmptyDataTemplate>
        <ItemTemplate>
       <div class="row searchRow">
                <div class="col-md-4 col-xs-4 col-lg-4"></div>
                <div class="col-md-4 col-xs-4 col-lg-4 searchCol">
                    <hr />
                    <div class="row"> 
                         <div class="col-md-6 col-xs-6 col-lg-6">
                            <div class="searchDetails">
                               <div>
                                <asp:Label ID="SearchUserNameLabel" runat="server" Text='<%# Eval("[User Name]") %>' />
                             </div>
                             <div>
                                 <asp:Label ID="SearchFirstNameLabel" CssClass="firstNameLabelSearch" runat="server" Text='<%# Eval("[First Name]") %>' />
                                 <asp:Label ID="SearchLastNameLabel" CssClass="lastNameLabelSearch" runat="server" Text='<%# Eval("[Last Name]") %>' />
                             </div>
                            </div>
                             <div class="viewProfileButtonSearchDiv">
                                 <asp:Button ID="viewSearchProfile" CssClass="viewProfileButtonSearch btn " CommandArgument='<%#Eval("ID")%>'  OnClick="searchViewProfile_OnClick" runat="server" Text="View profile" />
                             </div>
                             </div>
                    <div class="col-md-6 col-xs-6 col-lg-6">
                         <asp:Image ID="searchProfileImage" CssClass="ProfilePictureSearch" imageURL='<%# Eval("[Profile Picture]") %>' runat="server" />
                    </div>
                 </div>
                    
                  <hr/>
                </div>
               <div class="col-md-4 col-xs-4 col-lg-4" ></div>
            </div>
          </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="resultDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:UmixDBConnectionString %>" ProviderName="<%$ ConnectionStrings:UmixDBConnectionString.ProviderName %>" SelectCommand="SELECT [Users Table].[ID] AS ID, [Users Table].[First Name], [Users Table].[Last Name], [Users Table].[User Name], [Users Table].[Profile Picture], Friends.[Friend ID], Friends.Status FROM [Users Table] LEFT JOIN (SELECT * FROM Friends WHERE [User ID] = @ID) AS Friends ON [Users Table].ID = Friends.[Friend ID]  WHERE [Users Table].[ID] IN ( SELECT [ID] FROM [Users Table] WHERE 

((Friends.Status = 'Accepted') OR (Friends.Status = 'Pending') OR (Friends.Status = 'Requesting') OR (Friends.Status IS NULL) AND ([Users Table].ID &lt;&gt; @ID)) AND (

(([Users Table].[First Name] LIKE '%'&amp;  ? &amp; '%') OR ([Users Table].[First Name] LIKE '%' &amp; ?) OR ([Users Table].[First Name] LIKE ? &amp; '%'))    OR

(([Users Table].[Last Name] LIKE '%'&amp;  ? &amp; '%') OR ([Users Table].[Last Name] LIKE '%' &amp; ?) OR ([Users Table].[Last Name] LIKE ? &amp; '%') )    OR

(([Users Table].[User Name] LIKE '%'&amp;  ? &amp; '%') OR ([Users Table].[User Name] LIKE '%' &amp; ?) OR ([Users Table].[User Name] LIKE ? &amp; '%'))   OR

((([Users Table].[First Name] LIKE '%'&amp;  ? &amp; '%') OR ([Users Table].[First Name] LIKE '%' &amp; ?) OR ([Users Table].[First Name] LIKE ? &amp; '%'))    AND (([Users Table].[Last Name] LIKE '%'&amp;  ? &amp; '%') OR ([Users Table].[Last Name] LIKE '%' &amp; ?) OR ([Users Table].[Last Name] LIKE ? &amp; '%'))  ) 

)
)
">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchFirstWord" />
            <asp:SessionParameter Name="?" SessionField="SearchSecondWord" />
            <asp:SessionParameter Name="?" SessionField="SearchSecondWord" />
            <asp:SessionParameter Name="?" SessionField="SearchSecondWord" />
        </SelectParameters>

    </asp:SqlDataSource>
</asp:Content>



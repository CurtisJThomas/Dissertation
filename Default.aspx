<%@ Page   Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="myContainer">
        <div class="HomeBackgroundImageDiv">
            <asp:Image ID="HomeFriendImage" AlternateText="homeBackground" Width="100%" Height="5%" runat="server" ImageUrl="~/images/HomeBackground.jpg" />
        </div>
          <div class="HomeWelcome row" >
              <div class="col-md-4 col-xs-3 col-lg-4 ">
                <!-- blank space -->
              </div>
              <div class="col-md-4 col-xs-5 col-lg-4" >
                 <div class="WelcomeLabelDiv">
                 <asp:Label ID="WelcomeLabel" runat="server" Text="Welcome!" ForeColor="White"></asp:Label>
            </div>
            <div class="WelcomeTextDiv">
                <asp:Label ID="WelcomeText" runat="server" Text="Hello and welcome to Umix. We are here to keep you up to date with friends as they post live updates, so you can stay connected. Register below for free!" ForeColor="White" Font-Size="Medium"></asp:Label>
            </div>
            <div class="HomeSignInButtonDiv">
               <asp:Button ID="HomeSignUpButton" CssClass="btn btn-primary btn-md" runat="server" Text="Sign Up" OnClick="HomeSignUpButton_Click" UseSubmitBehavior="True" CausesValidation="False" />
            </div>
              </div>
              <div class="col-md-4 col-xs-4 col-lg-4">
                  <!-- blank space -->
              </div>
        </div>
        <div class="footerHome">
                    <div class="col-md-4 col-xs-4 col-lg-4">
                <!-- blank space -->
              </div>
              <div class="col-md-4 col-xs-4 col-lg-4">
               <div class="row" style="text-align:center;">
                   <div class="col-md-4 col-xs-4 col-lg-4">
                      <asp:HyperLink ID="HomefooterText" CssClass="ContactfooterText" NavigateUrl="Default.aspx" runat="server">Home</asp:HyperLink>
                   </div>
                   <div class="col-md-4 col-xs-4 col-lg-4">
                      <asp:HyperLink ID="RegisterfooterText" CssClass="RegisterfooterText" NavigateUrl="RegisterPage.aspx" runat="server">Register</asp:HyperLink>
                   </div>
                   <div class="col-md-4 col-xs-4 col-lg-4">
                       <asp:HyperLink ID="LogInfooterText" CssClass="LogInfooterText" NavigateURL="LogInPage.aspx" runat="server">Log in</asp:HyperLink>
                   </div > 
               </div>
              </div>
              <div class="col-md-4 col-xs-4">
                  <!-- blank space -->
              </div>
        </div>
    </div>
 
</asp:Content>


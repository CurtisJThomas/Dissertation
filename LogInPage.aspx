<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogInPage.aspx.cs" Inherits="LogInPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="col-md-4 col-xs-3 col-lg-4 ">
                    <!--blank space -->
    </div>

    <div  class="col-md-4 col-xs-6 col-lg-4  form-login">
        <!--Header -->
        <div class="LogInHeaderDiv" style="text-align:center;">
            <asp:Label ID="LogInHeader" CssClass="LogInHeader" runat="server" Text="Log in"></asp:Label>
        </div>
        <!-- Username or Email -->
        <div class="LogInDivs ">
             <asp:Label ID="SignInAllDetailsIncorrectValidaion" runat="server" class="label label-danger" Text=""></asp:Label>
            <asp:TextBox ID="LogInPageUsernameOrEmailTB" CssClass="form-control" placeholder="Email or Username" onkeydown="logIn()" runat="server"></asp:TextBox>
            <asp:Label ID="LogInEmailOrUsernameIncorrectValidation" runat="server" class="label label-danger" Text=""></asp:Label>
        </div>
        <!--password -->
        <div class="LogInDivs">
            <asp:TextBox ID="LogInPagePasswordTB" CssClass="form-control" type="password"  onkeydown="logIn()" placeholder="Password" runat="server"></asp:TextBox>
            <asp:Label ID="LogInPasswordIncorrectValidation" runat="server" class="label label-danger" Text=""></asp:Label>
        </div>
        <!-- Log in Button -->
        <div class="row"> 
            <div class="col-md-4"></div>
            <div class="col-md-3">
            <asp:Button ID="LogInPageButton" CssClass="btn btn-primary btn-md logInButton " runat="server" Text="Log in" OnClick="LogInPageButton_Click"  />
            </div>
            <div class="col-md-5">
              <asp:HyperLink ID="forgotPasswordLink" CssClass="forgotPasswordLink" NavigateUrl="ForgotPasswordPage.aspx"  runat="server">Forgot password?</asp:HyperLink>
            </div>
        </div>
    </div>

    <div  class="col-md-4 col-xs-3 col-lg-4 ">
        <!-- blank space -->
    </div>
</asp:Content>


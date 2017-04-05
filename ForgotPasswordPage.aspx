<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPasswordPage.aspx.cs" Inherits="ForgotPasswordPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="forgotContainer">
   <div class="forgotPasswordDiv">
       <div class="enterEmailForgotPasswordLabelDiv">
            <asp:Label ID="enterEmailForgotPasswordLabel"  CssClass="enterEmailForgotPasswordLabel" runat="server" Text="Enter your email"></asp:Label>
       </div>
       <div class="tbAndButtonForgotDiv">
            <asp:TextBox ID="forgotPasswordEmailTB" placeholder="Enter your email"   CssClass="form-control forgotPasswordEmailTB" runat="server"></asp:TextBox><asp:Button ID="forgotPasswordSubmitEmailButton" CssClass="btn btn-primary forgotPasswordSubmitEmailButton" runat="server" OnClick="forgotPasswordSubmitEmailButton_Click" Text="Submit" />
       </div>
       <div class="forgotPasswordValidationDiv">
            <asp:Label ID="forgotPasswordEnterEmailValidation" CssClass="label label-info forgotPasswordEnterEmailValidation" runat="server" Text=""></asp:Label>
            <asp:Label ID="forgotPasswordEnterEmailValidationTwo" CssClass="label label-danger forgotPasswordEnterEmailValidationTwo" runat="server" Text=""></asp:Label>
            <asp:RegularExpressionValidator ID="forgotPasswordEnterEmailRegEx" runat="server" class="label label-danger forgotPasswordEnterEmailRegEx" ErrorMessage="The email you have supplied is not valid" ControlToValidate="forgotPasswordEmailTB" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
       </div>
   </div> 
  </div>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPasswordEnterCode.aspx.cs" Inherits="ForgotPasswordEnterCode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="forgotContainerTwo">
        <div class="forgotPasswordDivTwo">
            <div runat="server" id="enterCodeDiv" class="enterCodeDiv">
                <div class="enterCodeLabelDiv">
                 <asp:Label ID="enterCodeLabel" CssClass="enterCodeLabel" runat="server" Text="Please enter your code we send via the email below"></asp:Label>
                </div>
                    <asp:TextBox ID="forgotPasswordCodeTB"  placeholder="Enter code" CssClass="forgotPasswordCodeTB form-control" MaxLength="8" runat="server"></asp:TextBox><asp:Button ID="forgotPasswordCodeButton" CssClass="btn btn-primary forgotPasswordCodeButton" OnClick="forgotPasswordCodeButton_Click" runat="server" Text="Submit" />
                 <div class="enterCodeValidationDiv">
                     <asp:Label ID="enterCodeValidation" CssClass="label label-danger" runat="server" Text=""></asp:Label>
                 </div>  
            </div>
            <div runat="server" id="enterNewPasswordDiv"  class="enterNewPasswordDiv">
                <div class="EnterNewPasswordLabelDiv" >
                 <asp:Label ID="EnterNewPasswordLabel" CssClass="EnterNewPasswordLabel" runat="server" Text="Enter your new password"></asp:Label>
                </div>
                 <asp:TextBox ID="EnterNewPasswordTBOne"  placeholder="Enter new password" type="password" CssClass="EnterNewPasswordTBOne form-control"  runat="server"></asp:TextBox>
                 <asp:TextBox ID="EnterNewPasswordTBTwo" placeholder="Re-enter the new password" type="password" CssClass="EnterNewPasswordTBTwo form-control" runat="server"></asp:TextBox>
                 <asp:Label ID="enterNewPasswordValidation"  CssClass="label label-danger enterNewPasswordValidation" runat="server" Text=""></asp:Label>
                 <asp:Button ID="SubmitNewPasswordButton" CssClass="btn btn-primary SubmitNewPasswordButton" OnClick="SubmitNewPasswordButton_Click" runat="server" Text="Submit"/>
            </div>

        </div>
    </div>
    
 
    
</asp:Content>


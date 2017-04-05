<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegisterPage.aspx.cs" Inherits="RegisterPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       

    <div class="col-md-4 col-xs-3">
                    <!--blank space -->
    </div>

    <div  class="col-md-4 col-xs-6 col-lg-4 form-register">
        <!--Header -->
        <div class="RegisterHeaderDiv" style="text-align:center;">
            <asp:Label ID="RegisterHeader" CssClass="RegisterHeader" runat="server" Text="Register"></asp:Label>
        </div>
        <!--User Name -->
        <div class="RegisterDivs">
            <asp:TextBox ID="RegisterUserNameTB" CssClass="form-control RegisterUserNameTB" MaxLength="15" onkeydown="registerWithJS()" placeholder="Username" runat="server"></asp:TextBox>
               <asp:Label ID="UserNameRegisteredValidation" CssClass="label label-danger" Display="Dynamic" runat="server" Text=""></asp:Label>
              <asp:RequiredFieldValidator ID="RegisterUserNameRequiredValidator" runat="server" ErrorMessage="Required" CssClass="label label-danger" ControlToValidate="RegisterUserNameTB"></asp:RequiredFieldValidator>
             </div>
        
        <!--fist name and last name -->
        <div class="row RegisterDivsSecond">
            <div class="col-md-6 col-xs-6  col-lg-6">
                <asp:TextBox ID="RegisterFirstNameTB" CssClass="form-control" placeholder="First name" MaxLength="20" onkeydown="registerWithJS()"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RegisterFirstNameRequiredValidator" runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="label label-danger" ControlToValidate="RegisterFirstNameTB"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="FirstNameRegExValidator" CssClass="label label-danger" runat="server" Display="Dynamic" ErrorMessage="Numbers or symbols not allowed" ValidationExpression="^[a-zA-Z]+$" ControlToValidate="RegisterFirstNameTB"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-6 col-xs-6 col-lg-6">
                <asp:TextBox ID="RegisterLastNameTB" CssClass="form-control" placeholder="Last name" MaxLength="20" onkeydown="registerWithJS()"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RegisterLastNameRequiredValidator" runat="server"  Display="Dynamic" ErrorMessage="Required" CssClass="label label-danger" ControlToValidate="RegisterLastNameTB"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="LastNameRegExValidator" CssClass="label label-danger" runat="server" Display="Dynamic" ErrorMessage="Numbers or symbols not allowed" ValidationExpression="^[a-zA-Z]+$" ControlToValidate="RegisterLastNameTB"></asp:RegularExpressionValidator>
            </div>
        </div>
        <!-- Email -->
        <div class="RegisterDivs">
            <asp:TextBox ID="RegisterEmailTB" CssClass="form-control" placeholder="Email"  runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RegisterEmailRequiredValidator" runat="server"  Display="Dynamic" ErrorMessage="Required" onkeydown="registerWithJS()" CssClass="label label-danger" ControlToValidate="RegisterEmailTB"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegisterEmailRegularExpressionValidator" Display="Dynamic" runat="server" CssClass="label label-danger"  ErrorMessage="Incorrect email" ControlToValidate="RegisterEmailTB" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
             <asp:Label ID="EmailRegisteredValidation" CssClass="label label-danger" runat="server" Text=""></asp:Label>
        </div>
        <!--password -->
        <div class="RegisterDivs">
            <asp:TextBox ID="RegisterPasswordTB" CssClass="form-control" type="password" onkeydown="registerWithJS()" placeholder="Password" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RegisterPasswordRequiredValidator" runat="server" Display="Dynamic" ErrorMessage="Required" CssClass="label label-danger" ControlToValidate="RegisterPasswordTB"></asp:RequiredFieldValidator>
              <asp:Label ID="registerPasswordValidator" CssClass="label label-danger registerPasswordValidator" Display="Dynamic"  runat="server" Text=""></asp:Label>
        </div>
        <!-- Mobile number -->
        <div class="RegisterDivs">
            <asp:TextBox ID="RegisterMobileNumberTB" CssClass="form-control" placeholder="Mobile number" onkeydown="registerWithJS()" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="MobileNumberFieldValidator" runat="server"  Display="Dynamic" CssClass="label label-danger" ErrorMessage="Required" ControlToValidate="RegisterMobileNumberTB"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="phoneNumberValidator" runat="server"  Display="Dynamic" ControlToValidate="RegisterMobileNumberTB"  ErrorMessage="Mobile number not recognized" CssClass="label label-danger" ValidationExpression="0[0-9]{10}"></asp:RegularExpressionValidator>
        </div>
        <!-- Register Button -->
        <div class="RegisterDivs RegisterButtonDiv">
           <asp:Button ID="RegisterButton" CssClass="btn btn-primary btn-md" runat="server" Text="Create account" OnClick="RegisterButton_Click" />
        </div>
    </div>

    <div  class="col-md-4 col-xs-3 col-lg-4">
        <!-- blank space -->
    </div>
</asp:Content>


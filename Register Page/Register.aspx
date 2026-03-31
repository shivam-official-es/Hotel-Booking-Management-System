<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Hotel_Booking_Management_System.Register_Page.Register" MasterPageFile="~/Masters/Site.Master" Title="Register" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="RegisterContent" runat="server">
    <main class="d-flex justify-content-center align-items-center flex-grow-1">
        <div class="card p-4 shadow-lg" style="width: 450px">
            <h2 class="fw-bold text-center pb-3">Create Account</h2>

            <div class="w-75 m-auto d-flex flex-column" style="width: 430px">
                <%-- Password --%>
                <div class="mb-3 d-flex justify-content-center flex-column">
                    <asp:Label ID="name_lbl" runat="server" Text="Name" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="name_txt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ErrorMessage="Please fill out the name field " CssClass="text-danger" ControlToValidate="name_txt" Display="Dynamic" SetFocusOnError="True" ID="NameValidator">Please fill out the name field </asp:RequiredFieldValidator>
                </div>

                <%-- Confirm Password --%>
                <div class="mb-3">
                    <asp:Label ID="email_lbl" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="email_txt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="email_txt" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please fill out the email field" SetFocusOnError="True">Please fill out the email field</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="EmailFormatValidator" runat="server" ControlToValidate="email_txt" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter a valid email address" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Please enter a valid email address</asp:RegularExpressionValidator>
                </div>

                <%-- Already have account Login --%>
                <div class="mb-3">
                    <asp:Label ID="phoneNumber_lbl" runat="server" Text="Phone Number" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="phoneNumber_txt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PhoneNumberRequiredFieldValidator" runat="server" ControlToValidate="phoneNumber_txt" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please fill out the phone number field" SetFocusOnError="True">Please fill out the phone number field</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="PhoneNumberFormatValidator" runat="server" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please enter a valid phone number" SetFocusOnError="True" ValidationExpression="\d{10}" ControlToValidate="phoneNumber_txt">Please enter a valid phone number</asp:RegularExpressionValidator>
                </div>

                <%-- Create Button --%>
                <div class="mb-3">
                    <asp:Label ID="role_lbl" runat="server" Text="Role" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="roleList" runat="server" CssClass="form-select">
                        <asp:ListItem>--- Select a Role ---</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>User</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RoleListValidator" runat="server" ErrorMessage="Please select a role" ControlToValidate="roleList" CssClass="text-danger" Display="Dynamic" SetFocusOnError="True">Please select a role</asp:RequiredFieldValidator>
                </div>


                <%-- Password --%>
                <div class="mb-3">
                    <asp:Label ID="password_lbl" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="password_txt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="password_txt" CssClass="text-danger" Display="Dynamic" ErrorMessage="Please fill out the password field" SetFocusOnError="True">Please fill out the password field</asp:RequiredFieldValidator>
                </div>

                <%-- Confirm Password --%>
                <div class="mb-3">
                    <asp:Label ID="confirmPassword_lbl" runat="server" Text="Confirm Password" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="confirmPassword_txt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:CompareValidator ID="ConfirmPasswordMatchValidator" runat="server" ControlToCompare="password_txt" ControlToValidate="confirmPassword_txt" CssClass="text-danger" Display="Dynamic" ErrorMessage="Passwords don't match. Please try again" SetFocusOnError="True">Passwords don&#39;t match. Please try again</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="ConfirmPasswordValidator" runat="server" ControlToValidate="confirmPassword_txt" Display="Dynamic" ErrorMessage="Please fill out the confirm password field" SetFocusOnError="True">Please fill out the confirm password field</asp:RequiredFieldValidator>
                </div>

                <%-- Already have account Login --%>
                <div class="text-center">
                    <p>Already have an account<a href="/Login Page/LoginUser.aspx" style="text-decoration: none"> Login</a></p>
                </div>

                <%-- Create Button --%>
                <asp:Button ID="create_btn" runat="server" CssClass="btn btn-primary w-100" Text="Create" OnClick="create_btn_Click" CausesValidation="true" />
            </div>
        </div>
    </main>
</asp:Content>

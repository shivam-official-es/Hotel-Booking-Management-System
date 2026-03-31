<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="Hotel_Booking_Management_System.Login_Page.LoginUser" MasterPageFile="~/Masters/Site.Master" Title="Login" %>

<asp:Content ContentPlaceHolderID="MainContent" ID="LoginContent" runat="server">
    <main class="d-flex justify-content-center align-items-center flex-grow-1">
        <div class="card p-4 shadow-lg" style="width: 430px">
            <h2 class="fw-bold text-center mb-3">Login</h2>

            <div class="d-flex flex-column w-75 mx-auto">
                <%-- Invalid Message --%>
                <div class="mt-3">
                    <asp:PlaceHolder ID="alertPlaceholder" runat="server" Visible="false">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <asp:Label ID="lblAlert" runat="server"></asp:Label>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </asp:PlaceHolder>
                </div>

                <%-- Role Dropdown list --%>
                <div class="mb-3">
                    <asp:Label ID="role_lbl" runat="server" Text="Role" CssClass="form-label"></asp:Label>
                    <asp:DropDownList ID="roleList" runat="server" CssClass="form-select">
                        <asp:ListItem Value="">--- Select a Role ---</asp:ListItem>
                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                        <asp:ListItem Value="User">User</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RoleValidator" runat="server" Display="Dynamic" ErrorMessage="Please select a role" SetFocusOnError="True" ControlToValidate="roleList" InitialValue="" CssClass="text-danger">Please select a role</asp:RequiredFieldValidator>
                </div>

                <%-- Email --%>
                <div class="mb-3">
                    <asp:Label ID="email_lbl" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="email_txt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="email_txt" Display="Dynamic" ErrorMessage="Email field cannot be empty" SetFocusOnError="True" CssClass="text-danger">Email field cannot be empty</asp:RequiredFieldValidator>
                </div>

                <%-- Password --%>
                <div class="mb-3">
                    <asp:Label ID="password_lbl" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="password_txt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="password_txt" Display="Dynamic" ErrorMessage="Password field cannot be empty" SetFocusOnError="True" CssClass="text-danger">Password field cannot be empty</asp:RequiredFieldValidator>
                </div>

                <%-- New User Register --%>
                <div class="text-center">
                    <p>Don't have an account?<a href="/Register Page/Register" style="text-decoration: none"> Register</a></p>
                </div>

                <%-- Login Button --%>
                <asp:Button ID="login_btn" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="login_btn_Click" CausesValidation="true" />
            </div>
        </div>
    </main>
</asp:Content>


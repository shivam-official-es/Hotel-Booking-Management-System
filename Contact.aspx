<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Masters/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Hotel_Booking_Management_System.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="d-flex justify-content-center align-items-center flex-column flex-grow-1 container pb-5">

        <h3 class="text-center fw-bold my-5">Contact Us</h3>

        <%-- Contact Details --%>
        <div class="justify-content-center row w-75 g-5">
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="mb-4">
                            <h5 class="card-title">Address</h5>
                            <p class="card-text">Hotel Luxury Stay 607 Beach Road Chennai.</p>
                        </div>
                        <div class="mb-4">
                            <h5 class="card-title">Phone</h5>
                            <p class="card-text">9954214339</p>
                        </div>
                        <div class="mb-4">
                            <h5 class="card-title">Email</h5>
                            <p class="card-text">sapphiregrand@gmail.com</p>
                        </div>
                        <div class="mb-4">
                            <h5 class="card-title">Working Hours</h5>
                            <p class="card-text">Our support team is available 24/7 to assist you</p>
                        </div>
                    </div>
                </div>
            </div>
            <%-- Contact Enquiry Form --%>
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="mb-4">
                            <asp:Label ID="name_lbl" runat="server" Text="Name" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="name_txt" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <asp:Label ID="email_lbl" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="email_txt" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <asp:Label ID="phoneNumber_lbl" runat="server" Text="Phone Number" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="phoneNumber_txt" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <asp:Label ID="message_lbl" runat="server" Text="Message" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="message_txt" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>

                        <asp:Button ID="send_button" CssClass="btn btn-primary" runat="server" Text="Send Message" OnClick="send_button_Click" />
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

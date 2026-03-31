<%@ Page Title="Add New Room" Language="C#" AutoEventWireup="true" CodeBehind="AddNewRoom.aspx.cs" Inherits="Hotel_Booking_Management_System.Admins_Dashboard.AddNewRoom" MasterPageFile="~/Masters/AdminMaster.Master" %>

<%-- Add New Room Form --%>
<asp:Content ContentPlaceHolderID="AdminDashboardContent" runat="server" ID="AddNewRoomsMainContent">
    <main class="container d-flex justify-content-center align-items-center flex-grow-1">
        <div class="card py-5 shadow-lg rounded-3" style="width: 500px;">
            <div class="m-auto">
            <h3 class="fw-bold mb-4 text-center text-success">Add New Room</h3>
                <asp:Label ID="roomAddedSuccessMessage_lbl" runat="server" Text="" Visible="false" CssClass="alert alert-success my-3 p-1"></asp:Label>

                <%-- Room Number --%>
                <div class="mb-3">
                    <asp:Label ID="roomNumber_lbl" runat="server" Text="Room Number" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="roomNumber_txt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <%-- Room Type --%>
                <div class="mb-3">
                    <asp:Label ID="roomType_lbl" runat="server" Text="Room Type" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="roomType_txt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <%-- Room Description --%>
                <div class="mb-3">
                    <asp:Label ID="roomDescription_lbl" runat="server" Text="Room Description" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="roomDescription_txt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <%-- Room Price --%>
                <div class="mb-3">
                    <asp:Label ID="roomPrice_lbl" runat="server" Text="Price" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="roomPrice_txt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <%-- Guests --%>
                <div class="mb-3">
                    <asp:Label ID="guestsCount_lbl" runat="server" Text="Guests" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="guestsCount_txt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <%-- Amenities --%>
                <div class="mb-4">
                    <asp:Label ID="amenities_lbl" runat="server" Text="Amenities" CssClass="form-label fw-semibold"></asp:Label>
                    <asp:TextBox ID="amenities_txt" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <%-- Room Image --%>
                <div class="mb-3">
                    <asp:FileUpload ID="RoomImageUpload" runat="server" CssClass="form-label fw-semibold" />
                </div>

                <%-- Add New Room and Cancel Buttons --%>
                <div class="d-flex justify-content-between">
                    <asp:Button ID="add_btn" CssClass="btn btn-outline-success" runat="server" Text="Add" OnClick="add_btn_Click" />
                    <asp:Button ID="cancel_btn" CssClass="btn btn-outline-secondary" runat="server" Text="Cancel" OnClick="cancel_btn_Click" />
                </div>
            </div>
        </div>
    </main>

</asp:Content>

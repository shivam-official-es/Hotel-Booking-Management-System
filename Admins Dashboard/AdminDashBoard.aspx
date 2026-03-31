<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashBoard.aspx.cs" Inherits="Hotel_Booking_Management_System.Admins_Dashboard.Dashboard" MasterPageFile="~/Masters/AdminMaster.Master" %>

<%-- Admin Dashboard Content --%>
<asp:Content ContentPlaceHolderID="AdminDashboardContent" runat="server">
    <main class="container mt-5">
        <asp:Label ID="roleSession_lbl" runat="server" Text="" CssClass="h3 fw-bold"></asp:Label>
        <div class="d-flex justify-content-around fw-bold h5 mt-5 p-1 shadow-lg text-center">
            <div class="my-2">
                <asp:Label ID="totalRooms_lbl" runat="server" Text="Total Rooms"></asp:Label>
                <p class="text-center text-danger m-0">
                    <asp:Label ID="displayTotalRooms_lbl" runat="server" Text=""></asp:Label>
                </p>
            </div>
            <div class="my-2">
                <asp:Label ID="totalUsers_lbl" runat="server" Text="Total Users"></asp:Label>
                <p class="text-center text-danger m-0">
                    <asp:Label ID="displayTotalUsers_lbl" runat="server" Text=""></asp:Label>
                </p>
            </div>
            <div class="my-2">
                <asp:Label ID="totalBookings_lbl" runat="server" Text="Total Bookings"></asp:Label>
                <p class="text-center text-danger m-0">
                    <asp:Label ID="displayTotalBookings_lbl" runat="server" Text=""></asp:Label>
                </p>
            </div>
        </div>
        <%-- Recent Bookings --%>
        <div class="mt-5">
            <h3 class="fw-bold">Recent Bookings</h3>
            <div>
                <asp:GridView class="table table-striped" ID="RecentBookingView" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingId" DataSourceID="RecentBookings">
                    <Columns>
                        <asp:BoundField DataField="BookingId" HeaderText="BookingId" InsertVisible="False" ReadOnly="True" SortExpression="BookingId" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                        <asp:BoundField DataField="RoomId" HeaderText="RoomId" SortExpression="RoomId" />
                        <asp:BoundField DataField="CheckInDate" HeaderText="CheckInDate" SortExpression="CheckInDate" />
                        <asp:BoundField DataField="CheckOutDate" HeaderText="CheckOutDate" SortExpression="CheckOutDate" />
                        <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                        <asp:BoundField DataField="BookingStatus" HeaderText="BookingStatus" SortExpression="BookingStatus" />
                    </Columns>

                </asp:GridView>
                <asp:SqlDataSource ID="RecentBookings" runat="server" ConnectionString="<%$ ConnectionStrings:HotelBookingManagementSystemConnectionString %>" SelectCommand="SELECT TOP (5) Bookings.* FROM Bookings"></asp:SqlDataSource>
            </div>
        </div>
    </main>

</asp:Content>

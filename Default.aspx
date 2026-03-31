<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Masters/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Hotel_Booking_Management_System._Default" %>

<%-- Home Page Content --%>
<asp:Content ContentPlaceHolderID="MainContent" runat="server" ID="HomeContent">
    <link rel="stylesheet" href="Styles/HomePageCard.css" />
    <main class="container m-auto">
        <div class="row g-4">
            <asp:Repeater ID="HomePageRepeater" runat="server" OnItemCommand="HomePageRepeater_ItemCommand">
                <ItemTemplate>
                    <div class="col-md-4 col-sm-6 d-flex">
                        <div class="card shadow-lg">
                            <img src='<%# ResolveUrl("~/" + Eval("ImagePath")) %>' alt="Room Image" class="roomImg" />
                            <div class="card-body">
                                <h5 class="card-title fw-bold"><%# Eval("RoomType") %></h5>
                                <p class="card-text"><%# Eval("RoomDescription") %></p>
                                <p class="card-text fw-bold">Guests: <span><%# Eval("Guests") %></span></p>
                                <p><b class="card-text">Amenities: </b><span><%# Eval("Amenities") %></span></p>
                                <b class="card-text">Price: <span class="text-success">Rs <%# Eval("Price") %> / Night</span></b>
                            </div>
                                <asp:Button Text="View Details" runat="server" CssClass="btn btn-primary ms-3 mb-3" ID="viewDetails_btn" OnClick="viewDetails_btn_Click" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </main>
</asp:Content>

<%@ Page Title="Manage Rooms" Language="C#" AutoEventWireup="true" CodeBehind="ManageRooms.aspx.cs" Inherits="Hotel_Booking_Management_System.Admins_Dashboard.ManageRooms" MasterPageFile="~/Masters/AdminMaster.Master" %>

<asp:Content ContentPlaceHolderID="AdminDashboardContent" ID="ManageRoomContent" runat="server">
    <main class="container">
        <div class="mt-5">
            <asp:Button Text="Add New Room" CssClass="btn btn-primary mb-4" runat="server" ID="AddNewRoom_btn" OnClick="AddNewRoom_btn_Click" />
            <asp:GridView CssClass="table table-striped table-hover" ID="AdminRoomsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="RoomId" OnRowEditing="AdminRoomsGridView_RowEditing" OnRowCancelingEdit="AdminRoomsGridView_RowCancelingEdit" OnRowUpdating="AdminRoomsGridView_RowUpdating" OnRowDeleting="AdminRoomsGridView_RowDeleting">
                <Columns>
                    <%-- Room Number --%>
                    <asp:TemplateField HeaderText="Room Number">
                        <ItemTemplate>
                            <%# Eval("RoomNumber") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="roomNumber_txt" runat="server" CssClass="form-control" Text='<%# Bind("RoomNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%-- Room Type --%>
                    <asp:TemplateField HeaderText="Room Type">
                        <ItemTemplate>
                            <%# Eval("RoomType") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="roomType_txt" runat="server" CssClass="form-control" Text='<%# Bind("RoomType") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%-- Room Description --%>
                    <asp:TemplateField HeaderText="Room Description">
                        <ItemTemplate>
                            <%# Eval("RoomDescription") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="roomDescription_txt" runat="server" CssClass="form-control" Text='<%# Bind("RoomDescription") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%-- Room Price --%>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <%# Eval("Price") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="price_txt" runat="server" CssClass="form-control" Text='<%# Bind("Price") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%-- Guests --%>
                    <asp:TemplateField HeaderText="Guests">
                        <ItemTemplate>
                            <%# Eval("Guests") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="guests_txt" runat="server" CssClass="form-control" Text='<%# Bind("Guests") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%-- Amenities --%>
                    <asp:TemplateField HeaderText="Amenities">
                        <ItemTemplate>
                            <%# Eval("Amenities") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="amenities_txt" runat="server" CssClass="form-control" Text='<%# Bind("Amenities") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%-- Image Path --%>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="imagePath" runat="server" ImageUrl='<%# ResolveUrl("~/" + Eval("ImagePath")) %>' Width="100px" Height="70px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Image runat="server" ID="imagePreview" ImageUrl='<%# Eval("ImagePath") %>' />
                            <asp:FileUpload runat="server" ID="roomImageUpload" CssClass="form-control mt-2" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%-- Actions (Update, Delete) --%>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div class="d-flex gap-2">
                                <asp:Button Text="Edit" CssClass="btn btn-warning btn-sm" runat="server" CommandName="Edit" ID="Edit_btn" />
                                <asp:Button Text="Delete" CssClass="btn btn-danger btn-sm" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure do want to permanently delete this room?')" />
                            </div>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div class="d-flex gap-2">
                                <asp:Button Text="Update" CssClass="btn btn-success btn-sm" runat="server" CommandName="Update" ID="Update_btn" />
                                <asp:Button Text="Cancel" CssClass="btn btn-secondary btn-sm" runat="server" CommandName="Cancel" ID="Cancel_btn" />
                            </div>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="AdminRoomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HotelBookingManagementSystemConnectionString %>" SelectCommand="Sp_AdminGetAllRooms" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
    </main>

</asp:Content>

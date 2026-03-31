<%@ Page Title="Enquiry" Language="C#" AutoEventWireup="true" CodeBehind="EnquiryAndUsers.aspx.cs" Inherits="Hotel_Booking_Management_System.Admins_Dashboard.EnquiryAndUsers" MasterPageFile="~/Masters/AdminMaster.Master" %>

<%-- Contact Enquiry Details --%>
<asp:Content ContentPlaceHolderID="AdminDashboardContent" runat="server" ID="EnquiryMainContent">
    <main class="container">
        <h2 class="mt-5 fw-bold mb-5">Enquiry Details and Status Update</h2>
        <div class="alert alert-success d-flex justify-content-between" Visible="false" ID="SuccessUpdateMessage" runat="server">
            <asp:Label ID="UpdateSuccessMessage_lbl" runat="server"></asp:Label>
            <button type="button" class="btn btn-close" data-bs-dismiss="alert"></button>
        </div>
        <asp:GridView CssClass="table table-striped table-hover text-center" ID="EnquiriesDetailsGridView" runat="server" AutoGenerateColumns="False" DataSourceID="EnquiriesDataSource" DataKeyNames="ContactId">
            <Columns>
                <asp:BoundField DataField="ContactId" HeaderText="ContactId" InsertVisible="False" ReadOnly="True" SortExpression="ContactId" />
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" SortExpression="CustomerName" />
                <asp:BoundField DataField="CustomerEmail" HeaderText="CustomerEmail" SortExpression="CustomerEmail" />
                <asp:BoundField DataField="CustomerNumber" HeaderText="CustomerNumber" SortExpression="CustomerNumber" />
                <asp:BoundField DataField="CustomerMessage" HeaderText="CustomerMessage" SortExpression="CustomerMessage" />
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlStatus" runat="server" SelectedValue='<%# Bind("ProcessStatus") %>'>
                            <asp:ListItem>-- Select a Status --</asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>In Progress</asp:ListItem>
                            <asp:ListItem>Resolved</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="Update_btn" runat="server" Text="Update" CssClass="btn btn-primary p-1" OnClick="Update_btn_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
        <asp:SqlDataSource ID="EnquiriesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HotelBookingManagementSystemConnectionString %>" SelectCommand="Sp_GetContactMessages" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </main>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ica12_JuanCarlosLauron.aspx.cs" Inherits="ica12_JuanCarlosLauron" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_phHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_phBody" Runat="Server">
    <h2> ica12 - Stored Procedures with ADO </h2>
    <hr />
    Pick a Customer: 
    <asp:DropDownList ID="_ddlCustomers" runat="server" OnSelectedIndexChanged="_ddlCustomers_SelectedIndexChanged" AutoPostBack="true">

    </asp:DropDownList>
    <asp:TextBox ID="_tbFilter" runat="server"></asp:TextBox>
    <asp:Button ID="_btnFilter" runat="server" Text="Filter" OnClick="_btnFilter_Click"/>
    <asp:GridView ID="_gvCustomer" runat="server" OnRowDataBound="_gvCustomer_RowDataBound" BackColor="White" BorderColor="#666666" BorderStyle="Solid" BorderWidth="3px" CellPadding="6" ForeColor="Black" GridLines="Horizontal"  Width="30%" >
        <AlternatingRowStyle BackColor="GhostWhite" />
        <Columns>
            <asp:BoundField>
            <HeaderStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    </asp:Content>


 
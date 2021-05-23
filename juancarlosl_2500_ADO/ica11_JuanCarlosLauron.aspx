<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ica11_JuanCarlosLauron.aspx.cs" Inherits="ica11_JuanCarlosLauron" Theme="ADO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_phHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_phBody" Runat="Server">
    <h2>ICA 11 - ADO Part 1 - Basic Queries</h2>
    <div>
        Pick a supplier:
        <asp:DropDownList ID="_ddlSupplier" runat="server" OnSelectedIndexChanged="_ddlSupplier_SelectedIndexChanged" ></asp:DropDownList>
        <asp:TextBox ID="_tbFilter" runat="server"></asp:TextBox>
        <asp:Button ID="_btnFilter" runat="server" Text="Filter" OnClick="_btnFilter_Click"/>

    </div>
    <hr />
    <table>
        <asp:Table ID="_tableProducts" runat="server" BackColor="White" CellPadding="5" HorizontalAlign="Center" Width="65%" >
            <asp:TableHeaderRow Width="50%" ></asp:TableHeaderRow>
            
        </asp:Table>
    </table>
</asp:Content>


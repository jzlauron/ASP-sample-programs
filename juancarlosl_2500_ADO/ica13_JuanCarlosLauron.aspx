<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ica13_JuanCarlosLauron.aspx.cs" Inherits="ica13_JuanCarlosLauron" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_phHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_phBody" Runat="Server">
    <h2> ica 13 - Modify Order Details</h2>
    <hr />
    <h2>Part 1 - Delete Order Details</h2>
    Enter OrderID:
    <asp:TextBox ID="_tbOrderID" runat="server"></asp:TextBox>
    <asp:Button ID="_btnGetOrder" runat="server" Text="Get Order Details" OnClick="_btnGetOrder_Click"/>
    <asp:SqlDataSource ID="Part1SDS" runat="server" ConnectionString="<%$ ConnectionStrings:jlauron1_NorthwindConnectionString %>" SelectCommand="SELECT OD.OrderID, OD.ProductID, P.ProductName, OD.UnitPrice, OD.Quantity, OD.Discount FROM [Order Details] AS OD INNER JOIN Products AS P ON OD.ProductID = P.ProductID WHERE (OD.OrderID = @OrderID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="_tbOrderID" Name="OrderID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="Part1GV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="OrderID,ProductID" DataSourceID="Part1SDS" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <br />
    <asp:Button ID="_btnDelete" runat="server" Text="Delete Selected" OnClick="_btnDelete_Click"/>
    <br />
    <asp:Label ID="_lblStatus" runat="server" Text="Status: "></asp:Label>
    <h2>Part II - Insert Order Details</h2>
    Enter OrderID: 
    <asp:TextBox ID="_tbOrderID2" runat="server"></asp:TextBox>
    <br />
    <asp:SqlDataSource ID="Part2SDS" runat="server" ConnectionString="<%$ ConnectionStrings:jlauron1_NorthwindConnectionString %>" SelectCommand="SELECT [ProductID], [ProductName] FROM [Products] ORDER BY [ProductName]">
    </asp:SqlDataSource>
    Enter Product: 
    <asp:DropDownList ID="Part2DDL" runat="server" DataSourceID="Part2SDS" DataTextField="ProductName" DataValueField="ProductID"></asp:DropDownList>
    <br />
    Enter Quantity: 
    <asp:TextBox ID="Part2TBQUantity" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Part2Button" runat="server" Text="Insert Record" OnClick="Part2Button_Click" />
    <br />
    <asp:Label ID="Part2Label" runat="server" Text="Status: "></asp:Label>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ica10_JuanCarlosLauron.aspx.cs" Inherits="ica10_JuanCarlosLauron" Theme="ADO"%>

<asp:Content ID="Content1" ContentPlaceHolderID="_phHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_phBody" Runat="Server">
    <h2>ica10 - More Data-aware controls</h2>
    <asp:Label ID="_lblCustomer" runat="server" Text="Customer"></asp:Label>
    <asp:SqlDataSource ID="_sdsCompnames" runat="server" ConnectionString="<%$ ConnectionStrings:jlauron1_NorthwindConnectionString %>" SelectCommand="SELECT [CompanyName], [CustomerID] FROM [Customers]"></asp:SqlDataSource>
    <asp:DropDownList ID="_ddlNames" runat="server" AutoPostBack="True" DataSourceID="_sdsCompnames" DataTextField="CompanyName" DataValueField="CustomerID" OnSelectedIndexChanged="_ddlNames_SelectedIndexChanged"></asp:DropDownList><br />
    <asp:SqlDataSource ID="_sdsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:jlauron1_NorthwindConnectionString %>" SelectCommand="SELECT [OrderID], [CustomerID], [OrderDate] FROM [Orders] WHERE ([CustomerID] = @CustomerID)" DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [Orders] ([CustomerID], [OrderDate]) VALUES (@CustomerID, @OrderDate)" UpdateCommand="UPDATE [Orders] SET [CustomerID] = @CustomerID, [OrderDate] = @OrderDate WHERE [OrderID] = @OrderID">
        <DeleteParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="_ddlNames" Name="CustomerID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </UpdateParameters>

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="_sdsCustom" runat="server" ConnectionString="<%$ ConnectionStrings:jlauron1_NorthwindConnectionString %>" SelectCommand=
"select OD.OrderID as 'Order ID', C.CategoryID as 'Category ID', C.CategoryName as 'Category Name', SUM(P.UnitPrice * Quantity)  from
Products as P
inner join [Order Details] as OD
on P.ProductID = OD.ProductID
inner join [Categories] as C
on P.CategoryID = C.CategoryID
inner join [Orders] as O
on O.OrderID = OD.OrderID
WHERE (OD.OrderID = @OrderID)
group by 
OD.OrderID, C.CategoryID, C.CategoryName">
        <SelectParameters>
            <asp:ControlParameter ControlID="_lvOrders" Name="OrderID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="_lvOrders" runat="server" DataKeyNames="OrderID" DataSourceID="_sdsOrders" InsertItemPosition="LastItem" OnSelectedIndexChanged="_lvOrders_SelectedIndexChanged" AutoPostBack="true" OnPagePropertiesChanged="_lvOrders_PagePropertiesChanged"  >
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button CommandName="Select" runat="server" ID="SelectButton" Text="Pick Me" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
                </td>
                <td>
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate","{0:dd MMM yyyy}") %>'  />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="OrderIDLabel1" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                     <asp:DropDownList ID="CustomerDDL" runat="server" DataSourceID="_sdsCompnames" DataTextField="CompanyName" DataValueField="CustomerID" OnSelectedIndexChanged="CustomerDDL_SelectedIndexChanged" SelectedValue='<%# Bind("CustomerID") %>' ></asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' />
                    
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    
                    <asp:DropDownList ID="CustomerDDL" runat="server" DataSourceID="_sdsCompnames" DataTextField="CompanyName" DataValueField="CustomerID" OnSelectedIndexChanged="CustomerDDL_SelectedIndexChanged" SelectedValue='<%# Bind("CustomerID") %>' ></asp:DropDownList>
                    

                </td>
                <td>
                    
                    <asp:Calendar Width="100%" ID="CustomerCalendar" runat="server" SelectedDate='<%# Bind("OrderDate") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000; ">
                <td>
                    <asp:Button CommandName="Select" runat="server" ID="SelectButton" Text="Pick Me" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
                </td>
                <td>
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate","{0:dd-MMM-yy hh:mm:ss tt}") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" style="width: 80%;">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style=" width: 100%;background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif; ">
                            <tr runat="server" style=" background-color:#DCDCDC;color: #000000; ">
                                <th style="padding-top:20px; padding-bottom:20px; " runat="server"></th>
                                <th runat="server">OrderID</th>
                                <th runat="server">CustomerID</th>
                                <th runat="server">OrderDate</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000; ">
                        <asp:DataPager ID="DataPager1" runat="server" >
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
                </td>
                <td>
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate","{0:dd-MMM-yy hh:mm:ss tt}") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    
    <asp:DetailsView SkinID="_myDetailsView"   ID="_dv" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"  CellPadding="3" DataSourceID="_sdsCustom" ForeColor="Black" GridLines="Vertical" Height="50px" Width="25%" CaptionAlign="Top" DataKeyNames="Category ID" EmptyDataText="Drat nothing to see here!" >
        <Fields>
            <asp:BoundField DataField="Order ID" HeaderText="Order ID" SortExpression="Order ID" >
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Category ID" HeaderText="Category ID" InsertVisible="False" ReadOnly="True" SortExpression="Category ID" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Category Name" HeaderText="Category Name" SortExpression="Category Name" >
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Column1" HeaderText="Category Sum" ReadOnly="True" SortExpression="Column1"  DataFormatString="{0:C2}">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Fields>
        
        <HeaderTemplate>
            Summary Category Details View
        </HeaderTemplate>
        
    </asp:DetailsView>
    
</asp:Content>


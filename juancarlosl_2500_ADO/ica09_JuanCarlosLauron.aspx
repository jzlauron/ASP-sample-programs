<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ica09_JuanCarlosLauron.aspx.cs" Inherits="ica09_JuanCarlosLauron" %>

<asp:Content ID="Content1" ContentPlaceHolderID="_phHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="_phBody" Runat="Server">
    <h2>ica09 - Data Aware Controls</h2>
    <div class =" container">
        <div class="button">
            <asp:Button runat="server" ID="_btnProducts" Text="Show Products" OnClick="_btnProducts_Click"  />
            <asp:Button runat="server" ID="_btnEditEmp" Text="Edit Employees" OnClick ="_btnEditEmp_Click" />
        </div>
        <asp:MultiView ID="multiview" runat="server">
            <asp:View ID ="view1" runat="server">
                <asp:SqlDataSource ID="_ssdProducts" runat="server" ConnectionString="<%$ ConnectionStrings:jlauron1_NorthwindConnectionString %>" SelectCommand="SELECT [ProductName], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [CategoryName] FROM [Alphabetical list of products] ORDER BY [ProductName]"></asp:SqlDataSource>
                <asp:GridView ID="_gvProducts" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="_ssdProducts" ForeColor="#333333" AllowPaging="True" AllowSorting="True" OnRowDataBound="_gvProducts_RowDataBound">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" >
                        <HeaderStyle Font-Bold="True" />
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="QuantityPerUnit" HeaderText="Qty Per Unit" SortExpression="QuantityPerUnit" >
                        <HeaderStyle Font-Bold="True" />
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" SortExpression="UnitPrice" DataFormatString="{0:c}" >

                        <HeaderStyle Font-Bold="True" />
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>

                        <asp:BoundField DataField="UnitsInStock" HeaderText="Units in Stock" SortExpression="UnitsInStock" >
                        <HeaderStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UnitsOnOrder" HeaderText="Units on Order" SortExpression="UnitsOnOrder" >
                        <HeaderStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ReorderLevel" HeaderText="Reorder Level" SortExpression="ReorderLevel" >
                        <HeaderStyle Font-Bold="True" />
                        </asp:BoundField>
                        <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" >
                        <HeaderStyle Font-Bold="True" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:CheckBoxField>
                        <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" >
                        <HeaderStyle Font-Bold="True" />
                        <ItemStyle Font-Bold="True" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </asp:View>
            <asp:View ID="view2" runat="server">

                <asp:SqlDataSource ID="_ssdEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:jlauron1_NorthwindConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [HireDate], [Address], [City], [Country]) VALUES (@LastName, @FirstName, @Title, @HireDate, @Address, @City, @Country)" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [HireDate], [Address], [City], [Country] FROM [Employees] ORDER BY [EmployeeID]" UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title, [HireDate] = @HireDate, [Address] = @Address, [City] = @City, [Country] = @Country WHERE [EmployeeID] = @EmployeeID">
                    <DeleteParameters>
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="HireDate" Type="DateTime" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="Country" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="HireDate" Type="DateTime" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="Country" Type="String" />
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="_gvEmployees" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EmployeeID" DataSourceID="_ssdEmployees" ForeColor="#333333" GridLines="Horizontal" AllowPaging="True" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="HireDate" HeaderText="Hire Date" SortExpression="HireDate" DataFormatString="{0:ddMMMyyyy}" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                        <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>

            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>



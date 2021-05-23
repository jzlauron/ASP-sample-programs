use jlauron1_Northwind
go

if exists
(
	select * from sysobjects
	where name = 'GetCustomers'
	)
	drop procedure GetCustomers
go

create procedure GetCustomers
@filter varchar(25) = ''
as
select C.CustomerID,CompanyName
from jlauron1_Northwind.dbo.Customers as C
where C.CompanyName like '%' + @filter + '%'
go

if exists
(
	select * from sysobjects
	where name = 'CustCatSummary'
)
	drop procedure CustCatSummary
go

create procedure CustCatSummary
@id nchar(5)
as
select CategoryName as 'Category Name', Sum(OD.Quantity) as 'Total', '$' + CAST(CONVERT(varchar, CAST(SUM(Quantity * OD.UnitPrice) as money),1) as varchar) as 'Costs'
from jlauron1_Northwind.dbo.Customers as C
inner join jlauron1_Northwind.dbo.Orders as O on
C.CustomerID = O.CustomerID
inner join jlauron1_Northwind.dbo.[Order Details] as OD on
O.OrderID = OD.OrderID
inner join jlauron1_Northwind.dbo.Products as P on
OD.ProductID = P.ProductID
inner join jlauron1_Northwind.dbo.Categories as CA on
P.CategoryID = CA.CategoryID
where C.CustomerID = @id
group by CategoryName
order by SUM(OD.Quantity) desc
go

if exists
(
select * from sysobjects
where name = 'DeleteOrderDetails'
)
drop procedure DeleteOrderDetails
go

create procedure DeleteOrderDetails
@orderID int,
@productID int,
@status varchar(80) output
as
delete from jlauron1_Northwind.dbo.[Order Details]
where jlauron1_Northwind.dbo.[Order Details].OrderID = @orderID
and jlauron1_Northwind.dbo.[Order Details].ProductID = @productID
if(@@ROWCOUNT > 0)
set @status = 'Record Deleted'
else
set @status = 'No record deleted, possible error'
go

if exists
(
select * from sysobjects
where name = 'InsertOrderDetails'
)
drop procedure InsertOrderDetails
go

create procedure InsertOrderDetails
@OrderID int,
@ProductID int,
@Quantity int,
@Discount float = 0
as
if not exists
(
select ProductID from jlauron1_Northwind.dbo.Products
where ProductID = @ProductID
)
return 0
if not exists
(
select OrderID from jlauron1_Northwind.dbo.[Order Details]
where OrderID = @OrderID
)
return 0
if not exists
(
select ProductID from jlauron1_Northwind.dbo.[Order Details]
where OrderID = @OrderID and ProductID = @ProductID
)
begin

declare @price as money
set @price = (select UnitPrice from Products where ProductID = @ProductID)
insert into jlauron1_Northwind.dbo.[Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
values (@OrderID, @ProductID, @price, @Quantity, @Discount)
end

else
begin
update [Order Details]
set Quantity = @Quantity
where OrderID= @OrderID and ProductID = @ProductID
end
return @@ROWCOUNT
go


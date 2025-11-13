use NORTHWND
go

--1--
select*from Categories
--2--
select firstname,lastname,DATEDIFF(YEAR,HireDate,GETDATE()) as age
from Employees
--3--
select*from Employees
where Country='USA'
--4--
select*from Orders
where Freight>20 and year(OrderDate)=1998

--5--
select*from Orders
where ShipCountry='Brazil'


--6--
select distinct ShipCountry
from Orders

--7--
select firstname,lastname,DATEDIFF(YEAR,Birthdate,GETDATE()) as age
from Employees

--8--
SELECT 
    FirstName,
    LastName,
    DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age,
    CASE 
        WHEN DATEDIFF(YEAR, BirthDate, GETDATE()) > 50 THEN 'G1'
        ELSE 'G2'
    END AS AgeGroup
FROM Employees;

--9--
select*,UnitPrice,Quantity as totalsales from [Order Details]

--10--
select top 4 *,UnitPrice,Quantity as totalsales from [Order Details]

--11--
select top 4 *,UnitPrice,Quantity as totalsales from [Order Details]

--12--
select count(*) numberofCoustemers from Customers

--13--
select count(*) numberofCoustemers from Customers
where Country='USA'

--14--
select count(*) numberofCoustemers,Country from Customers
group by Country
order by numberofCoustemers Desc

--15--

 select count(*) numberofCoustemers_Contact,ContactTitle from Customers
 group by ContactTitle
 order by numberofCoustemers_Contact Desc


 --16--
select P.ProductID,P.ProductName,ContactName
from Products as p
inner join Suppliers as s
on p.SupplierID=s.SupplierID


select Products.ProductID ,Products.ProductName,Suppliers.ContactName,Suppliers.Country
from Products
inner join Suppliers 
on Products.SupplierID=Suppliers.SupplierID

--17--
select count(*) as numberofProuduct,CategoryName
from Products as pp
inner join Categories as cc
on pp.CategoryID=cc.CategoryID
group by CategoryName
order by numberofProuduct desc
--18--
select Products.ProductID,Products.ProductName from Products
where UnitsInStock<ReorderLevel
--19--
select*from Customers as cc
left join orders as oo
on cc.CustomerID=oo.CustomerID
where EmployeeID is null

--20--
select top 5 * from Orders
where month(OrderDate)=2
order by Freight desc
--21--
select*from Orders
where ShippedDate>RequiredDate
--22--
select count(*) as NumberofDelaiedorders,EmployeeID
from Orders
where ShippedDate>RequiredDate
group by EmployeeID
order by NumberofDelaiedorders desc
--23--
select top 2 Percent*from Orders
order by NEWID()
--24--
select top 1 * from 
(select count(*) as numberofOrders,EmployeeID from Orders 
group by EmployeeID )as tt
inner join Employees as ee
on 
tt.EmployeeID=ee.EmployeeID
--25--
SELECT 
    ShipCountry, 
    AVG(Freight) AS AvgFreight
FROM Orders
GROUP BY ShipCountry
ORDER BY AvgFreight DESC;

--26--
SELECT 
    ProductID,
    ProductName,
    UnitPrice
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
order by UnitPrice
--27--
SELECT Country FROM Customers
INTERSECT
SELECT Country FROM Suppliers;

--28--
select Country from Suppliers
union
select Country from Customers

--29--
select
max(UnitPrice) as maxprice,
min(UnitPrice) as minprice
from Products

--30--
select
sum(Quantity*UnitPrice) as total
FROM [Order Details];

--31--
SELECT 
    OrderID,
    SUM(UnitPrice * Quantity) AS OrderTotal
FROM [Order Details]
GROUP BY OrderID
ORDER BY OrderTotal DESC;

--32--
SELECT 
    OrderID,
    SUM(UnitPrice * Quantity) AS TotalAmount
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice * Quantity) > 2000
ORDER BY TotalAmount DESC;
--33--
SELECT 
    ShipCountry,
    COUNT(OrderID) AS TotalOrders
FROM Orders
GROUP BY ShipCountry
ORDER BY TotalOrders DESC;
--34--
SELECT 
    AVG(DATEDIFF(DAY, RequiredDate, ShippedDate)) AS AvgDelay
FROM Orders
WHERE ShippedDate IS NOT NULL;

--35--
SELECT 
    ProductID,
    AVG(Discount) AS AvgDiscount
FROM [Order Details]
GROUP BY ProductID
ORDER BY AvgDiscount DESC;


    






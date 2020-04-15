-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select pro.ProductName, cat.CategoryName
from product as pro
join category as cat on pro.CategoryId = cat.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.id as OrderID, o.OrderDate, s.CompanyName as ShipperName
from [order] as o 
join shipper as s on o.ShipVia = s.id 
where o.orderdate < '2012-08-09'
order by o.OrderDate;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.ProductName, od.Quantity
from [order] as o
join OrderDetail as od on od.OrderId = o.id
join Product as p on p.id = od.ProductId
where o.id = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.id as "Order ID", c.CompanyName as "Customer Company Name", e.LastName as "Employee Last Name"
from [order] as o
join customer as c on c.id = o.CustomerId
join employee as e on e.id = o.EmployeeId;
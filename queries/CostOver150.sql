SELECT
Customers.ID AS CustomerID,
CONCAT(Customers.FirstName, ' ', Customers.LastName) AS CustomerName,
Orders.ID AS OrderID,
Orders.TotalCost AS Cost,
Menus.Name AS MenuName,
Starters.Name AS StarterName,
Courses.Name AS CourseName
FROM
Customers JOIN Orders 
JOIN MenusOrders
JOIN Menus
JOIN MenuItems AS Starters
JOIN MenuItems AS Courses
ON Orders.CustomerID = Customers.ID
AND MenusOrders.OrderID = Orders.ID
AND MenusOrders.MenuID = Menus.ID
AND Menus.StarterID = Starters.ID
AND Menus.CourseID = Courses.ID
WHERE TotalCost > 150;
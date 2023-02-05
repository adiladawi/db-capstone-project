SELECT
ID,
Name,
Price
FROM MenuItems
WHERE ID IN (
SELECT MenuItemID FROM (
	SELECT Menus.StarterID AS MenuItemID
	FROM Orders JOIN MenusOrders JOIN Menus
	ON Orders.ID = MenusOrders.OrderID AND Menus.ID = MenusOrders.MenuID
	UNION ALL
	SELECT Menus.CourseID
	FROM Orders JOIN MenusOrders JOIN Menus
	ON Orders.ID = MenusOrders.OrderID AND Menus.ID = MenusOrders.MenuID
	UNION ALL
	SELECT Menus.DessertID
	FROM Orders JOIN MenusOrders JOIN Menus
	ON Orders.ID = MenusOrders.OrderID AND Menus.ID = MenusOrders.MenuID
	UNION ALL
	SELECT Menus.DrinkID
	FROM Orders JOIN MenusOrders JOIN Menus) AS IdCount GROUP BY MenuItemID HAVING COUNT(*) > 2
);
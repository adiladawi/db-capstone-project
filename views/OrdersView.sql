CREATE OR REPLACE VIEW OrdersView AS
SELECT
Orders.ID AS OrderID,
SUM(MenusOrders.Quantity) AS Quantity,
TotalCost AS Cost
FROM Orders JOIN MenusOrders
ON MenusOrders.OrderID = Orders.ID
GROUP BY Orders.ID
HAVING Quantity > 2;
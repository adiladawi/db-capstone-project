CREATE PROCEDURE GetMaxQuantity ()
SELECT MAX(Qty) FROM (
	SELECT SUM(Quantity) AS Qty 
    FROM Orders 
    JOIN MenusOrders ON MenusOrders.OrderID = Orders.ID 
    GROUP BY Orders.ID 
) AS NetQuantity;
DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER //
CREATE PROCEDURE CancelOrder(IN OrderID INT)
BEGIN
DELETE FROM Orders WHERE ID = OrderID;
SELECT CONCAT("Order ", @OrderID, " is canceled") AS Confirmation;
END //
DELIMITER ;

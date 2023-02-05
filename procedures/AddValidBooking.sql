DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //
CREATE PROCEDURE AddValidBooking(IN newDate DATE, IN newTable INT)
BEGIN
START TRANSACTION;
INSERT INTO Bookings (Date, TableNo) VALUES (newDate, newTable);
IF (SELECT COUNT(Date) FROM Bookings WHERE Date = newDate AND TableNo = newTable) > 1
THEN
ROLLBACK;
SELECT CONCAT("Table ", newTable, " is already booked for ", newDate, ". Booking canceled.") AS BookingStatus;
ELSE
COMMIT;
SELECT CONCAT("Successfully booked table ", newTable, " for ", newDate, ".") AS BookingStatus;
END IF;
END //
DELIMITER ;

CALL AddValidBooking("2022-10-13", 3);
SELECT * FROM Bookings;
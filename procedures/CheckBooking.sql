DROP PROCEDURE IF EXISTS CheckBooking;

CREATE PROCEDURE CheckBooking(IN checkDate DATE, IN checkTable INT)
SELECT IF (EXISTS (SELECT ID FROM Bookings WHERE TableNo = checkTable AND Date = checkDate),
CONCAT("The table ", checkTable, " is already booked for ", checkDate), 
CONCAT("The table ", checkTable, " is free for ", checkDate)) AS BookingStatus;

CALL CheckBooking("2022-10-10", 5);

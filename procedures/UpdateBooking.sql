DROP PROCEDURE IF EXISTS UpdateBooking;

CREATE PROCEDURE UpdateBooking(BookingID INT, newDate DATE)
UPDATE Bookings SET Date = newDate WHERE ID = BookingID;
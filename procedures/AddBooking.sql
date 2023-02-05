DROP PROCEDURE IF EXISTS AddBooking;

CREATE PROCEDURE AddBooking(newBookingID INT, newCustomerID INT, newDate DATE, newTable INT)
INSERT INTO Bookings (ID, CustomerID, Date, TableNo) VALUES (newBookingID, newCustomerID, newDate, newTable);

-- User Register Table
CREATE TABLE Register(
	UserId int IDENTITY, CONSTRAINT pk_id PRIMARY KEY (Id), 	
	UserName VARCHAR(250),
	Email VARCHAR(100), CONSTRAINT unq_email UNIQUE(Email),
	PhoneNumber VARCHAR(20), CONSTRAINT unq_phno UNIQUE(PhoneNumber),
	UserRole VARCHAR(20),
	UserPassword VARCHAR(50), CONSTRAINT unq_usrpass UNIQUE(UserPassword),
);


SELECT * FROM Register

-- TO change the Column name
Exec sp_rename 'Register.Id', 'UserId', 'Column';

INSERT INTO Register (UserName, Email, PhoneNumber, UserRole, UserPassword,ConfirmPassword) VALUES('Shiva', 'shiva15@gmail.com', '9954213005', 'Employee', 'JenShiv7@', 'JenShiv7@')

-- Constraint Error Log table
CREATE TABLE ErrorLog(
	ErrorId INT IDENTITY,
	ErrorUserName VARCHAR(150),
	ErrorLine VARCHAR(150),
	ErrorMessage VARCHAR(MAX),
	ErrorNumber INT,
	ErrorProcedure VARCHAR (MAX),
	ErrorTime DATETIME
)

SELECT * FROM ErrorLog

-- Registeration and Error Log, Stored Procedure
CREATE PROCEDURE Sp_Register(
	@UserName VARCHAR(250),
	@Email VARCHAR(100),
	@PhoneNumber VARCHAR(20),
	@UserRole VARCHAR(20),
	@UserPassword VARCHAR(50),
	@Option INT
)
AS
BEGIN
	BEGIN TRY

		if(@Option = 1)
			INSERT INTO Register(UserName, Email, PhoneNumber, UserRole, UserPassword) 
			VALUES(@UserName, @Email, @PhoneNumber, @UserRole, @UserPassword)
		
		else if(@Option = 2)
			UPDATE Register SET Email = @Email, PhoneNumber = @PhoneNumber, UserRole = @UserRole, UserPassword = @UserPassword
			WHERE UserName = @UserName

		else if(@Option = 3)
			DELETE Register WHERE UserName = @UserName;
			
	END TRY

	BEGIN CATCH
		INSERT INTO ErrorLog
		SELECT 
		SUSER_NAME() AS UserName,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage,
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_PROCEDURE() AS ErrorProcedure,
		GETDATE() AS ErrorTime
	END CATCH
END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Login Authentication, Stored Procedure
CREATE PROCEDURE Sp_Login(
	@UserRole VARCHAR(20),
	@Email VARCHAR(100),
	@UserPassword VARCHAR(50)
)
AS
BEGIN
	SELECT UserId, UserName, UserRole FROM dbo.Register WHERE Email = @Email AND UserPassword = @UserPassword AND UserRole = @UserRole
END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Contact US
CREATE TABLE ContactUs(
	ContactId INT IDENTITY,
	CustomerName VARCHAR(150),
	CustomerEmail VARCHAR(100), CONSTRAINT unq_custemail UNIQUE(CustomerEmail),
	CustomerNumber VARCHAR(20), CONSTRAINT unq_custno UNIQUE(CustomerNumber),
	CustomerMessage VARCHAR(MAX),
	ProcessStatus VARCHAR(30) DEFAULT 'Pending'
)

SELECT * FROM ContactUs

DROP TABLE ContactUs

-- User, Insert Contact Us Stored Procedure
CREATE PROCEDURE Sp_ContactUs(
	@CustomerName VARCHAR(150),
	@CustomerEmail VARCHAR(100),
	@CustomerNumber VARCHAR(20),
	@CustomerMessage VARCHAR(MAX)
)
AS
BEGIN
	INSERT INTO ContactUs (CustomerName, CustomerEmail, CustomerNumber, CustomerMessage) 
	VALUES (@CustomerName, @CustomerEmail, @CustomerNumber, @CustomerMessage);
END

-- Admin View, Stored Procedure
CREATE PROCEDURE Sp_GetContactMessages
AS
BEGIN
	SELECT * FROM ContactUs
END

-- Admin Update, Stored Procedure
CREATE PROCEDURE Sp_UpdateContactMessages(
	@ContactId INT,
	@ProcessStatus VARCHAR(30)
)
AS
BEGIN
	UPDATE ContactUs SET ProcessStatus = @ProcessStatus WHERE ContactId = @ContactId
END



Exec sp_helptext 'Sp_Register';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Rooms

-- Rooms Table
CREATE TABLE Rooms(
	RoomId INT IDENTITY, CONSTRAINT pk_roomid PRIMARY KEY (RoomId),
	RoomNumber INT NOT NULL,
	RoomType VARCHAR(150) NOT NULL,
	RoomDescription VARCHAR(MAX),
	Price DECIMAL(10, 2),
	Guests INT NOT NULL, 
	Amenities VARCHAR(MAX),
	ImagePath VARCHAR(255)
)

SELECT * FROM Rooms

DROP TABLE Rooms

INSERT INTO Rooms (RoomNumber, RoomType, RoomDescription, Price, Guests, Amenities, ImagePath) 
VALUES(101,'Deluxe Room', 'A comfortable deluxe room designed for relaxation. Perfect for guests looking for both comfort and convenience.',3500.00,2, 'WiFi, AC, Smart TV', 'Images/Home_Page_Images/Deluxe.jpg'),
(102, 'Luxury Room', 'A spacious luxury room offering premium comfort with a separate living area, elegant interiors, and high-quality amenities.', 4500.00, 3, 'WiFi, AC, Smart TV, Geyser','Images/Home_Page_Images/Luxury.jpg'),
(201, 'Family Suite', 'Large suite for families, featuring multiple beds and ample space to relax.', 5500.00, 4, 'WiFi, AC, Smart TV, Gyser, Kitchen', 'Images/Home_Page_Images/Single.jpg'),
(301, 'Luxury Room', 'A spacious luxury room offering premium comfort with a separate living area, elegant interiors, and high-quality amenities.', 4500.00, 3, 'WiFi, AC, Smart TV, Geyser', 'Images/Home_Page_Images/Luxury.jpg'),
(302, 'Family Suite', 'Large suite for families, featuring multiple beds and ample space to relax.', 5500.00, 4, 'WiFi, AC, Smart TV, Gyser, Kitchen', 'Images/Home_Page_Images/Single.jpg'),
(303, 'Deluxe Room', 'A comfortable deluxe room designed for relaxation. Perfect for guests looking for both comfort and convenience.', 3500.00, 2, 'WiFi, AC, Smart TV' ,'Images/Home_Page_Images/Deluxe.jpg')


-- Admin View Rooms, Stored Procedure
CREATE PROCEDURE Sp_AdminGetAllRooms
AS
BEGIN
	SELECT RoomId, RoomNumber, RoomType, RoomDescription,Amenities, Guests, Price, ImagePath FROM Rooms;
END

-- Total Rooms, Users, Bookings Count. Stored Procedure
CREATE PROCEDURE Sp_AdminTotalRoomsUsersBookings
AS
BEGIN
	SELECT (SELECT COUNT(*) FROM Rooms) AS Total_Rooms,
			(SELECT COUNT(*) FROM Register WHERE UserRole = 'User') AS Total_Users,
			(SELECT COUNT(*) FROM Bookings) AS Total_Bookings
END

-- User Rooms, Stored Procedure
ALTER PROCEDURE Sp_ViewRooms
AS
BEGIN
	SELECT ImagePath, RoomType, RoomDescription, Amenities, Guests, Price, RoomId  FROM Rooms;
END

-- Admin Insert. Stored Procedure
CREATE PROCEDURE Sp_InsertRooms(
	@RoomNumber INT,
	@RoomType VARCHAR(150),
	@RoomDescription VARCHAR(MAX),
	@Price DECIMAL(10, 2),
	@Guests INT,
	@Amenities VARCHAR(MAX),
	@ImagePath VARCHAR(255)
)
AS
BEGIN
	INSERT INTO Rooms(RoomNumber, RoomType, RoomDescription, Price, Guests, Amenities, ImagePath) 
	VALUES(@RoomNumber, @RoomType , @RoomDescription, @Price, @Guests, @Amenities, @ImagePath)
END

-- Admin Update. Stored Procedure
CREATE PROCEDURE Sp_UpdateRooms(
	@RoomId INT,
	@RoomNumber INT,
	@RoomType VARCHAR(150),
	@RoomDescription VARCHAR(MAX),
	@Price DECIMAL(10, 2),
	@Guests INT,
	@Amenities VARCHAR(MAX),
	@ImagePath VARCHAR(255)
)
AS
BEGIN
	UPDATE Rooms SET RoomNumber = @RoomNumber, RoomType = @RoomType, RoomDescription = @RoomDescription, Price = @Price, Guests = @Guests, Amenities = @Amenities, ImagePath = @ImagePath 
	WHERE RoomId = @RoomId
END
		
-- Admin Delete. Stored Procedure
CREATE PROCEDURE Sp_DeleteRooms(
	@RoomId INT
)
AS
BEGIN
	DELETE FROM Rooms WHERE RoomId = @RoomId
END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Bookings

-- Booking Table
Create TABLE Bookings(
	BookingId INT IDENTITY, CONSTRAINT pk_bookingid PRIMARY KEY (BookingId),
	UserId INT, CONSTRAINT fk_userid FOREIGN KEY(UserId) REFERENCES Register(UserId),
	RoomId INT, CONSTRAINT fk_roomid FOREIGN KEY(RoomId) REFERENCES Rooms(RoomId),
	CheckInDate DATE,
	CheckOutDate DATE,
	BookingDate DATETIME DEFAULT GETDATE(),
	TotalPrice DECIMAL(10, 2),
	BookingStatus VARCHAR(50) DEFAULT 'Confirmed'
);

INSERT INTO Bookings (UserId, RoomId, CheckInDate, CheckOutDate) 
VALUES(1, 2, '2026-03-02', '2026-03-08'), (1, 1, '2026-03-14', '2026-03-22');

SELECT * FROM Bookings	

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ADMIN View, Stored Procedure
CREATE PROCEDURE Sp_GetAllBookings
AS
BEGIN
	SELECT B.BookingId, U.UserName, R.RoomNumber, B.CheckInDate, B.CheckOutDate, B.BookingStatus FROM Bookings AS B
	INNER JOIN Register AS U ON U.UserId = B.UserId INNER JOIN Rooms AS R ON R.RoomId = B.RoomId
END

-- User View, Stored Procedure
CREATE PROCEDURE Sp_GetAllUserBookingTable(
	@UserId INT
)
AS
BEGIN
	SELECT R.RoomNumber, R.RoomType, B.CheckInDate, B.CheckOutDate, R.Guests, B.TotalPrice, B.BookingStatus FROM Bookings AS B
	JOIN Rooms AS R ON B.RoomId = R.RoomId WHERE B.UserId = @UserId;
END

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Main Home Page View Card Stored Procedure
CREATE PROCEDURE Sp_HomePageCard
AS
BEGIN
	SELECT TOP 3 ImagePath, RoomType, RoomDescription, Guests, Amenities, Pricez, RoomId FROM Rooms 
END

--  User Room Booking Stored Procedure
CREATE PROCEDURE Sp_Booking(
	@UserId INT,
	@RoomId INT,
	@CheckInDate DATE,
	@CheckOutDate DATE,
	@TotalPrice DECIMAL(10, 2)
)
AS
BEGIN
	INSERT INTO Bookings (UserId, RoomId, CheckInDate, CheckOutDate, TotalPrice) VALUES (@UserId, @RoomId, @CheckInDate, @CheckOutDate, @TotalPrice)
END

ALTER PROCEDURE Sp_BookingDetailsView(
	@RoomId INT
)
AS
BEGIN
	SELECT RoomNumber, RoomType, Guests, Price FROM Rooms WHERE RoomId=@RoomId;
END


SELECT * FROM ContactUs

SELECT * FROM Register

SELECT * FROM Bookings

SELECT * FROM Rooms
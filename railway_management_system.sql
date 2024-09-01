
CREATE DATABASE RailwayManagementSystem;


USE RailwayManagementSystem;

-- Table to store information about stations
CREATE TABLE Stations (
    StationID INT PRIMARY KEY AUTO_INCREMENT,
    StationName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL
);

-- Table to store information about trains
CREATE TABLE Trains (
    TrainID INT PRIMARY KEY AUTO_INCREMENT,
    TrainName VARCHAR(100) NOT NULL,
    TrainType VARCHAR(50) NOT NULL, -- e.g., Express, Passenger, etc.
    TotalSeats INT NOT NULL
);

-- Table to store information about train routes (train stops at different stations)
CREATE TABLE TrainRoutes (
    RouteID INT PRIMARY KEY AUTO_INCREMENT,
    TrainID INT NOT NULL,
    StationID INT NOT NULL,
    ArrivalTime TIME,
    DepartureTime TIME,
    SequenceNumber INT NOT NULL, -- Order of stations on the route
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (StationID) REFERENCES Stations(StationID)
);

-- Table to store information about passengers
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

-- Table to store information about bookings
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT NOT NULL,
    TrainID INT NOT NULL,
    BookingDate DATE NOT NULL,
    JourneyDate DATE NOT NULL,
    SourceStationID INT NOT NULL,
    DestinationStationID INT NOT NULL,
    SeatNumber INT NOT NULL,
    Class VARCHAR(20) NOT NULL, -- e.g., First Class, Second Class, etc.
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID),
    FOREIGN KEY (SourceStationID) REFERENCES Stations(StationID),
    FOREIGN KEY (DestinationStationID) REFERENCES Stations(StationID)
);

-- Table to store information about tickets
CREATE TABLE Tickets (
    TicketID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT NOT NULL,
    TicketPrice DECIMAL(10, 2) NOT NULL,
    Status VARCHAR(20) NOT NULL, -- e.g., Confirmed, Waiting, Cancelled
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Insert sample data into Stations table
INSERT INTO Stations (StationName, City, State)
VALUES
('New Delhi', 'Delhi', 'Delhi'),
('Mumbai Central', 'Mumbai', 'Maharashtra'),
('Chennai Central', 'Chennai', 'Tamil Nadu'),
('Howrah', 'Kolkata', 'West Bengal'),
('Bangalore City', 'Bangalore', 'Karnataka');

-- Insert sample data into Trains table
INSERT INTO Trains (TrainName, TrainType, TotalSeats)
VALUES
('Rajdhani Express', 'Express', 1000),
('Shatabdi Express', 'Express', 800),
('Duronto Express', 'Express', 1200),
('Garib Rath', 'Express', 1500);

-- Insert sample data into TrainRoutes table
INSERT INTO TrainRoutes (TrainID, StationID, ArrivalTime, DepartureTime, SequenceNumber)
VALUES
(1, 1, '10:00:00', '10:15:00', 1),
(1, 2, '16:00:00', '16:15:00', 2),
(1, 3, '20:00:00', '20:15:00', 3),
(2, 1, '08:00:00', '08:10:00', 1),
(2, 4, '14:00:00', '14:15:00', 2);

-- Insert sample data into Passengers table
INSERT INTO Passengers (FirstName, LastName, Gender, DateOfBirth, Email, PhoneNumber)
VALUES
('John', 'Doe', 'Male', '1990-01-01', 'john.doe@example.com', '1234567890'),
('Jane', 'Smith', 'Female', '1985-05-15', 'jane.smith@example.com', '0987654321');

-- Insert sample data into Bookings table
INSERT INTO Bookings (PassengerID, TrainID, BookingDate, JourneyDate, SourceStationID, DestinationStationID, SeatNumber, Class)
VALUES
(1, 1, '2024-09-01', '2024-09-15', 1, 3, 45, 'First Class'),
(2, 2, '2024-09-02', '2024-09-18', 4, 1, 12, 'Second Class');

-- Insert sample data into Tickets table
INSERT INTO Tickets (BookingID, TicketPrice, Status)
VALUES
(1, 1500.00, 'Confirmed'),
(2, 1200.00, 'Confirmed');

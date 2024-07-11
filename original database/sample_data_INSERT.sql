use Wisdom_RubberProject_Practice_3;
-- Inserting sample data into Country table
INSERT INTO Country (CountryName)
VALUES ('Vietnam'), ('Laos'), ('Cambodia');

-- Inserting sample data into Region table
INSERT INTO Region (CountryID, RegionName)
VALUES 
    (1, 'Northern Vietnam'),
    (1, 'Central Vietnam'),
    (1, 'Southern Vietnam'),
    (2, 'Northern Laos'),
    (2, 'Central Laos'),
    (3, 'Northern Cambodia'),
    (3, 'Southern Cambodia');

-- Inserting sample data into Address table
INSERT INTO Address (RegionID, City, AddressLine)
VALUES 
    (1, 'Hanoi', '123 Nguyen Trai Street'),
    (2, 'Danang', '456 Le Duan Street'),
    (3, 'Ho Chi Minh City', '789 Dien Bien Phu Street'),
    (4, 'Vientiane', '321 Samsenthai Road'),
    (5, 'Luang Prabang', '654 Kingkitsarath Road'),
    (6, 'Phnom Penh', '987 Sisowath Quay'),
    (7, 'Siem Reap', '246 Pub Street');

-- Inserting sample data into Account table
INSERT INTO Account (Username, Password, Role)
VALUES 
    ('admin', 'admin123', 'Admin'),
    ('user1', 'pass123', 'User'),
    ('user2', 'pass456', 'User');

-- Inserting sample data into UserInfo table
INSERT INTO UserInfo (FirstName, LastName, Gender, DateOfBirth, AddressID, AccountID, Email, PhoneNumber)
VALUES 
    ('John', 'Doe', 'Male', '1990-05-15', 1, 1, 'john.doe@example.com', '1234567890'),
    ('Jane', 'Smith', 'Female', '1995-08-20', 2, 2, 'jane.smith@example.com', '9876543210');

-- Inserting sample data into Field table
INSERT INTO Field (RegionID, FieldName, Area)
VALUES 
    (1, 'Rice Field A', 100.50),
    (1, 'Rice Field B', 75.25),
    (2, 'Coffee Plantation A', 200.75);

-- Inserting sample data into RubberTree table
INSERT INTO RubberTree (FieldID, Location)
VALUES 
    (1, 'Nearby Village A'),
    (1, 'Nearby Village B'),
    (2, 'Nearby Village C');

-- Inserting sample data into RubberTreeInformation table
INSERT INTO RubberTreeInformation (TreeID, TopHeight, CrownHeight, Diameter, Circumference, CheckDate)
VALUES 
    (1, 15.5, 10.2, 5.5, 17.3, '2024-07-07'),
    (2, 18.3, 12.8, 6.1, 19.8, '2024-07-07');

-- Inserting sample data into Plan table
INSERT INTO [Plan] (Name, Description, StartDate)
VALUES 
    ('Harvest Plan 2024', 'Plan for rubber tree harvest in 2024', '2024-06-01'),
    ('Planting Plan 2025', 'Plan for new rubber tree planting in 2025', '2025-01-01');

-- Inserting sample data into PlanDetail table
INSERT INTO PlanDetail (FieldID, PlanID)
VALUES 
    (1, 1),
    (2, 1),
    (3, 2);

-- Inserting sample data into Lidar table
INSERT INTO Lidar (Model)
VALUES ('Lidar Model 1'), ('Lidar Model 2');

-- Inserting sample data into Camera table
INSERT INTO Camera (Model)
VALUES ('Camera Model 1'), ('Camera Model 2');

-- Inserting sample data into Radar table
INSERT INTO Radar (Model)
VALUES ('Radar Model 1'), ('Radar Model 2');

-- Inserting sample data into SensorControlSystem table
INSERT INTO SensorControlSystem (LidarID, CameraID, RadarID)
VALUES (1, 1, 1), (2, 2, 2);

-- Inserting sample data into Robot table
INSERT INTO Robot (TypeRobot, Model, Status)
VALUES 
    ('Harvesting', 'Robot H-1', 1),
    ('Harvesting', 'Robot H-2', 1),
    ('Planting', 'Robot P-1', 1),
    ('Planting', 'Robot P-2', 0);

-- Inserting sample data into Energy table
INSERT INTO Energy (RobotID, RemainingTime, RemainingEnergy)
VALUES 
    (1, '4 hours', 85.5),
    (2, '3.5 hours', 76.2),
    (3, '5 hours', 92.8),
    (4, '2 hours', 50.0);

-- Inserting sample data into RobotTapping table
INSERT INTO RobotTapping (RobotID, TreeID, Direction, Speed, Quantity)
VALUES 
    (1, 1, 'North', 1.5, 100),
    (1, 2, 'South', 1.7, 120),
    (2, 1, 'West', 1.8, 110),
    (2, 3, 'East', 1.6, 105);

-- Inserting sample data into Blade table
INSERT INTO Blade (RobotTappingID, TappingStatus, Angle, Depth, BladeStatus)
VALUES 
    (1, 'In Progress', 30.5, 12.5, 'Sharp'),
    (2, 'Completed', 45.2, 15.3, 'Worn out');

-- Inserting sample data into Environment table
INSERT INTO Environment (RobotTappingID, WindDirection, WindSpeed, Temperature, Rainfall, [Time])
VALUES 
    (1, 'Northwest', 10.2, 28.5, 0.5, '2024-07-07 10:00:00'),
    (2, 'Southeast', 8.9, 30.0, 1.2, '2024-07-07 11:00:00');

-- Inserting sample data into Drone table
INSERT INTO Drone (RobotID, ScsID)
VALUES 
    (1, 1),
    (2, 2);

-- Inserting sample data into DroneInformation table
INSERT INTO DroneInformation (DroneID, Direction, Speed, Height, CurrentLocation)
VALUES 
    (1, 'North', 25.5, 50.0, 'Nearby Field A'),
    (2, 'East', 30.0, 55.5, 'Nearby Field B');

-- Inserting sample data into DroneImage table
INSERT INTO DroneImage (DroneID, TreeID, Image)
VALUES 
    (1, 1, 'drone_image_1.jpg'),
    (2, 2, 'drone_image_2.jpg');

-- Inserting sample data into ChargingStation table
INSERT INTO ChargingStation (Location, MaxRobotNumber, CurrentRobotNumber, Status)
VALUES 
    ('Station A', 5, 3, 'Active'),
    ('Station B', 7, 5, 'Active');

-- Inserting sample data into ChargingStatus table
INSERT INTO ChargingStatus (DroneID, ChargingStationID, CurrentBattery, Status)
VALUES 
    (1, 1, 75.5, 1),
    (2, 2, 80.0, 1);

-- Inserting sample data into Task table
INSERT INTO Task (RobotID, PlanID, ActionDetail)
VALUES 
    (1, 1, 'Harvesting rubber trees in Field A'),
    (2, 2, 'Planting new rubber trees in Field B');

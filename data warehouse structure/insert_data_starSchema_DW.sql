--use master
use Wisdom_rubberProject_starSchema_DW


INSERT INTO userInfo (user_name, password, role, firstName, lastName, gender, dateOfBirth, phoneNumber, email, createDate, updateDate, addressLine, city)
VALUES
('john_doe', 'password123', 'admin', 'John', 'Doe', 'Male', '1990-05-15', '+1234567890', 'john.doe@example.com', '2024-07-12', '2024-07-12', '123 Main St', 'Anytown'),
('jane_smith', 'password456', 'user', 'Jane', 'Smith', 'Female', '1995-08-20', '+1987654321', 'jane.smith@example.com', '2024-07-12', '2024-07-12', '456 Elm St', 'Othertown'),
('sam_jones', 'password789', 'user', 'Sam', 'Jones', 'Male', '1988-12-10', '+1654321897', 'sam.jones@example.com', '2024-07-12', '2024-07-12', '789 Oak St', 'Smalltown'),
('emily_white', 'passwordabc', 'user', 'Emily', 'White', 'Female', '1992-04-25', '+1765432987', 'emily.white@example.com', '2024-07-12', '2024-07-12', '321 Pine St', 'Villagetown'),
('michael_brown', 'passwordxyz', 'user', 'Michael', 'Brown', 'Male', '1985-07-30', '+1876543210', 'michael.brown@example.com', '2024-07-12', '2024-07-12', '654 Birch St', 'Largetown');

INSERT INTO country (countryName)
VALUES
('Vietnam'),
('Thailand'),
('Indonesia'),
('Malaysia'),
('India');

INSERT INTO region (country_id, regionName)
VALUES
(1, 'Southern Region'),
(2, 'Northern Region'),
(3, 'Western Region'),
(4, 'Eastern Region'),
(5, 'Central Region');

INSERT INTO fields (region_id, fieldName, area)
VALUES
(1, 'Field 1', 100.5),
(2, 'Field 2', 75.2),
(3, 'Field 3', 120.8),
(4, 'Field 4', 90.0),
(5, 'Field 5', 110.3);

INSERT INTO rubberTrees (field_id, latitude, longitude, topHeight, crownHeight, circumference, diameter, checkDate)
VALUES
(1, 10.1234, 105.5678, 15.5, 10.2, 30.5, 5.5, '2024-07-12'),
(2, 11.3456, 106.7890, 14.2, 9.8, 28.3, 5.2, '2024-07-12'),
(3, 12.5678, 107.8901, 16.8, 11.4, 32.1, 5.8, '2024-07-12'),
(4, 13.7890, 108.0123, 13.7, 8.5, 27.6, 4.9, '2024-07-12'),
(5, 14.9012, 109.1234, 17.2, 12.1, 33.8, 6.1, '2024-07-12');

INSERT INTO plans (field_id, planTitle, planDescription, startDate)
VALUES
(1, 'Harvesting Plan 1', 'Harvest latex from mature trees', '2024-07-15'),
(2, 'Harvesting Plan 2', 'Collect latex from young trees', '2024-07-18'),
(3, 'Maintenance Plan 1', 'Prune trees and inspect field', '2024-07-20'),
(4, 'Harvesting Plan 3', 'Final harvest of the season', '2024-07-22'),
(5, 'Maintenance Plan 2', 'Fertilize and treat trees', '2024-07-25');

INSERT INTO tasks (plan_id, robot_id, detail)
VALUES
(1, 1, 'Collect latex from trees in Field 1'),
(2, 2, 'Survey trees in Field 2 for tapping'),
(3, 3, 'Inspect trees and soil in Field 3'),
(4, 4, 'Harvest latex from trees in Field 4'),
(5, 5, 'Apply fertilizer and treat trees in Field 5');

INSERT INTO robot (model, robotType, status, remainEnergy, remainTime)
VALUES
('Drone 1', 'Drone', 1, 80.5, 5.0),
('Tapping Robot 1', 'Tapping Robot', 1, 90.0, 6.0),
('Drone 2', 'Drone', 1, 75.2, 4.5),
('Tapping Robot 2', 'Tapping Robot', 0, 20.8, 1.2),
('Drone 3', 'Drone', 1, 85.7, 4.8);

INSERT INTO robotTapping (robot_id, direction, speed, quantity)
VALUES
(2, 'North', 2.5, 50.0),
(4, 'South', 3.0, 40.0),
(5, 'East', 2.8, 45.0),
(2, 'West', 2.3, 48.0),
(3, 'Northwest', 2.7, 52.0);

INSERT INTO blade (robotTapping_id, tappingStatus, angle, depth, bladeStatus)
VALUES
(1, 'Active', 45.0, 7.5, 'Good'),
(2, 'Active', 50.0, 8.0, 'Fair'),
(3, 'Active', 42.0, 7.0, 'Good'),
(4, 'Inactive', 55.0, 8.5, 'Fair'),
(5, 'Active', 48.0, 7.8, 'Good');

INSERT INTO environment (robotTapping_id, windDirection, windSpeed, temperature, rainfall, checkTime)
VALUES
(1, 'East', 3.5, 28.0, 0.2, '2024-07-12 08:00:00'),
(2, 'West', 4.0, 27.5, 0.1, '2024-07-12 08:30:00'),
(3, 'North', 3.8, 28.2, 0.3, '2024-07-12 09:00:00'),
(4, 'South', 4.2, 27.8, 0.4, '2024-07-12 09:30:00'),
(5, 'Northeast', 3.7, 28.5, 0.2, '2024-07-12 10:00:00');

INSERT INTO Drone (robot_id, direction, speed, height, latitude, longitude)
VALUES
(1, 'North', 10.5, 50.0, 10.1234, 105.5678),
(2, 'South', 9.8, 48.0, 11.3456, 106.7890),
(3, 'East', 11.2, 52.0, 12.5678, 107.8901),
(4, 'West', 10.0, 49.5, 13.7890, 108.0123),
(5, 'Northeast', 10.7, 51.5, 14.9012, 109.1234);

INSERT INTO chargingStation (latitude, longitude, maxNumberOfRobots, currentNumerOfRobots, [status])
VALUES
(10.1111, 105.2222, 5, 2, 1),
(11.3333, 106.4444, 6, 4, 1),
(12.5555, 107.6666, 4, 1, 0),
(13.7777, 108.8888, 3, 2, 1),
(14.9999, 109.0000, 5, 3, 1);

INSERT INTO chargingStatus (drone_id, chargingStation_id, [status], currentBattery)
VALUES
(1, 1, 1, 75.0),
(2, 2, 0, 20.0),
(3, 3, 1, 80.0),
(4, 4, 1, 85.0),
(5, 5, 1, 90.0);

INSERT INTO droneImages (drone_id, tree_id, imagePath, imageBase64)
VALUES
(1, 1, '/images/drone1/image1.jpg', ''),
(2, 2, '/images/drone2/image2.jpg', ''),
(3, 3, '/images/drone3/image3.jpg', ''),
(4, 4, '/images/drone4/image4.jpg', ''),
(5, 5, '/images/drone5/image5.jpg', '');

INSERT INTO camera (model)
VALUES
('Camera Model A'),
('Camera Model B'),
('Camera Model C'),
('Camera Model D'),
('Camera Model E');

INSERT INTO lidar (model)
VALUES
('Lidar Model 1'),
('Lidar Model 2'),
('Lidar Model 3'),
('Lidar Model 4'),
('Lidar Model 5');

INSERT INTO radar (model)
VALUES
('Radar Model X'),
('Radar Model Y'),
('Radar Model Z'),
('Radar Model W'),
('Radar Model V');

INSERT INTO SensorControlSystem (camera_id, lidar_id, radar_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO FACT ([user_id], country_id, region_id, plan_id, robot_id, sensorCtrlSys_id, tree_id, field_id, quantity)
VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 500.0),
(2, 2, 2, 2, 2, 2, 2, 2, 400.0),
(3, 3, 3, 3, 3, 3, 3, 3, 450.0),
(4, 4, 4, 4, 4, 4, 4, 4, 480.0),
(5, 5, 5, 5, 5, 5, 5, 5, 520.0);



-- Confirm data insertion
SELECT * FROM userInfo;
SELECT * FROM country;
SELECT * FROM region;
SELECT * FROM fields;
SELECT * FROM rubberTrees;
SELECT * FROM plans;
SELECT * FROM tasks;
SELECT * FROM robot;
SELECT * FROM robotTapping;
SELECT * FROM blade;
SELECT * FROM environment;
SELECT * FROM Drone;
SELECT * FROM chargingStation;
SELECT * FROM chargingStatus;
SELECT * FROM droneImages;
SELECT * FROM camera;
SELECT * FROM lidar;
SELECT * FROM radar;
SELECT * FROM SensorControlSystem;
SELECT * FROM FACT;

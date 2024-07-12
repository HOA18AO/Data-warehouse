--use master
use Wisdom_rubberProject_starSchema_DW
-- Insert sample data into userInfo table
INSERT INTO userInfo (user_name, [password], [role], firstName, lastName, gender, dateOfBirth, phoneNumber, email, createDate, updateDate, addressLine, city)
VALUES 
('john_doe', 'password123', 'admin', 'John', 'Doe', 'Male', '1990-05-15', '123456789', 'john.doe@example.com', '2023-01-01', '2023-03-10', '123 Main St', 'Hanoi'),
('jane_smith', 'securepass', 'user', 'Jane', 'Smith', 'Female', '1995-09-22', '987654321', 'jane.smith@example.com', '2023-02-05', '2023-04-20', '456 Oak Ave', 'Ho Chi Minh City'),
('alice_jones', 'mypassword', 'user', 'Alice', 'Jones', 'Female', '1988-07-10', '123123123', 'alice.jones@example.com', '2023-03-15', '2023-05-25', '789 Pine St', 'Vientiane'),
('bob_brown', 'pass1234', 'user', 'Bob', 'Brown', 'Male', '1985-11-30', '456456456', 'bob.brown@example.com', '2023-04-01', '2023-06-10', '101 Maple St', 'Phnom Penh'),
('charlie_black', 'charliepass', 'user', 'Charlie', 'Black', 'Male', '1992-02-20', '789789789', 'charlie.black@example.com', '2023-05-10', '2023-07-15', '202 Birch St', 'New York');

-- Insert sample data into country table
INSERT INTO country (countryName)
VALUES 
('Vietnam'),
('Laos'),
('Cambodia'),
('USA'),
('Brazil');

-- Insert sample data into region table
INSERT INTO region (country_id, regionName)
VALUES 
(1, 'Northern Region'),
(1, 'Southern Region'),
(2, 'Central Region'),
(3, 'Eastern Region'),
(4, 'Western Region');

-- Insert sample data into fields table
INSERT INTO fields (region_id, fieldName, area)
VALUES 
(1, 'Farm A', 100.5),
(1, 'Farm B', 75.2),
(2, 'Farm C', 120.0),
(3, 'Farm D', 200.8),
(4, 'Farm E', 150.3);

-- Insert sample data into rubberTrees table
INSERT INTO rubberTrees (field_id, latitude, longitude, topHeight, crownHeight, circumference, diameter, checkDate)
VALUES
(1, 21.028, 105.854, 25.5, 20.0, 35.7, 5.2, '2023-01-15'),
(2, 10.762, 106.689, 30.0, 22.5, 40.0, 6.0, '2023-02-20'),
(3, 17.975, 102.613, 28.0, 21.0, 38.5, 5.8, '2023-03-10'),
(4, 11.550, 104.926, 26.0, 19.5, 36.0, 5.4, '2023-04-05'),
(5, 40.712, -74.006, 27.5, 20.5, 37.2, 5.6, '2023-05-20');

-- Insert sample data into plans table
INSERT INTO plans (field_id, planTile, planDescription, startDate)
VALUES
(1, 'Harvesting Plan', 'Schedule for harvesting season', '2023-03-01'),
(2, 'Fertilization Plan', 'Plan for soil fertilization', '2023-04-10'),
(3, 'Irrigation Plan', 'Plan for regular irrigation', '2023-05-15'),
(4, 'Pest Control Plan', 'Plan for pest control measures', '2023-06-01'),
(5, 'Pruning Plan', 'Plan for tree pruning activities', '2023-07-10');

-- Insert sample data into tasks table
INSERT INTO tasks (plan_id, robot_id, detail)
VALUES
(1, 1, 'Harvesting operation'),
(2, 2, 'Apply fertilizer to soil'),
(3, 3, 'Irrigate the field'),
(4, 4, 'Control pests in the field'),
(5, 5, 'Prune the trees');

-- Insert sample data into robot table
INSERT INTO robot (model, robotType, [status], remainEnergy, remainTime)
VALUES
('Drone Model X', 'Drone', 1, 75.5, 10.0),
('Tapping Robot Y', 'Tapping Robot', 1, 85.2, 12.0),
('Drone Model Z', 'Drone', 0, 65.0, 8.0),
('Tapping Robot A', 'Tapping Robot', 1, 90.0, 15.0),
('Drone Model B', 'Drone', 1, 80.0, 9.0);

-- Insert sample data into robotTapping table
INSERT INTO robotTapping (robot_id, direction, speed, quantity)
VALUES
(2, 'North', 5.0, 100.0),
(2, 'South', 6.5, 120.0),
(4, 'East', 4.5, 110.0),
(4, 'West', 5.2, 130.0),
(4, 'North', 6.0, 140.0);

-- Insert sample data into blade table
INSERT INTO blade (robotTapping_id, tappingStatus, angle, depth, bladeStatus)
VALUES
(1, 'Operational', 45.0, 10.0, 'Sharp'),
(2, 'Operational', 50.0, 12.0, 'Dull'),
(3, 'Operational', 55.0, 14.0, 'Sharp'),
(4, 'Operational', 60.0, 16.0, 'Sharp'),
(5, 'Operational', 65.0, 18.0, 'Dull');

-- Insert sample data into environment table
INSERT INTO environment (robotTapping_id, windDirection, windSpeed, temperature, rainfall, checkTime)
VALUES
(1, 'East', 15.5, 25.0, 5.0, '2023-01-15 08:30:00'),
(2, 'West', 12.0, 28.0, 3.0, '2023-02-20 12:45:00'),
(3, 'North', 10.5, 22.0, 4.0, '2023-03-10 10:00:00'),
(4, 'South', 13.0, 27.0, 2.0, '2023-04-05 11:15:00'),
(5, 'East', 14.5, 26.0, 3.5, '2023-05-20 09:45:00');

-- Insert sample data into Drone table
INSERT INTO Drone (robot_id, direction, speed, height, latitude, longitude)
VALUES
(1, 'North', 20.0, 5.0, 21.028, 105.854),
(3, 'South', 18.0, 4.5, 10.762, 106.689),
(5, 'East', 22.0, 6.0, 17.975, 102.613),
(1, 'West', 19.0, 5.5, 11.550, 104.926),
(3, 'North', 21.0, 5.2, 40.712, -74.006);

-- Insert sample data into chargingStation table
INSERT INTO chargingStation (latitude, longitude, maxNumberOfRobots, currentNumerOfRobots, [status])
VALUES
(21.028, 105.854, 5, 2, 1),
(10.762, 106.689, 3, 1, 0),
(17.975, 102.613, 4, 3, 1),
(11.550, 104.926, 6, 4, 1),
(40.712, -74.006, 2, 1, 0);

-- Insert sample data into chargingStatus table
INSERT INTO chargingStatus (drone_id, chargingStation_id, [status], currentBattery)
VALUES
(1, 1, 1, 80.0),
(3, 2, 0, 30.0),
(5, 3, 1, 90.0),
(2, 4, 0, 40.0),
(4, 5, 1, 75.0);

-- Insert sample data into droneImages table
INSERT INTO droneImages (drone_id, tree_id, imagePath, imageBase64)
VALUES
(1, 1, 'path/to/image1.jpg', 'base64encodeddata1'),
(3, 2, 'path/to/image2.jpg', 'base64encodeddata2'),
(5, 3, 'path/to/image3.jpg', 'base64encodeddata3'),
(2, 4, 'path/to/image4.jpg', 'base64encodeddata4'),
(4, 5, 'path/to/image5.jpg', 'base64encodeddata5');

-- Insert sample data into camera table
INSERT INTO camera (model)
VALUES
('Camera Model A'),
('Camera Model B'),
('Camera Model C'),
('Camera Model D'),
('Camera Model E');

-- Insert sample data into lidar table
INSERT INTO lidar (model)
VALUES
('Lidar Model X'),
('Lidar Model Y'),
('Lidar Model Z'),
('Lidar Model A'),
('Lidar Model B');

-- Insert sample data into radar table
INSERT INTO radar (model)
VALUES
('Radar Model 1'),
('Radar Model 2'),
('Radar Model 3'),
('Radar Model 4'),
('Radar Model 5');

-- Insert sample data into SensorControlSystem table
INSERT INTO SensorControlSystem (camera_id, lidar_id, radar_id)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Insert sample data into FACT table
INSERT INTO FACT ([user_id], location_id, plan_id, robot_id, sensorCtrlSys_id, tree_id, quantity)
VALUES
(1, 1, 1, 1, 1, 1, 100.0),
(2, 2, 2, 2, 2, 2, 120.0),
(3, 3, 3, 3, 3, 3, 140.0),
(4, 4, 4, 4, 4, 4, 160.0),
(5, 5, 5, 5, 5, 5, 180.0);

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

--use master
--create database Wisdom_rubberProject_starSchema_DW

use Wisdom_rubberProject_starSchema_DW
-- Insert sample data into userInfo table
INSERT INTO userInfo (user_name, [password], [role], firstName, lastName, gender, dateOfBirth, phoneNumber, email, createDate, updateDate, addressLine, city)
VALUES 
('john_doe', 'password123', 'admin', 'John', 'Doe', 'Male', '1990-05-15', '123456789', 'john.doe@example.com', '2023-01-01', '2023-03-10', '123 Main St', 'City A'),
('jane_smith', 'securepass', 'user', 'Jane', 'Smith', 'Female', '1995-09-22', '987654321', 'jane.smith@example.com', '2023-02-05', '2023-04-20', '456 Oak Ave', 'City B');

-- Insert sample data into country table
INSERT INTO country (countryName)
VALUES 
('Vietnam'),
('USA'),
('Brazil');

-- Insert sample data into region table
INSERT INTO region (country_id, regionName)
VALUES 
(1, 'Northern Region'),
(1, 'Southern Region'),
(2, 'East Coast'),
(3, 'Amazon Rainforest');

-- Insert sample data into fields table
INSERT INTO fields (region_id, fieldName, area)
VALUES 
(1, 'Farm A', 100.5),
(1, 'Farm B', 75.2),
(2, 'Farm C', 120.0),
(3, 'Farm D', 200.8);

-- Insert sample data into rubberTrees table
INSERT INTO rubberTrees (field_id, [location], topHeight, crownHeight, circumference, diameter, checkDate)
VALUES
(1, geography::STPointFromText('POINT(106.689 10.762)', 4326), 25.5, 20.0, 35.7, 5.2, '2023-01-15'),
(2, geography::STPointFromText('POINT(105.845 21.028)', 4326), 30.0, 22.5, 40.0, 6.0, '2023-02-20');

-- Insert sample data into plans table
INSERT INTO plans (field_id, planTile, planDescription, startDate)
VALUES
(1, 'Harvesting Plan', 'Schedule for harvesting season', '2023-03-01'),
(2, 'Fertilization Plan', 'Plan for soil fertilization', '2023-04-10');

-- Insert sample data into tasks table
INSERT INTO tasks (plan_id, robot_id, detail)
VALUES
(1, 1, 'Harvesting operation'),
(2, 2, 'Apply fertilizer to soil');

-- Insert sample data into robot table
INSERT INTO robot (model, robotType, [status], remainEnergy, remainTime)
VALUES
('Drone Model X', 'Drone', 1, 75.5, 10.0),
('Tapping Robot Y', 'Tapping Robot', 1, 85.2, 12.0);

-- Insert sample data into robotTapping table
INSERT INTO robotTapping (direction, speed, quantity)
VALUES
('North', 5.0, 100.0),
('South', 6.5, 120.0);

-- Insert sample data into blade table
INSERT INTO blade (robotTapping_id, tappingStatus, angle, depth, bladeStatus)
VALUES
(1, 'Operational', 45.0, 10.0, 'Sharp'),
(2, 'Operational', 50.0, 12.0, 'Dull');

-- Insert sample data into environment table
INSERT INTO environment (robotTapping_id, windDirection, windSpeed, temperature, rainfall, checkTime)
VALUES
(1, 'East', 15.5, 25.0, 5.0, '2023-01-15 08:30:00'),
(2, 'West', 12.0, 28.0, 3.0, '2023-02-20 12:45:00');

-- Insert sample data into Drone table
INSERT INTO Drone (direction, speed, height, currentLocation)
VALUES
('North', 20.0, 5.0, geography::STPointFromText('POINT(106.789 10.862)', 4326)),
('South', 18.0, 4.5, geography::STPointFromText('POINT(105.945 21.128)', 4326));

-- Insert sample data into chargingStation table
INSERT INTO chargingStation ([location], maxNumberOfRobots, currentNumerOfRobots, [status])
VALUES
(geography::STPointFromText('POINT(106.789 10.862)', 4326), 5, 2, 1),
(geography::STPointFromText('POINT(105.945 21.128)', 4326), 3, 1, 0);

-- Insert sample data into chargingStatus table
INSERT INTO chargingStatus (drone_id, chargingStation_id, [status], currentBattery)
VALUES
(1, 1, 1, 80.0),
(2, 2, 0, 30.0);

-- Insert sample data into droneImages table
INSERT INTO droneImages (drone_id, tree_id, [image])
VALUES
(1, 1, 0x89504E470D0A1A0A0000000D494844520000000100000001080200000074E5FCAF),
(1, 2, 0x48656C6C6F20576F726C64),
(2, 1, 0x0102030405),
(2, 2, 0x010203040); -- just sample meaningless pictures

-- Insert sample data into camera table
INSERT INTO camera (model)
VALUES
('Camera Model X'),
('Camera Model Y');

-- Insert sample data into lidar table
INSERT INTO lidar (model)
VALUES
('Lidar Model A'),
('Lidar Model B');

-- Insert sample data into radar table
INSERT INTO radar (model)
VALUES
('Radar Model 1'),
('Radar Model 2');

-- Insert sample data into SensorControlSystem table
INSERT INTO SensorControlSystem (camera_id, lidar_id, radar_id)
VALUES
(1, 1, 1),
(2, 2, 2);

-- Insert sample data into FACT table
INSERT INTO FACT ([user_id], location_id, plan_id, robot_id, sensorCtrlSys_id, tree_id, quantity)
VALUES
(1, 1, 1, 1, 1, 1, 150.0),
(2, 2, 2, 2, 2, 2, 180.0),
(1, 2, 1, 1, 1, 2, 120.0),
(2, 1, 2, 2, 2, 1, 140.0),
(1, 3, 1, 1, 1, 1, 160.0);

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

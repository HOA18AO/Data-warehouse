USE Wisdom_rubberProject_starSchema_DW;

-- Drop fact table first as it depends on many other tables
DROP TABLE IF EXISTS FACT;

-- Drop tables with foreign key dependencies first
DROP TABLE IF EXISTS blade;
DROP TABLE IF EXISTS environment;
DROP TABLE IF EXISTS robotTapping;
DROP TABLE IF EXISTS droneImages;
DROP TABLE IF EXISTS chargingStatus;
DROP TABLE IF EXISTS SensorControlSystem;

-- Drop remaining tables with foreign keys
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS plans;
DROP TABLE IF EXISTS rubberTrees;
DROP TABLE IF EXISTS fields;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS chargingStation;

-- Drop tables with foreign keys related to robot
DROP TABLE IF EXISTS Drone;
DROP TABLE IF EXISTS robot;

-- Drop tables related to sensor control system
DROP TABLE IF EXISTS camera;
DROP TABLE IF EXISTS lidar;
DROP TABLE IF EXISTS radar;

-- Drop base tables
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS userInfo;

-- Print message after all tables are dropped
PRINT 'All tables have been dropped successfully.';
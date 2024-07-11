-- Create the database
use master
-- drop database Wisdom_RubberProject_Practice_2;
CREATE DATABASE Wisdom_RubberProject_Practice_3;
GO

-- Use the newly created database
USE Wisdom_RubberProject_Practice_3;
GO

-- Create tables
CREATE TABLE Country (
    CountryID INT PRIMARY KEY IDENTITY,
    CountryName VARCHAR(255) NOT NULL
);

CREATE TABLE Region (
    RegionID INT PRIMARY KEY IDENTITY,
    CountryID INT REFERENCES Country(CountryID),
    RegionName VARCHAR(255) NOT NULL
);

CREATE TABLE Address (
    AddressID INT PRIMARY KEY IDENTITY,
    RegionID INT REFERENCES Region(RegionID),
    City VARCHAR(255) NOT NULL,
    AddressLine VARCHAR(255) NOT NULL
);

CREATE TABLE Account (
    AccountID INT PRIMARY KEY IDENTITY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(50) NOT NULL
);

CREATE TABLE UserInfo (
    UserInfoID INT PRIMARY KEY IDENTITY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Gender VARCHAR(20),
    DateOfBirth DATE,
    AddressID INT REFERENCES Address(AddressID),
    AccountID INT REFERENCES Account(AccountID),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdateDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Field (
    FieldID INT PRIMARY KEY IDENTITY,
    RegionID INT REFERENCES Region(RegionID),
    FieldName VARCHAR(255) NOT NULL,
    Area NUMERIC(18, 2)
);

CREATE TABLE RubberTree (
    TreeID INT PRIMARY KEY IDENTITY,
    FieldID INT REFERENCES Field(FieldID),
    Location VARCHAR(100) NOT NULL
);

CREATE TABLE RubberTreeInformation (
    TreeInfoID INT PRIMARY KEY IDENTITY,
    TreeID INT REFERENCES RubberTree(TreeID),
    TopHeight NUMERIC(18, 2),
    CrownHeight NUMERIC(18, 2),
    Diameter NUMERIC(18, 2),
    Circumference NUMERIC(18, 2),
    CheckDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE [Plan] (
    PlanID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(MAX),
    StartDate DATETIME
);

CREATE TABLE PlanDetail (
    PlanDetailID INT PRIMARY KEY IDENTITY,
    FieldID INT REFERENCES Field(FieldID),
    PlanID INT REFERENCES [Plan](PlanID)
);

CREATE TABLE Lidar (
    LidarID INT PRIMARY KEY IDENTITY,
    Model VARCHAR(255) NOT NULL
);

CREATE TABLE Camera (
    CameraID INT PRIMARY KEY IDENTITY,
    Model VARCHAR(255) NOT NULL
);

CREATE TABLE Radar (
    RadarID INT PRIMARY KEY IDENTITY,
    Model VARCHAR(255) NOT NULL
);

CREATE TABLE SensorControlSystem (
    ScsID INT PRIMARY KEY IDENTITY,
    LidarID INT REFERENCES Lidar(LidarID),
    CameraID INT REFERENCES Camera(CameraID),
    RadarID INT REFERENCES Radar(RadarID)
);

CREATE TABLE Robot (
    RobotID INT PRIMARY KEY IDENTITY,
    TypeRobot VARCHAR(255) NOT NULL,
    Model VARCHAR(255) NOT NULL,
    Status BIT
);

CREATE TABLE Energy (
    EnergyID INT PRIMARY KEY IDENTITY,
    RobotID INT REFERENCES Robot(RobotID),
    RemainingTime VARCHAR(50),
    RemainingEnergy NUMERIC(18, 2)
);

CREATE TABLE RobotTapping (
    RobotTappingID INT PRIMARY KEY IDENTITY,
    RobotID INT REFERENCES Robot(RobotID),
    TreeID INT REFERENCES RubberTree(TreeID),
    Direction VARCHAR(50),
    Speed NUMERIC(18, 2),
    Quantity NUMERIC(18, 2)
);

CREATE TABLE Blade (
    BladeID INT PRIMARY KEY IDENTITY,
    RobotTappingID INT REFERENCES RobotTapping(RobotTappingID),
    TappingStatus VARCHAR(50),
    Angle NUMERIC(18, 2),
    Depth NUMERIC(18, 2),
    BladeStatus VARCHAR(50)
);

CREATE TABLE Environment (
    EnvironmentID INT PRIMARY KEY IDENTITY,
    RobotTappingID INT REFERENCES RobotTapping(RobotTappingID),
    WindDirection VARCHAR(50),
    WindSpeed NUMERIC(18, 2),
    Temperature NUMERIC(18, 2),
    Rainfall NUMERIC(18, 2),
    [Time] DATETIME DEFAULT GETDATE()
);

CREATE TABLE Drone (
    DroneID INT PRIMARY KEY IDENTITY,
    RobotID INT REFERENCES Robot(RobotID),
    ScsID INT REFERENCES SensorControlSystem(ScsID)
);

CREATE TABLE DroneInformation (
    DroneInfoID INT PRIMARY KEY IDENTITY,
    DroneID INT REFERENCES Drone(DroneID),
    Direction VARCHAR(50),
    Speed NUMERIC(18, 2),
    Height NUMERIC(18, 2),
    CurrentLocation VARCHAR(100)
);

CREATE TABLE DroneImage (
    DroneImageID INT PRIMARY KEY IDENTITY,
    DroneID INT REFERENCES Drone(DroneID),
    TreeID INT REFERENCES RubberTree(TreeID),
    Image VARCHAR(MAX)
);

CREATE TABLE ChargingStation (
    ChargingStationID INT PRIMARY KEY IDENTITY,
    Location VARCHAR(100) NOT NULL,
    MaxRobotNumber INT,
    CurrentRobotNumber INT,
    Status VARCHAR(50)
);

CREATE TABLE ChargingStatus (
    ChargingStatusID INT PRIMARY KEY IDENTITY,
    DroneID INT REFERENCES Drone(DroneID),
    ChargingStationID INT REFERENCES ChargingStation(ChargingStationID),
    CurrentBattery NUMERIC(18, 2),
    Status BIT
);

CREATE TABLE Task (
    TaskID INT PRIMARY KEY IDENTITY,
    RobotID INT REFERENCES Robot(RobotID),
    PlanID INT REFERENCES [Plan](PlanID),
    ActionDetail VARCHAR(MAX)
);
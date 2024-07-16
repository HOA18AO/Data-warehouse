use Wisdom_rubberProject_starSchema_DW;

create table userInfo (
    [user_id] int PRIMARY KEY IDENTITY,
    [user_name] VARCHAR(100),
    [password] VARCHAR(100),
    [role] VARCHAR(100),
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    gender varchar(6),
    dateOfBirth DATE,
    phoneNumber VARCHAR(12),
    email VARCHAR(100),
    createDate date,
    updateDate date,
    addressLine VARCHAR(200),
    city VARCHAR(50)
);

create table country (
    country_id int PRIMARY key IDENTITY,
    countryName VARCHAR(50) not NULL
);

create table region(
    region_id int PRIMARY key IDENTITY,
    country_id int not NULL,
    regionName VARCHAR(50) not null,
    FOREIGN key (country_id) REFERENCES country(country_id)
);

create table fields (
    field_id int PRIMARY KEY IDENTITY,
    region_id int not null,
    fieldName VARCHAR(50),
    area numeric(10, 2) -- the area of the field
);

create table rubberTrees (
    tree_id int PRIMARY key IDENTITY,
    field_id int not null,
    -- [location] GEOGRAPHY not null, --latitude and longtitude
    -- instead of 1 geography attribute, we considered to use 2 features latitude and longitude
    latitude numeric(10, 2) not null,
    longitude numeric(10, 2) not null,
    topHeight NUMERIC(10, 2) not null, -- from the base to the top of the tree
    crownHeight NUMERIC(10, 2) not null, -- from the base to the crown of the tree
    circumference numeric(10, 2) not null,
    diameter numeric(10, 2) not null,
    checkDate date, -- the date when data was collected
);

create table plans(
    plan_id int PRIMARY key IDENTITY,
    field_id int not null,
    planTitle varchar(100),
    planDescription VARCHAR(200),
    startDate DATE
);

create table tasks(
    task_id int PRIMARY key IDENTITY,
    plan_id int not null,
    robot_id int not null,
    detail varchar(200),
	foreign key (plan_id) references plans(plan_id)
);

create table robot(
    robot_id int PRIMARY key IDENTITY,
    model varchar(100) not null,
    robotType VARCHAR(100) not null, -- drone or tapping robot or other types
    [status] BIT not null, -- is still working or not
    remainEnergy NUMERIC(10, 2) not null,
    remainTime NUMERIC(10, 2) not null
);

create table robotTapping (
    robotTapping_id int PRIMARY key IDENTITY,
	robot_id int not null,
    direction VARCHAR(200), 
    speed NUMERIC(10, 2),
    quantity NUMERIC(10, 2)
    FOREIGN KEY (robot_id) REFERENCES robot(robot_id)
);

create table blade(
    blade_id int PRIMARY key IDENTITY,
    robotTapping_id int not null,
    tappingStatus varchar(200),
    angle NUMERIC(10, 2),
    depth NUMERIC(10, 2),
    bladeStatus VARCHAR(200) -- describe the durability of the blade
    FOREIGN key (robotTapping_id) REFERENCES robotTapping(robotTapping_id)
);

create table environment(
    environment_id int PRIMARY key IDENTITY,
    robotTapping_id int not null,
    windDirection VARCHAR(10),
    windSpeed NUMERIC(10, 2),
    temperature NUMERIC(10, 2),
    rainfall NUMERIC(10, 2), -- the amount of rain falling
    checkTime datetime, -- the moment when the information was collected
    FOREIGN key (robotTapping_id) REFERENCES robotTapping(robotTapping_id)
);

create table Drone(
    drone_id int PRIMARY key IDENTITY,
	robot_id int not null,
    direction VARCHAR(200),
    speed NUMERIC(10, 2),
    height NUMERIC(10, 2),
    -- currentLocation GEOGRAPHY not null
    -- considered using latitude, longtitude attributes instead
    latitude numeric(10, 2) not null,
    longitude numeric(10, 2) not null,
    FOREIGN key (robot_id) REFERENCES robot(robot_id)
);

create table chargingStation(
    chargingStation_id int PRIMARY key IDENTITY,
    -- [location] GEOGRAPHY not null, -- point, lattitude, longtitude
    -- considerd using latitude and longtitude attributes instead
    latitude numeric(10, 2) not null,
    longitude numeric(10, 2) not null,
    maxNumberOfRobots int not null,
    currentNumerOfRobots int,
    [status] BIT -- check the station is still working or not
);

create table chargingStatus(
    chargingStatus_id int PRIMARY KEY IDENTITY,
    drone_id int not null,
    chargingStation_id int,
    [status] BIT, -- check if the robot is charging or not
    currentBattery NUMERIC(10, 2)
    FOREIGN key (chargingStation_id) REFERENCES chargingStation(chargingStation_id),
    FOREIGN key (drone_id) REFERENCES Drone(drone_id)
);

create table droneImages(
    droneImages_id int PRIMARY key IDENTITY,
    drone_id int not null,
    tree_id int not null,
    -- [image] varbinary(max), -- "the images is captured. The image data as binary bytes."
    -- instead of using varbinary(max) to store image data, we decided to use nvarchar to store the image path, or use nvarchar to store the base64 encoded data of image
    imagePath NVARCHAR(200),
    imageBase64 NVARCHAR(max),
    FOREIGN key (drone_id) REFERENCES Drone(drone_id)
);

create table camera(
    camera_id int PRIMARY KEY IDENTITY,
    model varchar(200) not NULL
);

create table lidar(
    lidar_id int PRIMARY key IDENTITY,
    model VARCHAR(200) not NULL
);

CREATE table radar(
    radar_id int PRIMARY key IDENTITY,
    model VARCHAR(200) not NULL
);

create TABLE SensorControlSystem(
    sensorCtrlSys_id int PRIMARY key IDENTITY,
    camera_id int,
    lidar_id int,
    radar_id int,
    FOREIGN key (camera_id) REFERENCES camera(camera_id),
    FOREIGN key (lidar_id) REFERENCES lidar(lidar_id),
    FOREIGN KEY (radar_id) REFERENCES radar(radar_id)
);

create table FACT(
    fact_id int PRIMARY KEY IDENTITY,
    [user_id] int not null,
    country_id int not null,
    region_id int not null,
    plan_id int not null,
    robot_id int not null,
    sensorCtrlSys_id int NOT null,
    tree_id int not null,
    field_id int not null,

    quantity NUMERIC(10, 2) not null, -- the amount of latex obtained from the tree. When a certain amount is reached, an announcement will be made.

    FOREIGN KEY ([user_id]) REFERENCES [userInfo]([user_id]),
    FOREIGN KEY (country_id) REFERENCES country(country_id),
    FOREIGN KEY (region_id) REFERENCES region(region_id),
    FOREIGN key (plan_id) REFERENCES plans(plan_id),
    FOREIGN key (robot_id) REFERENCES robot(robot_id),
    FOREIGN key (sensorCtrlSys_id) REFERENCES SensorControlSystem(sensorCtrlSys_id),
    FOREIGN KEY (tree_id) REFERENCES rubberTrees(tree_id)
)
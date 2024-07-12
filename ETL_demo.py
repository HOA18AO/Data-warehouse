import pandas as pd
from sqlalchemy import create_engine
from pyspark.sql import SparkSession
from pyspark.sql.functions import col

# Initialize PySpark
spark = SparkSession.builder.appName("ETL Pipeline").config("spark.jars.packages", "com.microsoft.sqlserver:mssql-jdbc:9.4.1.jre11").getOrCreate()

# SQL Server connection string
conn_str = "mssql+pyodbc://username:password@server/database?driver=ODBC+Driver+17+for+SQL+Server"

# Create SQL Alchemy engine
engine = create_engine(conn_str)

# Extract data from old database
def extract_table(table_name):
    query = f"SELECT * FROM {table_name}"
    df = pd.read_sql(query, engine)
    return df

# List of tables to extract
tables = ["Country", "Region", "Address", "Account", "UserInfo", "Field", "RubberTree", 
          "RubberTreeInformation", "Plan", "PlanDetail", "Lidar", "Camera", "Radar", 
          "SensorControlSystem", "Robot", "Energy", "RobotTapping", "Blade", "Environment", 
          "Drone", "DroneInformation", "DroneImage", "ChargingStation", "ChargingStatus", "Task"]

# Extract data
dataframes = {table: extract_table(table) for table in tables}

# Transform data (example: cleaning)
def clean_data(df):
    # Add transformation logic here (e.g., handling missing values, data type conversions)
    return df

cleaned_dataframes = {table: clean_data(df) for table, df in dataframes.items()}

# Load data into the data warehouse
def load_data(df, table_name):
    df_spark = spark.createDataFrame(df)
    df_spark.write \
        .format("jdbc") \
        .option("url", "jdbc:sqlserver://server;databaseName=Wisdom_rubberProject_starSchema_DW") \
        .option("dbtable", table_name) \
        .option("user", "username") \
        .option("password", "password") \
        .option("driver", "com.microsoft.sqlserver.jdbc.SQLServerDriver") \
        .mode("append") \
        .save()

# List of target tables in the star schema
star_schema_tables = ["Country", "Region", "Address", "UserInfo", "Field", "RubberTree", 
                      "RubberTreeInformation", "Plan", "Lidar", "Camera", "Radar", 
                      "SensorControlSystem", "Robot", "Energy", "RobotTapping", "Blade", 
                      "Environment", "Drone", "ChargingStation", "Task"]

# Load data
for table in star_schema_tables:
    load_data(cleaned_dataframes[table], table)

# Stop Spark session
spark.stop()

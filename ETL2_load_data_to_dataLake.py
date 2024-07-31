# NOTICE:

# Make sure that the HDFS is running
# First, open Command Prompt at the directory "\hadoop-3.3.0\sbin"
# Run as admminstrator
# Then use the command line "start-all.cmd" to start HDFS

# Create a 'user' directory in the Hadoop folder if it doesn't exist
# Run the command "hdfs dfs -mkdir -p /user/<your_username>/<data_contained_folder>"
# In this case, using directory "/user/hoaibao/data"
# In this code, I already run a 'os' function to create that directory

import pandas as pd
# import pyodbc # to connect databases
# import numpy as np # maybe needed for data transforming/cleaning 
import os # create directory to store data for each database
# import subprocess # to run sqoop
from pyspark.sql import SparkSession


def load(database: str='dataset', user_name: str='hoaibao'):
    local_directory = f'{database}/'
    hdfs_directory  = f'hdfs://localhost:9001/user/{user_name}/{database}' #
    
    spark_session = SparkSession.builder.master('local[1]').appName('local_data_-too_hdfs').getOrCreate()
    # Create the target directory in HDFS if it doesn't exist
    os.system(f"hdfs dfs -mkdir -p {hdfs_directory}")
    
    csv_files = [f for f in os.listdir(local_directory) if f.endswith('.csv')]
    
    for file in csv_files:
        local_path = os.path.join(local_directory, file)
        df = spark_session.read.option('header', True).format('csv').load(local_path)
        hdfs_path = f'{hdfs_directory}/{os.path.splitext(file)[0]}'
        df.coalesce(1).write.mode('append').option('header', True).csv(hdfs_path)
        
        print(f'Uploaded {file} to {hdfs_path}')
    
    spark_session.stop()
    print('Completed.')
import pandas as pd
import os # create directory to store data for each database
import subprocess # to run sqoop
from pyspark.sql import SparkSession # csv to Hdfs
from pyspark.sql.functions import col

def retrieveData(hdfs_directory, database: str='data'):
    hdfs_data = subprocess.check_output(['hdfs', 'dfs', '-ls', hdfs_directory], shell=True).decode('utf-8').split('\n')
    hdfs_data_path = [line.split()[-1] for line in hdfs_data if line.startswith('drwxr')]
    # Ex: 'hdfs://localhost:9001/user/hoaibao/data/Wisdom_rubberProject_Practice_3/Account'
    spark_session = SparkSession.builder.master('local[1]').appName('read_HDFS').getOrCreate()
    data_dict = dict()
    for path in hdfs_data_path:
        contentFile = subprocess.check_output(
            f'hdfs dfs -ls {path}',
            shell = True
        ).decode('utf-8')
        table_name = contentFile.split()[-1].split('/')[-2] # e.g: "Account"
        file_name  = contentFile.split()[-1].split('/')[-1] # e.g: "part-00000-4d5ca4a3-29ac-4c15-a5f9-64629d8a0697-c000.csv"
        
        data_dict[table_name] = spark_session.read.option('header', True).csv(f'{hdfs_directory}/{table_name}/{file_name}')
    try:
        os.mkdir('data_from_dataLake')
    except FileExistsError:
        pass
    
    for table_name, data in data_dict.items():
        data.toPandas().to_csv(f'data_from_dataLake/{database}/{table_name}.csv', index=False)
    
    spark_session.stop()
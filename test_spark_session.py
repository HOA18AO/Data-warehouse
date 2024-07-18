import pandas as pd
from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from sqlalchemy import create_engine
import pyodbc
import os

os.environ['HADOOP_HOME'] = 'R:/Hadoop'
os.environ['PATH'] += os.pathsep + os.path.join(os.environ['HADOOP_HOME'], 'bin')

spark = SparkSession.builder.appName('extractFromMSSQL').getOrCreate()

print('create session succeed')

spark.stop()
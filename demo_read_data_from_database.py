import pandas as pd
import pyodbc

# print(pyodbc.driver())
# Idk, make sure there is a drive 'ODBC Driver 17 for SQL Server'
# I tried version 18, but it didnot work

connection = pyodbc.connect(driver='{ODBC Driver 17 for SQL Server}', host='HOAIBAO', database='Wisdom_rubberProject_starSchema_DW', trusted_connection='yes')
# this code works for local database
# https://www.youtube.com/watch?v=8BiQx_xEIhw&ab_channel=ProgrammingIsFun
# video: how to connect to SQL Server?

sqlQuery = 'SELECT * from Drone'
df = pd.read_sql(sqlQuery, connection)
# print out df to see the result
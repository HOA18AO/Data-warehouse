import pandas as pd
import pyodbc # to connect databases
import os

def extractDataFromDatabase(driver:str='{ODBC Driver 17 for SQL Server}', host:str='', database:str='', trusted_connection:str='no', username:str='', password:str='')-> dict:
    if trusted_connection is 'yes':
        connection_str = f'DRIVER={driver};SERVER={host};DATABASE={database};Trusted_Connectrion={trusted_connection}'
    else:
        connection_str = f'DRIVER={driver};SERVER={host};DATABASE={database};UID={username};PWD={password}'
    connection = pyodbc.connect(connection_str)
    
    # get the table names in the database
    sql_retrieve_table_names = "select name from sys.tables where name <> 'sysdiagrams';"
    df_tableNames = pd.read_sql(sql_retrieve_table_names, connection)
    data_dict = {}
    for table in df_tableNames['name']:
        sql_retrieve_data = f"select * from [{table}]" # e.g: [plan]
        data_dict[table] = pd.read_sql(sql_retrieve_data, connection)
    connection.close()
    return data_dict

def saveDataToLocalDirectory(directory:str='data_from_source', dataset:str='data', data_dict:dict={}):
    # save data to local directory /data_from_source/<dataset>
    # tip: set value dataset = <database name>
    if data_dict == {}:
        print("No data to save")
    else:
        try:
            os.mkdir(directory)
        except FileExistsError:
            print(f"Directory '{directory}' already exists")
        
        try:
            os.mkdir(f'{directory}/{dataset}')
            print(f'Directory "{directory}/{dataset}" is successfully created')
            for table_name, data in data_dict.items():
                data.to_csv(f'{directory}/{dataset}/{table_name}.csv', index=False)
        except FileExistsError:
            print(f"Directory '{directory}/{dataset}' is already exists")
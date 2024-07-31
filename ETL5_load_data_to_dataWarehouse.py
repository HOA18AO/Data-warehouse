import pandas as pd
import pyodbc # to connect databases
import sqlalchemy
import os

def pushData(df: pd.core.frame.DataFrame, table_name: str, engine : sqlalchemy.engine.base.Engine):
    print(f'pushing data to table: {table_name}')
    # print(df)
    try:
        # Inspect the database
        inspector = inspect(engine)
        # Check if the table exists
        if table_name not in inspector.get_table_names():
            print('TABLE DOES NOT EXIST!!!')
        else:
            print('Table exists')
            # Insert data into SQL Server
            df.to_sql(name=table_name, con=engine, if_exists='append', index=False)
            print('Data inserted successfully')
    except Exception as e:
        print(f"An error occurred: {e}")
    print(f'---')

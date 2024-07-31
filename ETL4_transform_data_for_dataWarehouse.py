import os
import pandas as pd
import numpy as np

def getDataFromLocalDirectory(directory:str='data_from_dataLake', dataset:str='')-> dict:
    data = dict()
    for csvFile in os.listdir(f'{directory}/{dataset}'):
        if csvFile.endswith(".csv"):
            table_name = csvFile.split('.')[0]
            data[table_name] = pd.read_csv(f'{directory}/{dataset}/{csvFile}')
    return data # dictionary

# perform table joining
# Project Title
WISDOM RUBBER TREE PROJECT

## Author
Tran Hoai Bao

## Contact
- Email: [tranhoaibao9@gmail.com](mailto:tranhoaibao9@gmail.com)
- Mobile: 0369285329

## Tools Used
- **Database**: SQL Server
- **Programming Language**: Python
- **Data Processing Frameworks**: Hadoop, Spark, Sqoop, Pandas, pyodbc

## Plan
- **Build a Data Warehouse**: Design a star schema structure based on the original database (MSSQL).
- **Build a Data Lake**: Create a structure using Hadoop HDFS to store raw data/files from various databases.
- **Apply ETL Processes**:
  1. **Extract**: Crawl data from databases (data sources) and save as '.csv' files using Pandas and pyodbc for database connection.
  2. **Load**: Load these files into the data lake using Sqoop/Spark (python).
  3. **Extract**: Retrieve data from the data lake using Sqoop/Spark (python).
  4. **Transform**: Preprocess the data based on requirements and the data warehouse structure using Pandas, Numpy and potentially Spark.
  5. **Load**: Load the ready-to-use data into the data warehouse.

## Tasks
1. Connect to and read data from a database using Python.
2. Save data as CSV files, transform them, and load them into the data warehouse.
3. Build a data lake structure to store data from multiple databases and load it into the data warehouse using Hadoop (HDFS). (A document on how to install and set up Hadoop is attached.)

## Notice
`ETL_demo.ipynb` is used for testing purposes.

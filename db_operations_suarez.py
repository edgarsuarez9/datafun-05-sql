import sqlite3
import pathlib
import logging

# Define the database file path
db_file_path = pathlib.Path("project.db")

# Configure logging
logging.basicConfig(filename='log.txt', level=logging.DEBUG, filemode='a', format='%(asctime)s - %(levelname)s - %(message)s')

def execute_sql_from_file(db_filepath, sql_file):
    try:
        with sqlite3.connect(db_filepath) as conn:
            with open(sql_file, 'r') as file:
                sql_script = file.read()
            conn.executescript(sql_script)
            logging.info(f"Executed SQL from {sql_file}")
            print(f"Executed SQL from {sql_file}")
    except (sqlite3.Error, FileNotFoundError) as e:
        error_message = f"Error executing SQL from {sql_file}: {e}"
        logging.error(error_message)
        print(error_message)

def main():
    # Define the SQL directory
    sql_directory = pathlib.Path("sql")

    # Define paths for the SQL files
    sql_files = [
        sql_directory.joinpath("create_tables.sql"),
        sql_directory.joinpath("insert_records.sql"),
        sql_directory.joinpath("update_records.sql"),
        sql_directory.joinpath("delete_records.sql"),
        sql_directory.joinpath("query_aggregation.sql"),
        sql_directory.joinpath("query_filter.sql"),
        sql_directory.joinpath("query_sorting.sql"),
        sql_directory.joinpath("query_group_by.sql"),
        sql_directory.joinpath("query_join.sql"),
    ]

    # Execute each SQL file
    for sql_file in sql_files:
        execute_sql_from_file(db_file_path, sql_file)

    logging.info("Program ended")

if __name__ == "__main__":
    main()

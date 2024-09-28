# Project 5 SQL Module

## Overview

This project utilizes Python and SQL to work on database interations. 
The project uses SQLite, introduces logging (a tool for debugging and monitoring projects). 
The project creates and manages a database while performing various SQL operations. 

## Commands Used

```
git add .
git commit -m "initial commit"
git push -u origin main
git pull
```

## File Types 
.py - Python files containing Python code
.sqlite3 - A database file managed by SQLite (may also see .db, .sqlite, or other file extension)
.sql - SQL files that contain SQL statements.

## Create a Database
SQLite is a self-contained, serverless, and zero-configuration SQL database engine.

Following code creates a Database

```
import sqlite3
import pandas as pd
import pathlib

# Define the database file in the current root project directory
db_file = pathlib.Path("project.sqlite3")

def create_database():
    """Function to create a database. Connecting for the first time
    will create a new database file if it doesn't exist yet.
    Close the connection after creating the database
    to avoid locking the file."""
    try:
        conn = sqlite3.connect(db_file)
        conn.close()
        print("Database created successfully.")
    except sqlite3.Error as e:
        print("Error creating the database:", e)

def main():
    create_database()

if __name__ == "__main__":
    main()
```

## Create Tables 

This SQL script is designed to manage the creation of two tables, authors and books, in a relational database, specifically addressing the need for the script to be rerunnable.

The author's table was created first and holds the primary key. 
The book's table is created afterwards and is a dependent table and holds foreign keys. 

```
- Start by deleting any tables if the exist already
-- We want to be able to re-run this script as needed.
-- DROP tables in reverse order of creation 
-- DROP dependent tables (with foreign keys) first
-- Makes the script idempotent (rerunnable) using the most current statements each time we run

DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

-- Create the authors table 
-- Note that the author table has no foreign keys, so it is a standalone table

CREATE TABLE authors (
    author_id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    year_born INTEGER
);

-- Create the books table
-- Note that the books table has a foreign key to the authors table
-- This means that the books table is dependent on the authors table
-- Be sure to create the standalone authors table BEFORE creating the books table.

CREATE TABLE books (
    book_id TEXT PRIMARY KEY,
    title TEXT,
    year_published INTEGER,
    author_id TEXT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
```
This code defines a function create_tables() that is responsible for creating tables in a SQLite database.

```
def create_tables():
    """Function to read and execute SQL statements to create tables"""
    try:
        with sqlite3.connect(db_file) as conn:
            sql_file = pathlib.Path("sql", "create_tables.sql")
            with open(sql_file, "r") as file:
                sql_script = file.read()
            conn.executescript(sql_script)
            print("Tables created successfully.")
    except sqlite3.Error as e:
        print("Error creating tables:", e)
```

The following main function is used. This is where the execution of the script begins. Its creates the database and its tables. 

```
def main():
    create_database()
    create_tables()
```

## Records

### Records creation

The following code was use to insert books and authors into their corresponding tables. 

```
-- Insert authors data
INSERT INTO authors (author_id, first_name, last_name, year_born)
VALUES
    ('10f88232-1ae7-4d88-a6a2-dfcebb22a596', 'Harper', 'Lee', NULL),
    ('c3a47e85-2a6b-4196-a7a8-8b55d8fc1f70', 'George', 'Orwell', NULL),
    ('e0b75863-866d-4db4-85c7-df9bb8ee6dab', 'F. Scott', 'Fitzgerald', NULL),
    ('7b144e32-7ff4-4b58-8eb0-e63d3c9f9b8d', 'Aldous', 'Huxley', NULL),
    ('8d8107b6-1f24-481c-8a21-7d72b13b59b5', 'J.D.', 'Salinger', NULL),
    ('0cc3c8e4-e0c0-482f-b2f7-af87330de214', 'Ray', 'Bradbury', NULL),
    ('4dca0632-2c53-490c-99d5-4f6d41e56c0e', 'Jane', 'Austen', NULL),
    ('16f3e0a1-24cb-4ed6-a50d-509f63e367f7', 'J.R.R.', 'Tolkien', NULL),
    ('06cf58ab-90f1-448d-8e54-055e4393e75c', 'J.R.R.', 'Tolkien', NULL),
    ('6b693b96-394a-4a1d-a4e2-792a47d7a568', 'J.K.', 'Rowling', NULL);


-- Insert books data
INSERT INTO books (book_id, title, year_published, author_id)
VALUES
    ('d6f83870-ff21-4a5d-90ab-26a49ab6ed12', 'To Kill a Mockingbird', 1960, '10f88232-1ae7-4d88-a6a2-dfcebb22a596'),
    ('0f5f44f7-44d8-4f49-b8c4-c64d847587d3', '1984', 1949, 'c3a47e85-2a6b-4196-a7a8-8b55d8fc1f70'),
    ('f9d9e7de-c44d-4d1d-b3ab-59343bf32bc2', 'The Great Gatsby', 1925, 'e0b75863-866d-4db4-85c7-df9bb8ee6dab'),
    ('38e530f1-228f-4d6e-a587-2ed4d6c44e9c', 'Brave New World', 1932, '7b144e32-7ff4-4b58-8eb0-e63d3c9f9b8d'),
    ('c2a62a4b-cf5c-4246-9bf7-b2601d542e6d', 'The Catcher in the Rye', 1951, '8d8107b6-1f24-481c-8a21-7d72b13b59b5'),
    ('3a1d835c-1e15-4a48-8e8c-b12239604e98', 'Fahrenheit 451', 1953, '0cc3c8e4-e0c0-482f-b2f7-af87330de214'),
    ('c6e67918-e509-4a6b-bc3a-979f6ad802f0', 'Pride and Prejudice', 1813, '4dca0632-2c53-490c-99d5-4f6d41e56c0e'),
    ('be951205-6cc2-4b3d-96f1-7257b8fc8c0f', 'The Hobbit', 1937, '16f3e0a1-24cb-4ed6-a50)
```

![Alt text](C:/Users/Edgar/OneDrive/Desktop/insertquery.png)


### Function read CSV data from CSV files and insert Data into SQLite database. 

This function automates the process of populating the authors and books tables in a SQLite database with data from CSV files. It uses the efficiency of pandas for reading CSVs and inserting the data directly into the database, while also ensuring robust error handling for common issues that may arise during the process.

```
def insert_data_from_csv():
    """Function to use pandas to read data from CSV files (in 'data' folder)
    and insert the records into their respective tables."""
    try:
        author_data_path = pathlib.Path("data", "authors.csv")
        book_data_path = pathlib.Path("data", "books.csv")
        authors_df = pd.read_csv(author_data_path)
        books_df = pd.read_csv(book_data_path)
        with sqlite3.connect(db_file) as conn:
            # use the pandas DataFrame to_sql() method to insert data
            # pass in the table name and the connection
            authors_df.to_sql("authors", conn, if_exists="replace", index=False)
            books_df.to_sql("books", conn, if_exists="replace", index=False)
            print("Data inserted successfully.")
    except (sqlite3.Error, pd.errors.EmptyDataError, FileNotFoundError) as e:
        print("Error inserting data:", e)
```

The following main() funtion sets up the database and inserts the data. 

### Query Select

This query retrieves all records from the books table, displaying all columns and rows. 

```
-- Select all books
SELECT * FROM books;
```

This query retrieves the title, year_published, and author_id from the books table.

```
-- Select specific fields from the books table
SELECT title, year_published, author_id
FROM books;
```

### Query Filter

Queries can allow you to filter books based on author, publication year, and to retrieve distinct author IDs based on specific conditions.

This code allows you select books by the specific author.

```
SELECT * FROM books WHERE author_id = (SELECT author_id FROM authors WHERE first_name = 'John' AND last_name = 'Doe');
```

### Sort with Order By

The "sort by" query in SQL is used to arrange the result set of a query in a specific order based on one or more columns.

```
SELECT * FROM books ORDER BY year_published; #ascending order 
SELECT * FROM books ORDER BY title DESC; #descending order 
```
### Inner Join 

This query combines data from the authors and books tables, providing a comprehensive view of which authors wrote which books, along with relevant details.

```
SELECT authors.first_name, authors.last_name, books.title, books.year_published #select statement
FROM authors #from clause 
INNER JOIN books ON authors.author_id = books.author_id; #inner join clause
```
### Update Query 

Update queries allow you to change attributes like genre and publication year based on the book title.
```
UPDATE books #this line specifies the table to be updated
SET year_published = 1955 #This line sets the value of the year_published column to 1955
WHERE title = 'The Old Man and the Sea'; #This line specifies the condition that must be met for the update to occur.
```
### Delete

Queries can delete specific records from their respective tables based on unique identifiers (like author_id for authors and title for books).

```
-- Delete records
DELETE FROM authors
WHERE author_id = 'c1aef7cf-62f4-4f87-a775-f563f0308d64';  -- Deletes Agatha Christie

DELETE FROM books
WHERE title = '1984';  -- Deletes the book "1984"
```

### Group By 

This query identifies authors who have authored multiple books, providing their author_id and the corresponding count of books.

```
SELECT author_id, COUNT(*) AS book_count 
FROM books 
GROUP BY author_id 
HAVING COUNT(*) > 1;  -- Authors with more than one book
```
![Logging Screenshot](images/logging.png)

## How to Import Dependencies

Create a file in the root folder of your repo (same level as the README.md) named requirements.txt with the following content. 

Install the packages listed in the requirements file with this command:

pandas
pyarrow

```
py -m pip install -r requirements.txt
```

I created the requirement.txt. I then input the depenedies in the file, one per line. From there I used option 3, or, py -m pip install -r requirements.txt

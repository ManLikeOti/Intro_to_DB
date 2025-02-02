-- Active: 1738525271950@@127.0.0.1@3306@alx_book_store
import mysql.connector


myalxdb = mysql.connector.connect(host="localhost", 
                                user="root",
                                password="Dilichukwu1.",
                                database = "alx_book_store"
                                )

cursor = myalxdb.cursor()
cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
print("Database Created Successfully!")
print(myalxdb.get_server_info())

cursor.execute("""
                CREATE TABLE Authors(
                    author_id INT PRIMARY KEY NOT NULL,
                    author_name VARCHAR(215) NOT NULL
                    )
              """)

cursor.execute("""
               CREATE TABLE Books (
                    book_id INT PRIMARY KEY NOT NULL,
                    title VARCHAR(130) NOT NULL,
                    author_id INT NOT NULL,
                    price DOUBLE(10, 2) NOT NULL,
                    publication_date DATE,
                    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
                )
               """)

cursor.execute("""
                CREATE TABLE Customers(
                    customer_id INT PRIMARY KEY NOT NULL,
                    customer_name VARCHAR(215) NOT NULL,
                    email VARCHAR(215) NOT NULL,
                    address TEXT NOT NULL
                )
                """)


cursor.execute("""
                CREATE TABLE Orders(
                    order_id INT PRIMARY KEY NOT NULL,
                    customer_id INT NOT NULL,
                    order_date DATE,
                    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
                    )
            """)


cursor.execute("""
                CREATE TABLE Order_Details(
                    orderdetailid INT PRIMARY KEY NOT NULL,
                    quantity DOUBLE NOT NULL,
                    order_id INT NOT NULL,
                    book_id INT NOT NULL,
                    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
                    FOREIGN KEY (book_id) REFERENCES Books(book_id)
                )
        """)

print("Created all tables successfully!")
cursor.close()
myalxdb.close()
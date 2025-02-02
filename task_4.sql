-- Active: 1738525271950@@127.0.0.1@3306@alx_book_store
import mysql.connector


myalxdb = mysql.connector.connect(host="localhost", 
                                user="root",
                                password="Dilichukwu1.",
                                database = "alx_book_store"
                                )
cursor = myalxdb.cursor()
cursor.execute("USE alx_book_store;")
cursor.execute("""SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_DEFAULT, EXTRA
                FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Books'
              """)

for col in cursor.fetchall():
    print(col)
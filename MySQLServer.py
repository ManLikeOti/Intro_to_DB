import mysql.connector

try:
    myalxdb = mysql.connector.connect(host="localhost", 
                               user="root",
                               password="Dilichukwu1.",
                               database = "alx_book_store"
                               )

    cursor = myalxdb.cursor()
    cursor.execute("""CREATE DATABASE IF NOT EXISTS alx_book_store""")
    print("Database 'alx_book_store' created successfully!")
except myalxdb.connector.Error:
    print("Unable to connect to Database!")
finally:
    cursor.close()
    myalxdb.close()
-- Active: 1738525271950@@127.0.0.1@3306@alx_book_store
import mysql.connector


myalxdb = mysql.connector.connect(host="localhost", 
                                user="root",
                                password="Dilichukwu1.",
                                database = "alx_book_store"
                                )
cursor = myalxdb.cursor()
cursor.execute("USE alx_book_store;")

cursor.execute("""INSERT INTO customers(customer_id, customer_name, email, address)
        VALUES(1, "Cole Baidoo", "cbaidoo@sandtech.com", "123 Happiness Ave.")
    """)
myalxdb.commit()
print(cursor.rowcount, "record(s)")
cursor.close()
myalxdb.close()
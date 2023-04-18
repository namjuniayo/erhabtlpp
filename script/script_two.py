
import mysql.connector


try:

  mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="64*18eVheS0pQ",
    database="erha_db"
  )

  mycursor = mydb.cursor()

  sql = " DELETE FROM transact_in WHERE date_time < SUBDATE(NOW(), INTERVAL 12 MONTH);"
  mycursor.execute(sql)


finally:
  mycursor.close()


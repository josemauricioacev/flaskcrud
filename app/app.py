from flask import Flask
import pymysql

pymysql.install_as_MySQLdb()

# Application initializations
app = Flask(__name__)

# settings
app.secret_key = "mysecretkey"
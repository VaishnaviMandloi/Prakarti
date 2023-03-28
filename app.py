
from flask import Flask, render_template, request, redirect, url_for,session,flash
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

from flask_mysqldb import MySQL
import MySQLdb.cursors
import re

import pickle
import numpy as np
from sklearn.preprocessing import StandardScaler

app = Flask(__name__)


db = SQLAlchemy()
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:@localhost/prakarti"
app.config['SECRET_KEY'] = "random string"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db.init_app(app)

app.secret_key = 'xyzsdfg'
  
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'prakarti'

mysql = MySQL(app)

#class User()

class Contact(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    phone = db.Column(db.String(100), nullable=False)
    

class Admin(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    password = db.Column(db.String(100), nullable=False)
    

class Appoinment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    Title = db.Column(db.String(100), nullable=False)
    first_name = db.Column(db.String(100), nullable=False)
    last_name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    first_appoinment = db.Column(db.String(100), nullable=False)
    phone = db.Column(db.String(100), nullable=False)
    slot = db.Column(db.String(100), nullable=False)
    service_type = db.Column(db.String(100), nullable=False)
    doctor = db.Column(db.String(100), nullable=False)
    date = db.Column(db.String(100), nullable=False)
    date2= db.Column(db.String(100), nullable=False)
    # date_created = db.Column(db.DATE, default=datetime.now())

class Accpted(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    f_appoinment = db.Column(db.String(100), nullable=False)
    slot = db.Column(db.String(100), nullable=False)
    service = db.Column(db.String(100), nullable=False)
    doctor = db.Column(db.String(100), nullable=False)
    date = db.Column(db.String(100), nullable=False)
    date2 = db.Column(db.String(100), nullable=False)
class Reject(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    f_appoinment = db.Column(db.String(100), nullable=False)
    slot = db.Column(db.String(100), nullable=False)
    service = db.Column(db.String(100), nullable=False)
    doctor = db.Column(db.String(100), nullable=False)
    date = db.Column(db.String(100), nullable=False)
    date2 = db.Column(db.String(100), nullable=False)

@app.route('/login', methods =['GET', 'POST'])
def login():
    mesage = ''
    if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
        email = request.form['email']
        password = request.form['password']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE email = % s AND password = % s', (email, password, ))
        user = cursor.fetchone()
        if user:
            session['loggedin'] = True
            session['userid'] = user['userid']
            session['name'] = user['name']
            session['email'] = user['email']
            mesage = 'Logged in successfully !'
            return render_template('user.html', mesage = mesage)
        else:
            mesage = 'Please enter correct email / password !'
    return render_template('login.html', mesage = mesage)

@app.route('/userlogout')
def user_logout():
    session.pop('loggedin', None)
    session.pop('userid', None)
    session.pop('email', None)
    return redirect(url_for('login'))

@app.route('/register', methods =['GET', 'POST'])
def register():
    mesage = ''
    if request.method == 'POST' and 'name' in request.form and 'password' in request.form and 'email' in request.form :
        userName = request.form['name']
        password = request.form['password']
        email = request.form['email']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE email = % s', (email, ))
        account = cursor.fetchone()
        if account:
            mesage = 'Account already exists !'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            mesage = 'Invalid email address !'
        elif not userName or not password or not email:
            mesage = 'Please fill out the form !'
        else:
            cursor.execute('INSERT INTO user VALUES (NULL, % s, % s, % s)', (userName, email, password, ))
            mysql.connection.commit()
            mesage = 'You have successfully registered ! , Now login !! '
            return render_template('login.html' , mesage =mesage)
    elif request.method == 'POST':
        mesage = 'Please fill out the form !'
    return render_template('register.html', mesage = mesage)

@app.route("/",)
def admin_login():

    return render_template ("index.html")
@app.route("/admin")
def admin():
    if session.get('username'):
        record = Appoinment.query.all()
        flash("Accpted successfully" )
        # flash("Rejected successfully" )
        return render_template("admin/index.html",record=record)
    else:
        return render_template("admin/login.html")

@app.route("/home",methods=['POST','GET'])
def home():
    
    if session.get('username'):
        record = Appoinment.query.all()
        flash("Accpted successfully" )
        # flash("Rejected successfully" )
        return render_template("admin/index.html",record=record)
    else:
            
        msg = "Login first"
        if request.method == "POST":
        
            username = request.form.get("username")
            password = request.form.get("password")
            record = Appoinment.query.all()
            std = Admin.query.filter_by(name=username, password=password).first()
            if std:
                session['username'] = username
                return render_template("admin/index.html", record = record)
            else:
                flash("Incorrect password or user name")  
                return render_template("admin/login.html", msg=msg)
        else:

            return render_template("admin/login.html", msg=msg)

@app.route("/contact" , methods = ['GET','POST'])
def contact():
    if request.method == 'POST': 
        name  =  request.form.get('name')
        phone =  request.form.get('phone')
        email =  request.form.get('email')
        c = Contact(name=name , phone = phone , email = email)
        db.session.add(c)
        db.session.commit()
        flash("Contact  has been send successfully")  
        return render_template("user.html")
    return render_template("user.html")
    

@app.route("/logout")
def logout():
    session.clear()
    return redirect('/')

@app.route("/funlearn")
def funlearn():
    return render_template('funlearn.html')

@app.route("/appoinment", methods = ['GET','POST'])
def appoinment():
    if  request.method == 'POST' :
        title = request.form.get('title')
        first_name = request.form.get('fname')
        last_name = request.form.get('lname')
        email = request.form.get('email')
        first_appoinment = request.form.get('first_appoinment')
        phone = request.form.get('phone')
        slot = request.form.get('slot')
        service_type = request.form.get('service_type')
        doctor = request.form.get('doctor')
        date = request.form.get('date')
        date2 = request.form.get('date2')
        entry = Appoinment(Title = title , first_name = first_name , last_name= last_name,email=email , first_appoinment=first_appoinment , phone= phone , slot = slot, service_type = service_type, doctor = doctor , date = date,date2 = date2 )
        db.session.add(entry)
        db.session.commit()
        flash("Appoinment Booking request has been send successfully")
    return render_template ("/appoinment.html")        






@app.route("/Accept/<int:id>")
def accept(id):

    d = Appoinment.query.get(id)
    apt = Appoinment.query.filter_by(id = id).first()
    add = Accpted(name=apt.first_name , email= apt.email , f_appoinment=apt.first_appoinment,slot=apt.slot,service=apt.service_type,doctor=apt.doctor,date=apt.date,date2=apt.date2)
    db.session.add(add)
    db.session.delete(d)
    db.session.commit()
    return redirect("/home")


@app.route("/reject/<int:id>")
def reject(id):
    d = Appoinment.query.get(id)
    apt = Appoinment.query.filter_by(id = id).first()
    add = Reject(name=apt.first_name , email= apt.email , f_appoinment=apt.first_appoinment,slot=apt.slot,service=apt.service_type,doctor=apt.doctor,date=apt.date,date2=apt.date2)
    db.session.add(add)
    db.session.delete(d)
    db.session.commit()
    return redirect("/home")
@app.route("/accepted")
def accepted():
    msg=("Login First")
    if session.get('username'):
        record = Accpted.query.all()
    
    return render_template("admin/accept.html",record=record)

@app.route("/rejected")
def rejected(): 
    msg=("Login First")
    if session.get('username'):
        record = Reject.query.all()
        return render_template ("admin/reject.html",record=record)
    return render_template("admin/reject.html",msg=msg)
    
    
        

@app.route("/Delete/<int:id>")
def delete_accept(id):
    d = Accpted.query.get(id)
    db.session.delete(d)
    db.session.commit()
    return redirect("/accepted")

@app.route("/reject_delete/<int:id>")
def delete_reject(id):
    d = Reject.query.get(id)
    db.session.delete(d)    
    db.session.commit()
    return redirect("/rejected")


@app.route('/predict')
def predict_diabetic():
    return render_template('predictorform.html')

@app.route('/results' , methods=['POST'])
def results():
    form = request.form
    if request.method == 'POST':

        loaded_model = pickle.load(open('diabetes_training_model.sav', 'rb') )
        
        Pregnancies   = request.form.get('Pregnancies')
        Glucose   = request.form.get('Glucose')
        BloodPressure   = request.form.get('BloodPressure')
        SkinThickness   = request.form.get('SkinThickness')
        Insulin    = request.form.get('Insulin')
        BMI   = request.form.get('BMI')
        DiabetesPedigreeFunction   = request.form.get('DiabetesPedigreeFunction')
        Age   = request.form.get('Age')

        input_data = (Pregnancies, Glucose,BloodPressure,SkinThickness,Insulin,BMI, DiabetesPedigreeFunction,Age)

# chaning input_data to numpy array
        input_data_as_numpy_array = np.array(input_data)

# reshaping array as we are predicting only one value
        input_data_reshaped = input_data_as_numpy_array.reshape(1,-1)

# standardize the input data

        predicted_result = loaded_model.predict(input_data_reshaped)
        if(predicted_result[0] ==0):
            prediction ='non-diabetic person'  
        else:
            prediction ='diabetic person'
    return render_template('predictorform.html' , prediction=prediction)
        

if __name__ == '__main__':
#     Session = sessionmaker(bind=engine)
    app.run(debug=True)


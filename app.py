
from flask import Flask, render_template, request, redirect, url_for,session,flash
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

import os
import secrets

from flask_wtf.file import FileAllowed ,  FileField , FileRequired
from wtforms import Form , SubmitField ,FloatField , IntegerField , StringField , BooleanField , TextAreaField , validators
from flask_uploads import UploadSet, configure_uploads, IMAGES, patch_request_class
from flask_msearch import Search

from flask_mysqldb import MySQL
import MySQLdb.cursors
import re

import pickle
import numpy as np


app = Flask(__name__)


db = SQLAlchemy()
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql:///prakarti.sql"
app.config['SECRET_KEY'] = "random string"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db.init_app(app)

app.secret_key = 'xyzsdfg'


search = Search()
search.init_app(app)
  
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'prakarti'

basedir = os.path.abspath(os.path.dirname(__file__))

app.config['UPLOADED_PHOTOS_DEST'] = os.path.join(basedir, 'static/images')
photos = UploadSet('photos', IMAGES)
configure_uploads(app, photos)
patch_request_class(app)

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

#----------------- shop ---------------

class Brand(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30), nullable=False , unique=True)

class Category(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30), nullable=False , unique=True)

class Addproducts(Form):
    name = StringField('Name' , [validators.DataRequired()])
    price = FloatField('Price', [validators.DataRequired()])
    discount = IntegerField('Discount', default=0)
    stock = IntegerField('Stock', [validators.DataRequired()])
    flavours = StringField('Flavours', [validators.DataRequired()])
    discription = TextAreaField('Discription', [validators.DataRequired()])

    image_1 = FileField('Image 1', validators=[FileRequired(), FileAllowed(['jpg','png','gif','jpeg'], 'Images only please')])
    image_2 = FileField('Image 2', validators=[FileRequired(), FileAllowed(['jpg','png','gif','jpeg'], 'Images only please')])
    image_3 = FileField('Image 3', validators=[FileRequired(), FileAllowed(['jpg','png','gif','jpeg'], 'Images only please')])

class product(db.Model):
    __seachbale__ = ['name','desc']
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    price = db.Column(db.Numeric(10,2), nullable=False)
    discount = db.Column(db.Integer, default=0)
    stock = db.Column(db.Integer, nullable=False)
    flavours = db.Column(db.Text, nullable=False)
    desc = db.Column(db.Text, nullable=False)
    pub_date = db.Column(db.DateTime, nullable=False,default=datetime.utcnow)

    category_id = db.Column(db.Integer, db.ForeignKey('category.id'),nullable=False)
    category = db.relationship('Category',backref=db.backref('categories', lazy=True))

    brand_id = db.Column(db.Integer, db.ForeignKey('brand.id'),nullable=False)
    brand = db.relationship('Brand',backref=db.backref('brands', lazy=True))

    image_1 = db.Column(db.String(150), nullable=False, default='image1.jpg')
    image_2 = db.Column(db.String(150), nullable=False, default='image2.jpg')
    image_3 = db.Column(db.String(150), nullable=False, default='image3.jpg')

#----------------- /shop --------------

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
        #flash('Accepted successfully')
        # flash("Rejected successfully" )
        return render_template("admin/index.html",record=record)
    else:
        return render_template("admin/login.html")

@app.route("/home",methods=['POST','GET'])
def home():
    
    if session.get('username'):
        record = Appoinment.query.all()
        #flash("Accepted successfully")
        # flash("Rejected successfully" )
        return render_template("admin/index.html",record=record )
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
        flash("Contact has been send successfully")  
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
        flash(f'Appoinment Booking request has been send successfully')
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

@app.route('/predictor')
def predictor():
    return render_template('predictor.html')

@app.route('/predictdiabetes')
def predict_diabetic():
    return render_template('diabeticPredictorform.html')

@app.route('/diabeticResults' , methods=['POST'])
def results():
    form = request.form
    if request.method == 'POST':

        loaded_model = pickle.load(open('D:/vaishnavi/Minor Project/Prakarti/templates/diabetes_training_model.sav', 'rb') )

        Name = request.form.get('Name')
        Gender = request.form.get('gender')

        Pregnancies   = (int)(request.form.get('Pregnancies'))
        Glucose   = (int)(request.form.get('Glucose'))
        BloodPressure   = (int)(request.form.get('BloodPressure'))
        SkinThickness   = (int)(request.form.get('SkinThickness'))
        Insulin    = (int)(request.form.get('Insulin'))
        BMI   = (float)(request.form.get('BMI'))
        DiabetesPedigreeFunction   = (float)(request.form.get('DiabetesPedigreeFunction'))
        Age   = (int)(request.form.get('Age'))

        input_data = (Pregnancies, Glucose,BloodPressure,SkinThickness,Insulin,BMI, DiabetesPedigreeFunction,Age)

        # chaning input_data to numpy array
        input_data_as_numpy_array = np.array(input_data)

        # reshaping array as we are predicting only one value
        input_data_reshaped = input_data_as_numpy_array.reshape(1,-1)

        predicted_result = loaded_model.predict(input_data_reshaped)
        if(predicted_result[0] ==0):
            prediction ='non-diabetic person'
        else:
            prediction ='diabetic person'
    return render_template('diabeticPredictorform.html' , prediction=prediction , Name=Name , gender=Gender , Pregnancies = Pregnancies, Glucose =  Glucose,BloodPressure = BloodPressure ,SkinThickness = SkinThickness ,Insulin =Insulin ,BMI = BMI, DiabetesPedigreeFunction =DiabetesPedigreeFunction ,Age = Age)

@app.route('/predictheartdefect')
def predict_heartdefect():
    return render_template('heartdefectPredictorform.html')

@app.route('/heartdefectResults' , methods=['POST'])
def heartresults():
    form = request.form
    if request.method == 'POST':

        heart_loaded_model = pickle.load(open('D:/vaishnavi/Minor Project/Prakarti/templates/heartdefect_training_model.sav', 'rb') )

        Name = request.form.get('Name')

        age   = (int)(request.form.get('age'))
        sex   = (int)(request.form.get('sex'))
        cp   = (int)(request.form.get('cp'))
        trestbps   = (int)(request.form.get('trestbps'))
        chol    = (int)(request.form.get('chol'))
        fbs   = (int)(request.form.get('fbs'))
        restecg   = (int)(request.form.get('restecg'))
        thalach   = (int)(request.form.get('thalach'))
        exang = (int)(request.form.get('exang'))
        oldpeak = (float)(request.form.get('oldpeak'))
        slope = (int)(request.form.get('slope'))
        ca = (int)(request.form.get('ca'))
        thal = (int)(request.form.get('thal'))

        input_data = (age,sex,cp,trestbps,chol,fbs,restecg,thalach,exang,oldpeak,slope,ca,thal)

        # chaning input_data to numpy array
        input_data_as_numpy_array = np.array(input_data)

        # reshaping array as we are predicting only one value
        input_data_reshaped = input_data_as_numpy_array.reshape(1,-1)

        predicted_result = heart_loaded_model.predict(input_data_reshaped)
        if(predicted_result[0] ==0):
            prediction ='Your heart is healthy'
        else:
            prediction ='Your heart have some defect'
    return render_template('heartdefectPredictorform.html' , prediction=prediction , Name=Name , age=age,sex=sex,cp=cp,trestbps=trestbps,chol=chol,fbs=fbs,restecg=restecg,thalach=thalach,exang=exang,oldpeak=oldpeak,slope=slope,ca=ca,thal=thal)
       
# ---------------------------- shop ------------------------------

#------------------ admin ------------------------
@app.route('/addbrand',methods=['GET','POST'])
def addbrand():
    if request.method =="POST":
        getbrand = request.form.get('brand')
        brand = Brand(name=getbrand)
        db.session.add(brand)
        flash(f'The brand {getbrand} was added to your database','success')
        db.session.commit()
        return redirect(url_for('addbrand'))
    return render_template('products/addbrand.html', title='Add brand',brands='brands')

@app.route('/addcat',methods=['GET','POST'])
def addcat():
    if request.method =="POST":
        getcat = request.form.get('category')
        cat = Category(name=getcat)
        db.session.add(cat)
        flash(f'The brand {getcat} was added to your database','success')
        db.session.commit()
        return redirect(url_for('addcat'))
    return render_template('products/addbrand.html')

@app.route('/addproduct', methods=['GET','POST'])
def addproduct():
    form = Addproducts(request.form)
    brands = Brand.query.all()
    categories = Category.query.all()
    if request.method=="POST"and 'image_1' in request.files:
        name = form.name.data
        price = form.price.data
        discount = form.discount.data
        stock = form.stock.data
        flavours = form.flavours.data
        desc = form.discription.data
        brand = request.form.get('brand')
        category = request.form.get('category')
        image_1 = photos.save(request.files.get('image_1'), name=secrets.token_hex(10) + ".")
        image_2 = photos.save(request.files.get('image_2'), name=secrets.token_hex(10) + ".")
        image_3 = photos.save(request.files.get('image_3'), name=secrets.token_hex(10) + ".")
        addproduct =  product(name=name,price=price,discount=discount,stock=stock,flavours=flavours,desc=desc,category_id=category,brand_id=brand,image_1=image_1,image_2=image_2,image_3=image_3)
        db.session.add(addproduct)
        flash(f'The product {name} was added in database','success')
        db.session.commit()
        return redirect(url_for('adminproduct'))
    return render_template('products/addproduct.html', form=form, title='Add a Product',brands=brands,categories=categories) 

@app.route('/adminproduct')
def adminproduct():
    if session.get('username'):
        products = product.query.all()
        return render_template('products/adminproduct.html' , title='Admin Product page' , products=products)
    else:
        return render_template("admin/login.html")

@app.route('/brands')
def brands():
    brands = Brand.query.order_by(Brand.id.desc()).all()
    return render_template('products/adminbrand.html', title='brands',brands=brands)


@app.route('/categories')
def categories():
    categories = Category.query.order_by(Category.id.desc()).all()
    return render_template('products/adminbrand.html', title='categories',categories=categories)

#----------------------------- /admin ----------------------------

def api_response():
    from flask import jsonify
    if request.method == 'POST':
        return jsonify(**request.json)

def brands():
    brands = Brand.query.join(product, (Brand.id == product.brand_id)).all()
    return brands

def categories():
    categories = Category.query.join(product,(Category.id == product.category_id)).all()
    return categories

@app.route('/shop')
def shop():
    page = request.args.get('page',1, type=int)
    products = product.query.filter(product.stock > 0).order_by(product.id.desc()).paginate(page=page, per_page=8)
    return render_template('products/index.html', products=products,brands=brands(),categories=categories())

@app.route('/result')
def result():
    searchword = request.args.get('q')
    products = product.query.msearch(searchword, fields=['name','desc'] , limit=6)
    return render_template('products/result.html',products=products,brands=brands(),categories=categories())

@app.route('/product/<int:id>')
def single_page(id):
    Addproduct = product.query.get_or_404(id)
    return render_template('products/single_page.html',product=Addproduct,brands=brands(),categories=categories())

@app.route('/brand/<int:id>')
def get_brand(id):
    page = request.args.get('page',1, type=int)
    get_brand = Brand.query.filter_by(id=id).first_or_404()
    brand = product.query.filter_by(brand=get_brand).paginate(page=page, per_page=8)
    return render_template('products/index.html',brand=brand,brands=brands(),categories=categories(),get_brand=get_brand)


@app.route('/categories/<int:id>')
def get_category(id):
    page = request.args.get('page',1, type=int)
    get_cat = Category.query.filter_by(id=id).first_or_404()
    get_cat_prod = product.query.filter_by(category=get_cat).paginate(page=page, per_page=8)
    return render_template('products/index.html',get_cat_prod=get_cat_prod,brands=brands(),categories=categories(),get_cat=get_cat)

# ---------------------------- /shop -------------------------------



if __name__ == '__main__':
#     Session = sessionmaker(bind=engine)
    app.run(debug=True)


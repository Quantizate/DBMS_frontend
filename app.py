from flask import Flask, render_template, request, redirect,session, url_for, jsonify
# from Flask-MySQLdb import MySQL
from flask_mysqldb import MySQL
import MySQLdb.cursors
from flask import redirect
import os

# app = Flask(__name__,  template_folder='C:/Users/anish/Desktop/Frontend_Lab/DBMS_frontend/src')

# Get the absolute path of the directory where this file is located
# dir_path = os.path.dirname(os.path.realpath(__file__))

# app = Flask(__name__, template_folder=dir_path)
app = Flask(__name__)

# Configure MySQL
app.secret_key = 'abcd2123445'  
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_PORT'] = 3306
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'lab_bookings'

mysql = MySQL(app)

session_email=None
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
        
    if request.method == 'POST':
        details = request.form
        email = session.get('email')  # Retrieve email from session
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM students WHERE Email_ID = %s", (email,))
        user = cur.fetchone()
        if user==None:
            cur.execute("SELECT * FROM professor WHERE Email_ID = %s", (email,))
            user = cur.fetchone()
            if user==None:
                cur.execute("SELECT * FROM staff WHERE Email_ID = %s", (email,))
                user = cur.fetchone()
        if user:
            name=user[1]
        # Check if the form is for lab booking or equipment issuing
        if 'time_slot' in details:
                # Lab booking form data
                lab_name = details['Lab_Name']
                time_slot = details['time_slot']
                date= details['date']
                cur = mysql.connection.cursor()
                cur.execute("SELECT * FROM bookings WHERE lab_name = %s AND date = %s AND time_slot = %s", (lab_name, date, time_slot))
                existing_booking = cur.fetchone()
                if existing_booking:
                    return redirect(url_for('booking_lab'))
                else:
                    cur.execute("INSERT INTO bookings (user_email, name, lab_name, time_slot, date) VALUES (%s, %s, %s, %s, %s)", (email, name, lab_name, time_slot, date))
                    mysql.connection.commit()
                    cur.close()
        
        elif 'Equipment_Name' in details:
                # Equipment issuing form data
                # print(details)
                equipment_name = details['Equipment_Name']
                equipment_id= details['ID']
                price= details['Price']
                vendor_address= details['Vendor_Address']
                vendor_phone_number= details['Vendor_Phone_Number']
                manufacturer_name= details['Manufacturer_Name']
                status= details['isAvailable']
                if(status=='Available'):
                    status=1
                else:
                    status=0
                lab_name= details['Lab_Name']
                
                cur = mysql.connection.cursor()
                cur.execute("INSERT INTO inventory ( ID,Equipment_Name, Price, Vendor_Address, Vendor_Phone_Number, Manufacturer_Name, isAvailable ,  Lab_Name )  VALUES (%s,%s, %s, %s, %s, %s, %s,%s)", (equipment_id,equipment_name, price, vendor_address, vendor_phone_number, manufacturer_name, status, lab_name))
                mysql.connection.commit()
                cur.close()
        
        elif 'Enrolled_Course_ID' in details:
            # request.form.getlist('Enrolled_Course_ID')
            enrolled_course_ids = request.form.getlist('Enrolled_Course_ID')
            cur = mysql.connection.cursor()
            cur.execute("SELECT Roll_Number FROM students WHERE Email_ID = %s", (email,))
            roll_no = cur.fetchone()[0]
            for enrolled_course in enrolled_course_ids:
                print(enrolled_course[2:-3])
                cur.execute("SELECT * FROM student_enrolled WHERE Course_Id = %s AND Roll_Number = %s", (enrolled_course[2:-3], roll_no))
                user = cur.fetchone()
                if user:
                    continue
                cur.execute("INSERT INTO student_enrolled (Course_Id, Roll_Number) VALUES (%s, %s)", (enrolled_course[2:-3], roll_no))  
                mysql.connection.commit()
            
            cur.close()
    
        elif 'Course_Name' in details:
            # print("Hello")
            course_name= details['Course_Name']
            course_id= details['Course_ID']
            credits= details['Credits']
            
            cur = mysql.connection.cursor()
            cur.execute("select * from professor where Email_ID = %s", (email,))
            user = cur.fetchone()
            employee_id=user[0]
            cur.execute("INSERT INTO course (Course_ID, Course_Name, Credits) VALUES (%s, %s, %s)", (course_id,course_name, credits))
            mysql.connection.commit()
            cur.execute("INSERT INTO instructor(Course_ID, Employee_ID) VALUES (%s, %s)", (course_id,employee_id))
            # cur.execute("INSERT INTO course (email,Course_ID, Course_Name, Credits) VALUES (%s,%s, %s, %s)", (email,course_id,course_name, credits))
            mysql.connection.commit()    
            cur.close()
        
        elif 'Donating_Organization' in details:
            id=details['ID']
            lab_name=details['Lab_Name']
            donor=details['Donor']
            donating_organization=details['Donating_Organization']
            amount=details['Amount']
            receiving_date= details['Receiving_Date']
            
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO grants (ID, Lab_Name, Donor, Donating_Organization, Amount, Receiving_Date) VALUES (%s, %s, %s, %s, %s, %s)", (id, lab_name, donor, donating_organization, amount, receiving_date))
            mysql.connection.commit()
            cur.close()
               
        else:
                # print(details)
                # Equipment issuing form data
            if 'issueDate' in details:
                equipmentID = details['ID']
                # number_of_equipment = details['numberOfEquipment']
                issue_date = details['issueDate']
                # return_date = details['returnDate']
                
                cur = mysql.connection.cursor()
                cur.execute("select * from students where Email_ID = %s", (email,))
                user = cur.fetchone()
                if user!=None:
                    roll_no=user[0]
                else:
                    redirect(url_for('404'))
                cur.execute("SELECT ID,isAvailable FROM inventory WHERE ID = %s", (equipmentID,))
                existing_id = cur.fetchone()
                if not existing_id:
                    return redirect(url_for('booking_lab'))
                elif (existing_id[1]==0):
                    return redirect(url_for('booking_lab'))
                cur.execute("INSERT INTO accessed_tool (Roll_Number, ID, Issued_date) VALUES (%s, %s, %s)", (roll_no, equipmentID, issue_date))
                mysql.connection.commit()
                cur.execute("UPDATE inventory SET isAvailable = 0 WHERE ID = %s", (equipmentID,))
                mysql.connection.commit()
                cur.close()
            else:
                equipmentID = details['equipment_id']
                cur = mysql.connection.cursor()
                cur.execute("select * from students where Email_ID = %s", (email,))
                user = cur.fetchone()
                if user!=None:
                    roll_no=user[0]
                else:
                    redirect(url_for('404'))
                cur.execute("DELETE from accessed_tool where Roll_Number = %s AND ID = %s", (roll_no, equipmentID))
                mysql.connection.commit()
                cur.execute("UPDATE inventory SET isAvailable = 1 WHERE ID = %s", (equipmentID,))
                mysql.connection.commit()
                cur.close()

                
        lab_bookings=fetch_lab_bookings(email)
        equipment_issued = fetch_equipment_issued(email)
        if(type(equipment_issued)==type(None)):
            equipment_issued=[]
        courses=fetch_courses()
        role=fetch_role(email)
        equipment_details_list = fetch_equip_details_list(equipment_issued)
        return render_template('submit.html', equipment_issued=equipment_issued, lab_bookings=lab_bookings,courses=courses,role=role, equipment_details_list=equipment_details_list)

@app.route('/profile')
def profile():
    email=session.get('email')
    lab_bookings=fetch_lab_bookings(email)
    equipment_issued = fetch_equipment_issued(email)
    if(type(equipment_issued)==type(None)):
        equipment_issued=[]
    role=fetch_role(email)
    if(role!='lab'):
        name=fetch_name(email)
        if(role=='student'):
            courses=fetch_student_courses(email)
            equipment_details_list = fetch_equip_details_list(equipment_issued)
            return render_template('profile.html', equipment_issued=equipment_issued, lab_bookings=lab_bookings,courses=courses,name=name,role = role, equipment_details_list=equipment_details_list)
        elif(role=='professor'):
            courses=fetch_prof_course(email)
            return render_template('profile.html', lab_bookings=lab_bookings,courses=courses,name=name, equipment_issued=[] ,role = role)
        else:
            return render_template('profile.html',name=name,role =role)
    else:
        grants, inventory=fetch_grant_inventory(email)
        return render_template('profile.html',role =role,grants=grants,inventory=inventory)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        if (email=="admin@gmail.com"):
            return redirect(url_for('table'))
        # session_email=email
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        # Fetch user from database
        # cur = mysql.connection.cursor()
        cursor.execute("SELECT * FROM students WHERE Email_ID = %s AND password = %s", (email, password))
        user = cursor.fetchone()
        if user==None:
            cursor.execute("SELECT * FROM professor WHERE Email_ID = %s AND password = %s", (email, password))
            user = cursor.fetchone()
            if user==None:
                cursor.execute("SELECT * FROM staff WHERE Email_ID = %s AND password = %s", (email, password))
                user = cursor.fetchone()
        if user:
            session['loggedin'] = True
            session['email'] = user['Email_ID']
            return redirect(url_for('booking_lab'))
        # cursor.close()

        # if user:
        #     # Redirect to booking page if login is successful
        #     return render_template('/bookinglab.html')
        else:
            # Redirect to login page with error message if login fails
            print(email)
            cursor.execute("SELECT * FROM lab WHERE Email_ID = %s", (email,))
            user = cursor.fetchone()
            if user:
                session['loggedin'] = True
                session['email'] = user['Email_ID']
                return redirect(url_for('labpage'))
            else:   
                return render_template('login.html', error="Invalid email or password")
            
    if request.method == 'GET':
        return render_template('login.html')
    
    return render_template('login.html')


@app.route('/labpage')
def labpage():
    if 'loggedin' in session:
        role=fetch_role(session.get('email'))
        return render_template('labpage.html', role=role)
    
    return redirect(url_for('login'))
    
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        email = request.form['reg_email']
        password = request.form['reg_password']
        role = request.form['role']
        first_name=request.form['first name']
        last_name=request.form['last name']
        middle_name = request.form['middle name']
        roll_no = request.form['roll number']
        lab_name = request.form['Lab name']
        # print(role)
        # Insert new user into database
        cur = mysql.connection.cursor()
        if(role=='student'):
             cur.execute("INSERT INTO students (Roll_Number, First_Name, Middle_Name, Last_Name, Email_ID, password) VALUES (%s, %s, %s,%s,%s,%s)", (roll_no, first_name,middle_name,last_name,email,password))
            #  cur.execute("INSERT INTO students (Email_ID, First_Name,password) VALUES (%s, %s, %s,%s)", (email, name,password,role))
        elif(role=='professor'):
            cur.execute("INSERT INTO professor (Employee_ID,Email_ID, First_Name, Middle_Name, Last_Name,  password) VALUES (%s,%s, %s, %s,%s,%s)", (roll_no, email, first_name,middle_name,last_name,password))
            # cur.execute("INSERT INTO professors (Email_ID, First_Name,password) VALUES (%s, %s, %s,%s)", (email, name,password,role))
        elif(role=='staff'):
            cur.execute("INSERT INTO staff (Employee_ID,Email_ID, First_Name, Middle_Name, Last_Name, password,Lab_Name) VALUES (%s,%s, %s, %s,%s,%s,%s)", (roll_no, email, first_name,middle_name,last_name,password,lab_name))
            # cur.execute("INSERT INTO staff (email, name,password) VALUES (%s, %s, %s,%s)", (email, name,password,role))
        mysql.connection.commit()
        cur.close()

        # Redirect to login page after successful registration
        return redirect('/login')
    
    if request.method == 'GET':
        return render_template('register.html')

@app.route('/bookinglab')
def booking_lab():
    if 'loggedin' in session:
        role=fetch_role(session.get('email'))
        courses=fetch_courses()
        # print(role)
        equipment_issued=fetch_equipment_issued(session.get('email'))
        return render_template('bookinglab.html', role=role,courses=courses,equipment_issued=equipment_issued,)
    return redirect(url_for('login'))

@app.route('/admintables/bookings', methods=['GET', 'POST'])
def bookings():
    bookings,equipment_issued,courses, inventory, student_enrolled, accessed_tool, course_slot =fetch_all()
    columns=get_column_names('bookings')
    # print(columns)
    return render_template('/admintables/bookings.html',bookings=bookings,equipment_issued=equipment_issued, courses=courses, inventory=inventory, columns=columns)

@app.route('/admintables/inventory', methods=['GET', 'POST'])
def inventory():
    bookings,equipment_issued,courses, inventory , student_enrolled, accessed_tool, course_slot =fetch_all()
    columns=get_column_names('inventory')
    # print(columns)
    return render_template('/admintables/inventory.html',bookings=bookings,equipment_issued=equipment_issued, courses=courses, inventory=inventory, columns=columns)

@app.route('/admintables/course', methods=['GET', 'POST'])
def course():
    bookings,equipment_issued,courses, inventory , student_enrolled, accessed_tool, course_slot =fetch_all()
    columns=get_column_names('course')
    return render_template('/admintables/course.html',bookings=bookings,equipment_issued=equipment_issued, courses=courses, inventory=inventory, columns=columns)

@app.route('/admintables/student_enrolled', methods=['GET', 'POST'])
def student_enrolled():
    bookings,equipment_issued,courses, inventory,student_enrolled, accessed_tool, course_slot =fetch_all()
    columns=get_column_names('student_enrolled')
    return render_template('/admintables/student_enrolled.html',bookings=bookings,equipment_issued=equipment_issued, courses=courses, inventory=inventory,student_enrolled= student_enrolled ,columns=columns)

@app.route('/admintables/accessed_tool', methods=['GET', 'POST'])
def accessed_tool():
    bookings,equipment_issued,courses, inventory , student_enrolled, accessed_tool , course_slot =fetch_all()
    columns=get_column_names('accessed_tool')
    return render_template('/admintables/accessed_tool.html',bookings=bookings,equipment_issued=equipment_issued, courses=courses, inventory=inventory, student_enrolled=student_enrolled, accessed_tool=accessed_tool, columns=columns)

@app.route('/admintables/course_slot', methods=['GET', 'POST'])
def course_slot():
    bookings,equipment_issued,courses, inventory , student_enrolled, accessed_tool, course_slot =fetch_all()
    columns=get_column_names('course_slot')
    return render_template('/admintables/course_slot.html',bookings=bookings,equipment_issued=equipment_issued, courses=courses, inventory=inventory, student_enrolled=student_enrolled, accessed_tool=accessed_tool, columns=columns, course_slot=course_slot)

@app.route('/admintables/grants', methods=['GET', 'POST'])
def grants():
    grants=fetch_all_grants()
    columns=get_column_names('grants')
    return render_template('/admintables/grants.html', grants=grants, columns=columns)

def fetch_all_grants():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM grants")
    grants = cur.fetchall()  # Fetch all rows
    return grants

def fetch_all_instructor():
    cur=mysql.connection.cursor()
    cur.execute("SELECT * FROM instructor")
    instructor=cur.fetchall()
    return instructor


@app.route('/admintables/instructor', methods=['GET', 'POST'])
def instructor():
    instructor=fetch_all_instructor()
    columns=get_column_names('instructor')
    return render_template('/admintables/instructor.html', instructor=instructor, columns=columns)

def fetch_all_lab_grant():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM lab_grant")
    lab_grants = cur.fetchall()  # Fetch all rows
    return lab_grants

@app.route('/admintables/lab_grant', methods=['GET', 'POST'])
def lab_grants():
    lab_grant=fetch_all_lab_grant()
    columns=get_column_names('lab_grant')
    return render_template('/admintables/lab_grant.html', lab_grant=lab_grant, columns=columns)

def get_all_prof_department():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM prof_department")
    prof_department = cur.fetchall()  # Fetch all rows
    return prof_department

@app.route('/admintables/prof_department', methods=['GET', 'POST'])
def prof_department():
    prof_department=get_all_prof_department()
    columns=get_column_names('prof_department')
    return render_template('/admintables/prof_department.html', prof_department=prof_department, columns=columns)

def get_all_professor():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM professor")
    professor = cur.fetchall()  # Fetch all rows
    return professor

@app.route('/admintables/professor', methods=['GET', 'POST'])
def professor():
    professor=get_all_professor()
    columns=get_column_names('professor')
    return render_template('/admintables/professor.html', professor=professor, columns=columns)

def get_all_project():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM project")
    project = cur.fetchall()  # Fetch all rows
    return project

@app.route('/admintables/project', methods=['GET', 'POST'])
def project():
    project=get_all_project()
    columns=get_column_names('project')
    return render_template('/admintables/project.html', project=project, columns=columns)

def get_all_staff():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM staff")
    staff = cur.fetchall()  # Fetch all rows
    return staff

@app.route('/admintables/staff', methods=['GET', 'POST'])
def staff():
    staff=get_all_staff()
    columns=get_column_names('staff')
    return render_template('/admintables/staff.html', staff=staff, columns=columns)

def get_all_students():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM students")
    students = cur.fetchall()  # Fetch all rows
    return students

@app.route('/admintables/students', methods=['GET', 'POST'])
def students():
    students=get_all_students()
    columns=get_column_names('students')
    return render_template('/admintables/students.html', students=students, columns=columns)

def get_all_time_slot():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM time_slot")
    time_slot = cur.fetchall()  # Fetch all rows
    return time_slot

@app.route('/admintables/time_slot', methods=['GET', 'POST'])
def time_slot():
    time_slot=get_all_time_slot()
    columns=get_column_names('time_slot')
    return render_template('/admintables/time_slot.html', time_slot=time_slot, columns=columns)

def get_all_lab():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM lab")
    lab = cur.fetchall()  # Fetch all rows
    return lab

@app.route('/admintables/lab', methods=['GET', 'POST'])
def lab():
    lab=get_all_lab()
    columns=get_column_names('lab')
    return render_template('/admintables/lab.html', lab=lab, columns=columns)

@app.route('/submitadmin', methods=['GET', 'POST'])
def submitadmin():
    if request.method == 'POST':
        details = request.form
        email = session.get('email')
        # print(details)
        
        if details['button']=='insert':
            try:
                table_name=details['table']
                columns=get_column_names(table_name)
                values=[]
                for column in columns:
                    values.append(details[column])
                cur = mysql.connection.cursor()
                cur.execute(f"INSERT INTO {table_name} ({','.join(columns)}) VALUES ({','.join(['%s']*len(columns))})", values)
                mysql.connection.commit()
                cur.close()
            #Handling errors
            except Exception as e:
                return render_template('errorquery.html',error=e)
            
        elif details['button']=='delete':
            try:
                table_name=details['table']
                condition=details['Where']
                cur = mysql.connection.cursor()
                cur.execute(f"DELETE FROM {table_name} WHERE {condition}")
                mysql.connection.commit()
                cur.close()
            #Handling errors
            except Exception as e:
                return render_template('errorquery.html',error=e)
        
        elif details['button']=='update':
            
            try:
                table_name=details['table']
                condition=details['where']
                cur = mysql.connection.cursor()
                cur.execute(f"UPDATE {table_name} SET {details['set']} WHERE {condition}")
                mysql.connection.commit()
                cur.close()
            #Handling errors
            except Exception as e:
                return render_template('errorquery.html',error=e)
            
        elif details['button']=='rename':
            try:
                table_name=details['table']
                columns=get_column_names(table_name)
                cur = mysql.connection.cursor()
                cur.execute(f"ALTER TABLE {table_name} RENAME TO {details['new_table']}")
                mysql.connection.commit()
                cur.close()
            #Handling errors
            except Exception as e:
                return render_template('errorquery.html',error=e)
            
            
            
        return render_template('submitadmin.html')
    
@app.route('/table', methods=['GET', 'POST'])
def table():
        bookings,equipment_issued,courses, inventory , student_enrolled, accessed_tool ,course_slot =fetch_all()
        return render_template('table.html',bookings=bookings,equipment_issued=equipment_issued, courses=courses, inventory=inventory, student_enrolled=student_enrolled, accessed_tool=accessed_tool, course_slot=course_slot)


def get_column_names(table_name):
    mycursor = mysql.connection.cursor()
    mycursor.execute(f"DESCRIBE {table_name}")
    columns = [column[0] for column in mycursor.fetchall()]  # Access the first element of each tuple
    return columns

@app.route('/get_columns/<table_name>')
def get_columns(table_name):
    columns = get_column_names(table_name)
    return {'columns': columns}

@app.route('/api/get_equipment', methods=['POST'])
def get_equipment():
    if 'loggedin' not in session:
        return redirect(url_for('login'))
    email = session.get('email')

    data = request.get_json()  # Get data sent in the request
    selectedValue = int(data['selectedValue'])
    equipments = fetch_equipment_issued(email)

    for equipment in equipments:
        if equipment[0] == selectedValue:
            equip_det = fetch_equip_details(selectedValue)
            return jsonify({"equipment": equipment, "details": equip_det}), 200
    
    return jsonify({"error": "Bad Request"}), 400

@app.route('/api/check_lab', methods=['POST'])
def check_lab():
    if 'loggedin' not in session:
        return redirect(url_for('login'))
    
    data = request.get_json()  
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM bookings WHERE lab_name = %s AND date = %s AND time_slot = %s", (data['lab'], data['date'], data['time_slot']))
    existing_booking = cur.fetchone()
    if existing_booking:
        return jsonify({"Availability": "False"}), 400
    return jsonify({"Availability": "True"}), 400

@app.route('/api/check_equipment', methods=['POST'])
def check_equipment():
    if 'loggedin' not in session:
        return redirect(url_for('login'))
    
    email = session.get('email')
    data = request.get_json()  
    cur = mysql.connection.cursor()
    cur.execute("select * from students where Email_ID = %s", (email,))
    user = cur.fetchone()
    if user!=None:
        roll_no=user[0]
    else:
        redirect(url_for('404'))
    cur.execute("SELECT ID,isAvailable FROM inventory WHERE ID = %s", (data['id'],))
    existing_id = cur.fetchone()
    if not existing_id:
        return jsonify({"Availability": "False", "Message": "No such equipment exists."}), 400
    elif (existing_id[1] == 0):
        return jsonify({"Availability": "False", "Message": "The selected equipment is unavailable at the moment."}), 400
    return jsonify({"Availability": "True"}), 400


def fetch_all():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM bookings")
    lab_bookings = cur.fetchall()  # Fetch all rows
    cur.execute("SELECT * FROM EquipmentIssued")
    equipment_issued = cur.fetchall()  # Fetch all rows
    cur.execute("SELECT * FROM course")
    courses = cur.fetchall()  # Fetch all rows
    cur.execute("SELECT * FROM inventory")
    inventory = cur.fetchall()  # Fetch all rows    
    cur.execute("SELECT * FROM student_enrolled")
    student_enrolled = cur.fetchall()  # Fetch all rows
    cur.execute("SELECT * FROM accessed_tool")
    accessed_tool = cur.fetchall()  # Fetch all rows
    cur.execute("SELECT * FROM course_slot")
    course_slot= cur.fetchall()  # Fetch all rows 
    
    return lab_bookings, equipment_issued,courses, inventory, student_enrolled, accessed_tool, course_slot

def fetch_equip_details_list(item_list):
    cur = mysql.connection.cursor()
    details_list = []
    for item in item_list:
        cur.execute("SELECT * FROM inventory WHERE ID = %s", (item[0],))
        details = cur.fetchone()
        details_list.append(details)
    return details_list

def fetch_equip_details(id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM inventory WHERE ID = %s", (id,))
    equipment = cur.fetchone()  
    return equipment

def fetch_lab_bookings(email):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM bookings WHERE user_email = %s", (email,))
    lab_bookings = cur.fetchall()  # Fetch all rows

    return lab_bookings

def fetch_equipment_issued(email):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * from students where Email_ID = %s", (email,))
    user = cur.fetchone()
    if user!=None:
        roll_no=user[0]
    else:
        return None
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM accessed_tool WHERE Roll_Number = %s", (roll_no,))
    equipment_issued = cur.fetchall()  # Fetch all rows
    return equipment_issued

def fetch_role(email):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM students WHERE Email_ID = %s", (email,))
    role = cur.fetchone() 
    if(role==None):
        cur.execute("SELECT * FROM professor WHERE Email_ID = %s", (email,))
        role = cur.fetchone() 
        if(role==None):
            cur.execute("SELECT * FROM staff WHERE Email_ID = %s", (email,))
            role=cur.fetchone()
            if(role==None):
                cur.execute("SELECT * FROM lab WHERE Email_ID = %s", (email,))
                role=cur.fetchone()
                if(role!=None):
                    role='lab'
            else:
                role = 'staff'
        else:
            role = 'professor'
    else:
        role = 'student'
    return role

def fetch_courses():
    cur = mysql.connection.cursor()
    cur.execute("SELECT Course_ID FROM course")

    courses = cur.fetchall()  # Fetch all rows
    # print(courses)
    return courses

def fetch_student_courses(email):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM students WHERE Email_ID = %s", (email,))
    roll_no = cur.fetchone()
    roll_no=roll_no[0]
    cur.execute("SELECT Course_ID FROM student_enrolled WHERE Roll_Number = %s", (roll_no,))
    courses = cur.fetchall()  # Fetch all rows
    return courses

def fetch_prof_course(email):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM professor WHERE Email_ID = %s", (email,))
    emp_id = cur.fetchone()
    emp_id=emp_id[0]
    cur.execute("SELECT Course_ID FROM instructor WHERE Employee_ID = %s", (emp_id,))
    courses = cur.fetchall()  # Fetch all rows
    return courses

def fetch_name(email):
    cur = mysql.connection.cursor()
    cur.execute("SELECT First_Name FROM students WHERE Email_ID = %s", (email,))
    name = cur.fetchone() 
    if(name==None):
        cur.execute("SELECT First_Name FROM professor WHERE Email_ID = %s", (email,))
        name = cur.fetchone() 
        if(name==None):
            cur.execute("SELECT First_Name FROM staff WHERE Email_ID = %s", (email,))
            name = cur.fetchone()
    return name[0]

def fetch_grant_inventory(email):
    
    cur = mysql.connection.cursor()
    cur.execute("SELECT Lab_Name FROM lab WHERE Email_ID = %s", (email,))
    lab_name = cur.fetchone()
    cur.execute("SELECT * FROM grants WHERE Lab_Name = %s", (lab_name[0],))
    grants = cur.fetchall()  # Fetch all rows
    cur.execute("SELECT * FROM inventory WHERE Lab_Name = %s", (lab_name[0],))
    inventory = cur.fetchall()  # Fetch all rows
    return grants,inventory


@app.errorhandler(404) 
def invalid_route(e): 
    return render_template('404.html')

if __name__ == '__main__':       
    app.run(debug=True)



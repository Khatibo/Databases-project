--create DATABASE Milestone3_final_Nadaaa;

create table Schools(
name varchar(50),
level varchar(50),
email varchar(50),
mission varchar(50),
vision varchar(50),
address varchar(50),
language varchar(50),
type varchar(50),
fees int,
information varchar(60),
primary key(name,level))


create table Phone_Numbers(
name varchar(50),
level varchar(50),
phone integer,
primary key (name,level,phone),
foreign key (name,level) references Schools on update cascade on delete cascade
)

create table Elementries(
name varchar(50),
level varchar(50),
primary key(name,level),
foreign key (name,level) references Schools on delete cascade on update cascade
)
create table List_Of_Supplies(
name varchar(50),
level varchar(50),
list varchar(50),
primary key(name,level,list),
foreign key(name,level) references Schools on delete cascade on update cascade
)
create table Middles(
name varchar(50),
level varchar(50),
primary key(name,level),
foreign key (name,level) references Schools on delete cascade on update cascade
)


create table High_Schools(
name varchar(50),
level varchar(50),
primary key(name,level),

foreign key (name,level) references Schools on delete cascade on update cascade
)

create table Parents(
username varchar(50) unique,
email varchar(50),
first_name varchar(50),
last_name varchar(50),
password varchar(50),
address varchar(50),
phone varchar(50),
primary key (username) 

)



create table Students(
ssn int,
name varchar(30),
birth_date date,
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)), 
gender varchar(15),
username varchar(30) unique ,
password varchar(50),

primary key(ssn),
)


create unique nonclustered index x on Students (username) where [username] is not null;


create table Clubs(

name varchar(50),
name_school varchar(50),
level varchar(50),
purpose varchar(50),
primary key(name,name_school,level),
foreign key (name_school,level) references High_Schools on delete cascade on update cascade
 )
 
 create table Clubs_Has_Schools(
 name varchar(50),
 level varchar(50),
 name_school varchar(50),
 primary key(name),
 foreign key (name,name_school,level) references Clubs on delete cascade on update cascade
 )

 create table Parent_Mobile(
 mobile int,
 username varchar(50)
 primary key(username)
 foreign key(username) references Parents on delete cascade on update cascade
 )

 create table Parent_Apply_Schools_Students(
 username varchar(50),
 name varchar(50),
 level varchar(50),
 ssn int,
 accepted bit,
 primary key (username,name,level,ssn),
 foreign key (name,level) references Schools on delete cascade on update cascade,
 foreign key(username) references Parents on delete cascade on update cascade,
 foreign key (ssn) references Students on delete cascade on update cascade
 )
 create table Parents_Review_Schools(
 username varchar(50),
 level varchar(50),
 name varchar(50),
 review_text varchar(50),
 primary key(username,level,name),
 foreign key(name,level) references Schools on delete cascade on update cascade,
 foreign key(username ) references Parents on delete cascade on update cascade
 )

 CREATE TABLE Parent_Has_Student (
    username VARCHAR (50) ,
    ssn   INT  ,
    PRIMARY KEY(username , ssn),
    FOREIGN KEY (username) REFERENCES Parents on delete cascade on update cascade,
    FOREIGN KEY (ssn) REFERENCES Students on delete cascade on update cascade
);

 create table Employees(
 id int identity,
 username varchar(50) ,
 email varchar(50),
 password varchar(50),
 address varchar(50),
 birthdate date,
 salary int,
 gender varchar(50),
 first_name varchar(50),
 middle_name varchar(50),
 last_name varchar(50),
 phone_number int,
 primary key (id)
 )

 create unique nonclustered index y on Employees (username) where username is not null;

 create table Administrators(

id int,
primary key(id),
foreign key(id) references Employees on delete cascade on update cascade
)

create table Announcements(
id int identity,
date date,
title varchar(30),
type varchar(30),
description varchar(60),
primary key(id)
)
 create table Administrators_Post_Announcements(
 id int,
 a_id int,
 primary key(id),
 foreign key (id) references Announcements on delete cascade on update cascade,
 foreign key(a_id) references Administrators on delete set null on update set null
 )

 create table Employees_Employed_Schools(
 id int ,
 name varchar(50) ,
 level varchar(50),
 primary key(id),
 foreign key(name,level) references Schools on delete cascade on update cascade,
 foreign key(id ) references Employees on delete cascade on update cascade 
 )
 
 create table Teachers(
 id int ,
 years_of_experience int,
 primary key(id),
 foreign key(id) references Employees on update cascade on delete cascade
 )

 
 create table Teachers_Supervise_Teachers(
 supervisor int,
 supervised int,
 primary key(supervisor,supervised),
 foreign key (supervisor) references Teachers ,
 foreign key (supervised) references Teachers  
 )
 
create Table Courses(
name varchar(50),
code varchar(50),
grade int,
description varchar(60),
primary key(name,code) 
)

create Table Courses1_Prerequisite_Courses2(
name1 Varchar(50),
code1 varchar(50),
name2 Varchar(50),
code2 varchar(50),
primary key(name1,code1,name2,code2),
foreign key(name1,code1) references Courses on delete no action on update no action,
foreign key(name2,code2) references Courses on delete no action on update no action
)

create table Levels(
name varchar(30),
primary key(name)
)

create table Courses_Offers_Levels(
name_course varchar(50),
code varchar(50),
name_level varchar(30),
primary key(name_course,code),
foreign key(name_course,code) references Courses on delete cascade on update cascade,
foreign key(name_level) references Levels on delete cascade on update cascade
)



create table Schools_Enrolled_School_Students(
ssn int,
name varchar(50) default null,
level varchar(50) default null,
primary key(ssn),
foreign key(name,level) references Schools on delete set default on update cascade,
foreign key(ssn) references Students on delete cascade on update cascade
)

create table Levels_Enrolled_level_Students(
ssn int,
grade int,
name varchar(30),
primary key(ssn),
foreign key(ssn) references Students on delete cascade on update cascade,
foreign key(name) references Levels on delete cascade on update cascade
)

create table Activities(
name varchar(30),
date date,
location varchar(30),
description varchar(60),
type varchar(30),
equipment varchar(30),
primary key(name)
)

create table Activities_Join_Act_Student_Students(
name varchar(30),
ssn int,
primary key(name,ssn),
foreign key(name) references Activities on delete cascade on update cascade,
foreign key(ssn) references Students on delete cascade on update cascade
)



create table Administrators_Assign_And_Create_Activity_Teachers(
name varchar(30),
t_id int,
a_id int,
primary key(name),
foreign key (name) references Activities on delete cascade on update cascade,
foreign key (t_id) references Teachers on delete cascade on update cascade,
foreign key(a_id) references Administrators on delete no action on update no action
)
create table Assignments(
id int,
content varchar(60), 
due_date date,
posting_date date,
primary key(id)
)


create table Assignments_For_Courses_Posted_By_Teachers(
id int ,
t_id int ,
code varchar(50),
name varchar(50),
primary key(id),
foreign key(name,code) references Courses on delete cascade on update cascade,
foreign key(t_id) references Teachers on delete cascade on update cascade,
foreign key(id) references Assignments on delete cascade on update cascade 
)
create table Clubs_Joined_By_Students(
 ssn int,
 name varchar(50),
 school_name varchar(50),
 level varchar(50),
 primary key(ssn),
 foreign key(name,school_name,level) references Clubs on delete cascade on update cascade,
 foreign key(ssn) references Students on delete cascade on update cascade
)

create table Parents_Rate_Teachers(
username varchar(50),
id int,
rating int,
primary key(username,id),
foreign key(username) references Parents on delete cascade on update cascade,
foreign key(id) references Teachers on delete cascade on update cascade
)

create table Questions(
name varchar(50),
code varchar(50),
question_number int identity,
question varchar(70),
answer varchar(70),
primary key(name,code,question_number),
foreign key(name,code) references Courses on delete cascade on update cascade
)


create table Courses_Has_Questions(
question_number int,
name varchar(50),
code varchar(50),
primary key(question_number,name,code),
foreign key(name,code) references Courses,
foreign key(name,code,question_number) references Questions on delete cascade on update cascade
)


create table Questions_Viewed_By_Teachers(
id int,
name varchar(50),
code varchar(50),
number int,
primary key(id,number),
foreign key(id) references Teachers,
foreign key(name,code,number) references Questions on delete cascade on update cascade
)



create table Assignments_Viewed_By_Teachers(
t_id int,
id int,
primary key(id),
foreign key(t_id) references Teachers on delete set null on update cascade,
foreign key(id) references Assignments on delete cascade on update cascade
)

create table Reports(
t_id int,
ssn int,
date date,
comment varchar(60),
content varchar(60),
primary key(t_id,ssn,date),
foreign key(ssn) references Students on delete cascade on update cascade,
foreign key(t_id) references Teachers on delete cascade on update cascade)


create table Parents_Reply_Reports(
date date,
t_id int,
ssn int,
reply varchar(50),
parent_username varchar(50),
primary key(date,t_id,ssn),
foreign key(t_id,ssn,date) references Reports on delete cascade on update cascade,
foreign key (parent_username) references Parents on delete set null on update cascade
)
create table Courses_By_Teachers(
name varchar(50),
code varchar(50),
t_id int,
primary key(name,code,t_id),
foreign key (name,code) references courses on delete cascade on update cascade,
foreign key (t_id) references teachers on delete cascade on update cascade
)



create table Courses_For_Students_By_Teachers(
ssn int,
name varchar(50),
code varchar(50),
t_id int,
primary key(ssn),
foreign key (name,code) references Courses on delete cascade on update cascade,
foreign key (ssn) references Students on delete cascade on update cascade,
foreign key(t_id) references Teachers on delete cascade on update cascade
)
create table Assignments_Solved_By_Students(
id int,
ssn int,
solution varchar(50),
grade int,
primary key(id,ssn),
foreign key(id) references Assignments on delete cascade on update cascade,
foreign key(ssn) references Students on delete cascade on update cascade

)

create table Reports_Written_To_Students_By_Teachers(
date date,
t_id int,
ssn int,
primary key(date,t_id,ssn),
foreign key(t_id,ssn,date) references Reports on delete cascade on update cascade
)


create table In_Courses_Students_Ask_Questions(
question_number int,
name varchar(50),
code varchar(50),
ssn int,
primary key(question_number,name,code),
foreign key (ssn) references Students on delete cascade on update cascade,
foreign key(name,code,question_number) references Questions on delete cascade on update cascade
)



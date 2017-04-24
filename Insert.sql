insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('sacre-coeur','High School','Heliopolis','sch@hotmail.com','french school in cairo',
'To be the leading knowledge hub','To develop entrepreneurial Characters','FRENCH','national',7000);

insert into Phone_Numbers(name,level,phone) values ('sacre-coeur','High School',22756604);


insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('sacre-coeur','Elementary','Heliopolis','sch@hotmail.com','french school in cairo',
'To be the leading knowledge hub','To develop entrepreneurial Characters','FRENCH','national',7000);

insert into Phone_Numbers(name,level,phone) values ('sacre-coeur','Elementary',22756604);

insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('Fransiscaines','High School','Tahrir','fransiscaines@gmail.com','french school in cairo',
'To educate young minds and foster ethical','Strive relentlessly and vigorously','FRENCH','national',7500);

insert into Phone_Numbers(name,level,phone) values ('Fransiscaines','High School',22756607);


insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('Jesuites','Middle School','Heliopolis','Jesuites@yahoo.com','french school in cairo',
'Taking students beyond expectations','Creating confident,connected learners','FRENCH','national',8000);

insert into Phone_Numbers(name,level,phone) values ('Jesuites','Middle School',22576325);

insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('Lycee Balzac','High School','5th settlement','balzac@yahoo.com','french school in cairo',
'The leader of excellence in academic to worldclass','develop the quality of learners','FRENCH','international',10000);

insert into Phone_Numbers(name,level,phone) values ('Lycee Balzac','High School',22945321);

insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('DSB','Elementary','Maadi','dsb@gmail.com','Deutsch school in cairo',
'To empower our children to value their own skills','providing our childen with an excellent education','DEUTSCH','international',17000);

insert into Phone_Numbers(name,level,phone) values ('DSB','Elementary',23671142);

insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('DEO Kairo','High School','Dokki','deo@hotmail.com','Deutsch school in cairo',
'building a foundation for life-long learning','teaching for learning for all','DEUTSCH','international',20000);

insert into Phone_Numbers(name,level,phone) values ('DEO Kairo','high school',237481645);

insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('BISC','Middle School','Cairo-Alex Road','bisc@gmail.com','English school in cairo',
'creating the leaders of tomorrow','improve collaboration skills','ENGLISH','international',35000);

insert into Phone_Numbers(name,level,phone) values ('BISC','Middle School',23827034);

insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('MET','Elementary','New Cairo','met@hotmail.com','English school in cairo',
'to allow every child to make outstanding progress','making differences for the future','ENGLISH','international',40000);

insert into Phone_Numbers(name,level,phone) values ('MET','Elementary',16489);

insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('CAC','Elementary','Maadi','cac@yahoo.com','American school in cairo',
'empower students to be healthy individuals','strive to challenge students to think critically','ENGLISH','international',45000);

insert into Phone_Numbers(name,level,phone) values ('CAC','Elementary',27555555);

insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('NCBIS','High School','New Cairo','ncbis@hotmail.com','British internation school in new cairo',
'to be the leading institution in the region','to provide a quality education based on values','ENGLISH','international',50000);

insert into Phone_Numbers(name,level,phone) values ('NCBIS','High School',227582881);


insert into Schools (name,level,address, email,information, vision, mission,language,type,fees)
values ('MBIS','Elementary','Maadi','mbis@gmail.com','British international school in cairo',
'learning together..achieving together','make children feel valued','ENGLISH','international',55000);

insert into Phone_Numbers(name,level,phone) values ('MBIS','Elementary',227058671);

insert into Levels(name) 
values('Elementary');

insert into Levels(name) 
values('High School');

insert into Levels(name) 
values('Middle School');

insert into courses(name,code,grade,description)
values('maths','MATHS1',3,'Basics of mathematics');


insert into courses(name,code,grade,description)
values('physics','PHYS1',2,'introduction to thermodynamics');


insert into courses(name,code,grade,description)
values('maths','MATHS2',4,'intoduction to algebra');


insert into courses(name,code,grade,description)
values('maths','MATHS3',6,'introduction to calculus');

insert into courses(name,code,grade,description)
values('chemistry','CHMS1',1,'chemical reactions');


insert into courses(name,code,grade,description)
values('history','HIST1',4,'introduction towards civilization');


insert into courses(name,code,grade,description)
values('geography','GEO1',2,'introduction to physical geography');


insert into courses(name,code,grade,description)
values('physics','PHYS2',4,'introduction to fluids ');


insert into courses(name,code,grade,description)
values('chemistry','CHMS2',2,'organic chemistry');

insert into courses(name,code,grade,description)
values('chemistry','CHMS3',3,'laboratory techniques');

insert into Courses1_Prerequisite_Courses2 (name1,code1,name2,code2)
values('maths','MATHS2','maths','MATHS1');

insert into Courses1_Prerequisite_Courses2 (name1,code1,name2,code2)
values('maths','MATHS3','maths','MATHS2');

insert into Courses1_Prerequisite_Courses2 (name1,code1,name2,code2)
values('chemistry','CHMS2','chemistry','CHMS1');

insert into Courses1_Prerequisite_Courses2 (name1,code1,name2,code2)
values('chemistry','CHMS3','chemistry','CHMS2');

insert into Courses1_Prerequisite_Courses2 (name1,code1,name2,code2)
values('physics','PHYS2','physics','PHYS1');

insert into Courses_Offers_Levels(name_course,code,name_level)
values('maths','MATHS1','Elementary');

insert into Courses_Offers_Levels(name_course,code,name_level)
values('maths','MATHS2','Middle School');

insert into Courses_Offers_Levels(name_course,code,name_level)
values('maths','MATHS3','High School');


insert into Courses_Offers_Levels(name_course,code,name_level)
values('chemistry','CHMS1','Elementary');

insert into Courses_Offers_Levels(name_course,code,name_level)
values('chemistry','CHMS2','Middle School');



insert into Courses_Offers_Levels(name_course,code,name_level)
values('chemistry','CHMS3','High School');

insert into Courses_Offers_Levels(name_course,code,name_level)
values('physics','PHYS1','Elementary');


insert into Courses_Offers_Levels(name_course,code,name_level)
values('physics','PHYS2','High School');

insert into Courses_Offers_Levels(name_course,code,name_level)
values('history','HIST1','Middle School');

insert into Courses_Offers_Levels(name_course,code,name_level)
values('geography','GEO1','Elementary');



insert into Employees(first_name,middle_name,last_name,birthdate,address,email,gender,salary,username,password,phone_number)
values('Ahmed','Mohamed','Abdo','11/15/1970','Ahmed Fakhry st.-Nasr City','Ahmed.mohamed@gmail.com','male',3000,'Ahmed.Abdo','A123',010043800);

insert into Employees(first_name,middle_name,last_name,birthdate,address,email,gender,salary,username,password,phone_number)
values('Mostafa','Hatem','Hassan','09/16/1980','Sawra st.-Heliopolis','Mostafa.hatem@hotmail.com','male',5000,'Mostafa','Hatem',0126764325);

insert into Employees(first_name,middle_name,last_name,birthdate,address,email,gender,salary,username,password,phone_number)
values('Abdelrahman','Amr','Gouda','08/28/1975','Maadi','Abdelrahman.amr@yahoo.com','male',5000,'Abdelrahman.gouda','G12345',012785490);

insert into Employees(first_name,middle_name,last_name,birthdate,address,email,gender,salary,username,password,phone_number)
values('Ahmed','Mostafa','Ali','03/17/1974','Makram Ebeid st.-Nasr City','Ahmed.mostafa@hotmail.com','male',5000,'Ahmed.Ali','X123',01244567500);

insert into Employees(first_name,middle_name,last_name,birthdate,address,email,gender,salary,username,password,phone_number)
values('salma','Mohamed','Ahmed','04/18/1980','El-Shrouk','Salma.mohamed@gmail.com','female',5000,'salma.ahmed','S12345',011573900);

insert into Employees(first_name,middle_name,last_name,birthdate,address,email,gender,salary,username,password,phone_number)
values('Fatma','Hossam','ElAzab','06/15/1985','New Cairo','Fatma_Hossam@gmail.com','female',3000,'fatma.Azab','f123',0109966320);

insert into Employees(first_name,middle_name,last_name,birthdate,address,email,gender,salary,username,password,phone_number)
values('Nada','Nasser','Ramadan','07/19/1986','Zamalek','Nada-Ramadan@hotmail.com','female',3000,'nada.ramadan','n1234',0124532678);









insert into Administrators(id)  values(6);
insert into Administrators (id) values(3);
insert into Administrators (id) values(7);
insert into Administrators (id) values(4);
insert into Administrators (id) values(5);
insert into Administrators (id) values(2);
insert into Administrators (id) values(1);




insert into Employees_Employed_Schools  values (1,'sacre-coeur','High school');
insert into Employees_Employed_Schools  values (2,'DSB','Elementary');
insert into Employees_Employed_Schools  values (3,'Jesuites','Middle School');
insert into Employees_Employed_Schools  values (4,'MET','Elementary');
insert into Employees_Employed_Schools  values (5,'BISC','Middle School');
insert into Employees_Employed_Schools  values (6,'CAC','Elementary');
insert into Employees_Employed_Schools  values (7,'Fransiscaines','High School');


insert into High_Schools values ('NCBIS','High School');
insert into High_Schools values('Fransiscaines','High School');
insert into High_Schools values ('sacre-coeur','High School');
insert into Elementries values ('MBIS','Elementary');
insert into Elementries values ('CAC','Elementary');
insert into Middles values ('BISC','Middle School');

insert into Clubs values ('Inspire','sacre-coeur','High School','sport');
insert into Clubs values ('Nebny','NCBIS','High School','charity');
insert into Clubs values ('Insider','Fransiscaines','High School','Journal');


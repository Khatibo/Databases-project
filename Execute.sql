--Adminstrator (4)
exec delete_schools @name = 'CAC' ,  @level= 'Elementary';
exec Delete_Schools @name= 'DSB' , @level='Elementary';

--Adminstrator 'System user'(1)
EXEC Search 'national';
EXEC Search 'DSB';
EXEC Search 'Heliopolis';
--Adminstrator 'System user'(2)
EXEC View_All_Available_Schools;

--Adminstrator 'System user'(3)
 exec Get_Info 'MET' 

 --Adminstrator(1)
  exec View_Teachers '4';
  exec Verify_Teachers '4','malak.ossama','12345678','8';
  exec Verify_Teachers '4','ramy.mohamed','1234','15';

   --Adminstrator(2)
  exec View_Students 4;
  exec Verify_Students 4,'samir.ahmad','ewdwe',555;
 exec Verify_Students 4,'youssef.hossam','ff12345',212 ;
 exec Verify_Students 2,'tia.ahmed','khbn9078',790;
 exec Verify_Students 2,'tara.ahmed','kkjn9078',791;
 exec Verify_Students

  --Adminstrator(3)
   exec Insert_Admin 'ahmed','mohamed','mostafa','Maadi','ahmed.mostafa2010@yahoo.com','ahmed.mostafa','fhgt1897','male',4;

    --Adminstrator(4)
	
exec Delete_Employee 'malak.ossama';
exec Delete_Student '456';
 --Adminstrator(5)
 
 exec Edit_Info_Of_School 4,'Britich Elementary school in cairo';

  --Adminstrator(6)
  exec Post_Announcements '07/12/2016','Big Surprise','trip to Dream park','trip',4;

   --Adminstrator(7)
    exec Create_Activities 'Football Class','only 2 hours ','sport','09/09/2016','the green area','ball',13,4;

    --Adminstrator(8)
	 exec Update_Assigned_Teachers 'Football Class' ,15,4;

	 --Adminstrator(9)
	  exec Assign_Teacher 4,15,'chemistry','CHMS1';
	  --Adminstrator(10)
 exec Assign_Supervisors 13,15;
	   --Adminstrator(11)
 exec Accept_Reject_Children 2,791,1;
  exec Accept_Reject_Children 4,223,1;
  exec Accept_Reject_Children 2,790,1;
  exec Accept_Reject_Children 4,555,1;
   exec Accept_Reject_Children 4,212,0;
  --Teacher(1)
  exec sign_up_teacher 'Nada' ,'Sharaf' ,'Ahmed' ,'06/29/1990','Dokki','nada-sharaf@hotmail.com','female',01233924943,'MET','Elementary',4; 
  exec sign_up_teacher 'malak','ossama','khalil','1990-03-01','Nasr City','malak.ossama@hotmail.com','female',0112155800,'MET','Elementary',3;
  exec sign_up_teacher 'doaa','nasser','fawzy','1980-07-05','Dokki','doaa_nasser@gmail.com','female',0122245066,'DEO Kairo','High School',4;
  exec sign_up_teacher 'mohamed','ashraf','awad','1988-02-09','New Cairo','mohamed.ashraf1@yahoo.com','male',01165589903,'sacre-coeur','Elementary',5;
  exec sign_up_teacher 'Ahmed','Mohamed','Tamer','1980-05-01','Obour','king.ahmed@hotmail.com','male',0104455800,'Fransiscaines','High School',11;
  exec sign_up_teacher 'Amira','sayed','mohamed','1970-07-08','zamalek','princess.amira@gmail.com','female',012546603,'DSB','Elementary',9;

  exec sign_up_teacher'bassant','ashraf','awad','1990-02-01','new cairo','bassant.ashraf@hotmail.com','female',011332210,'MET','Elementary',2;
  exec sign_up_teacher 'Nervine','mohamed','hilal','1988-05-04','Dokki','Nervine_Hilal@gmail.com','female',01231690688,'DSB','Elementary',3;
  exec sign_up_teacher 'Ramy','Mohamed','Ahmed','1988-02-06','New Cairo','Ramy.Nasser@yahoo.com','male',01166689903,'MET','Elementary',5;
  exec sign_up_teacher 'karim','ehab','hassan','1986-03-01','Shoubra','krakiro@hotmail.com','male',0104466800,'MET','Elementary',8;
 exec sign_up_teacher 'karam','karim','mohamed','1980-06-02','New cairo','karam.mohamed@gmail.com','male',011443603,'DEO Kairo','High School',2;

  --Teacher(2)
  exec view_teachers_courses 15 ;
  --Teacher(3)
  exec Post_Assignments 15,'CHMS1','chemistry','2015-07-02','2015-10-02','give the chemical reactions of page 170 in the book',4;
  --Teacher(4)
   exec View_Solutions 15,4;
  --Teacher(5)
   exec grade_assignments 4,896,5;
  --Teacher(6)
  exec delete_Assignment 4;
 
  --Teacher(7)
  exec Write_Reports 896,15,'you must study more','study hard';
 exec Write_Reports 223,15,'you must study more','study';
  --Teacher(8)
  exec View_Questions 896 ,'chemistry','CHMS1';
 
  --Teacher(9)
  exec Answer_Questions 15,'chemistry','CHMS1','A+B->C',4;
  --Teacher(10)
   exec View_MyStudents 15 ;
  --Teacher(11)
 exec No_Join_Activity ;
  --Teacher(12)
 exec max_clubs ;

 --As a parent(1)
 exec Sign_Up'Ahmed','Hossam','Ahmed.hossam@gmail.com','maadi',22324422,'ahmed.hossam',01000226678,null ,'H12234';
 exec Sign_UP'Nader','william','nader.william@hotmail.com','heliopolis',22324345,'nader.william',01033256678,null,'kk234';
 exec Sign_Up'Rana','Hossam','Rana.hossam@gmail.com','Nasr City',27324822,'Rana.hossam',01040526978,0106782345,'P932234';
 exec Sign_UP'Mona','Samir','Mona_Samir@hotmail.com','Shoubra',22716731,'Mona.Samir',01091880184,01239249453,'mm12345';
 exec Sign_UP'salma','Sabry','salma_sabry@hotmail.com','rehab',22719051,'salma.sabry',0108876150,null,'mk123fg';
 exec Sign_UP'Hassan','Sabry','hassan.sabry@hotmail.com','zamalek',23716731,'hassan.sabry',01091880284,01239249433,'mm12245';
  exec Sign_Up'Ahmed','rami','Ahmed.rami@gmail.com','maadi',22924822,'ahmed.rami',01009876678,null ,'Hk498765';

   --As a parent(2)

 exec Apply 223,'ahmed.hossam','Youssef','1995-03-02','male','MET','Elementary',3;
  exec Apply 456,'nader.william','Karen','1996-04-04 ','female','MBIS','Elementary',4;
  exec Apply 165,'Rana.hossam','rami','2009-08-05 ','male','DSB','Elementary',1;
  exec Apply 896,'Mona.Samir','rana','2011-06-04 ','female','sacre-coeur','Elementary',1;
  exec Apply 567,'salma.sabry','mariam','2012-07-03','female','DEO Kairo ','High School',2;
   exec Apply 511,'sana.ahmed','hossam','2005-09-23','female','BISC','Middle School',1;
  exec Apply 790,'ahmed.rami','tia','2013-02-02','female','DSB','Elementary',3; 
  exec Apply 791,'ahmed.rami','tara','2013-02-02','female','DSB','Elementary',3
   exec Apply 555,'salma.sabry','Samir','1999-02-01','male','MET','Elementary',5;
 exec Apply 212,'ahmed.hossam','yasser','1995-03-02','male','MET','Elementary',2;
  exec Apply 476,'nader.william','Karima','1997-05-04 ','female','MBIS','Elementary',1;
   --As a parent(3)
    EXEC View_School 'ahmed.hossam';

  --As a parent(4)
  exec Choose_School 'sana.ahmed','BISC','Middle',511;
  exec Choose_School 'ahmed.hossam','MET','Elementary',223;
  exec Choose_School 'ahmed.rami','DSB','Elementary',790;
  exec Choose_School 'salma.sabry','MET','Elementary',555;
   --As a parent(5)
 exec View_Reports 'ahmed.hossam',223;
   --As a parent(6)
 exec Reply_Reports '1990-02-01',223,'ok','ahmed.hossam';
  --As a parent(7)
 exec View_Schools_of_MyChildren 'ahmed.hossam';
 
  --As a parent(8)
 exec view_announcements_parent 'ahmed.hossam';
  --As a parent(9)
 exec rate_teacher 'ahmed.hossam',21,4;

  --As a parent(10)
 exec write_review 'ahmed.hossam','good','MET','Elementary';
  --As a parent(11)
 exec delete_review 'ahmed.hossam','MET','Elementary';
  --As a parent(12)
 exec avg_rate 21;

 --As a parent(13)
  exec top_ten 'sana.ahmed','highest reviews';
  --As a parent(14)


 --As a student

 --1
 exec Update_account 223,'nicepassword';
 --2
 exec view_myCourses 223;
 --3
 exec post_quest 223,'maths','MATHS2','when will be the quiz?';
 exec post_quest 567,'maths','MATHS2','when will be quiz1?';
 exec post_quest 223,'chemistry','CHMS1','exaaam?'; 
 exec post_quest 223,'chemistry','CHMS1','midtermexaaam?'; 
 --4
 exec view_other_questions 'youssef.hossam','maths','MATHS2';
 --5
 exec my_assignments 'youssef.hossam';
 --6
 exec my_solution 'youssef.hossam','truee',2;
  exec my_solution 'youssef.hossam' ,'A+B->C',4;
 --7
 exec view_my_grade 'youssef.hossam';
 --8
 exec view_announcements 'youssef.hesham';
 --9
 exec view_my_activities 'youssef.hesham';
 --10
 exec apply_for_activity 'youssef.hesham','tennis';
 --11
 exec join_clubs 'youssef.hesham','inspire';
 --12
 exec search_courses 'youssef.hesham','maths','MATHS2';



 




  
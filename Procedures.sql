--create database nada;
--as a system administrator
create proc Delete_Schools
@name varchar(50),
@level varchar(50)
as

Delete from Schools where name = @name and level=@level;
declare @id int 
select @id = a.id
from Employees_Employed_Schools a 
where a.name=@name and a.level=@level 

delete from Employees_Employed_Schools
where name=@name and level=@level;

Update Employees
set username = null ,password=null
where id = @id 

update Students
set username=null , password=null
where ssn not in(
select ssn
from Schools_Enrolled_School_Students
where name <>null and level<>null)
go
--as a system user
create proc Search 
@user_input varchar(50)
AS
SELECT *
FROM Schools s
WHERE s.name=@user_input or s.address=@user_input or s.type=@user_input  

go


create proc View_All_Available_Schools as
SELECT *
FROM Schools s 
order by s.level
 

 go
Create proc Get_Info
@user_input varchar(50) as
SELECT s.information ,p.review_text,t.*
FROM Schools s ,Parents_Review_Schools p , Employees_Employed_Schools e , Teachers t
where s.name=@user_input and s.name=p.name and s.level=p.level and s.name=e.name and s.level = e.level and e.id=t.id
go
--as an administrator
create proc View_Teachers
@admin int  
as
select e1.*
From Employees e1 , Employees_Employed_Schools e , Employees_Employed_Schools e2 
where e1.username is null and e1.password is null and e2.id=@admin and e.name=e2.name and e.level=e2.level and e.id=e1.id 
go

create proc Verify_Teachers
@admin_id int ,
@username varchar(50),
@password varchar(50),
@teacher int 
as
declare @years int
select @years=t.years_of_experience
from teachers t
where t.id=@teacher

if exists (select s.id  from Employees_Employed_Schools s , Employees_Employed_Schools s2 where s.id=@teacher 
and s2.id=@admin_id and s.name=s2.name and s.level=s2.level)
begin
update Employees
set username=@username , password=@password , salary= @years *500
where id=@teacher 
end 
else 
print 'this teacher does not exist in your school '

go

create proc View_Students
@admin int  
as
select s1.ssn ,s1.name,s1.birth_date,s1.gender,s1.age  
From Students s1 ,Schools_Enrolled_School_Students s2 , Employees_Employed_Schools e 
where s1.username is null and s1.password is null and e.id=@admin and e.name=s2.name and e.level=s2.level and s1.ssn=s2.ssn 

go
create proc Verify_Students 
@admin int ,
@username varchar(50),
@password varchar(50),
@ssn int 
as
declare @admin_school varchar(50),@student_username varchar(50) , @student_password varchar(50);
declare @admin_level varchar(50);

select @admin_school = e.name , @admin_level = e.level
from Employees_Employed_Schools e 
where e.id=@admin 

select @student_username =f.username , @student_password = f.password 
from Students f 
where f.ssn = @ssn  
if exists (select * from Schools_Enrolled_School_Students s where s.ssn=@ssn and s.name=@admin_school and s.level=@admin_level)
begin
if(@student_username is null )
begin
update Students 
set username=@username , password=@password
where ssn=@ssn ;

with temp as (
select c2.t_id as t_id, c3.ssn as ssn, c2.name as name, c2.code as code
from Courses_By_Teachers c2 ,Courses_Offers_Levels c1 ,Levels_Enrolled_level_Students c3   
where  c2.name=c1.name_course and c2.code =c1.code and c1.name_level = c3.name
)
INSERT INTO Courses_For_Students_By_Teachers (ssn,name,code,t_id )
SELECT ssn,name,code,t_id Country FROM temp;
 
;

end
end

else 
print 'you cannot verify this student '
go

create proc Insert_Admin
@first_name varchar(50),
@middle_name varchar(50),
@last_name varchar(50),
@birthdate date,
@address varchar(50),
@email varchar(50),
@username varchar(50),
@password varchar(50),
@gender varchar(50),
@admin int 
as
declare @type varchar(50) ,@name varchar(50),@level varchar(50),@id int , @id1 int 
select @type = s.type ,@name=s.name ,@level=s.level 
from Employees_Employed_Schools s1 , Schools s 
where s1.id = @admin and s.name=s1.name and s.level=s1.level 
if @type='international' 
begin
insert into Employees(username,email,password,address,birthdate,salary,gender,first_name,middle_name,last_name) 
values(@username,@email,@password,@address,@birthdate,5000,@gender,@first_name,@middle_name,@last_name);

set @id = (select id from Employees where username = @username and email=@email and first_name=@first_name and middle_name= @middle_name and last_name = @last_name
  and address= @address and gender=@gender )
insert into Employees_Employed_Schools values (@id ,@name,@level) 
insert into Administrators values (@id)
end

else
begin
insert into Employees(username,email,password,address,birthdate,salary,gender,first_name,middle_name,last_name) 
values(@username,@email,@password,@address,@birthdate,3000,@gender,@first_name,@middle_name,@last_name);

set @id1 = (select id from Employees where username = @username and email=@email and first_name=@first_name and middle_name= @middle_name and last_name = @last_name
 and address= @address and gender=@gender )
insert into Employees_Employed_Schools values (@id1 ,@name,@level) 
insert into Administrators values (@id1)
end

go


create proc Delete_Employee 
@employee_username varchar(50)
as 
delete from Employees where username = @employee_username 
go

create proc Delete_Student 
@student_ssn int
as 
delete from Students where ssn = @student_ssn 

go

create proc Edit_Info_Of_School
@admin_id int,
@new_info varchar(50)
as

declare @name varchar(50)
declare @level varchar(50)
select @name=s.name, @level=s.level
from Employees_Employed_Schools s
where s.id=@admin_id
update Schools 
set  information = @new_info 
where name = @name and level= @level
 go

create proc Post_Announcements
@date date,@title varchar(50),@description varchar(50),@type varchar(50),@admin int
as
insert into Announcements (date,title,description,type) values (@date,@title,@description,@type)
declare @Announcement_id int 
set @Announcement_id = (select e.id from Announcements e where e.date=@date and e.title=@title and e.description=@description and e.type=@type)
insert into Administrators_Post_Announcements values(@Announcement_id,@admin)
go

create proc Create_Activities
@activity_name varchar(50),@description varchar(50),
@type varchar(50),@date date,@location varchar(50),@equipement varchar(50),@teacher_id int,@admin_id int
as
insert into Activities values (@activity_name,@date,@location,@description,@type,@equipement);
insert into Administrators_Assign_And_Create_Activity_Teachers values (@activity_name,@teacher_id,@admin_id)
go
 create proc Update_Assigned_Teachers 
 @activity varchar(50),
 @new_teacher int ,
 @admin_id int
 as
 update Administrators_Assign_And_Create_Activity_Teachers
 set t_id= @new_teacher
 where name=@activity and a_id=@admin_id
 go
 create proc Assign_Teacher
 @admin_id int ,
 @teacher_id int,
 @course_name varchar(50),
 @course_code varchar(50) 
 as
 declare @name varchar(50)
declare @level varchar(50)
select @name=s.name, @level=s.level
from Employees_Employed_Schools s
where s.id=@admin_id
if exists (select * from Courses_Offers_Levels c where c.name_level=@level and c.name_course=@course_name  
and c.code=@course_code )
insert into Courses_By_Teachers values (@course_name,@course_code,@teacher_id)
else
print 'this course is not available for this level '

go

create proc Assign_Supervisors
@supervisor_id int,
@supervised_id int
as
insert into Teachers_Supervise_Teachers values(@supervisor_id,@supervised_id)
go

create proc Accept_Reject_Children
@admin_id int,
@ssn int,
@accept bit
as
declare @username varchar(50)
select @username=p.username
from Parent_Has_Student p
where p.ssn=@ssn;

declare @name varchar(50)
declare @level varchar(50)
select @name=s.name, @level=s.level
from Employees_Employed_Schools s
where s.id=@admin_id

update Parent_Apply_Schools_Students
set accepted=@accept
where username=@username and name=@name and level=@level and ssn=@ssn
go
--as a teacher 
create proc sign_up_teacher
@first varchar(50), @middle varchar(50),@last varchar(50),@birthdate date,@address varchar(50),
@email varchar(50),
@gender varchar(50),
@phone int,
@name varchar(50),
@level varchar(50),
@years_of_experience int 
as
insert into Employees (email,first_name,middle_name,last_name,birthdate,address,gender,phone_number) values 
(@email,@first,@middle,@last,@birthdate,@address,@gender,@phone)
declare @id int 
set @id = (select id from Employees where email=@email and first_name=@first and middle_name= @middle and last_name = @last
and birthdate =@birthdate  and address= @address and gender=@gender and phone_number=@phone)

insert into Employees_Employed_Schools values (@id ,@name,@level) 

insert into Teachers(id,years_of_experience) 
values (@id,@years_of_experience)


go

create proc view_teachers_courses
@t_id int
as
select c.name,x.name_level,c.grade
from courses c, Courses_Offers_Levels x,Courses_By_Teachers y
where c.name=x.name_course and c.code=x.code and y.name=c.name and y.code=c.code and y.t_id=@t_id
group by x.name_level , c.grade,c.name

go
create proc Post_Assignments
@teacher int,@code varchar(50),@name varchar(50),@posting_date date ,@due_date date ,@content varchar(50) ,@id int
as
insert into Assignments_For_Courses_Posted_By_Teachers (id,t_id,code,name) values (@id,@teacher,@code,@name)
insert into Assignments values (@id,@content,@due_date,@posting_date)
go

create proc View_Solutions
@my_id int,
@number int			
as
select e.*
from Assignments_For_Courses_Posted_By_Teachers s , Assignments_Solved_By_Students e
where s.id=@number  and e.id=s.id and s.t_id=@my_id
order by e.id 
go

create proc grade_assignments
@number int,
@student int,
@grade int
as
update Assignments_Solved_By_Students
set grade=@grade
where id=@number and ssn=@student
go

create proc delete_Assignment
@number int
as
delete from Assignments
where id=@number
go

create proc Write_Reports
@student int,
@teacher int,
@comment varchar(50),
@content varchar(50)
as
insert into reports(t_id,ssn,date,comment,content) values (@teacher,@student,cast (getdate()as date ),@comment,@content)
insert into Reports_Written_To_Students_By_Teachers values (cast (getdate() as date ),@teacher,@student)
go

create proc View_Questions 
@student int,
@course_name varchar(50),
@course_code  varchar(50)
as 
select e.question 
from Questions e , In_Courses_Students_Ask_Questions e1 
where e1.ssn=@student and e1.name=@course_name and e1.code=@course_code and e.question_number=e1.question_number
and e.name = @course_name and e.code = @course_code 
go

create proc Answer_Questions
@TeacherID int,
@name varchar(50),
@code varchar(50),
@answer varchar(50),
@number int
as
if exists (
select *
from Courses_By_Teachers e 
where e.name =@name and e.code=@code and e.t_id =@TeacherID
) BEGIN
update Questions 
set answer = @answer where name=@name and code=@code  and question_number=@number 
END
else 
print 'you are not allowed to answer this question '
go

create proc View_MyStudents
@TeacherID int
as
select *
from Courses_For_Students_By_Teachers c , Levels_Enrolled_level_Students l ,Students s
where c.t_id =@TeacherID and c.ssn=l.ssn and c.ssn=s.ssn 
order by l.grade,s.name 

go

create proc No_Join_Activity
as
select* from Students 
except( select s.* from Students s, Activities_Join_Act_Student_Students a 
where s.ssn=a.ssn 
)
go


create proc max_clubs
as
with temp as(
select c.ssn , count(c.name) as 'val'
from Clubs_Joined_By_Students c 
group by c.ssn 
)
select top 1 s.name
from Students s , temp
where s.ssn=temp.ssn
group by s.name,temp.val
order by temp.val



go

--as a parent

create proc Sign_Up
@first_name varchar(50),
@last_name varchar(50),
@email varchar(50),
@address varchar(50),
@phone int,
@username varchar(50),
@mobile1 int,
@mobile2 int,
@password varchar(50)

as
insert into Parents(first_name,last_name,email,address,phone,username,password)
values(@first_name,@last_name,@email,@address,@phone,@username,@password)

if (@mobile1 is not null)

insert into Parent_Mobile(mobile,username)
values(@mobile1,@username)

if(@mobile2 is not null)
insert into Parent_Mobile values(@mobile2,@username)
go

create proc Apply
@ssn int,
@username varchar(50),
@name varchar(50),
@birth_date date,
@gender varchar(50),
@school_name varchar(50),
@level varchar(50),
@grade int
as
insert into Students (ssn,name,birth_date,gender)
values(@ssn,@name,@birth_date,@gender)

insert into Parent_Has_Student (username,ssn) values (@username,@ssn)
insert into Parent_Apply_Schools_Students(username,name,level,ssn) values(@username,@school_name,@level,@ssn)

insert into Levels_Enrolled_level_Students values(@ssn,@grade,@level)
go

create proc View_School
@username varchar(50) as
select p.ssn ,s.name,s.level,s.address,s.email,s.fees,s.information,s.language,s.mission,s.type,s.vision
from Schools s ,Parent_Apply_Schools_Students p ,Students t
where s.name=p.name and s.level=p.level and p.accepted=1 and p.ssn=t.ssn and p.username=@username
order by t.ssn 
go

create proc Choose_School
@username VARCHAR(50),
@name varchar(50),
@level varchar(50),
@ssn int
as
if exists (select * from Parent_Apply_Schools_Students s where s.accepted=1 and s.username=@username and s.ssn=@ssn and s.name=@name and s.level=@level)
 insert into Schools_Enrolled_School_Students values(@ssn,@name,@level)
 else 
 print 'your child is not accepted in this school'
 go


create proc View_Reports 
@username varchar(50),
@ssn int as
select r.*
from Reports r ,Reports_Written_To_Students_By_Teachers w ,Parent_Has_Student p
where r.ssn=w.ssn and r.date=w.date and r.t_id=w.t_id and p.username=@username and p.ssn=@ssn
go

create proc Reply_Reports 
@date date,

@ssn int,
@reply varchar(50),
@parent_username varchar(50) as
insert into Parents_Reply_Reports (date,ssn,reply,parent_username) values (@date,@ssn,@reply,@parent_username)
go


create proc View_Schools_of_MyChildren
@username varchar(50)
as 
select c.*
from Schools c , Parent_Has_Student p , Schools_Enrolled_School_Students s 
where p.ssn=s.ssn and p.username=@username and s.name=c.name and s.level=c.level
order by c.name 
go

create proc view_announcements_parent
@username varchar(50)
as
declare @ssn int
declare @s_name varchar(50)
declare @s_level varchar(50)

select @ssn=ps.ssn, @s_name=sc.name , @s_level=sc.level
from parents p,Parent_Has_Student ps ,Schools_Enrolled_School_Students sc
where p.username=@username and p.username=ps.username and sc.ssn=ps.ssn and ps.ssn =@ssn

select a.*
from Administrators_Post_Announcements admin , Announcements a, Employees_Employed_Schools e
where admin.id=a.id and admin.a_id=e.id and e.name=@s_name and e.level=@s_level and ( datediff(day,(cast (getdate()as date )),a.date ) )<=10
go



create proc rate_teacher
@username varchar(50),
@t_id int,
@rate int
as
declare @student int
select @student=s.ssn
from Parent_Has_Student s
where s.username=@username 

if exists (select * from Courses_For_Students_By_Teachers c where c.ssn=@student and c.t_id=@t_id)
insert into Parents_Rate_Teachers values (@username,@t_id,@rate)
else print 'this teacher doesn''t teach your student'

go 

create proc write_review
@username varchar(50),
@text varchar(50),
@name varchar(50),
@level varchar(50)
as

if exists (select * from Parent_Has_Student p,Schools_Enrolled_School_Students s where s.ssn=p.ssn and s.name=@name and s.level=@level )
 insert into Parents_Review_Schools values (@username,@level,@name,@text);
 else 
 print 'you can''t review this school '
 go
 create proc delete_review
 @username varchar(50),
 @name varchar(50),
 @level varchar(50)
 as
 delete from Parents_Review_Schools where username=@username and name=@name and level=@level
 go
 create proc avg_rate 
 @teacher int
 as
 select avg(p.rating) 
 from Parents_Rate_Teachers p
 where p.id=@teacher
 go
 
 
create proc top_ten @username varchar(50) , @choice varchar(50)
as
declare @input varchar(50)
set @input=@choice

if @input = 'highest reviews'
begin
with temp as 
( 
select s.name as 'student_school_name' ,s.level as 'student_school_level' 
from Parent_has_Student p inner join Schools_Enrolled_School_Students s on p.ssn=s.ssn where p.username=@username 
) 
select TOP(10) s.*
from (Schools s inner join Parents_Review_Schools r on s.name = r.name and s.level=r.level) left outer join temp p 
on s.name=p.student_school_name and s.level =p.student_school_level
where s.name not in (p.student_school_name)  and s.level not in (p.student_school_level)  
group by s.name,s.level,s.email,s.address,s.mission,s.vision,s.language,s.type,s.information,s.fees
order by COUNT(*) DESC 
end
else 
begin

with temp as 
( 
select s.name as 'student_school_name' ,s.level as 'student_school_level'
from Parents_have_Students p inner join Schools_Enrolled_School_Students  s on p.ssn=s.ssn where p.username=@username 
) 
select TOP(10) s.*
from (Schools s inner join Schools_Enrolled_School_Students e on s.name=e.name and s.level=e.level)
 left outer join temp p on p.student_school_name=e.name and p.student_school_level=e.level
 
where s.name not in (p.student_school_name) and s.level not in (p.student_school_level) 
group by s.name,s.level,s.email,s.address,s.mission,s.vision,s.language,s.type,s.information,s.fees
order by COUNT(*) DESC 

end

go


create proc Highest_Reputation 
as 

with temp as (
select s.name as name ,count(r.review_text) as 'Number_Of_Reviews'
from  Schools s, Parents_Review_Schools r
where s.name=r.name and s.level=r.level and s.type='international'
group by s.name
)
SELECT TOP 1 temp.name 
FROM temp
group by temp.Number_Of_Reviews , temp.name
order by Count(temp.Number_Of_Reviews) desc 
go

--as an enrolled student

create proc Update_account
@ssn int,
@password varchar(50)
as
with old as (select * from Students where ssn=@ssn)

update old set password=@password
go

create proc view_myCourses
@ssn int
as
declare @level varchar(30)
set @level = (
select name from Levels_Enrolled_level_Students where ssn=@ssn)
select name_course,code from Courses_Offers_Levels where name_level=@level
order by name_course
go


create proc post_quest
@ssn int,
@name varchar(50),
@code varchar(50),
@question varchar(50)
as
declare @num int;
insert into Questions (name,code,question) values (@name,@code,@question);
set @num = (select question_number from Questions where name=@name and code=@code and question=@question)
insert into Courses_Has_Questions (question_number,name,code) values(@num,@name,@code) 
insert into In_Courses_Students_Ask_Questions (question_number,name,code,ssn) values (@num,@name,@code,@ssn)
go


create proc view_other_questions
@username varchar(50),
@name varchar(50),
@code varchar(50)
as
declare @ssn int
select @ssn=s.ssn
from students s
where s.username=@username

select q.*
from In_Courses_Students_Ask_Questions x,questions q
where x.name=q.name and x.code=q.code and x.question_number=q.question_number and x.name=@name and x.code=@code and x.ssn<>@ssn

go
create proc my_assignments
@username varchar(50)
as
declare @ssn int
select @ssn=s.ssn
from students s
where s.username=@username

select a.*
from Courses_For_Students_By_Teachers c,Assignments_For_Courses_Posted_By_Teachers a
where c.name=a.name and c.code=a.code and c.ssn=@ssn
go

create proc my_solution
@username varchar(50),
@solution varchar(50),
@id int
as
declare @ssn int
select @ssn=s.ssn
from students s
where s.username=@username


insert into Assignments_Solved_By_Students (id,ssn,solution) values (@id,@ssn,@solution)
go

create proc view_my_grade
@username varchar(50)
as
declare @ssn int
select @ssn=s.ssn
from students s
where s.username=@username

select a.grade
from Assignments_Solved_By_Students a, Courses_For_Students_By_Teachers c
where c.ssn=@ssn and c.ssn=a.ssn
order by c.name , c.code
go

create proc view_announcements
@username varchar(50)
as
declare @ssn int
declare @s_name varchar(50)
declare @s_level varchar(50)

select @ssn=s.ssn, @s_name=sc.name , @s_level=sc.level
from students s , Schools_Enrolled_School_Students sc
where s.username=@username and s.ssn=sc.ssn 

select a.*
from Administrators_Post_Announcements admin , Announcements a, Employees_Employed_Schools e
where admin.id=a.id and admin.a_id=e.id and e.name=@s_name and e.level=@s_level and ( datediff(day,(cast (getdate()as date )),a.date ) )<=10
go


create proc view_my_activities
@username varchar(50)
as
declare @ssn int
declare @s_name varchar(50)
declare @s_level varchar(50)

select @ssn=s.ssn, @s_name=sc.name , @s_level=sc.level
from students s , Schools_Enrolled_School_Students sc
where s.username=@username and s.ssn=sc.ssn 

select a.* , teacher.*
from Activities a, Administrators_Assign_And_Create_Activity_Teachers t,Employees_Employed_Schools e, teachers teacher
where a.name=t.name and e.id=t.a_id and teacher.id=e.id
go

create proc apply_for_activity
@username varchar(50),
@name varchar(50)
as
declare @ssn int
declare @s_name varchar(50)
declare @s_level varchar(50)

select @ssn=s.ssn, @s_name=sc.name , @s_level=sc.level
from students s , Schools_Enrolled_School_Students sc
where s.username=@username and s.ssn=sc.ssn 

declare @type varchar(50)
declare @date date

select @type=act.type , @date=act.date
from Activities act
where act.name=@name

if exists (select * from Activities a , Activities_Join_Act_Student_Students x where x.name=a.name and x.ssn=@ssn and a.date=@date and a.type=@type )
print 'you can''t join this activity '
else
insert into Activities_Join_Act_Student_Students values (@name,@ssn)
go

create proc join_clubs
@username varchar(50),
@name varchar(50)
as
declare @ssn int
declare @s_name varchar(50)
declare @s_level varchar(50)

select @ssn=s.ssn, @s_name=sc.name , @s_level=sc.level
from students s , Schools_Enrolled_School_Students sc
where s.username=@username and s.ssn=sc.ssn 

if exists (select * from clubs c where c.name=@name and c.name_school=@s_name and c.level=@s_level and c.level='High School')
insert into Clubs_Joined_By_Students values (@ssn,@name,@s_name,@s_level)
else
print 'you can''t join this club'
go


create proc search_courses
@username varchar(50),
@name varchar(50),
@code varchar(50)
as

declare @ssn int
declare @s_name varchar(50)
declare @s_level varchar(50)

select @ssn=s.ssn, @s_name=sc.name , @s_level=sc.level
from students s , Schools_Enrolled_School_Students sc
where s.username=@username and s.ssn=sc.ssn 

if exists (
select c.*
from Courses c, Courses_For_Students_By_Teachers s
where c.name=s.name and c.code=s.code and s.ssn=@ssn and c.name=@name and c.code=@code)
begin
select c.*
from Courses c, Courses_For_Students_By_Teachers s
where c.name=s.name and c.code=s.code and s.ssn=@ssn and c.name=@name and c.code=@code
end 
else
print 'you''re not allowed to view this course'
go

























 


  
 

















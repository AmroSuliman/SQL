/* 1.
Create a view that will display
Instructor Name, Department Name for the ‘SD’ or ‘Java’ Department “. */

create view Instructor_info
as
 select  Instructor.Ins_Name , Department.Dept_Name 
 FROM  Instructor , Department
 where  Instructor.Dept_Id=Department.Dept_Id and Department.Dept_Name = 'SD' or Department.Dept_Name = 'Java' 

select * from Instructor_info


//**2.	Create a view “V1” that displays student data for the student who lives in Alex or Cairo. */

create view V1
as
select *  from Student
where St_Address = 'alex' or St_Address = 'cairo'
with check option

select * from V1



/*3 Create a view that displays
the student’s full name, course name if the student has a grade of more than 50. */

create view std_info
as
select St_Fname + ' ' + St_Lname as Full_name , Course.Crs_Name
from Student , Course , Stud_Course
where  Course.Crs_Id=Stud_Course.Crs_Id and Student.St_Id=Stud_Course.St_Id and Stud_Course.Grade > 50

select * from std_info


/*4Create an Encrypted view that displays manager names and the topics they teach.
(Hint :To Find Instructor who work as manger using Manage Relation Ship between instructor and department PK =[dbo].[Instructor]. [Ins_Id]
FK =[dbo].[Department]. [Dept_Manager]  )
*/

create view Manager_info
WITH ENCRYPTION
as
select Instructor.Ins_Name as Manager, topic.Top_Name as topic
from Instructor , Course, Topic , Department , Ins_Course
where Ins_Course.Crs_Id=Course.Crs_Id and Instructor.Ins_Id=Ins_Course.Ins_Id
and Instructor.Ins_Id=Department.Dept_Manager and topic.Top_Id=course.Top_Id

select * from Manager_info






/* 1.	Make a rule that makes sure the value is less than 1000 
then bind it on the Salary in Employee table.*/

create rule r1 as @salary < 1000
go
sp_bindrule r1, 'employee.salary'
go


/*2.	Create a new user data type named loc with the following Criteria:
•	nchar(2)
•	default: NY 
•	create a rule for this Datatype :values in (NY,DS,KW)) and associate it to the location column */

create type loc from nchar(2)
go
/*   */

create rule locval as @loc in ( 'NY' , 'DS' , 'KW')
go
sp_bindrule locval, loc
go

/*   */////

create default locdef as'NY'
go
sp_bindefault locdef, loc
go



/* 3.	Create a New table Named newStudent,
and use the new user define data type on it you just have made and .*/

create table newStudent
                   (sName varchar , sid int , slocation loc , ssubject varchar)



/* 1)	 Create a view that will display the project name and the number of employees works on it. */

create view V_C1
as
select Project.Pname , COUNT (Works_for.essn) as ' E in P'
from Project,Employee,Works_for
where Project.Pnumber=Works_for.Pno and Employee.SSN=Works_for.ESSn 
group by Project.Pname

select * from V_C1


/* 2)	Create a view named   “v_D30” that will display employee number, project number,
hours of the projects in department 30.*/

create view v_D30
as
select Employee.SSN , Project.Pnumber , Works_for.Hours
from Employee , Works_for , Project
where Employee.SSN=Works_for.ESSn and Project.Pnumber=Works_for.Pno and Project.Dnum=30

select * from v_D30


/*3)	Create a view named “v_count “ 
that will display the project name and the number of hours for each one. */

create view v_count
as
select  Project.Pname , sum( Works_for.Hours) as 'hours on project',Project.Pnumber
from      Works_for , Project 
where     Project.Pnumber=Works_for.Pno 
group by project.Pname,Project.Pnumber

select * from v_count

/*4)	Create a view named ” v_project_500” that will display the emp no.
 for the project 500, use the previously created view  “v_D30” */

 
 create view v_project_500 
 as
 select v_D30.SSN  as EmployeeNo
 from v_D30 
 where v_D30.Pnumber=500
 

 select * from v_project_500

 /* 5)	Delete the views  “v_D30” and “v_count” */

 drop view v_D30 , v_count ;





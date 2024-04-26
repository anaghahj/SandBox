create database dbms_student;
use dbms_student;

create table Student(
USN varchar(10),
Name varchar(20),
Semester integer,
Section varchar(1),
Department varchar(10),
CGPA float,
constraint pks primary key (USN));

create table Student_FoI(
USN varchar(10),
FoI varchar(20),
Experience varchar(10),
constraint pksfoi primary key (USN,FoI),
constraint fksfoi foreign key (USN) references Student (USN));

create table Course_Activities(
USN varchar(10),
Type varchar(10),
Name varchar(20),
Date_start date,
Date_end date,
constraint fkca foreign key (USN) references Student (USN));

create table Teacher(
Teacher_id varchar(10),
Name varchar(20),
Department varchar(20),
Phone varchar(10),
constraint pkt primary key(Teacher_id));

create table Teacher_FoI(
Teacher_id varchar(10),
FoI varchar(20),
Experience varchar(10),
constraint pktfoi primary key (Teacher_id,FoI),
constraint fktfoi foreign key (Teacher_id) references Teacher (Teacher_id));

create table Teacher_projects(
Teacher_id varchar(10),
Project_name varchar(20),
constraint pktp primary key (Teacher_id,Project_name),
constraint fktp foreign key (Teacher_id) references Teacher (Teacher_id));

create table Works_on_Projects(
Teacher_id varchar(10),
USN varchar(10),
Project_name varchar(20),
constraint pkwop primary key (Teacher_id,USN,Project_name),
constraint fkwopt foreign key (Teacher_id) references Teacher(Teacher_id),
constraint fkwops foreign key (USN) references Student(USN));

insert into Student values("1BI21CS011","Afreen S",5,'A',"CSE",9);
insert into Student values("1BI21CS015","Anaghashree",5,'A',"CSE",9);
insert into Student values("1BI21CS062","Khushi",5,'A',"CSE",9.3);

insert into Student_FoI values("1BI21CS011","Machine Learning","7 Months");
insert into Student_FoI values("1BI21CS015","App Development","4 Months");
insert into Student_FoI values("1BI21CS062","Full Stack","1 Year");

insert into Course_Activities values("1BI21CS011","Course","Introduction to ML","2023-05-03","2023-07-03");
insert into Course_Activities values("1BI21CS011","Hackathon","SIH-2023","2023-12-22","2024-01-12");
insert into Course_Activities values("1BI21CS015","Hackathon","SIH-2023","2023-12-22","2024-01-12");

insert into Teacher values("1BICS001","Prathima M G","CSE","9611999441");
insert into Teacher values("1BICS002","Hemavathi P","CSE","9845696399");

insert into Teacher_FoI values("1BICS001","DBMS","12 Years");
insert into Teacher_FoI values("1BICS002","Networks","14 Years");
insert into Teacher_FoI values("1BICS002","DSA","9 Years");

insert into Teacher_Projects values("1BICS001","College Database");
insert into Teacher_Projects values("1BICS002","Networks using ns2");

delimiter //
create trigger T1 before delete on Student for each row
begin
delete from Student_FoI where USN=old.USN;
delete from Course_Activities where USN=old.USN;
end //

delimiter //
create trigger T2 before delete on Teacher for each row
begin
delete from Teacher_FoI where Teacher_id=old.Teacher_id;
delete from Teacher_Projects where Teacher_id=old.Teacher_id;
end //
delimiter ;

delete from Student where USN="1BI21CS011";
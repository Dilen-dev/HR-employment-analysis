create database HR_DB;
use HR_DB;

select * from human_resources;
alter table human_resources
change column ï»¿id emp_id varchar(20)NULL;

describe human_resources;

select birthdate from human_resources;

update human_resources
set birthdate = case
	when birthdate like'%/%' then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    when birthdate like'%-%' then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    else NULL
end;

alter table human_resources
modify column birthdate date;

update human_resources
set hire_date = case
	when hire_date like'%/%' then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    when hire_date like'%-%' then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    else NULL
end;
select hire_date from human_resources;
alter table human_resources
modify column hire_date date;

set sql_mode = '';
update human_resources
set termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate !='';

select termdate from human_resources;

alter table human_resources
modify column termdate date;

alter table human_resources add column age int;

update human_resources
set age = timestampdiff(Year,birthdate,curdate());

select 
min(age) as youngest,
max(age) as oldest
from human_resources;

select birthdate,age from human_resources;

select count(*) from human_resources where age<18;
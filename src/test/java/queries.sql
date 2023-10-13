-- select
select FIRST_NAME, LAST_NAME from EMPLOYEES;

select * from EMPLOYEES;

--distinct
select distinct FIRST_NAME from EMPLOYEES;

--where
select salary from EMPLOYEES
where SALARY > 5000;

select salary from EMPLOYEES
where  salary <> 6000;

select salary from EMPLOYEES
where  salary > 5000 and salary < 10000;

SELECT FIRST_NAME from EMPLOYEES
WhErE FIRST_NAME = 'David';

-- sql language is case insensitive, but data is sensitive

-- count
select count(FIRST_NAME) from EMPLOYEES;
select count(*) from EMPLOYEES;

-- count statement only counting not null data
select COMMISSION_PCT from EMPLOYEES;
select count(COMMISSION_PCT) from EMPLOYEES;

-- order by
-- default order is ascending
select FIRST_NAME from EMPLOYEES
order by FIRST_NAME asc ;

select FIRST_NAME from EMPLOYEES
order by FIRST_NAME desc ;

select FIRST_NAME, SALARY from EMPLOYEES
order by SALARY;

select FIRST_NAME, LAST_NAME from EMPLOYEES
order by FIRST_NAME asc , LAST_NAME desc ;

--between
select SALARY from EMPLOYEES
where  SALARY >= 5000 and SALARY <= 10000;  --39

-- lower bound and upper bound are included
select SALARY from EMPLOYEES
where  SALARY between 5000 and 10000;  --43

-- use lower value first, bigger value last
select SALARY from EMPLOYEES
where  SALARY between 6000 and 8000;

-- IN
select JOB_ID from EMPLOYEES
where JOB_ID = 'AD_VP' OR JOB_ID = 'IT_PROG' OR JOB_ID = 'SA_REP';

SELECT JOB_ID FROM EMPLOYEES
WHERE  JOB_ID IN ('AD_VP','IT_PROG','SA_REP');

SELECT CITY , COUNTRY_ID FROM LOCATIONS
WHERE  COUNTRY_ID NOT IN ('IT','US','JP');

-- like    used for uncertain part of data
-- %   for starting part, or ending part

select FIRST_NAME from EMPLOYEES
where FIRST_NAME like 'Da%';

-- ending with er
select LAST_NAME from EMPLOYEES
where LAST_NAME like '%er';

--   -  it's for single character
select FIRST_NAME from EMPLOYEES
where  FIRST_NAME like '_____';

select JOB_ID from EMPLOYEES
where JOB_ID NOT like 'SA____';

-- aggregate functions
-- min
select min(salary) from EMPLOYEES;
select START_DATE from JOB_HISTORY;
select min(START_DATE) from  JOB_HISTORY;

-- max
select max(SALARY) from EMPLOYEES;
select HIRE_DATE from EMPLOYEES;
select max(HIRE_DATE) from EMPLOYEES;

-- avg  we will use round keyword together to get more readable data
select avg(salary) from EMPLOYEES;
select round(avg(salary),2) from EMPLOYEES;
select round(avg(salary)) from EMPLOYEES;

--sum
select sum(salary) from EMPLOYEES;

-- group by
select * from EMPLOYEES where JOB_ID = 'FI_ACCOUNT';
select JOB_ID, min(salary), max(salary), avg(salary), sum(salary) from EMPLOYEES
group by JOB_ID;

select count(EMPLOYEE_ID), DEPARTMENT_ID from EMPLOYEES
group by DEPARTMENT_ID;

select min(salary), MANAGER_ID from EMPLOYEES
group by MANAGER_ID;

-- having     after group by, if we want to add condition, we will use having
select count(EMPLOYEE_ID), DEPARTMENT_ID from EMPLOYEES
group by DEPARTMENT_ID
having count(employee_id) < 5;

-- difference between having and where
-- where is put condition before group, applies to individual rows
-- having is put condition after group, applies to grouped rows

-- get every department total salary, get me those total salary > 20000 only
select sum(salary), DEPARTMENT_ID from EMPLOYEES
group by DEPARTMENT_ID
having sum(SALARY) > 20000;


-- row number
select FIRST_NAME, SALARY from EMPLOYEES
where ROWNUM <= 10;

-- row number is only working for first 10/5/20 data.
select FIRST_NAME, SALARY from EMPLOYEES
where ROWNUM < 10;

-- sub query
select max(salary) from EMPLOYEES; -- 36000

select FIRST_NAME from EMPLOYEES
where  SALARY = (select max(salary) from EMPLOYEES);

-- get me all firstnames making more than avg salary
select FIRST_NAME, SALARY from EMPLOYEES
where SALARY > (select avg(SALARY) from EMPLOYEES);

-- second highest  salary using subquery
select max(salary) from EMPLOYEES
where SALARY != (Select max(SALARY) from EMPLOYEES);

select max(salary) from EMPLOYEES
where SALARY < (Select max(SALARY) from EMPLOYEES);

-- string functions
-- concatenation    ||
select FIRST_NAME, LAST_NAME from EMPLOYEES;
select FIRST_NAME ||' '||LAST_NAME as fullName from EMPLOYEES;

--upper   lower
select upper(LAST_NAME) from EMPLOYEES;
select FIRST_NAME ||' '||upper(LAST_NAME) as fullName from EMPLOYEES;

--length
select FIRST_NAME, length(FIRST_NAME) from EMPLOYEES;

--substring
--sub(david,2,2)  --
select FIRST_NAME, substr(FIRST_NAME,2,2) from EMPLOYEES
where FIRST_NAME = 'David';


--initcap
select initcap(EMAIL) from EMPLOYEES;


--join
-- (INNER) JOIN: Returns records that have matching values in both tables
-- LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
-- RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
-- FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

--inner join
select * from EMPLOYEES;
select START_DATE from JOB_HISTORY;
select * from JOB_HISTORY;

select FIRST_NAME, START_DATE, END_DATE from JOB_HISTORY
inner join EMPLOYEES
on EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;

select FIRST_NAME, START_DATE, END_DATE from JOB_HISTORY
left join EMPLOYEES
on JOB_HISTORY.EMPLOYEE_ID = EMPLOYEES.EMPLOYEE_ID;

select FIRST_NAME, START_DATE, END_DATE from EMPLOYEES
right join JOB_HISTORY
           on JOB_HISTORY.EMPLOYEE_ID = EMPLOYEES.EMPLOYEE_ID;

select FIRST_NAME, START_DATE, END_DATE from JOB_HISTORY
full outer join  EMPLOYEES
on JOB_HISTORY.EMPLOYEE_ID = EMPLOYEES.EMPLOYEE_ID;


-- DQL   data query language  --> select, where, join   most important
-- DML   data manipulation language --> insert, update
-- DDL   data definition language --> create, alter, drop
-- DMl   data management language --> commit, savepoint


-- CREATE TABLE
create table Teachers11(
                         T_id integer primary key ,
                         T_name char(40),
                         T_branch char(40)
);

create table Students11(
                         S_id integer primary key ,
                         S_name char(40),
                         S_branch char(40)

);

-- INSERT DATA
insert into TEACHERS11 VALUES (100,'Jamal','API');
SELECT * FROM TEACHERS11;

--UPDATE DATA
UPDATE TEACHERS11
SET T_BRANCH = 'Database Testing'
where T_ID = 100;

delete TEACHERS11
where T_ID = 100;

-- alter
-- add column
alter table TEACHERS11
add address varchar(60);

-- change column name
alter table TEACHERS11 rename column address to state;

-- delete column
alter table TEACHERS11 drop column state;

-- change table name
alter table TEACHERS11 rename to CydeoTeachers;

select * from CYDEOTEACHERS;

-- truncate ( only deleting the data, but remain the table)
insert into CYDEOTEACHERS values (100,'Jamal','API');
truncate table CYDEOTEACHERS;

-- drop table ( deleting whole table)
drop table CYDEOTEACHERS;

-- set operators
--union
select FIRST_NAME from EMPLOYEES
union
select city from LOCATIONS;


-- union all
select FIRST_NAME from EMPLOYEES
union all
select city from LOCATIONS;

-- union all is combining all the data, but union is removing duplicated ones and order them
-- minus
-- intersect



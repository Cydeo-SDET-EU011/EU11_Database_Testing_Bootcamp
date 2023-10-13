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
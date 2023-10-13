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
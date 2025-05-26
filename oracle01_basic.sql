select * from employees;

select * from all_objects a 
where owner = 'HR'
and a.object_type = 'TABLE';

select *
from user_tables;

select * from tab;

select salary * 10 as bouns from employees;
desc employees; -- desc 구조확인. 


SELECT last_name || '님의 급여는' || salary ||  '입니다.' as name 
from employees;

select distinct first_name 
from employees;

select first_name , salary 
from employees a 
where salary < 3000;

-- employees테이블에서 first_name컬럼의 값이 'David' 일때의
-- first_name, salary을 출력하라.
SELECT first_name, salary
FROM employees
WHERE first_name != 'David';

select FIRST_NAME, salary
from employees a 
where a.salary  in (3000,9000,17000);

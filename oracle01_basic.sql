select * from employees;

select * from all_objects a 
where owner = 'HR'
and a.object_type = 'TABLE';

select *
from user_tables;

select * from tab;

select salary * 10 as bouns from employees;
desc employees; -- desc ����Ȯ��. 


SELECT last_name || '���� �޿���' || salary ||  '�Դϴ�.' as name 
from employees;

select distinct first_name 
from employees;

select first_name , salary 
from employees a 
where salary < 3000;

-- employees���̺��� first_name�÷��� ���� 'David' �϶���
-- first_name, salary�� ����϶�.
SELECT first_name, salary
FROM employees
WHERE first_name != 'David';

select FIRST_NAME, salary
from employees a 
where a.salary  in (3000,9000,17000);

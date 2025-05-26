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

--employees���̺��� salary�� 3000���� 5000���� �϶���
--first_name, hire_date, salary�� ����϶�.
select FIRST_NAME, salary
from employees a 
where a.salary  in (3000,9000,17000);

select FIRST_NAME, hire_date, salary 
from employees a 
where a.salary  >= 3000 and salary <= 5000;

select FIRST_NAME, hire_date, salary 
from employees a 
where a.salary between 3000 and 5000;

--employees���̺��� job_id�� 'IT_PROG'�� �ƴҶ�
--first_name, email, job_id�� ����϶�.
select FIRST_NAME, email, job_id
from employees a 
where NOT job_id = 'IT_PROG';

select FIRST_NAME, hire_date, salary 
from employees a 
where NOT a.salary between 3000 and 15000;

select FIRST_NAME, salary , commission_pct
from employees a 
where commission_pct is not null;

select first_name, salary, email
from employees 
where first_name like '%der%';

--employees���̺��� first_name�� ���� 'A'�� �����ϰ�
--�ι�° ���ڴ� ���� �����̸� 'exander'�� ������
--first_name, salary, email�� ����϶�.


/*
 WHERE������ ���� ������ 3���� ����
 1 �񱳿����� : = > >= < <= != <> ^=
 2 SQL������ : BETWEEN a AND b,  IN, LIKE, IS NULL
 3 �������� : AND, OR, NOT
 
 �켱����
 1 ��ȣ()
 2 NOT������
 3 �񱳿�����, SQL������
 4 AND
 5 OR
  */

/*////////////////////////////////////
////--����--
/////////////////////////////////////*/ 
-- 1) employees���̺��� �޿��� 17000������ ����� �����ȣ, �����(first_name), �޿��� ����Ͻÿ�.
SELECT employee_id, first_name, salary
from employees 
where salary <= 17000;

--2) employees���̺��� 2005�� 1�� 1�� ���Ŀ� �Ի��� ����� ����Ͻÿ�.
SELECT *
from employees 
where hire_date >= to_date('20050101','YYYYMMDD');

--3) employees���̺��� �޿��� 5000�̻��̰� 
--����(job_id)�� 'IT_PROG'�� ����� �����(first_name), �޿�, ������ ����Ͻÿ�.
SELECT first_name, salary, job_id
from employees 
where salary >= 5000
and job_id = 'IT_PROG';

--4) employees���̺��� �μ���ȣ�� 10, 40, 50 �� ����� �����(first_name), �μ���ȣ, �̸���(email)�� ����Ͻÿ�.
SELECT first_name, DEPARTMENT_ID, email
from employees 
where DEPARTMENT_ID in (10,40,50);

--5) employees���̺��� �����(first_name)�� even�� ���Ե� �����,�޿�,�Ի����� ����Ͻÿ�.
SELECT first_name, salary, hire_date
from employees 
where first_name like '%even%';

--6) employees���̺��� �����(first_name)�� teve�յڿ� ���ڰ� �ϳ��� �ִ� �����,�޿�,�Ի����� ����Ͻÿ�.
SELECT first_name, salary, hire_date
from employees 
where first_name like '_teve_';

--7) employees���̺��� �޿��� 17000�����̰� Ŀ�̼��� null�� �ƴҶ��� �����(first_name), �޿�, Ŀ�̼��� ����Ͻÿ�.
 SELECT first_name, salary, COMMISSION_PCT
from employees 
where salary <= 17000
and COMMISSION_PCT is not null;
  
--8) 2005�⵵�� �Ի��� ����� �����(first_name),�Ի����� ����Ͻÿ�.
SELECT first_name, hire_date
from employees 
where to_char(hire_date,'YYYY') = '2005'; 

--9) Ŀ�̼� ���� ����� ����� �����(first_name), Ŀ�̼��� ����Ͻÿ�.
 SELECT first_name, COMMISSION_PCT
from employees 
where 1=1
and COMMISSION_PCT is not null; 

--10) ����� 206�� ����� �̸�(first_name)�� �޿��� ����Ͻÿ�.
SELECT first_name, salary
from employees 
where EMPLOYEE_ID = 206;

--11) �޿��� 3000�� �Ѵ� ����(job_id),�޿�(salary)�� ����Ͻÿ�.
SELECT first_name, job_id, salary
from employees 
where salary > 3000;

--12)'ST_MAN'������ ������ ������� �����(first_name)�� ����(job_id)�� ����Ͻÿ�.
SELECT first_name, job_id
from employees 
where  job_id <> 'ST_MAN';

--13) ������ 'PU_CLERK' �� ��� �߿��� �޿��� 10000 �̻��� �����(first_name),����(job_id),�޿�(salary)�� ����Ͻÿ�.
SELECT first_name, job_id, salary
from employees 
where  job_id = 'PU_CLERK'
and salary >= 10000;

--14) commission�� �޴� �����(first_name)�� ����Ͻÿ�.
SELECT first_name, COMMISSION_PCT
from employees 
where COMMISSION_PCT is not null;

--15) 20�� �μ��� 30�� �μ��� ���� ����� �����(fist_name), �μ��� ����Ͻÿ�.
SELECT first_name, DEPARTMENT_ID
from employees 
where DEPARTMENT_ID in (20,30);

--16) �޿��� ���� ������� ����ϵ� �޿��� ���� ��� �����(first_name) ������� ����Ͻÿ�.
SELECT first_name, salary
from employees
order by salary desc, first_name;

--17) ������ 'MAN' ������ ����� �����(first_name), �޿�(salary), ����(job_id)�� ����Ͻÿ�.
SELECT first_name, salary, job_id
from employees
where job_id like '%MAN';

/*=========================================
���տ�����(Set Operations)
===========================================*/
/*
-�� �̻��� query����� �ϳ��� ����� �����Ѵ�.
-select�� ���� ������ ���ƾ� �Ѵ�.
  ù��° select�� 2���̸� �ι�° select�� 2������ �Ѵ�.
-Ÿ���� ��ġ�ؾ� �Ѵ�.  
 ���� ��� character�̸� character�̿��� �Ѵ�.

���տ����� ����
union(������)- �ߺ����� ���ŵ� �� query
union all(������)-�ߺ����� ���Ե� �� query��
intersect(������)-�� query�� �������� ��
minus(������)-ù��° query�� �ִ� �� �� �ι�° query�� ���� ��ǥ��

���տ����� �������
-���� �ٸ� ���̺��� ������ ������ ����� ��ȯ�ϱ� ���ؼ�
-���� ���� ���̺��� ���� �ٸ� ���Ǹ� �����Ͽ� ����� ��ġ�� ���ؼ�
 */
--=============================================================
-- union
select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 40
union all
select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 60;

select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 40
intersect
select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 60;

-- ������ ( except )
select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 40
minus
select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 60;
















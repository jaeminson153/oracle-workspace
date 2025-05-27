/*=======================================================
join : �������� ���̺��� ���ϴ� ���̺��� �������ִ� �������̴�.

join�� oracle��ǰ���� ���Ǵ� oracle�� join�� �ְ�
��� ��ǰ���� ���������� ���Ǵ� ǥ��(ANSI) join�� �ִ�.
�̱� ���� ǥ�� ��ȸ(American National Standards Institute)
========================================================*/
--1. carteian product(īƼ�� ��) ���� : 
--   ���̺� ���� ������ŭ ������ִ� �����̴�.
--1) oracle�� cartesian product
  SELECT e.department_id, e.first_name, e.job_id, j.job_title
  FROM employees e, jobs  j; --2,033
  
  SELECT *
  FROM employees; --107
  SELECT *
  FROM jobs;  --19
  
--(2) ANSI�� cross join
 SELECT e.department_id, e.first_name, e.job_id, j.job_title
 FROM employees e cross join jobs  j; 

 /*
 2. equi join
    ���� ���� ���Ǵ� ���ι������ ���� ����� �Ǵ� �� ���̺��� ���������� �����ϴ� �÷��� ����
    ��ġ�Ǵ� ���� �����Ͽ� ����� �����ϴ� ����̴�.
 */
 --(1) oracle�� equi join
  SELECT e.department_id, e.first_name, e.job_id, j.job_title
  FROM employees e, jobs  j
  WHERE e.job_id=j.job_id;
 
--(2) ansi�� inner join
 SELECT e.department_id, e.first_name, e.job_id, j.job_title  
  FROM employees e inner join jobs  j  
  ON e.job_id=j.job_id;

--employees�� departments���̺��� �����ȣ(employee_id),
--�μ���ȣ(department_id), �μ���(department_name)�� �˻��Ͻÿ�.
select e.employee_id, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select e.employee_id, d.department_id, d.department_name
from employees e inner join departments d
  on e.department_id = d.department_id;

select e.employee_id, d.job_id, d.JOB_TITLE
from employees e inner join jobs d
  on e.job_id = d.job_id;
  
select *
from employees e
where a.department_id is null;

 --job_id�� 'FI_MGR'�� ����� ����
 --�޿�(salary)�� �ּҰ�(min_salary), �ִ밪(max_salary)�� ����Ͻÿ�. 
select e.first_name, e.job_id, j.min_salary, j.max_salary
from employees e, jobs j 
where e.job_id = j.job_id
and e.job_id = 'FI_MGR';

select e.first_name, e.job_id, j.min_salary, j.max_salary
from employees e inner join jobs j 
on e.job_id = j.job_id
where  e.job_id = 'FI_MGR';

--�μ��� 'Seattle'�� �ִ� �μ����� �ٹ��ϴ�
--��������  first_name, hire_date, department_name, city
--����ϴ� SELECT�� �ۼ��Ͻÿ�.
select e.first_name, e.hire_date, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.LOCATION_ID = l.location_id
and l.city = 'Seattle';

select e.first_name, e.hire_date, d.department_name, l.city
from employees e inner join departments d on e.department_id = d.department_id
                 inner join locations l   on d.LOCATION_ID = l.location_id
where l.city = 'Seattle';

-- 20�� �μ��� �̸��� �� �μ��� �ٹ��ϴ� ����� �̸� �� ����Ͻÿ�.
select e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id
and d.department_id = '20';

select e.first_name, d.department_name
from employees e inner join departments d
on e.department_id = d.department_id
where d.department_id = '20';

-- 1400, 1500�� ��ġ�� �����̸��� �� ���� �ִ� �μ��� �̸��� ����Ͻÿ�.
select l.location_id, l.city, d.department_name
from locations l, departments d 
where l.location_id = d.location_id
and l.location_id in (1400,1500);

select l.location_id, l.city, d.department_name
from locations l inner join departments d 
on l.location_id = d.location_id
where l.location_id in (1400,1500);

/*===================================
3. non-equi join (������)
  (=)����񱳿����ڸ� ������ >=, <=, >, <���� �����ڸ� 
  �̿��ؼ� ������ �����ϴ� ���ι���̴�.
=======================================*/
--(1) oracle�� non-equi join
SELECT e.first_name, e.salary, j.min_salary,
               j.max_salary, j.job_title
FROM employees e, jobs j               
WHERE  e.job_id=j.job_id
  AND e.salary>=j.min_salary
       AND e.salary<=j.max_salary;

--(2) ansi�� non-equi join
SELECT e.first_name, e.salary, j.min_salary,
       j.max_salary, j.job_title
FROM employees e JOIN jobs j
ON e.job_id=j.job_id
WHERE e.salary>=j.min_salary
AND e.salary<=j.max_salary;

/*=================================================================
4. outer join
  �� ���̺��� �����Ͱ� �ְ� �ٸ� �ݴ��ʿ��� �����Ͱ� ���� ��쿡
  �����Ͱ� �ִ� ���̺��� ������ ��� �������� �����̴�.
  https://dataschool.com/how-to-teach-people-sql/left-right-join-animated/
  ===============================================================*/
--(1) oracle outer join
  SELECT e.employee_id, e.first_name, e.employee_id, e.department_id, 
          d.department_id, d.department_name 
  FROM employees e, departments d
  WHERE e.department_id=d.department_id(+)
  ORDER BY e.employee_id;  /* LEFT OUTER JOIN*/

 SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e, departments d
 WHERE e.department_id(+)=d.department_id; /* RIGHT OUTER JOIN */

 --(2) ansi outer join
  SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e LEFT OUTER JOIN departments d
 ON e.department_id=d.department_id;
 
 SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e RIGHT OUTER JOIN departments d
 ON e.department_id=d.department_id;
 
 SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e FULL OUTER JOIN departments d
 ON e.department_id=d.department_id;
 
  /*=================================================
5. self join
 �ϳ��� ���̺��� �ΰ��� ���̺�� �����ؼ� ����ϴ� ���ι���̴�.
 �ϳ��� ���̺� ���������Ͱ� �ΰ��� �÷��� �ٸ� �������� ����ǿ� �ִ� ���
 employees, employee_id, manager_id
====================================================*/
 --(1) oracle self join
 SELECT w.employee_id AS "�����ȣ",
               w.first_name AS "����̸�",
              w.manager_id  AS "�����ڹ�ȣ",
             m.first_name AS "�������̸�"
 FROM employees w, employees m
 WHERE w.manager_id=m.employee_id
 ORDER BY w.employee_id; 
 
 --(2) ansi self join
 SELECT w.employee_id AS "�����ȣ",
        w.first_name AS "����̸�",
        w.manager_id  AS "�����ڹ�ȣ",
        m.first_name AS "�������̸�"
 FROM employees w  JOIN employees m
 ON w.manager_id=m.employee_id
 ORDER BY w.employee_id;
 
 /*----------------------------------------------
 ����
 ----------------------------------------------   */
--1)EMPLOYEES ���̺��� �Ի��� ��(hire_date) ���� �ο����� ��ȸ�Ͻÿ� . 
--  <���: ��        ������   >
 SELECT  to_char(hire_date,'MM'), count(*)
 FROM employees e 
 group by to_char(hire_date,'MM')
 order by to_char(hire_date,'MM');
 
--2)�� �μ����� �ٹ��ϴ� �������� ��ȸ�ϴ� SQL ��ɾ �ۼ��Ͻÿ�. 
--��, �������� 5�� ������ �μ� ������ ��µǾ�� �ϸ� �μ������� ���� ������ �ִٸ� �μ��� ��<�̹�ġ�ο�>�� �̶�� ���ڰ� ��µǵ��� �Ͻÿ�. 
--�׸��� ��°���� �������� ���� �μ����� ��µǾ�� �մϴ�.
 select NVL(d.department_name,'�̹�ġ�ο�') department_name , count(*)
 from employees e, departments d 
 where e.department_id = d.department_id(+)
 group by d.department_name
 order by count(*) desc;

--3)�� �μ� �̸� ���� 2005�� ������ �Ի��� �������� �ο����� ��ȸ�Ͻÿ�.
-- <��� :    �μ���		�Ի�⵵	�ο���  >
 select NVL(d.department_name,'�̹�ġ�ο�') department_name , count(*)
 from employees e, departments d 
 where e.department_id = d.department_id(+)
 and to_char(e.hire_date,'yyyy') <= '2005'
 group by d.department_name
 order by department_name; 
 
 
--4)��å(job_title)���� 'Manager'�� �����̵� ����� �̸�(first_name), ��å(job_title), �μ���(department_name)�� ��ȸ�Ͻÿ�.
 select e.first_name, j.job_title, d.department_name
 from employees e, departments d , jobs j 
 where e.department_id = d.department_id
 and e.job_id = j.job_id
 and j.job_title like '%Manager%'
;
  
  
--5)'Executive' �μ��� �ӿ� �ִ� �������� ������ �̸��� ��ȸ�Ͻÿ�. 
--��, �����ڰ� ���� ������ �ִٸ� �� ���� ������ ��°���� ���Խ��Ѿ� �մϴ�.
-- <��� : �μ���ȣ ������  �����ڸ�  >
 select e.department_id, e.first_name, m.first_name
 from employees e, departments d , employees m 
 where e.department_id = d.department_id
 and e.manager_id = m.manager_id(+)
 and d.department_name = 'Executive'




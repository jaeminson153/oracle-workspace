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
 
 
--USING :�� ���̺� �� ���� ���ǿ� ���Ǵ� �÷����� ������ ��� USING�� ����Ѵ�.
--       ������ �ٸ� ��쵵 �����Ƿ� USING ��� ON ���� ����ϴ� ���� �Ϲ����̴�.
SELECT department_id, first_name, job_id, job_title  
FROM employees  
INNER JOIN jobs USING(job_id);
   
SELECT first_name, hire_date, department_name, city
FROM employees 
INNER JOIN departments USING(department_id)
INNER JOIN locations USING(location_id)
WHERE  city='Seattle';


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
 and j.job_title like '%Manager%';
  
  
--5)'Executive' �μ��� �ӿ� �ִ� �������� ������ �̸��� ��ȸ�Ͻÿ�. 
--��, �����ڰ� ���� ������ �ִٸ� �� ���� ������ ��°���� ���Խ��Ѿ� �մϴ�.
-- <��� : �μ���ȣ ������  �����ڸ�  >
 select e.department_id, e.first_name, m.first_name
 from employees e, departments d , employees m 
 where e.department_id = d.department_id
 and e.manager_id = m.manager_id(+)
 and d.department_name = 'Executive';

-------------------------------------------------------------------
-- 2025.05.28 subquery
-------------------------------------------------------------------
/*-----------------------------------------------------------------------------------------
��������(subquery)
 �ϳ��� SQL���ȿ� ���ԵǾ� �ִ� �� �ٸ� SQL���� ���Ѵ�.
 ���������� �˷����� ���� ������ �̿��� �˻��� ���� ����Ѵ�.
 ���������� ���������� ���������� �����ϴ� �������� �����̴�.
 ���������� ���������� �÷��� ��� ����� �� ������ ���������� ���������� �÷��� ����� �� ����. 
 ���� ����� �������� �÷��� ǥ���ؾ� �Ѵٸ� ���ι������ 
    ��ȯ�ϰų� �Լ�, ��Į�� ��������(scarar subquery)���� ����ؾ� �Ѵ�. 
 ������ ���հ��� ��(Product)�� �����̴�. 
 
�ܺ� ���� (��������)
 :�Ϲ� ������ �ǹ��մϴ�.
��Į�� ��������
 :SELECT ���� ������ ���Ǵ� ����, �Լ�ó�� ���ڵ�� ��Ȯ�� �ϳ��� ������ ��ȯ�ϴ� ���������Դϴ�.
�ζ��� ��
 :FROM ���� ���Ǵ� ������, ���ϴ� �����͸� ��ȸ�Ͽ� ������ ������ ����� ������ �����ϰų� ������ ������ �ٽ� ��ȸ�� �� ����մϴ�.


���������� ����� �� ���� ���׿� ����
  ���������� ��ȣ�� ���μ� ����Ѵ�. 
  ���������� ���� ��(Single Row) �Ǵ� ���� ��(Multiple Row) �� �����ڿ� �Բ� ��� �����ϴ�. 
  ���� �� �� �����ڴ� ���������� ����� �ݵ�� 1�� �����̾�� �ϰ� ���� �� �� �����ڴ� ���������� ��� �Ǽ��� ��� ����. 
  �������������� ORDER BY�� ������� ���Ѵ�. 
  ORDER BY���� SELECT������ ���� �� ���� �� �� �ֱ� ������ ORDER BY���� ���������� ������ ���忡 ��ġ�ؾ� �Ѵ�.
  

���� ���� ��밡���� ��ġ
SELECT, FROM, WHERE, HAVING,ORDER BY 
INSERT���� VALUES,
UPDATE���� SET, 
CREATE��

���������� ������ �����ϴ� ����̳� ��ȯ�Ǵ� �������� ���¿� ���� �з��� �� �ִ�.
1 �����ϴ� ��Ŀ� ���� �������� �з�
  Un-Correlated(�񿬰�) : ���������� �������� �÷��� ������ ���� �ʴ� ������ ���������̴�.
          ���������� ��(���������� ����� ���)�� �����ϱ� ���� ��������  �ַ� ����Ѵ�.
  Correlated(����) : ���������� �������� Į���� ������ �ִ� ������ ���������̴�.
          �Ϲ������� ���������� ���� ����Ǿ� ������ �����͸� ������������ ������ �´��� Ȯ��
	  �ϰ��� �� �� �ַ� ���ȴ�.  (EXISTS���������� �׻� ���� ���������� ���ȴ�. ������ �����ϴ� 1�Ǹ� ã����
	  �߰� �˻��� ���� �ʴ´�.)
2 ��ȯ�Ǵ� �������� ���¿� ���� �������� ����
  Single Row(������ ��������) : ���������� �������� �׻� 1�� ������ ���������� �ǹ��Ѵ�. 
          ������ ���������� ���� �� �� �����ڿ� �Բ� ���ȴ�.
	  ���� �� �� �����ڴ� =, <, <=, >, >=, <>�� �ִ�.
  Multi Row(������ ��������) : ���������� ���� ����� ���� ���� ���������� �ǹ��Ѵ�. 
          ���� �� ���������� ���� �� �� �����ڿ� �Բ� ���ȴ�. 
	  ���� �� �� �����ڿ��� in, all, any, some, exists�� �ִ�.
	      in : ���������� ������('='�����ڷ� ���� ���)�� ���������� ��� �߿���
               �ϳ��� ��ġ�ϸ� ���̴�.
           any,some : ���� ������ �� ������ ���� ������ �˻� ����� �ϳ� �̻��� ��ġ�ϸ�
                ���̴�.
           all : ���� ������ �� ������ ���� ������ �˻� ����� ��� ���� ��ġ�ϸ� ���̴�.
           exists : ���� ������ �� ������ ���� ������ ��� �߿��� �����ϴ� ���� �ϳ���
               �����ϸ� ���̴�.
  Multi Column(����Į�� ��������) : ���������� ���� ����� ���� �÷��� ��ȯ�Ѵ�.
          ���������� �������� ���� �÷��� ���ÿ� ���� �� �ִ�. 
	  ���������� ������������ ���ϰ��� �ϴ� �÷� ������ �÷��� ��ġ�� �����ؾ� �Ѵ�.
https://www.w3resource.com/sql/subqueries/correlated-subqueries-using-aliases.php	  
--------------------------------------------------------------------------------- */ 
-- 90�� �μ����� �ٹ��ϴ� Lex�� �μ����� ����Ͻÿ�.
select d.department_name
from departments d 
where d.department_id = 90 ;

-- Lex�� �ٹ��ϴ� �μ����� ����Ͻÿ�.
select e.department_id
from employees e 
where e.first_name = 'Lex';

select d.department_name
from departments d , employees e
where d.department_id = e.department_id
and e.first_name = 'Lex';

select d.department_name
from departments d 
where d.department_id = (select e.department_id
                        from employees e 
                        where e.first_name = 'Lex');
                        
/* ������� 
1. �������� ����
2. ���� From 
3. ���� where 
4. ���� select 
*/

 --'Lex'�� ������ ����(job_id)�� ���� ����� �̸�(first_name), 
 -- ������(job_title), �Ի���(hire_date)�� ����Ͻÿ�.   
select e.first_name, j.job_title , e.hire_date
from employees e, jobs j 
where e.job_id = j.job_id
and e.job_id in (
                    select job_id 
                    from employees e 
                    where e.first_name = 'Lex'
                );

-- 'IT' �� �ٹ��ϴ� ����̸� , �μ���ȣ�� ����Ͻÿ�.
select e.first_name, e.department_id
from employees e 
where e.department_id = (select department_id from departments where department_name = 'IT');

-- 'Bruce' ���� �޿��� ���� ���� ����̸�, �μ���, �޿��� ���
select e.first_name, d.department_name, e.salary
from employees e , departments d
where e.department_id = d.department_id
and e.salary > (select salary from employees where first_name = 'Bruce')
order by salary;

select e.first_name, e.salary, hire_date, department_id 
from employees e
where department_id in (select department_id from employees where first_name = 'Steven');

--------------------------------------------------------------------------------------------
-- �μ����� ���� �޿��� ���� �޴� ����̸�, �μ���ȣ, �޿��� ��� 
--------------------------------------------------------------------------------------------
select first_name, e.department_id, salary
from employees e 
where (department_id, salary) in (
                            select department_id, max(salary)
                            from employees e 
                            group by e.department_id
                            ) ;
                            
-- �μ��� IT �� ���Ե� ����� ���� �����, �μ���ȣ, �μ��� �� ��� 
select e.first_name, e.department_id, d.department_name
from employees e , departments d 
where e.department_id = d.department_id
and e.department_id in (select department_id from departments where department_name like '%IT%');

--------------------------------------------------------------------------------------------------
--30�Ҽӵ� ����� �߿��� �޿��� ���� ���� ������� �� ���� �޿��� �޴�
--����̸�, �޿�, �Ի����� ����Ͻÿ�. (ALL)
--(������������ max()�Լ��� ������� �ʴ´�);
--------------------------------------------------------------------------------------------------
select e.first_name, e.salary, e.hire_date
from employees e
where e.salary > ALL (
                    select e.salary
                    from employees e 
                    where department_id = '30')
order by salary ;

--------------------------------------------------------------------------------------------------
 --30�Ҽӵ� ������� ���� �޿�����  ���� �޿��� �޴� 
--����̸�, �޿�, �Ի����� ����Ͻÿ�. (ANY)
--(������������ min()�Լ��� ������� �ʴ´�);
--------------------------------------------------------------------------------------------------
select e.first_name, e.salary, e.hire_date, e.department_id
from employees e
where e.salary > ANY (
                    select e.salary
                    from employees e 
                    where department_id = '30'  )
and e.department_id != '30'                    
order by salary ;

 
 --Toronto ���ÿ� �ٹ��ϴ� ������� �޴� �ּұ޿����� ���� �޴�  �����
--first_name, city, salary�� ����Ͻÿ�(ANY)
--Toronto�� �����Ѵ�. 
select e.first_name, l.city, salary
from employees e, departments d , locations l 
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.city != 'Toronto'
and e.salary > any (
                    select e.salary
                    from employees e, departments d , locations l 
                    where e.department_id = d.department_id
                    and d.location_id = l.location_id
                    and l.city = 'Toronto') ;
                    
--------------------------------------------------------------------------                    
/*-----------------------------------------------------
 ������� ��������
 : ������������ ���������� �÷��� �����Ѵ�.(���������� ���������Ѵ�.)
   ���������� �������� ������ �࿡ ���ؼ� ���������� �ѹ��� �����Ѵ�.
 <�Ʒ� ���� ó������>
 1st : �ٱ��� ������ ù° row�� ���Ͽ� 
 2nd : ���� �������� �ڽ��� �����ִ� �μ��� MAX salary��
       ���Ͽ� true �̸� �ٱ��� �÷����� ��ȯ�ϰ� , 
       false �̸� ���� ������. 
 3rd : �ٱ��� ������ �� ��° row�� ���Ͽ� ���������� �����ϸ�, 
       �̷��� �ٱ��� ������ ������ row���� �����Ѵ�. 
	   
https://www.w3resource.com/sql/subqueries/correlated-subqueries-using-aliases.php	   
----------------------------------------------------*/
--------------------------------------------------------------------------
-- ����� �ִ� �μ��� ���������� (����)
select d.department_id, d.department_name
from departments d 
where department_id in (select department_id from employees where department_id is not null) ;

-- ��� 
select d.department_id, d.department_name
from departments d 
where department_id in (select department_id from employees where department_id = d.department_id) ;

select d.department_id, d.department_name
from departments d 
where exists (select 1 from employees where department_id = d.department_id) ;

-- EXISTS �������� �۵����
--     ��EXISTS�� �������� ����� 1���̶� �����ϴ����� üũ�մϴ�.
--     ����� ��ȯ��(���⼱ SELECT 1)�� �߿����� �ʽ��ϴ�.
--     �� ���ɻ� ������ ���� �� ������ �����ϴ� ù ��° ���� ã�� ��� ����
  SELECT department_id, department_name
  FROM departments d
   WHERE  EXISTS (
                    SELECT 1
                    FROM employees
                    WHERE department_id   = d.department_id                                      
                      )
   ORDER BY department_id;     
 
 /*
 1. FROM departments d
    |
   ��
2. �� �μ� d�� ���� ���� �������� ����:
     EXISTS (
        SELECT 1
        FROM employees e
        WHERE e.department_id = d.department_id
     )
   �� �μ��� ���� ������ ������ TRUE
    |
   ��
3. WHERE ���� �����ϴ� �μ��� ����
    |
   ��
4. SELECT department_id, department_name ���
    |
   ��
5.  ORDER BY department_id;   ���
 */

  SELECT department_id, department_name
    FROM departments d
   WHERE NOT EXISTS (
                    SELECT 1
                    FROM employees
                    WHERE department_id   = d.department_id                                      
                      )
   ORDER BY department_id;

-- �μ��� �ִ� ����� ������ ����϶�
 select e.employee_id, e.first_name, e.department_id
 from employees e 
 where exists (select 1 from departments d where d.department_id = e.department_id);
 
 select e.employee_id, e.first_name, e.department_id
 from employees e 
 where not exists (select 1 from departments d where d.department_id = e.department_id);
 
 -- �����ڰ� �ִ� ��������� ���
 select e.employee_id, e.first_name, e.department_id
 from employees e 
 where exists (select 1 from employees where employee_id = e.manager_id);
 
 select e.employee_id, e.first_name, e.department_id
 from employees e 
 where not exists (select 1 from employees where employee_id = e.manager_id);
 
 /*=========================================================
Top-N ��������                   ######  ����¡ ó�� �Ҷ� ######
   ������ ���� �����Ҷ� ���ȴ�.
   <, <=�����ڸ� ����Ҽ� �ִ�. �� �񱳵Ǵ� ���� 1�϶��� =�� �����ϴ�.
   order by���� ����� �� �ִ�.
   
   from ������ ���� ���������� �ζ��κ�� �Ѵ�.
   �Ϲ��� �������������� order by�� ���Ұ� ����.
=========================================================*/
-- �޿��� ���� ���� ���� 3���� �˻��Ͻÿ�.
select rownum, emp.first_name, emp.salary
from (
    select first_name, salary
    from employees e 
    order by salary desc 
    ) emp 
where rownum <=3;    

------------------------------------------------------------------------------------
-- �޿��� ���� ���� ���� 4������ 8������ �˻��Ͻÿ�.    ###  ����¡ ó�� �Ҷ� ###
------------------------------------------------------------------------------------
select *
from (
        select rownum rm, emp.first_name, emp.salary
        from (
            select first_name, salary
            from employees e 
            order by salary desc 
            ) emp 
        --where rownum <=4 
      ) ee
where rm between 4 and 8 ;      

--�� �� �Ի��� ���� ��ȸ�ϵ� �Ի��ڼ��� ���� ���� ���� 3���� ��µǵ��� �Ͻÿ�.
--  <���:   ��     �Ի��ڼ� >
select rownum, emp.*
from (
        select to_char(hire_date,'MM')  , count(*)
        from employees e 
        group by to_char(hire_date,'MM')  
        order by count(*) desc 
      ) emp 
where rownum <=3;      
      
/*-----------------------------------------------------------
       ����
 -------------------------------------------------------------*/
--1) department_id�� 60�� �μ��� ���ø��� �˾Ƴ��� SELECT������ ����Ͻÿ�
select city
from locations a 
where a.location_id = (select location_id from departments where department_id = '60');
    
--2)����� 107�� ����� �μ�������,167���� �޿����� ���� ������� ���,�̸�(first_name),�޿��� ����Ͻÿ�.
 select employee_id, first_name, salary
 from employees e 
 where department_id = (select department_id from employees where employee_id = '107')
 and salary > (select salary from employees where employee_id = '167') ;
   
                  
--3) �޿���պ��� �޿��� ���Թ޴� ������� Ŀ�̼��� �޴� ������� ���,�̸�(first_name),�޿�,Ŀ�̼� �ۼ�Ʈ�� ����Ͻÿ�.
 select employee_id, first_name, salary, e.commission_pct
 from employees e 
 where salary < (select avg(salary) from employees)   
 and e.commission_pct is not null;
    
    
--4)�� �μ��� �ּұ޿��� 20�� �μ��� �ּұ޿����� ���� �μ��� ��ȣ�� �׺μ��� �ּұ޿��� ����Ͻÿ�.
 select NVL(to_char(department_id),'CEO'), min(salary) 
 from employees e 
 group by department_id 
 having min(salary) > (select min(salary) from employees where department_id = '20');
    
--5) �����ȣ�� 177�� ����� ��� ������ ���� ����� ����̸�(first_name)�� ������(job_id)�Ͻÿ�.   
 select first_name, job_id
 from employees e  
 where job_id = (select job_id from employees where employee_id = 177);
  
--6) �ּ� �޿��� �޴� ����� �̸�(first_name), ��� ����(job_id) �� �޿�(salary)�� ǥ���Ͻÿ�(�׷��Լ� ���).
 select first_name, job_id, salary
 from employees e 
 where salary = (select min(salary) from employees);
				
--7)������ ��� �޿��� ���� ����  ����(job_id)�� ã�� ����(job_id)�� ��� �޿��� ǥ���Ͻÿ�.
select job_id, avg(salary)
from employees 
group by job_id
having avg(salary) = (
                        select min(salary)
                        from (
                        select job_id, avg(salary) salary
                        from employees 
                        group by job_id
                        )
                     );
					  
--8) �� �μ��� �ּ� �޿��� �޴� ����� �̸�(first_name), �޿�(salary), �μ���ȣ(department_id)�� ǥ���Ͻÿ�.
 select first_name, salary, department_id
 from employees e 
 where (department_id, salary) in (select department_id, min(salary) from employees group by department_id);


--9)��� ������ ���α׷���(IT_PROG)�� ��� ������� �޿��� �����鼭 
--������ ���α׷���(IT_PROG)�� �ƴ�  ������� �����ȣ(employee_id), �̸�(first_name), 
--��� ����(job_id), �޿�(salary))�� ����Ͻÿ�.
 select employee_id, first_name, job_id, salary
 from employees e            
 where salary < all (select salary from employees where job_id = 'IT_PROG')
 and job_id != 'IT_PROG';

--10)���������� ���� ��� ����� �̸��� ǥ���Ͻÿ�.
select first_name 
from employees e 
where not exists (select 1 from employees where manager_id = e.employee_id)
order by employee_id;

select first_name 
from employees e 
where exists (select 1 from employees where manager_id = e.employee_id)
order by employee_id;


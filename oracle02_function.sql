/*=====================================================
SQL(structured query language)�Լ�
1. �������Լ� : �� �ϳ��� �ϳ��� ����� ����Ѵ�
              (�����Լ�, �����Լ�, ��¥�Լ�, ��ȯ�Լ�, �Ϲ��Լ�)
2. �������Լ� : �� �������� �ϳ��� ����� ����Ѵ�
               (�հ�, ���, �ִ�, �ּ�, ����)  
====================================================== 
--SELECT�������� �ݵ�� ���̺���� ����ؾ� �Ѵ�.
--�׷��� SELECT���� ���̳� Ư���Լ��� �̿��ؼ� ������� �����ö�
-- ����� �� �ִ� DUAL�̶�� ���̺��� �����ϰ� �ִ�. */

select sysdate from dual;

SELECT LEVEL AS num
FROM DUAL
CONNECT BY LEVEL <= 10;
/*-----------------------
�����Լ�
---------------------------*/
-- �ܾ��� ù���ڸ� �빮�ڷ� �������ִ� �Լ�
select initcap('korea hello') from dual;

-- ��� ���ڸ� �빮�ڷ� 
select upper('korea') from dual;

select first_name, upper(first_name), last_name, upper(last_name)
from employees;

-- �ҹ��ڷ� ���� 
select lower('KOREA') from dual;

select first_name, lower(first_name), last_name, lower(last_name)
from employees;

-- employees ���̺� first_name�� Ja �� ������ �� 
select first_name, salary
from employees a  
where upper(first_name) like upper('%Ja%');

-- ������ ���̸� �����ϴ� �Լ�
select length('korea') from dual;
select length('�ѱ�') from dual;
select lengthb('korea') from dual;
select lengthb('�ѱ�') from dual;

create table user1(data varchar2(5));
alter table user1 modify data varchar2(6);
select * from user1;
insert into user1 values('south korea');
insert into user1 values('�ѱ�');

-- Ư�������� ���ڸ� ������ �ִ� �Լ�
-- substr(����, ������ġ, ����)
select substr('oracle test',2,2) from dual;
select substr('oracle test',-2,2) from dual;
select substr('����Ŭ �׽�Ʈ',2,4) from dual;

-- Ư�������� �ε����� ������ �ִ� �Լ� 
select instr('korea','kor') from dual;
select instr('�ѱ��ڹ�','�ڹ�') from dual;

-- �־��� ���ڿ����� �������� Ư�����ڸ� ä��� �Լ�
select lpad('korea', 8, '*') from dual;
select rpad('korea', 8, '*') from dual;

-- �־��� ���ڿ����� Ư������ ����
select ltrim('***korea**','*') from dual;
select rtrim('***korea**','*') from dual;
select trim('*' from '***korea**') from dual;

-- �־��� ���ڿ����� ���� ��������
select '    korea' , length('    korea'), ltrim('    korea'), length(ltrim('    korea')) from dual; 

--�־��� ���ڿ����� �������� ��������
SELECT 'korea   ', length('korea   '), rtrim('korea   '), length(rtrim('korea   ')) FROM dual;

--�־��� ���ڿ����� ������ ��������
SELECT  trim(' ' from '  korea   ' ), length(trim(' ' from '  korea   ' )) FROM dual;

-- �־��� ������ �ƽ�Ű �ڵ尪�� ���ϴ� �Լ�
select ascii('A'), ascii('a'), ascii('0') from dual;

-- �־��� �ƽ�Ű �ڵ尪�� ���ڸ� ���ϴ� �Լ�
select chr(65), chr(97), chr(48) from dual;

-- �־��� ���ڸ� �����ϴ� �Լ�
select concat('java','jsp') from dual;

/*----------------------------
 �����Լ�
-------------------------------*/
--3.55�� �Ҽ��� 1�� �ڸ����� ���Ͻÿ�(�ݿø�)
SELECT round(3.55, 1)
FROM dual;

SELECT round(42523.55, -1)
FROM dual;

SELECT round(42523.55, 0)
FROM dual;

--256.78�� ������ �ø��Ѵ�.(�ø�)
SELECT ceil(256.78)
FROM dual;

--289.78���� �Ҽ����ϴ� ������ ������.(����)
SELECT floor(289.78)
FROM dual;

--2�� 3�� (�ŵ�����)
SELECT power(2,3)
FROM dual;

--25�� ������
SELECT sqrt(25)
FROM dual;

--������
SELECT mod(10,3)
FROM dual;

/*-------------------------------
 ��¥�Լ�
-------------------------------*/
--���� �ý��ۿ��� �������ִ� ������ ��¥ ���ϴ� �Լ�
SELECT sysdate FROM dual;


SELECT sysdate + 1 FROM dual;

-- ù��° ������ �޿� �ι�° ���ڰ��� ���� ��¥�� ��ȯ
SELECT add_months(sysdate, 10) FROM dual;


/*==============================================
 ��ȯ�� �Լ�
   ����                ����            ��¥
 to_number()  <-> to_char( ) <-> to_date( )
==============================================*/
--1 ����->����
--ù��° ���ڰ��� �ι�° ���ڰ��� �������� ��ȯ���ִ� �Լ�
SELECT to_char(2532, '999,999.99') FROM dual;

SELECT to_char(2532, '000,000.00') FROM dual;

--�� ������ ��ȭ�� ǥ���� �� �� L��ȣ�� ����Ѵ�.
SELECT to_char(253212,'L999,999.99') FROM dual;

--2. ��¥ -> ����
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss day')  /* 12�ð�  */ 
FROM dual;

SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss dy') FROM dual;

SELECT to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss day')  /* 24?��?  */ 
FROM dual;

/*===============================
to_number( )
����->����
==================================*/
SELECT '253' || '12' FROM dual;  --25312

SELECT concat('253','12') FROM dual;  --25312

SELECT '253' + '12' FROM dual;   --265

SELECT to_number('253') + to_number('12') FROM dual;   --265

/*===============================
to_date()
 ����->��¥
=================================*/
SELECT to_date('2013-10-14') FROM dual;

---------------------------------------------------------
select first_name || '���� ' || to_char(hire_date,'yyyy') || '�� ' || 
        ltrim(to_char(hire_date,'mm'),0) || '�� ' || ltrim(to_char(hire_date,'dd'),0) || '�Ͽ� �Ի��߽��ϴ�.' AS "���"
from employees ;

/*====================================================================
�Ϲ��Լ�
nvl(�÷�, ��ü��) : ù��° ���ڰ��� null�̸� ��ü�� ���� ��ü�ؼ� ����Ѵ�.
nvl2(�÷�, ��ü1, ��ü2) : �÷��� ���� null�ƴϸ� ��ü1��, null�̸� ��ü2�� ����Ѵ�. 
nullif(ǥ����1, ǥ����2 ) : ǥ����1�� ǥ����2�� ������ NULL, �ٸ��� ǥ����1�� ����Ѵ�.

--��ü�� ���� �����̸� �ι�° ���ڰ��� ���ڸ� �����Ѵ�.
--��ü�� ���� �����̸� �ι�° ���ڰ��� ���ڸ� �����Ѵ�.
--��ü�� ���� ��¥�̸� �ι�° ���ڰ��� ��¥�� �����Ѵ�. 
=======================================================================*/

select commission_pct , nvl(commission_pct,0) 
from employees;

select first_name, manager_id, nvl(to_char(manager_id),'CEO') 
from employees ;

select commission_pct , nvl2(commission_pct,1,0) 
from employees;

select commission_pct, nullif( commission_pct, 0.4) 
from employees
where commission_pct in (0.4,0.3);

/*======================================================
decode(�÷�,��1, ó��1, ��2, ó��2,  �׹��� ó��)
java�� switch_case���� ��� 
======================================================*/
select first_name, department_id,
        decode(department_id, 10, 'ACCOUNTINT',
                                20,'RESEARCH',
                                30,'SALES',
                                40,'OPERATIONS','OTHERS')
from employees 
order by department_id;


--������ 'PR_REP' �� ����� 5%, 'SA_MAN'�� ����� 10%, 
--'AC_MGR'�� ����� 15%, 'PU_CLERK' �� ����� 20% �� �λ� 
select job_id, salary, decode(job_id, 'PR_REP', salary * 1.05,
                                        'SA_MAN', salary * 1.1,
                                        'AC_MGR', salary * 1.15,
                                        'PU_CLERK', salary * 1.2, salary) AS newSal
from employees ;

/*================================
case when ����1 then ���1
     when ����2 then ���2
     when ����3 then ���3
     else ���n
end AS alias;
�ڹٿ��� if-else�� ����� �ǹ�
==================================*/

--�Ի��Ͽ��� ���� 1-3�̸� '1��б�', 4-6�̸� '2��б�', 
--             7-9�̸� '3��б�', 10-12�̸� '4��б�'
--�� ó���� �ϰ� �����(first_name), 
--�Ի���(hire_date), �б�� ����Ͻÿ�.
select first_name, hire_date,
    case when to_char(hire_date,'mm') <= 3 then '1��б�'
        when to_char(hire_date,'mm') <= 6 then '2��б�'
        when to_char(hire_date,'mm') <= 9 then '3��б�'
        when to_char(hire_date,'mm') <= 12 then '4��б�'
     end as qq   
from employees;

/*=================================================
�����Լ�(Aggregate Function), �׷��Լ�(Group Function)
===================================================*/
select max(salary) from employees;
select count(salary) from employees;
select count(commission_pct) from employees;
select count(*) from employees;
select sum(salary) from employees;
select round(avg(salary),2) from employees;

--�����Լ��� �ܼ��÷��� �Բ� ��� �� �� ����.(��µǴ� ���ڵ���� �ٸ��� �����̴�)
--ORA-00937: not a single-group group function
--ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
SELECT first_name, count(*)
FROM employees;

select department_id , count(*)
from employees 
group by department_id 
order by department_id ;

-- 50������ �μ��� ���ؼ� null �� �ƴ� �μ����� �������� ����Ͻÿ�.
select department_id , count(*)
from employees 
where department_id <= 50 and department_id is not null 
group by department_id
order by department_id;

select department_id , count(*)
from employees 
group by department_id
having department_id <= 50 and department_id is not null 
order by department_id;

select department_id , count(*)
from employees 
group by department_id
having department_id <= 50 and department_id is not null and count(*) <= 5
order by department_id;

-- ������ �޿��հ踦 ����Ͻÿ�.
select job_id, sum(salary)
from employees
group by job_id;

--�μ��� �ּұ޿�, �ִ�޿���  �ּҰ��� �ִ밪�� ���� ���� ��쿡�� �μ��� ������������ ����Ͻÿ�.
select department_id, min(salary), max(salary)
from employees
group by department_id
having min(salary) <> max(salary)
order by department_id;

/*------------------------------
����
------------------------------*/
--1) ��������Դ� ���(Manager)�� �ִ�. ������ employees���̺� �����ϰ� �����
--   ���� �ο찡 �ִµ� �� ���(CEO)�� manager_id�÷����� NULL�̴�. ����� ���� �����
--   ����ϵ� manager_id�÷��� NULL ��� CEO�� ����Ͻÿ�.
select first_name, NVL(to_char(manager_id),'CEO') manager_id
from employees
where manager_id is null;    

--2) �����ֱٿ� �Ի��� ����� �Ի��ϰ� ��������� ����� �Ի����� ���Ͻÿ�.
select max(HIRE_DATE) , min(HIRE_DATE)
from employees;
 
--3) �μ����� Ŀ�̼��� �޴� ����� ���� ���Ͻÿ�.
select DEPARTMENT_ID, count(*)
from employees
where COMMISSION_PCT is not null
group by DEPARTMENT_ID;  
   
--4) �μ��� �ִ�޿��� 10000�̻��� �μ��� ����Ͻÿ�.   
select DEPARTMENT_ID,  max(salary)
from employees
group by DEPARTMENT_ID
having max(salary) >= 10000;

--5) employees ���̺��� ������ 'IT_PROG'�� ������� �޿������ ���ϴ� SELECT������ ����Ͻÿ�.
select avg(salary)
from employees
where job_id = 'IT_PROG' ;   

--6) employees ���̺��� ������ 'FI_ACCOUNT' �Ǵ� 'AC_ACCOUNT' �� ����� �� �ִ�޿���  ���ϴ�    SELECT������ ����Ͻÿ�.   
select max(salary)
from employees
where job_id in ('FI_ACCOUNT','AC_ACCOUNT') ;      

--7) employees ���̺��� 50�μ��� �ּұ޿��� ����ϴ� SELECT������ ����Ͻÿ�.
select min(salary)
from employees
where DEPARTMENT_ID = '50';      
    
--8) employees ���̺��� �Ʒ��� ���ó�� �Ի��ο��� ����ϴ� SELECT������ ����Ͻÿ�.
--   <���:  2001		   2002		       2003
--  	     1          7                6   >
select to_char(sum(decode(yyyy,'2001',cnt,0))) as "2001" 
    , to_char(sum(decode(yyyy,'2002',cnt,0))) as "2002"
    , to_char(sum(decode(yyyy,'2003',cnt,0))) as "2003"
from (
select to_char(HIRE_DATE,'yyyy') yyyy, count(*) cnt 
from employees 
group by to_char(HIRE_DATE,'yyyy')
having to_char(HIRE_DATE,'yyyy') <= '2003') x;  

select to_char(sum(decode(to_char(HIRE_DATE,'yyyy'),'2001',1,0))) as "2001" 
    , to_char(sum(decode(to_char(HIRE_DATE,'yyyy'),'2002',1,0))) as "2002"
    , to_char(sum(decode(to_char(HIRE_DATE,'yyyy'),'2003',1,0))) as "2003"
from employees;
    
--9) employees ���̺��� �� �μ��� �ο��� 10�� �̻��� �μ��� �μ��ڵ�,
--  �ο���,�޿��� ���� ���ϴ�  SELECT������ ����Ͻÿ�.
select DEPARTMENT_ID, count(*), sum(salary)
from employees
group by DEPARTMENT_ID
having count(*) >= 10;     
  
--10) employees ���̺��� �̸�(first_name)�� ����° �ڸ��� 'e'�� ������ �˻��Ͻÿ�.
select *
from employees
where substr(first_name,3,1) = 'e';  

select *
from employees
where instr(first_name,'e',3,1) = 3;  






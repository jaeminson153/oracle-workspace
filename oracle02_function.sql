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

select * from user1;
insert into user1 values('south korea');
insert into user1 values('�ѱ�');
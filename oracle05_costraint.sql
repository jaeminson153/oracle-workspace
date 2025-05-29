/*===============================
���̺� ���� ����
CREATE TABLE table_name(
  column_name datatype,
  column_name datatype
);

�ڷ���(datatype)
varchar2 - �������� ���ڸ� ����
char - �������� ���ڸ� ����
number(m)-��������
number(m,n)- �Ǽ�����
date - ��¥ ����
===============================*/
CREATE TABLE student(
  name varchar2(20), --����Ʈ(����,Ư������- 1byte / �ѱ�-3byte)
  age number(3),   --�ڸ���
  avg number(5,2), --5�� ��ü�ڸ���, 2�� �Ҽ��� �ڸ���
  hire date  
);

insert into student(name, age,avg, hire) values('ȫ�浿',30, 297.8512, sysdate);

select * from student;

desc student;

/*====================================
ALTER 
 ��ü(���̺�)�� ������ �������ִ� ��ɾ��̴�.
======================================*/
--���� : CREATE TABLE, CREATE SEQUENCE, CREATE VIEW, CREATE INDEX
--���� : ALTER TABLE, ALTER VIEW, ALTER INDEX, ALTER USER

alter table student 
add loc varchar2(50);

alter table student 
modify name varchar2(30);

alter table student 
rename column avg to jumsu;

alter table student 
rename to members;

/*================================================
TRUNCATE : ���̺� ����� �����͸� ��� �����Ѵ�.(auto COMMIT�� ��)
DROP : ���̺� ��ü�� �����Ѵ�.
DELETE : ���̺� ����� �����͸� ��� �����Ѵ�.(auto COMMIT�� �ȵ�)
==================================================*/
commit;
rollback;
select * from members;

delete from members;

truncate table members ;

drop table members;

/*================================================================
���Ἲ ��������
   ���Ἲ�� �����ͺ��̽� ���� �ִ� �������� ��Ȯ�� ������ �ǹ��Ѵٸ�
   ���������� �ٶ������� �ʴ� �����Ͱ� ����Ǵ� ���� �����ϴ� ���� ���Ѵ�.
   ���Ἲ �������� 5���� : not null, unique, primary key, foreign key, check
    not null : null�� ������� �ʴ´�.
    unique : �ߺ��� ���� ������� �ʴ´�. �׻� �����Ѱ��̴�.
    primary key : not null + unique
    foreign key : �����Ǵ� ���̺��� �÷��� ���� �����ϸ� ���ȴ�.
    check : ���� ������ �����Ͱ��� ������ ������ �����Ͽ� ������ ������ ����Ѵ�.

   ���Ἲ�������� 2���� ���� : �÷�����, ���̺���

    �÷����� ����
    CREATE TABLE emp06(
     id varchar2(10) constraint  emp06_id_pk primary key,
     name varchar2(20) constraint emp06_name_nk not null,
     age number(3) constraint emp06_age_uk check(age between 20 and 50),
     gen char(2) constraint emp06_gen_uk check(gen in('m','w')));
   
    ���̺� ���� ����-not null�� ���̺� �������� ������ �� ����.
     CREATE TABLE emp07(
     id varchar2(10),
     name varchar2(20) constraint emp07_name_nk not null,
     age number(3),
     gen char(2),
     constraint emp07_id_pk primary key(id),
     constraint emp07_age_uk check(age between 20 and 50),
     constraint emp07_gen_uk check(gen in('m','w')));
     
    --ORA-02290: üũ ��������(HR.EMP06_AGE_UK)�� ����Ǿ����ϴ�
    INSERT INTO emp06(id, name, age, gen)
    VALUES('100','PARK',15,'m');
    
    --ORA-01400: NULL�� ("HR"."EMP06"."ID") �ȿ� ������ �� �����ϴ�
    INSERT INTO emp06(id, name, age, gen)
    VALUES(null,'PARK',15,'m');
=================================================================*/
select * from tab;

insert into emp04(id,name,age,gen)
values(1,'Ȧ�浿', 30, 'm');

select * from emp04;

insert into emp04(id,name,age,gen)
values(1,null, 30, 'm');

/*=======================================================================
�������� �߰�
  ALTER TABLE table_name
       ADD constraint constraint_name constraint_type(column_name)
=========================================================================*/
alter table emp04
add constraint emp04_age_ck check(age between 20 and 50);

insert into emp04(id,name,age,gen)
values(2,'������', 30, 'm');

select * from emp04;

alter table emp04 
add constraint emp04_gen_ck check(gen in('m','w'));

insert into emp04(id,name,age,gen)
values(4,'����', 35, 'm');

alter table emp04 
add constraint emp04_name_uk unique(name);

-- NOT null ������ modify ������ ���������ϴ�. 
alter table emp04 
modify name not null;

insert into emp04(id,name,age,gen)
values(5,'�迬��', 35, 'm');

/*=================================================
�������� ����
 ALTER TABLE table_name
  DROP constraint constraint_name
======================================================*/

 ALTER TABLE emp04
   DROP CONSTRAINT emp04_age_chk;
   
insert into emp04(id,name,age,gen)
values(6,'�ڵ���', 10, 'w');
/*=============================================================
�������� ����
  ALTER TABLe table_name
     MODIFY column_name CONSTRAINT constraint_name constraint_type
============================================================*/

alter table emp04
modify age constraint emp04_age_ck check(age > 0);

insert into emp04(id,name,age,gen)
values(7,'�ڼֹ�', 6, 'w');

select * from emp04;

desc emp04;

/*=========================================================================

������ ��ųʸ�(Data Dictionary)
  ���� ������ ��ųʸ���� �Ѵ�.
  ������ ��ųʸ���  �޸𸮱����� ���Ͽ� ���� ��������, 
  �� ������Ʈ���� ���Ǵ� �������� ����, �������� ����,
  ����ڿ� ���� ����, �����̳� ��������, �ѿ����� ����, 
  ���翡 ������������ �����Ѵ�.
  constraint_type : primary key=> P     foregin key=>R
                   check, not null=>C
                   unique=>U
===========================================================================*/
select * from user_constraints
where constraint_name like '%EMP%04%';

create table dept01(
deptno number(2) constraint dept01_deptno_pk primary key,
dname varchar(20)
);

desc dept01;

INSERT INTO dept01
VALUES(10,'accounting');   

INSERT INTO dept01
VALUES(20,'sales');

INSERT INTO dept01
VALUES(30,'research'); 
   
SELECT * FROM dept01;  

--==================================
CREATE TABLE loc01(
  locno number(2),
  locname varchar2(20),
   CONSTRAINT loc01_locno_pk primary key(locno));
 
   INSERT INTO loc01
   VALUES(11,'seoul');
   
   INSERT INTO loc01
   VALUES(22,'jeju');
   
   INSERT INTO loc01
   VALUES(33,'busan');  
 
 SELECT * FROM loc01;
 
 --==================================
CREATE TABLE loc01(
  locno number(2),
  locname varchar2(20),
   CONSTRAINT loc01_locno_pk primary key(locno));
 
   INSERT INTO loc01
   VALUES(11,'seoul');
   
   INSERT INTO loc01
   VALUES(22,'jeju');
   
   INSERT INTO loc01
   VALUES(33,'busan');  
 
 SELECT * FROM loc01;

 CREATE TABLE emp07(
   empno number(2) constraint emp07_deptno_pk primary key,
   deptno number(2) 
         constraint emp07_deptno_fk references dept01(deptno),
   locno number(2) ,
        constraint emp07_locno_fk foreign key(locno) references loc01(locno)); 
        
 SELECT * FROM emp07;        

--���� ����
 INSERT INTO emp07(empno, deptno, locno)
 VALUES(1, 10, 11);
 
 INSERT INTO emp07(empno, deptno, locno)
 VALUES(2, 20, 22);

INSERT INTO emp07(empno, deptno, locno)
VALUES(3, null, null);
 
INSERT INTO emp07(empno, deptno, locno)
VALUES(4, 44, 55);

delete from dept01
where deptno = 20;

select * from dept01;
select * from emp07;
/*=========================================================================
�ٸ� ���̺��� ���� ���̺��� �����ؼ� ����ϰ� ��������
    ���������� �������� ���� ���̺��� �����͸� �����Ѵ�.
==========================================================================*/
ALTER TABLE emp07
 DROP CONSTRAINT emp07_deptno_fk;

/*=========================================================
�θ�Ű�� ������ �Ǹ� �����Ǵ� Ű�� ������ �ǵ��� cascade�� �����Ѵ�.
==========================================================*/
--����
INSERT INTO dept01
VALUES(20,'sales');

 -- CASCADE ����
ALTER TABLE emp07
 ADD constraint emp07_deptno_rk foreign key(deptno) references dept01(deptno) ON DELETE CASCADE;

delete from dept01
where deptno = 10;

select * from dept01;
select * from emp07;


/*==========================================
ON UPDATE CASCADE�� ����Ŭ���� �����ȵ�
�ذ��� : trigger
==========================================*/
CREATE OR REPLACE TRIGGER dept_tri
 AFTER UPDATE ON dept01 FOR EACH ROW
 BEGIN
  UPDATE emp07
  SET deptno=50
  WHERE deptno=20;
 END;
/

update dept01
set deptno = 50
where deptno = 20;














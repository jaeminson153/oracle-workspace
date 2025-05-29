/*===============================
테이블 구조 정의
CREATE TABLE table_name(
  column_name datatype,
  column_name datatype
);

자료형(datatype)
varchar2 - 가변길이 문자를 저장
char - 고정길이 문자를 저장
number(m)-정수저장
number(m,n)- 실수저장
date - 날짜 저장
===============================*/
CREATE TABLE student(
  name varchar2(20), --바이트(영문,특수문자- 1byte / 한글-3byte)
  age number(3),   --자릿수
  avg number(5,2), --5는 전체자릿수, 2은 소수점 자릿수
  hire date  
);

insert into student(name, age,avg, hire) values('홍길동',30, 297.8512, sysdate);

select * from student;

desc student;

/*====================================
ALTER 
 객체(테이블)의 구조를 변경해주는 명령어이다.
======================================*/
--생성 : CREATE TABLE, CREATE SEQUENCE, CREATE VIEW, CREATE INDEX
--수정 : ALTER TABLE, ALTER VIEW, ALTER INDEX, ALTER USER

alter table student 
add loc varchar2(50);

alter table student 
modify name varchar2(30);

alter table student 
rename column avg to jumsu;

alter table student 
rename to members;

/*================================================
TRUNCATE : 테이블에 저장된 데이터를 모두 제거한다.(auto COMMIT이 됨)
DROP : 테이블 자체를 제거한다.
DELETE : 테이블에 저장된 데이터를 모두 삭제한다.(auto COMMIT이 안됨)
==================================================*/
commit;
rollback;
select * from members;

delete from members;

truncate table members ;

drop table members;

/*================================================================
무결성 제약조건
   무결성이 데이터베이스 내에 있는 데이터의 정확성 유지를 의미한다면
   제약조건은 바람직하지 않는 데이터가 저장되는 것을 방지하는 것을 말한다.
   무결성 제약조건 5종류 : not null, unique, primary key, foreign key, check
    not null : null를 허용하지 않는다.
    unique : 중복된 값을 허용하지 않는다. 항상 유일한값이다.
    primary key : not null + unique
    foreign key : 참조되는 테이블의 컬럼의 값이 존재하면 허용된다.
    check : 저장 가능한 데이터값의 범위나 조건을 지정하여 설정한 값만을 허용한다.

   무결성제약조건 2가지 레벨 : 컬럼레벨, 테이블레벨

    컬럼레벨 설정
    CREATE TABLE emp06(
     id varchar2(10) constraint  emp06_id_pk primary key,
     name varchar2(20) constraint emp06_name_nk not null,
     age number(3) constraint emp06_age_uk check(age between 20 and 50),
     gen char(2) constraint emp06_gen_uk check(gen in('m','w')));
   
    테이블 레벨 설정-not null은 테이블 레벨에서 설정할 수 없다.
     CREATE TABLE emp07(
     id varchar2(10),
     name varchar2(20) constraint emp07_name_nk not null,
     age number(3),
     gen char(2),
     constraint emp07_id_pk primary key(id),
     constraint emp07_age_uk check(age between 20 and 50),
     constraint emp07_gen_uk check(gen in('m','w')));
     
    --ORA-02290: 체크 제약조건(HR.EMP06_AGE_UK)이 위배되었습니다
    INSERT INTO emp06(id, name, age, gen)
    VALUES('100','PARK',15,'m');
    
    --ORA-01400: NULL을 ("HR"."EMP06"."ID") 안에 삽입할 수 없습니다
    INSERT INTO emp06(id, name, age, gen)
    VALUES(null,'PARK',15,'m');
=================================================================*/
select * from tab;

insert into emp04(id,name,age,gen)
values(1,'홀길동', 30, 'm');

select * from emp04;

insert into emp04(id,name,age,gen)
values(1,null, 30, 'm');

/*=======================================================================
제약조건 추가
  ALTER TABLE table_name
       ADD constraint constraint_name constraint_type(column_name)
=========================================================================*/
alter table emp04
add constraint emp04_age_ck check(age between 20 and 50);

insert into emp04(id,name,age,gen)
values(2,'여진구', 30, 'm');

select * from emp04;

alter table emp04 
add constraint emp04_gen_ck check(gen in('m','w'));

insert into emp04(id,name,age,gen)
values(4,'박찬', 35, 'm');

alter table emp04 
add constraint emp04_name_uk unique(name);

-- NOT null 수정은 modify 문으로 수정가능하다. 
alter table emp04 
modify name not null;

insert into emp04(id,name,age,gen)
values(5,'김연아', 35, 'm');

/*=================================================
제약조건 삭제
 ALTER TABLE table_name
  DROP constraint constraint_name
======================================================*/

 ALTER TABLE emp04
   DROP CONSTRAINT emp04_age_chk;
   
insert into emp04(id,name,age,gen)
values(6,'박돌이', 10, 'w');
/*=============================================================
제약조건 수정
  ALTER TABLe table_name
     MODIFY column_name CONSTRAINT constraint_name constraint_type
============================================================*/

alter table emp04
modify age constraint emp04_age_ck check(age > 0);

insert into emp04(id,name,age,gen)
values(7,'박솔미', 6, 'w');

select * from emp04;

desc emp04;

/*=========================================================================

데이터 딕셔너리(Data Dictionary)
  데이 데이터 딕셔너리라고 한다.
  데이터 딕셔너리는  메모리구조와 파일에 대한 구조정보, 
  각 오브젝트들이 사용되는 공간들의 정보, 제약조건 정보,
  사용자에 대한 정보, 권한이나 프로파일, 롤에대한 정보, 
  감사에 대한정보들을 관리한다.
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

--정상 삽입
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
다른 테이블에서 현재 테이블을 참조해서 사용하고 있을때는
    제약조건을 제거한후 현재 테이블의 데이터를 삭제한다.
==========================================================================*/
ALTER TABLE emp07
 DROP CONSTRAINT emp07_deptno_fk;

/*=========================================================
부모키가 삭제가 되면 참조되는 키도 삭제가 되도록 cascade을 설정한다.
==========================================================*/
--삽입
INSERT INTO dept01
VALUES(20,'sales');

 -- CASCADE 설정
ALTER TABLE emp07
 ADD constraint emp07_deptno_rk foreign key(deptno) references dept01(deptno) ON DELETE CASCADE;

delete from dept01
where deptno = 10;

select * from dept01;
select * from emp07;


/*==========================================
ON UPDATE CASCADE은 오라클에서 제공안됨
해결방법 : trigger
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














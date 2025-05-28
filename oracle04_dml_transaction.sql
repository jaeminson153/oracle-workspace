/*==========================================================
오라클에서 제공되는 명령어
1 DML(Data Manipulation Language 데이터 조작어) : 
  데이터는 추가, 수정, 삭제, 검색, 병합해주는 명령어들이다.
  (insert, update, delete, select, merge)
2 DDL(Data Definition Language 데이터 정의어 ) : 
  테이블의 구조를 정의, 변경해주는 명령어들이다.
  (create, drop, alter, truncate)
3 DCL(Data Control Language 데이터 제어어) : 
  사용자의 권한을 부여,제거해주는 명령어들이다.(grant ,revoke)
4 TCL(Transaction Control Language 트랜잭션 처리어) : 
  트랜잭션 설정,취소을 처리해주는 명령어들이다
  (commit, rollback, savepoint)
==========================================================*/
drop table emp;

-- 테이블 구조 복사 
create table emp01 
as
select first_name, salary
from employees 
where 1=0;

-- insert into emp01 values('Lex',null);
insert into emp01(first_name) values('Paran');
select *
from emp01;


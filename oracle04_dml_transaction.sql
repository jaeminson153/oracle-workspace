/*==========================================================
����Ŭ���� �����Ǵ� ��ɾ�
1 DML(Data Manipulation Language ������ ���۾�) : 
  �����ʹ� �߰�, ����, ����, �˻�, �������ִ� ��ɾ���̴�.
  (insert, update, delete, select, merge)
2 DDL(Data Definition Language ������ ���Ǿ� ) : 
  ���̺��� ������ ����, �������ִ� ��ɾ���̴�.
  (create, drop, alter, truncate)
3 DCL(Data Control Language ������ �����) : 
  ������� ������ �ο�,�������ִ� ��ɾ���̴�.(grant ,revoke)
4 TCL(Transaction Control Language Ʈ����� ó����) : 
  Ʈ����� ����,����� ó�����ִ� ��ɾ���̴�
  (commit, rollback, savepoint)
==========================================================*/
drop table emp;

-- ���̺� ���� ���� 
create table emp01 
as
select first_name, salary
from employees 
where 1=0;

-- insert into emp01 values('Lex',null);
insert into emp01(first_name) values('Paran');
select *
from emp01;


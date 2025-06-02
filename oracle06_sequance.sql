/*-------------------------------------------------------------
 ������(sequence)
   ���̺� ���� ������ ���ڸ� �ڵ����� �����ϴ� �ڵ���ȣ �߻��̹Ƿ� ��������
   �⺻ Ű�� ����ϸ� ������� �δ��� ���� �� �ִ�.

     create sequence ��������
     start with  n - ������ ���۹�ȣ
     increment by n  -������ ����ġ
     nocache  -cache�� �޸𸮻��� ���������� �����ϰ� �ϴµ� �⺻���� 20�̴�.
              -nocache�� �޸𸮻��� �������� �������� �ʴ´�.
     nocycle  - cycle�� ������ ���������� �ִ밪���� ������ �Ϸ��ϸ� start with
                �ɼǿ� ������ ���۰����� �ٽ� �������� �����Ѵ�.
              - nocycle��  ������ �Ϸ�Ǹ� ������ �����Ѵ�.

    maxvalue n;- �������� ������ �ִ� �ִ밪�� �����Ѵ�.
              maxvalue�� �⺻���� ascending�϶� 1027��, descending �϶� -1�̴�.
-------------------------------------------------------------------------- */
select * from tab;

select * from emp03;

select * from user_sequences;
/*
create sequence emp03_num_seq
start with 1
increment by 1
nocache
nocycle;
*/

select emp03_num_seq.nextval from dual;
select emp03_num_seq.currval from dual;

insert into emp03(num, name)
values(emp03_num_seq.nextval, '������');

/*************************************************************/
create table mem(
num number,
name varchar2(50),
age number,
loc varchar2(30));

select * from mem;

--create sequence mem_num_seq

insert into mem
values (mem_num_seq.nextval, '���',30,'����');

select *
from departments a ;

select * from departments where department_name like '%IT%';


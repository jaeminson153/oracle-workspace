/*-------------------------------------------------------------
 시퀀스(sequence)
   테이블 내의 유일한 숫자를 자동으로 생성하는 자동번호 발생이므로 시퀀스를
   기본 키로 사용하면 사용자의 부담을 줄일 수 있다.

     create sequence 시퀀스명
     start with  n - 시퀀스 시작번호
     increment by n  -시퀀스 증가치
     nocache  -cache는 메모리상의 시퀀스값을 관리하게 하는데 기본값이 20이다.
              -nocache은 메모리상의 시퀀스를 관리하지 않는다.
     nocycle  - cycle은 지정된 시퀀스값이 최대값까지 증가를 완료하면 start with
                옵션에 지정된 시작값에시 다시 시퀀스를 시작한다.
              - nocycle은  증가가 완료되면 에러를 유발한다.

    maxvalue n;- 시퀀스가 가질수 있는 최대값을 지정한다.
              maxvalue의 기본값은 ascending일때 1027승, descending 일때 -1이다.
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
values(emp03_num_seq.nextval, '여진구');

/*************************************************************/
create table mem(
num number,
name varchar2(50),
age number,
loc varchar2(30));

select * from mem;

--create sequence mem_num_seq

insert into mem
values (mem_num_seq.nextval, '고수',30,'서울');

select *
from departments a ;

select * from departments where department_name like '%IT%';


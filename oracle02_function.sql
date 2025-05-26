/*=====================================================
SQL(structured query language)함수
1. 단일행함수 : 행 하나당 하나의 결과를 출력한다
              (문자함수, 숫자함수, 날짜함수, 변환함수, 일반함수)
2. 복수행함수 : 행 여러개당 하나의 결과를 출력한다
               (합계, 평균, 최대, 최소, 갯수)  
====================================================== 
--SELECT문에서는 반드시 테이블명을 명시해야 한다.
--그래서 SELECT절에 식이나 특정함수를 이용해서 결과값을 가져올때
-- 사용할 수 있는 DUAL이라는 테이블을 제공하고 있다. */

select sysdate from dual;

SELECT LEVEL AS num
FROM DUAL
CONNECT BY LEVEL <= 10;
/*-----------------------
문자함수
---------------------------*/
-- 단어의 첫글자만 대문자로 변경해주는 함수
select initcap('korea hello') from dual;

-- 모든 문자를 대문자로 
select upper('korea') from dual;

select first_name, upper(first_name), last_name, upper(last_name)
from employees;

-- 소문자로 변경 
select lower('KOREA') from dual;

select first_name, lower(first_name), last_name, lower(last_name)
from employees;

-- employees 테이블에 first_name에 Ja 가 포함이 된 
select first_name, salary
from employees a  
where upper(first_name) like upper('%Ja%');

-- 문자의 길이를 리턴하는 함수
select length('korea') from dual;
select length('한국') from dual;
select lengthb('korea') from dual;
select lengthb('한국') from dual;

create table user1(data varchar2(5));

select * from user1;
insert into user1 values('south korea');
insert into user1 values('한국');
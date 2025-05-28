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
alter table user1 modify data varchar2(6);
select * from user1;
insert into user1 values('south korea');
insert into user1 values('한국');

-- 특정범위의 문자를 추출해 주는 함수
-- substr(문자, 시작위치, 길이)
select substr('oracle test',2,2) from dual;
select substr('oracle test',-2,2) from dual;
select substr('오라클 테스트',2,4) from dual;

-- 특정문자의 인덱스를 추출해 주는 함수 
select instr('korea','kor') from dual;
select instr('한국자바','자바') from dual;

-- 주어진 문자열에서 왼쪽으로 특정문자를 채우는 함수
select lpad('korea', 8, '*') from dual;
select rpad('korea', 8, '*') from dual;

-- 주어진 문자열에서 특정문자 삭제
select ltrim('***korea**','*') from dual;
select rtrim('***korea**','*') from dual;
select trim('*' from '***korea**') from dual;

-- 주어진 문자열에서 왼쪽 공백제거
select '    korea' , length('    korea'), ltrim('    korea'), length(ltrim('    korea')) from dual; 

--주어진 문자열에서 오른쪽의 공백제거
SELECT 'korea   ', length('korea   '), rtrim('korea   '), length(rtrim('korea   ')) FROM dual;

--주어진 문자열에서 양쪽의 공백제거
SELECT  trim(' ' from '  korea   ' ), length(trim(' ' from '  korea   ' )) FROM dual;

-- 주어진 문자의 아스키 코드값을 구하는 함수
select ascii('A'), ascii('a'), ascii('0') from dual;

-- 주어진 아스키 코드값의 문자를 구하는 함수
select chr(65), chr(97), chr(48) from dual;

-- 주어진 문자를 연결하는 함수
select concat('java','jsp') from dual;

/*----------------------------
 숫자함수
-------------------------------*/
--3.55을 소수점 1의 자리까지 구하시오(반올림)
SELECT round(3.55, 1)
FROM dual;

SELECT round(42523.55, -1)
FROM dual;

SELECT round(42523.55, 0)
FROM dual;

--256.78을 무조건 올림한다.(올림)
SELECT ceil(256.78)
FROM dual;

--289.78에서 소수이하는 무조건 버린다.(버림)
SELECT floor(289.78)
FROM dual;

--2의 3승 (거듭제곱)
SELECT power(2,3)
FROM dual;

--25의 제곱근
SELECT sqrt(25)
FROM dual;

--나머지
SELECT mod(10,3)
FROM dual;

/*-------------------------------
 날짜함수
-------------------------------*/
--현재 시스템에서 제공해주는 오늘의 날짜 구하는 함수
SELECT sysdate FROM dual;


SELECT sysdate + 1 FROM dual;

-- 첫번째 인자의 달에 두번째 인자값을 더한 날짜를 반환
SELECT add_months(sysdate, 10) FROM dual;


/*==============================================
 변환형 함수
   숫자                문자            날짜
 to_number()  <-> to_char( ) <-> to_date( )
==============================================*/
--1 숫자->문자
--첫번째 인자값을 두번째 인자값의 형식으로 변환해주는 함수
SELECT to_char(2532, '999,999.99') FROM dual;

SELECT to_char(2532, '000,000.00') FROM dual;

--각 나라의 통화를 표현해 줄 때 L기호를 사용한다.
SELECT to_char(253212,'L999,999.99') FROM dual;

--2. 날짜 -> 문자
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss day')  /* 12시간  */ 
FROM dual;

SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss dy') FROM dual;

SELECT to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss day')  /* 24?ð?  */ 
FROM dual;

/*===============================
to_number( )
문자->숫자
==================================*/
SELECT '253' || '12' FROM dual;  --25312

SELECT concat('253','12') FROM dual;  --25312

SELECT '253' + '12' FROM dual;   --265

SELECT to_number('253') + to_number('12') FROM dual;   --265

/*===============================
to_date()
 문자->날짜
=================================*/
SELECT to_date('2013-10-14') FROM dual;

---------------------------------------------------------
select first_name || '님은 ' || to_char(hire_date,'yyyy') || '년 ' || 
        ltrim(to_char(hire_date,'mm'),0) || '월 ' || ltrim(to_char(hire_date,'dd'),0) || '일에 입사했습니다.' AS "결과"
from employees ;

/*====================================================================
일반함수
nvl(컬럼, 대체값) : 첫번째 인자값이 null이면 대체값 으로 대체해서 출력한다.
nvl2(컬럼, 대체1, 대체2) : 컬럼의 값이 null아니면 대체1로, null이면 대체2로 출력한다. 
nullif(표현식1, 표현식2 ) : 표현식1과 표현식2가 같으면 NULL, 다르면 표현식1로 출력한다.

--대체할 값이 숫자이면 두번째 인자값에 숫자를 지정한다.
--대체할 값이 문자이면 두번째 인자값에 문자를 지정한다.
--대체할 값이 날짜이면 두번째 인자값에 날짜를 지정한다. 
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
decode(컬럼,값1, 처리1, 값2, 처리2,  그밖의 처리)
java의 switch_case문과 비슷 
======================================================*/
select first_name, department_id,
        decode(department_id, 10, 'ACCOUNTINT',
                                20,'RESEARCH',
                                30,'SALES',
                                40,'OPERATIONS','OTHERS')
from employees 
order by department_id;


--직급이 'PR_REP' 인 사원은 5%, 'SA_MAN'인 사원은 10%, 
--'AC_MGR'인 사원은 15%, 'PU_CLERK' 인 사원은 20% 를 인상 
select job_id, salary, decode(job_id, 'PR_REP', salary * 1.05,
                                        'SA_MAN', salary * 1.1,
                                        'AC_MGR', salary * 1.15,
                                        'PU_CLERK', salary * 1.2, salary) AS newSal
from employees ;

/*================================
case when 조건1 then 결과1
     when 조건2 then 결과2
     when 조건3 then 결과3
     else 결과n
end AS alias;
자바에서 if-else와 비슷한 의미
==================================*/

--입사일에서 월이 1-3이면 '1사분기', 4-6이면 '2사분기', 
--             7-9이면 '3사분기', 10-12이면 '4사분기'
--로 처리를 하고 사원명(first_name), 
--입사일(hire_date), 분기로 출력하시오.
select first_name, hire_date,
    case when to_char(hire_date,'mm') <= 3 then '1사분기'
        when to_char(hire_date,'mm') <= 6 then '2사분기'
        when to_char(hire_date,'mm') <= 9 then '3사분기'
        when to_char(hire_date,'mm') <= 12 then '4사분기'
     end as qq   
from employees;

/*=================================================
집계함수(Aggregate Function), 그룹함수(Group Function)
===================================================*/
select max(salary) from employees;
select count(salary) from employees;
select count(commission_pct) from employees;
select count(*) from employees;
select sum(salary) from employees;
select round(avg(salary),2) from employees;

--집계함수와 단순컬럼은 함께 사용 할 수 없다.(출력되는 레코드수가 다르기 때문이다)
--ORA-00937: not a single-group group function
--ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
SELECT first_name, count(*)
FROM employees;

select department_id , count(*)
from employees 
group by department_id 
order by department_id ;

-- 50이하인 부서에 대해서 null 이 아닌 부서별의 직원수를 출력하시오.
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

-- 업무별 급여합계를 출력하시요.
select job_id, sum(salary)
from employees
group by job_id;

--부서별 최소급여, 최대급여를  최소값과 최대값이 같이 않은 경우에만 부서별 오름차순으로 출력하시오.
select department_id, min(salary), max(salary)
from employees
group by department_id
having min(salary) <> max(salary)
order by department_id;

/*------------------------------
문제
------------------------------*/
--1) 모든사원에게는 상관(Manager)이 있다. 하지만 employees테이블에 유일하게 상관이
--   없는 로우가 있는데 그 사원(CEO)의 manager_id컬럼값이 NULL이다. 상관이 없는 사원을
--   출력하되 manager_id컬럼값 NULL 대신 CEO로 출력하시오.
select first_name, NVL(to_char(manager_id),'CEO') manager_id
from employees
where manager_id is null;    

--2) 가장최근에 입사한 사원의 입사일과 가장오래된 사원의 입사일을 구하시오.
select max(HIRE_DATE) , min(HIRE_DATE)
from employees;
 
--3) 부서별로 커미션을 받는 사원의 수를 구하시오.
select DEPARTMENT_ID, count(*)
from employees
where COMMISSION_PCT is not null
group by DEPARTMENT_ID;  
   
--4) 부서별 최대급여가 10000이상인 부서만 출력하시오.   
select DEPARTMENT_ID,  max(salary)
from employees
group by DEPARTMENT_ID
having max(salary) >= 10000;

--5) employees 테이블에서 직종이 'IT_PROG'인 사원들의 급여평균을 구하는 SELECT문장을 기술하시오.
select avg(salary)
from employees
where job_id = 'IT_PROG' ;   

--6) employees 테이블에서 직종이 'FI_ACCOUNT' 또는 'AC_ACCOUNT' 인 사원들 중 최대급여를  구하는    SELECT문장을 기술하시오.   
select max(salary)
from employees
where job_id in ('FI_ACCOUNT','AC_ACCOUNT') ;      

--7) employees 테이블에서 50부서의 최소급여를 출력하는 SELECT문장을 기술하시오.
select min(salary)
from employees
where DEPARTMENT_ID = '50';      
    
--8) employees 테이블에서 아래의 결과처럼 입사인원을 출력하는 SELECT문장을 기술하시오.
--   <출력:  2001		   2002		       2003
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
    
--9) employees 테이블에서 각 부서별 인원이 10명 이상인 부서의 부서코드,
--  인원수,급여의 합을 구하는  SELECT문장을 기술하시오.
select DEPARTMENT_ID, count(*), sum(salary)
from employees
group by DEPARTMENT_ID
having count(*) >= 10;     
  
--10) employees 테이블에서 이름(first_name)의 세번째 자리가 'e'인 직원을 검색하시오.
select *
from employees
where substr(first_name,3,1) = 'e';  

select *
from employees
where instr(first_name,'e',3,1) = 3;  






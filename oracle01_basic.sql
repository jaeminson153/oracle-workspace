select * from employees;

select * from all_objects a 
where owner = 'HR'
and a.object_type = 'TABLE';

select *
from user_tables;

select * from tab;

select salary * 10 as bouns from employees;
desc employees; -- desc 구조확인. 


SELECT last_name || '님의 급여는' || salary ||  '입니다.' as name 
from employees;

select distinct first_name 
from employees;

select first_name , salary 
from employees a 
where salary < 3000;

-- employees테이블에서 first_name컬럼의 값이 'David' 일때의
-- first_name, salary을 출력하라.
SELECT first_name, salary
FROM employees
WHERE first_name != 'David';

--employees테이블에서 salary이 3000부터 5000까지 일때의
--first_name, hire_date, salary을 출력하라.
select FIRST_NAME, salary
from employees a 
where a.salary  in (3000,9000,17000);

select FIRST_NAME, hire_date, salary 
from employees a 
where a.salary  >= 3000 and salary <= 5000;

select FIRST_NAME, hire_date, salary 
from employees a 
where a.salary between 3000 and 5000;

--employees테이블에서 job_id가 'IT_PROG'이 아닐때
--first_name, email, job_id을 출력하라.
select FIRST_NAME, email, job_id
from employees a 
where NOT job_id = 'IT_PROG';

select FIRST_NAME, hire_date, salary 
from employees a 
where NOT a.salary between 3000 and 15000;

select FIRST_NAME, salary , commission_pct
from employees a 
where commission_pct is not null;

select first_name, salary, email
from employees 
where first_name like '%der%';

--employees테이블에서 first_name의 값중 'A'로 시작하고
--두번째 문자는 임의 문자이면 'exander'로 끝나는
--first_name, salary, email을 출력하라.


/*
 WHERE절에서 사용된 연산자 3가지 종류
 1 비교연산자 : = > >= < <= != <> ^=
 2 SQL연산자 : BETWEEN a AND b,  IN, LIKE, IS NULL
 3 논리연산자 : AND, OR, NOT
 
 우선순위
 1 괄호()
 2 NOT연산자
 3 비교연산자, SQL연산자
 4 AND
 5 OR
  */

/*////////////////////////////////////
////--문제--
/////////////////////////////////////*/ 
-- 1) employees테이블에서 급여가 17000이하인 사원의 사원번호, 사원명(first_name), 급여를 출력하시오.
SELECT employee_id, first_name, salary
from employees 
where salary <= 17000;

--2) employees테이블에서 2005년 1월 1일 이후에 입사한 사원을 출력하시오.
SELECT *
from employees 
where hire_date >= to_date('20050101','YYYYMMDD');

--3) employees테이블에서 급여가 5000이상이고 
--업무(job_id)이 'IT_PROG'이 사원의 사원명(first_name), 급여, 업무을 출력하시오.
SELECT first_name, salary, job_id
from employees 
where salary >= 5000
and job_id = 'IT_PROG';

--4) employees테이블에서 부서번호가 10, 40, 50 인 사원의 사원명(first_name), 부서번호, 이메일(email)을 출력하시오.
SELECT first_name, DEPARTMENT_ID, email
from employees 
where DEPARTMENT_ID in (10,40,50);

--5) employees테이블에서 사원명(first_name)이 even이 포함된 사원명,급여,입사일을 출력하시오.
SELECT first_name, salary, hire_date
from employees 
where first_name like '%even%';

--6) employees테이블에서 사원명(first_name)이 teve앞뒤에 문자가 하나씩 있는 사원명,급여,입사일을 출력하시오.
SELECT first_name, salary, hire_date
from employees 
where first_name like '_teve_';

--7) employees테이블에서 급여가 17000이하이고 커미션이 null이 아닐때의 사원명(first_name), 급여, 커미션을 출력하시오.
 SELECT first_name, salary, COMMISSION_PCT
from employees 
where salary <= 17000
and COMMISSION_PCT is not null;
  
--8) 2005년도에 입사한 사원의 사원명(first_name),입사일을 출력하시오.
SELECT first_name, hire_date
from employees 
where to_char(hire_date,'YYYY') = '2005'; 

--9) 커미션 지급 대상인 사원의 사원명(first_name), 커미션을 출력하시오.
 SELECT first_name, COMMISSION_PCT
from employees 
where 1=1
and COMMISSION_PCT is not null; 

--10) 사번이 206인 사원의 이름(first_name)과 급여를 출력하시오.
SELECT first_name, salary
from employees 
where EMPLOYEE_ID = 206;

--11) 급여가 3000이 넘는 업무(job_id),급여(salary)를 출력하시오.
SELECT first_name, job_id, salary
from employees 
where salary > 3000;

--12)'ST_MAN'업무을 제외한 사원들의 사원명(first_name)과 업무(job_id)을 출력하시오.
SELECT first_name, job_id
from employees 
where  job_id <> 'ST_MAN';

--13) 업무이 'PU_CLERK' 인 사원 중에서 급여가 10000 이상인 사원명(first_name),업무(job_id),급여(salary)을 출력하시오.
SELECT first_name, job_id, salary
from employees 
where  job_id = 'PU_CLERK'
and salary >= 10000;

--14) commission을 받는 사원명(first_name)을 출력하시오.
SELECT first_name, COMMISSION_PCT
from employees 
where COMMISSION_PCT is not null;

--15) 20번 부서와 30번 부서에 속한 사원의 사원명(fist_name), 부서를 출력하시오.
SELECT first_name, DEPARTMENT_ID
from employees 
where DEPARTMENT_ID in (20,30);

--16) 급여가 많은 사원부터 출력하되 급여가 같은 경우 사원명(first_name) 순서대로 출력하시오.
SELECT first_name, salary
from employees
order by salary desc, first_name;

--17) 업무이 'MAN' 끝나는 사원의 사원명(first_name), 급여(salary), 업무(job_id)을 출력하시오.
SELECT first_name, salary, job_id
from employees
where job_id like '%MAN';

/*=========================================
집합연산자(Set Operations)
===========================================*/
/*
-둘 이상의 query결과를 하나의 결과로 조합한다.
-select의 인자 갯수가 같아야 한다.
  첫번째 select가 2개이면 두번째 select도 2개여야 한다.
-타입이 일치해야 한다.  
 예를 들어 character이면 character이여야 한다.

집합연산자 종류
union(합집합)- 중복행이 제거된 두 query
union all(합집합)-중복행이 포함된 두 query행
intersect(교집합)-두 query에 공통적인 행
minus(차집합)-첫번째 query에 있는 행 중 두번째 query에 없는 행표시

집합연산자 사용이유
-서로 다른 테이블에서 유사한 형태의 결과를 반환하기 위해서
-서로 같은 테이블에서 서로 다른 질의를 수행하여 결과를 합치기 위해서
 */
--=============================================================
-- union
select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 40
union all
select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 60;

select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 40
intersect
select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 60;

-- 차집합 ( except )
select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 40
minus
select department_id, first_name, last_name
from employees a 
where department_id = 20 or department_id = 60;
















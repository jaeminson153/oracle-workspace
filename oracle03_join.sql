/*=======================================================
join : 여러개의 테이블에서 원하는 테이블을 추출해주는 쿼리문이다.

join은 oracle제품에서 사용되는 oracle용 join이 있고
모든 제품에서 공통적으로 사용되는 표준(ANSI) join이 있다.
미국 국립 표준 협회(American National Standards Institute)
========================================================*/
--1. carteian product(카티션 곱) 조인 : 
--   테이블 행의 갯수만큼 출력해주는 조인이다.
--1) oracle용 cartesian product
  SELECT e.department_id, e.first_name, e.job_id, j.job_title
  FROM employees e, jobs  j; --2,033
  
  SELECT *
  FROM employees; --107
  SELECT *
  FROM jobs;  --19
  
--(2) ANSI용 cross join
 SELECT e.department_id, e.first_name, e.job_id, j.job_title
 FROM employees e cross join jobs  j; 

 /*
 2. equi join
    가장 많이 사용되는 조인방법으로 조인 대상이 되는 두 테이블에서 공통적으로 존재하는 컬럼의 값이
    일치되는 행을 연결하여 결과를 생성하는 방법이다.
 */
 --(1) oracle용 equi join
  SELECT e.department_id, e.first_name, e.job_id, j.job_title
  FROM employees e, jobs  j
  WHERE e.job_id=j.job_id;
 
--(2) ansi용 inner join
 SELECT e.department_id, e.first_name, e.job_id, j.job_title  
  FROM employees e inner join jobs  j  
  ON e.job_id=j.job_id;

--employees와 departments테이블에서 사원번호(employee_id),
--부서번호(department_id), 부서명(department_name)을 검색하시오.
select e.employee_id, d.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select e.employee_id, d.department_id, d.department_name
from employees e inner join departments d
  on e.department_id = d.department_id;

select e.employee_id, d.job_id, d.JOB_TITLE
from employees e inner join jobs d
  on e.job_id = d.job_id;
  
select *
from employees e
where a.department_id is null;

 --job_id가 'FI_MGR'인 사원이 속한
 --급여(salary)의 최소값(min_salary), 최대값(max_salary)을 출력하시오. 
select e.first_name, e.job_id, j.min_salary, j.max_salary
from employees e, jobs j 
where e.job_id = j.job_id
and e.job_id = 'FI_MGR';

select e.first_name, e.job_id, j.min_salary, j.max_salary
from employees e inner join jobs j 
on e.job_id = j.job_id
where  e.job_id = 'FI_MGR';

--부서가 'Seattle'에 있는 부서에서 근무하는
--직원들의  first_name, hire_date, department_name, city
--출력하는 SELECT을 작성하시오.
select e.first_name, e.hire_date, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
and d.LOCATION_ID = l.location_id
and l.city = 'Seattle';

select e.first_name, e.hire_date, d.department_name, l.city
from employees e inner join departments d on e.department_id = d.department_id
                 inner join locations l   on d.LOCATION_ID = l.location_id
where l.city = 'Seattle';

-- 20번 부서의 이름과 그 부서에 근무하는 사원의 이름 을 출력하시요.
select e.first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id
and d.department_id = '20';

select e.first_name, d.department_name
from employees e inner join departments d
on e.department_id = d.department_id
where d.department_id = '20';

-- 1400, 1500번 위치의 도시이름과 그 곳에 있는 부서의 이름을 출력하시요.
select l.location_id, l.city, d.department_name
from locations l, departments d 
where l.location_id = d.location_id
and l.location_id in (1400,1500);

select l.location_id, l.city, d.department_name
from locations l inner join departments d 
on l.location_id = d.location_id
where l.location_id in (1400,1500);

/*===================================
3. non-equi join (비등가조인)
  (=)동등비교연산자를 제외한 >=, <=, >, <등의 연산자를 
  이용해서 조건을 지정하는 조인방법이다.
=======================================*/
--(1) oracle용 non-equi join
SELECT e.first_name, e.salary, j.min_salary,
               j.max_salary, j.job_title
FROM employees e, jobs j               
WHERE  e.job_id=j.job_id
  AND e.salary>=j.min_salary
       AND e.salary<=j.max_salary;

--(2) ansi용 non-equi join
SELECT e.first_name, e.salary, j.min_salary,
       j.max_salary, j.job_title
FROM employees e JOIN jobs j
ON e.job_id=j.job_id
WHERE e.salary>=j.min_salary
AND e.salary<=j.max_salary;

/*=================================================================
4. outer join
  한 테이블에는 데이터가 있고 다른 반대쪽에는 데이터가 없는 경우에
  데이터가 있는 테이블의 내용을 모두 가져오는 조건이다.
  https://dataschool.com/how-to-teach-people-sql/left-right-join-animated/
  ===============================================================*/
--(1) oracle outer join
  SELECT e.employee_id, e.first_name, e.employee_id, e.department_id, 
          d.department_id, d.department_name 
  FROM employees e, departments d
  WHERE e.department_id=d.department_id(+)
  ORDER BY e.employee_id;  /* LEFT OUTER JOIN*/

 SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e, departments d
 WHERE e.department_id(+)=d.department_id; /* RIGHT OUTER JOIN */

 --(2) ansi outer join
  SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e LEFT OUTER JOIN departments d
 ON e.department_id=d.department_id;
 
 SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e RIGHT OUTER JOIN departments d
 ON e.department_id=d.department_id;
 
 SELECT e.first_name, e.employee_id,
        e.department_id, d.department_id, d.department_name
 FROM employees e FULL OUTER JOIN departments d
 ON e.department_id=d.department_id;
 
  /*=================================================
5. self join
 하나의 테이블을 두개의 테이블로 설정해서 사용하는 조인방법이다.
 하나의 테이블에 같은데이터가 두개의 컬럼에 다른 목적으로 저장되여 있는 경우
 employees, employee_id, manager_id
====================================================*/
 --(1) oracle self join
 SELECT w.employee_id AS "사원번호",
               w.first_name AS "사원이름",
              w.manager_id  AS "관리자번호",
             m.first_name AS "관리자이름"
 FROM employees w, employees m
 WHERE w.manager_id=m.employee_id
 ORDER BY w.employee_id; 
 
 --(2) ansi self join
 SELECT w.employee_id AS "사원번호",
        w.first_name AS "사원이름",
        w.manager_id  AS "관리자번호",
        m.first_name AS "관리자이름"
 FROM employees w  JOIN employees m
 ON w.manager_id=m.employee_id
 ORDER BY w.employee_id;
 
 
--USING :두 테이블 간 조인 조건에 사용되는 컬럼명이 동일한 경우 USING을 사용한다.
--       하지만 다른 경우도 많으므로 USING 대신 ON 절을 사용하는 것이 일반적이다.
SELECT department_id, first_name, job_id, job_title  
FROM employees  
INNER JOIN jobs USING(job_id);
   
SELECT first_name, hire_date, department_name, city
FROM employees 
INNER JOIN departments USING(department_id)
INNER JOIN locations USING(location_id)
WHERE  city='Seattle';


 /*----------------------------------------------
 문제
 ----------------------------------------------   */
--1)EMPLOYEES 테이블에서 입사한 달(hire_date) 별로 인원수를 조회하시오 . 
--  <출력: 월        직원수   >
 SELECT  to_char(hire_date,'MM'), count(*)
 FROM employees e 
 group by to_char(hire_date,'MM')
 order by to_char(hire_date,'MM');
 
--2)각 부서에서 근무하는 직원수를 조회하는 SQL 명령어를 작성하시오. 
--단, 직원수가 5명 이하인 부서 정보만 출력되어야 하며 부서정보가 없는 직원이 있다면 부서명에 “<미배치인원>” 이라는 문자가 출력되도록 하시오. 
--그리고 출력결과는 직원수가 많은 부서먼저 출력되어야 합니다.
 select NVL(d.department_name,'미배치인원') department_name , count(*)
 from employees e, departments d 
 where e.department_id = d.department_id(+)
 group by d.department_name
 order by count(*) desc;

--3)각 부서 이름 별로 2005년 이전에 입사한 직원들의 인원수를 조회하시오.
-- <출력 :    부서명		입사년도	인원수  >
 select NVL(d.department_name,'미배치인원') department_name , count(*)
 from employees e, departments d 
 where e.department_id = d.department_id(+)
 and to_char(e.hire_date,'yyyy') <= '2005'
 group by d.department_name
 order by department_name; 
 
 
--4)직책(job_title)에서 'Manager'가 포함이된 사원의 이름(first_name), 직책(job_title), 부서명(department_name)을 조회하시오.
 select e.first_name, j.job_title, d.department_name
 from employees e, departments d , jobs j 
 where e.department_id = d.department_id
 and e.job_id = j.job_id
 and j.job_title like '%Manager%';
  
  
--5)'Executive' 부서에 속에 있는 직원들의 관리자 이름을 조회하시오. 
--단, 관리자가 없는 직원이 있다면 그 직원 정보도 출력결과에 포함시켜야 합니다.
-- <출력 : 부서번호 직원명  관리자명  >
 select e.department_id, e.first_name, m.first_name
 from employees e, departments d , employees m 
 where e.department_id = d.department_id
 and e.manager_id = m.manager_id(+)
 and d.department_name = 'Executive';

-------------------------------------------------------------------
-- 2025.05.28 subquery
-------------------------------------------------------------------
/*-----------------------------------------------------------------------------------------
서브쿼리(subquery)
 하나의 SQL문안에 포함되어 있는 또 다른 SQL문을 말한다.
 서브쿼리는 알려지지 않은 기준을 이용한 검색을 위해 사용한다.
 서브쿼리는 메인쿼리가 서브쿼리를 포함하는 종속적인 관계이다.
 서브쿼리는 메인쿼리의 컬럼을 모두 사용할 수 있지만 메인쿼리는 서브쿼리의 컬럼을 사용할 수 없다. 
 질의 결과에 서브쿼리 컬럼을 표시해야 한다면 조인방식으로 
    변환하거나 함수, 스칼라 서브쿼리(scarar subquery)등을 사용해야 한다. 
 조인은 집합간의 곱(Product)의 관계이다. 
 
외부 쿼리 (메인쿼리)
 :일반 쿼리를 의미합니다.
스칼라 서브쿼리
 :SELECT 절에 쿼리가 사용되는 경우로, 함수처럼 레코드당 정확히 하나의 값만을 반환하는 서브쿼리입니다.
인라인 뷰
 :FROM 절에 사용되는 쿼리로, 원하는 데이터를 조회하여 가상의 집합을 만들어 조인을 수행하거나 가상의 집합을 다시 조회할 때 사용합니다.


서브쿼리를 사용할 때 다음 사항에 주의
  서브쿼리를 괄호로 감싸서 사용한다. 
  서브쿼리는 단일 행(Single Row) 또는 복수 행(Multiple Row) 비교 연산자와 함께 사용 가능하다. 
  단일 행 비교 연산자는 서브쿼리의 결과가 반드시 1건 이하이어야 하고 복수 행 비교 연산자는 서브쿼리의 결과 건수와 상관 없다. 
  서브쿼리에서는 ORDER BY를 사용하지 못한다. 
  ORDER BY절은 SELECT절에서 오직 한 개만 올 수 있기 때문에 ORDER BY절은 메인쿼리의 마지막 문장에 위치해야 한다.
  

서브 쿼리 사용가능한 위치
SELECT, FROM, WHERE, HAVING,ORDER BY 
INSERT문의 VALUES,
UPDATE문의 SET, 
CREATE문

서브쿼리의 종류는 동작하는 방식이나 반환되는 데이터의 형태에 따라 분류할 수 있다.
1 동작하는 방식에 따른 서브쿼리 분류
  Un-Correlated(비연관) : 서브쿼리가 메인쿼리 컬럼을 가지고 있지 않는 형태의 서브쿼리이다.
          메인쿼리에 값(서브쿼리가 실행된 결과)를 제공하기 위한 목적으로  주로 사용한다.
  Correlated(연관) : 서브쿼리가 메인쿼리 칼럼을 가지고 있는 형태의 서브쿼리이다.
          일반적으로 메인쿼리가 먼저 수행되어 읽혀진 데이터를 서브쿼리에서 조건이 맞는지 확인
	  하고자 할 때 주로 사용된다.  (EXISTS서브쿼리는 항상 연관 서브쿼리로 사용된다. 조건을 만족하는 1건만 찾으면
	  추가 검색을 하지 않는다.)
2 반환되는 데이터의 형태에 따른 서브쿼리 종류
  Single Row(단일행 서브쿼리) : 서브쿼리의 실행결과가 항상 1건 이하인 서브쿼리를 의미한다. 
          단일행 서브쿼리는 단일 행 비교 연산자와 함께 사용된다.
	  단일 행 비교 연산자는 =, <, <=, >, >=, <>이 있다.
  Multi Row(다중행 서브쿼리) : 서브쿼리의 실행 결과가 여러 건인 서브쿼리를 의미한다. 
          다중 행 서브쿼리는 다중 행 비교 연산자와 함께 사용된다. 
	  다중 행 비교 연산자에는 in, all, any, some, exists가 있다.
	      in : 메인쿼리의 비교조건('='연산자로 비교할 경우)이 서브쿼리의 결과 중에서
               하나라도 일치하면 참이다.
           any,some : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상이 일치하면
                참이다.
           all : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 모든 값이 일치하면 참이다.
           exists : 메인 쿼리의 비교 조건이 서브 쿼리의 결과 중에서 만족하는 값이 하나라도
               존재하면 참이다.
  Multi Column(다중칼럼 서브쿼리) : 서브쿼리의 실행 결과로 여러 컬럼을 반환한다.
          메인쿼리의 조건절에 여러 컬럼을 동시에 비교할 수 있다. 
	  서브쿼리와 메인쿼리에서 비교하고자 하는 컬럼 갯수와 컬럼의 위치가 동일해야 한다.
https://www.w3resource.com/sql/subqueries/correlated-subqueries-using-aliases.php	  
--------------------------------------------------------------------------------- */ 
-- 90번 부서에서 근무하는 Lex의 부서명을 출력하시요.
select d.department_name
from departments d 
where d.department_id = 90 ;

-- Lex가 근무하는 부서명을 출력하시요.
select e.department_id
from employees e 
where e.first_name = 'Lex';

select d.department_name
from departments d , employees e
where d.department_id = e.department_id
and e.first_name = 'Lex';

select d.department_name
from departments d 
where d.department_id = (select e.department_id
                        from employees e 
                        where e.first_name = 'Lex');
                        
/* 실행순서 
1. 서브쿼리 실행
2. 메인 From 
3. 메인 where 
4. 메일 select 
*/

 --'Lex'와 동일한 업무(job_id)를 가진 사원의 이름(first_name), 
 -- 업무명(job_title), 입사일(hire_date)을 출력하시오.   
select e.first_name, j.job_title , e.hire_date
from employees e, jobs j 
where e.job_id = j.job_id
and e.job_id in (
                    select job_id 
                    from employees e 
                    where e.first_name = 'Lex'
                );

-- 'IT' 에 근무하는 사원이름 , 부서번호를 출력하시요.
select e.first_name, e.department_id
from employees e 
where e.department_id = (select department_id from departments where department_name = 'IT');

-- 'Bruce' 보다 급여를 많이 받은 사원이름, 부서명, 급여를 출력
select e.first_name, d.department_name, e.salary
from employees e , departments d
where e.department_id = d.department_id
and e.salary > (select salary from employees where first_name = 'Bruce')
order by salary;

select e.first_name, e.salary, hire_date, department_id 
from employees e
where department_id in (select department_id from employees where first_name = 'Steven');

--------------------------------------------------------------------------------------------
-- 부서별로 가장 급여를 많이 받는 사원이름, 부서번호, 급여를 출력 
--------------------------------------------------------------------------------------------
select first_name, e.department_id, salary
from employees e 
where (department_id, salary) in (
                            select department_id, max(salary)
                            from employees e 
                            group by e.department_id
                            ) ;
                            
-- 부서명에 IT 가 포함된 사람이 속한 사원명, 부서번호, 부서명 을 출력 
select e.first_name, e.department_id, d.department_name
from employees e , departments d 
where e.department_id = d.department_id
and e.department_id in (select department_id from departments where department_name like '%IT%');

--------------------------------------------------------------------------------------------------
--30소속된 사원들 중에서 급여를 가장 받은 사원보다 더 많은 급여를 받는
--사원이름, 급여, 입사일을 출력하시오. (ALL)
--(서브쿼리에서 max()함수를 사용하지 않는다);
--------------------------------------------------------------------------------------------------
select e.first_name, e.salary, e.hire_date
from employees e
where e.salary > ALL (
                    select e.salary
                    from employees e 
                    where department_id = '30')
order by salary ;

--------------------------------------------------------------------------------------------------
 --30소속된 사원들이 받은 급여보다  높은 급여를 받는 
--사원이름, 급여, 입사일을 출력하시오. (ANY)
--(서브쿼리에서 min()함수를 사용하지 않는다);
--------------------------------------------------------------------------------------------------
select e.first_name, e.salary, e.hire_date, e.department_id
from employees e
where e.salary > ANY (
                    select e.salary
                    from employees e 
                    where department_id = '30'  )
and e.department_id != '30'                    
order by salary ;

 
 --Toronto 도시에 근무하는 사원들이 받는 최소급여보다 많이 받는  사원의
--first_name, city, salary을 출력하시오(ANY)
--Toronto은 제외한다. 
select e.first_name, l.city, salary
from employees e, departments d , locations l 
where e.department_id = d.department_id
and d.location_id = l.location_id
and l.city != 'Toronto'
and e.salary > any (
                    select e.salary
                    from employees e, departments d , locations l 
                    where e.department_id = d.department_id
                    and d.location_id = l.location_id
                    and l.city = 'Toronto') ;
                    
--------------------------------------------------------------------------                    
/*-----------------------------------------------------
 상관관계 서브쿼리
 : 서브쿼리에서 메인쿼리의 컬럼을 참조한다.(메인쿼리를 먼저수행한다.)
   서브쿼리는 메인쿼리 각각의 행에 대해서 순서적으로 한번씩 실행한다.
 <아래 쿼리 처리순서>
 1st : 바깥쪽 쿼리의 첫째 row에 대하여 
 2nd : 안쪽 쿼리에서 자신의 속해있는 부서의 MAX salary과
       비교하여 true 이면 바깥의 컬럼값을 반환하고 , 
       false 이면 값을 버린다. 
 3rd : 바깥쪽 쿼리의 두 번째 row에 대하여 마찬가지로 실행하며, 
       이렇게 바깥쪽 쿼리의 마지막 row까지 실행한다. 
	   
https://www.w3resource.com/sql/subqueries/correlated-subqueries-using-aliases.php	   
----------------------------------------------------*/
--------------------------------------------------------------------------
-- 사원이 있는 부서만 가져오세요 (비상관)
select d.department_id, d.department_name
from departments d 
where department_id in (select department_id from employees where department_id is not null) ;

-- 상관 
select d.department_id, d.department_name
from departments d 
where department_id in (select department_id from employees where department_id = d.department_id) ;

select d.department_id, d.department_name
from departments d 
where exists (select 1 from employees where department_id = d.department_id) ;

-- EXISTS 서브쿼리 작동방식
--     ①EXISTS는 서브쿼리 결과가 1행이라도 존재하는지만 체크합니다.
--     ②실제 반환값(여기선 SELECT 1)은 중요하지 않습니다.
--     ③ 성능상 이점도 있음 → 조건을 만족하는 첫 번째 행을 찾는 즉시 종료
  SELECT department_id, department_name
  FROM departments d
   WHERE  EXISTS (
                    SELECT 1
                    FROM employees
                    WHERE department_id   = d.department_id                                      
                      )
   ORDER BY department_id;     
 
 /*
 1. FROM departments d
    |
   ↓
2. 각 부서 d에 대해 다음 서브쿼리 실행:
     EXISTS (
        SELECT 1
        FROM employees e
        WHERE e.department_id = d.department_id
     )
   → 부서에 속한 직원이 있으면 TRUE
    |
   ↓
3. WHERE 절을 만족하는 부서만 남김
    |
   ↓
4. SELECT department_id, department_name 출력
    |
   ↓
5.  ORDER BY department_id;   출력
 */

  SELECT department_id, department_name
    FROM departments d
   WHERE NOT EXISTS (
                    SELECT 1
                    FROM employees
                    WHERE department_id   = d.department_id                                      
                      )
   ORDER BY department_id;

-- 부서가 있는 사원의 정보를 출력하라
 select e.employee_id, e.first_name, e.department_id
 from employees e 
 where exists (select 1 from departments d where d.department_id = e.department_id);
 
 select e.employee_id, e.first_name, e.department_id
 from employees e 
 where not exists (select 1 from departments d where d.department_id = e.department_id);
 
 -- 관리자가 있는 사원정보를 출력
 select e.employee_id, e.first_name, e.department_id
 from employees e 
 where exists (select 1 from employees where employee_id = e.manager_id);
 
 select e.employee_id, e.first_name, e.department_id
 from employees e 
 where not exists (select 1 from employees where employee_id = e.manager_id);
 
 /*=========================================================
Top-N 서브쿼리                   ######  페이징 처리 할때 ######
   상위의 값을 추출할때 사용된다.
   <, <=연산자를 사용할수 있다. 단 비교되는 값이 1일때는 =도 가능하다.
   order by절을 사용할 수 있다.
   
   from 절에서 사용된 서브쿼리를 인라인뷰라 한다.
   일반적 서브쿼리에서는 order by가 사용불가 지만.
=========================================================*/
-- 급여가 가장 높은 상위 3명을 검색하시요.
select rownum, emp.first_name, emp.salary
from (
    select first_name, salary
    from employees e 
    order by salary desc 
    ) emp 
where rownum <=3;    

------------------------------------------------------------------------------------
-- 급여가 가장 높은 상위 4위부터 8위까지 검색하시요.    ###  페이징 처리 할때 ###
------------------------------------------------------------------------------------
select *
from (
        select rownum rm, emp.first_name, emp.salary
        from (
            select first_name, salary
            from employees e 
            order by salary desc 
            ) emp 
        --where rownum <=4 
      ) ee
where rm between 4 and 8 ;      

--월 별 입사자 수를 조회하되 입사자수가 가장 많은 상위 3개만 출력되도록 하시오.
--  <출력:   월     입사자수 >
select rownum, emp.*
from (
        select to_char(hire_date,'MM')  , count(*)
        from employees e 
        group by to_char(hire_date,'MM')  
        order by count(*) desc 
      ) emp 
where rownum <=3;      
      
/*-----------------------------------------------------------
       문제
 -------------------------------------------------------------*/
--1) department_id가 60인 부서의 도시명을 알아내는 SELECT문장을 기술하시오
select city
from locations a 
where a.location_id = (select location_id from departments where department_id = '60');
    
--2)사번이 107인 사원과 부서가같고,167번의 급여보다 많은 사원들의 사번,이름(first_name),급여를 출력하시오.
 select employee_id, first_name, salary
 from employees e 
 where department_id = (select department_id from employees where employee_id = '107')
 and salary > (select salary from employees where employee_id = '167') ;
   
                  
--3) 급여평균보다 급여를 적게받는 사원들중 커미션을 받는 사원들의 사번,이름(first_name),급여,커미션 퍼센트를 출력하시오.
 select employee_id, first_name, salary, e.commission_pct
 from employees e 
 where salary < (select avg(salary) from employees)   
 and e.commission_pct is not null;
    
    
--4)각 부서의 최소급여가 20번 부서의 최소급여보다 많은 부서의 번호와 그부서의 최소급여를 출력하시오.
 select NVL(to_char(department_id),'CEO'), min(salary) 
 from employees e 
 group by department_id 
 having min(salary) > (select min(salary) from employees where department_id = '20');
    
--5) 사원번호가 177인 사원과 담당 업무가 같은 사원의 사원이름(first_name)과 담당업무(job_id)하시오.   
 select first_name, job_id
 from employees e  
 where job_id = (select job_id from employees where employee_id = 177);
  
--6) 최소 급여를 받는 사원의 이름(first_name), 담당 업무(job_id) 및 급여(salary)를 표시하시오(그룹함수 사용).
 select first_name, job_id, salary
 from employees e 
 where salary = (select min(salary) from employees);
				
--7)업무별 평균 급여가 가장 적은  업무(job_id)를 찾아 업무(job_id)와 평균 급여를 표시하시오.
select job_id, avg(salary)
from employees 
group by job_id
having avg(salary) = (
                        select min(salary)
                        from (
                        select job_id, avg(salary) salary
                        from employees 
                        group by job_id
                        )
                     );
					  
--8) 각 부서의 최소 급여를 받는 사원의 이름(first_name), 급여(salary), 부서번호(department_id)를 표시하시오.
 select first_name, salary, department_id
 from employees e 
 where (department_id, salary) in (select department_id, min(salary) from employees group by department_id);


--9)담당 업무가 프로그래머(IT_PROG)인 모든 사원보다 급여가 적으면서 
--업무가 프로그래머(IT_PROG)가 아닌  사원들의 사원번호(employee_id), 이름(first_name), 
--담당 업무(job_id), 급여(salary))를 출력하시오.
 select employee_id, first_name, job_id, salary
 from employees e            
 where salary < all (select salary from employees where job_id = 'IT_PROG')
 and job_id != 'IT_PROG';

--10)부하직원이 없는 모든 사원의 이름을 표시하시오.
select first_name 
from employees e 
where not exists (select 1 from employees where manager_id = e.employee_id)
order by employee_id;

select first_name 
from employees e 
where exists (select 1 from employees where manager_id = e.employee_id)
order by employee_id;


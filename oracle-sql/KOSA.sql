/*
[1일차 수업]
1. 오라클 소프트웨어 다운로드
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (무료설치)

3. Oracle 설치(SYS, SYSTEM 계정의 대한 암호 : 1004)

4.Sqlplus 프로그램 제공(CMD) : GUI 환경 일반개발자 사용 불편

5.별도의 Tool 설치 무료(SqlDeveloper , https://dbeaver.io/)  ,
                 유료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : KOSA

-- USER SQL
ALTER USER "HR" IDENTIFIED BY 1004 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "HR" QUOTA UNLIMITED ON USERS;

-- ROLES
ALTER USER "HR" DEFAULT ROLE "RESOURCE","CONNECT";

-- SYSTEM PRIVILEGES


7. 현재 접속 계정 확인 : show user;   >> USER이(가) "BITUSER"입니다.


-- USER SQL
CREATE USER "KOSA" IDENTIFIED BY "1004"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS

-- ROLES
GRANT "CONNECT" TO "KOSA" WITH ADMIN OPTION;
GRANT "RESOURCE" TO "KOSA" WITH ADMIN OPTION;
ALTER USER "BITUSER" KOSA ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES


*/

/*
실습코드

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/
select * from emp;
select * from dept;
select * from salgrade;

--사원테이블에서 사원의 급여를 100달라 인상한 결과를 출력하세요
select  empno , sal , sal + 100 as "인상급여" from emp;

--사원의 이름이 king 인 사원의 사번, 이름,  급여 정보를 출력하세요
select empno , ename , sal   --3
from emp                     --1
where ename='KING';          --2


--급여가 2000달러 초과이면서 직종이 manager 인 사원의 모든 정보를 출력하세요
select *
from emp
where sal > 2000 and job='MANAGER';

select sysdate  from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select sysdate from dual;

select hiredate from emp where hiredate='1981-02-20';
select hiredate from emp where hiredate='1981/02/20';
select hiredate from emp where hiredate='1981.02.20';

--mysql : curdate() , now() , sysdate()
--ms-sql: getdate()

--부서번호가 10번 또는 20번 또는 30번인 사원의 사번 , 이름, 급여 , 부서번호를 출력하세요
select *
from emp 
where deptno in (10,20,30);
--where deptno=10 or deptno=20 or deptno=30;

--부서번호가 10번 또는 20번이 아닌  사원의 사번 , 이름, 급여 , 부서번호를 출력하세요
select *
from emp
--where deptno != 10 and deptno != 20;
where deptno not in(10,20);

--수당(comm) 을 받지 않는 모든 사원의 정보를 출력하세요  (데이터 null)
--select  * from emp where  comm = null;  (x)
select  * from emp where  comm is null;

select  * from emp where  comm is not null;

--사원테이블에서 사번 , 이름  , 급여 , 수당 , 총급여를 출력하세요
--총급여 정의(급여 + 수당)
select empno , ename , sal , comm , sal+nvl(comm,0)
from emp;

/*
null 이란 녀석 ...
1. null 과의 모든 연산의 결과는 null ex) 100 + null > null , 100-null > null
2. 위 문제를 해결하기 위해서  함수 >> nvl() , nvl2()  >> 암기
ex) nvl(컬럼명,대체값) >> 치환 

Tip) ms-sql > null > convert()
     Mysql  > null > IFNULL()  >> SELECT IFNULL(NULL, "W3Schools.com");
*/
--사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번, 이름 , 직종, 급여, 수당을 
--출력하세요
select * 
from emp
where sal >= 1000 and comm is null;

--사원테이블에서 사원의 이름에 A 가 들어가 있는 모든 사원정보를 출력하세요
--LIKE 검색
--select * from emp where regexp_like(ename,'[A-C]');
select * from emp where ename like '%A%';

select * from emp where ename like '%A%A%';

select * from emp where ename like '_A%';

--입사일이 가장 늦은 순으로 정렬해서 사번 , 이름 , 급여 , 입사일을 출력하세요
--가장 최근에 입사한 순으로 
select *
from emp
order by hiredate desc;

/*
select       3
from         1
where        2
order by     4  (select 결과를 정렬)
*/
select empno , ename, sal , job , hiredate
from emp
where job='MANAGER'
order by hiredate desc;

select job , deptno
from emp
order by job asc , deptno desc;
--오라클 함수 사용하기
/*
 단일 행 함수의 종류 
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를
   제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다. (to_char() , to_date())
5) 일반적인 함수 : NVL, DECODE
*/
--사원테이블에서 ename  컬럼의 데이터에 대해서 첫글자는 소문자로 나머지 글자는 대문자로
--출력하되 하나의 컬럼으로 만들어 출력하시고 컬럼의 별칭은 fullname 하고 첫글자와 나머지
--문자 사이에는 공백 하나를 넣으세요

select lower(substr(ename,1,1)) from emp;
select upper(substr(ename,2)) from emp;

select lower(substr(ename,1,1)) || ' ' ||upper(substr(ename,2))  as fullname
from emp;

/*
1. Date + Number >> Date
2. Date - Number >> Date
3. Date - Date   >> Number  (일수)
*/
select sysdate + 100 from dual;
select sysdate + 1000 from dual;
--1. 사원 테이블에서 사원들의 입사일에서 현재날짜까지의 근속월수를 구하세요
--사원이름, 입사일 , 근속월수 출력
--단 근속월수는 정수부분만 출력 (반올림 하지 마세요)

--수단과 방법을 gpt 검색 ,,, 해결 하면 되요 ....

select empno,ename, trunc(months_between(sysdate,hiredate),0) as 근속월수 from emp;

--2. 한달이 31 일 이라는 기준에서 근속월수를 구하세요 
-- (반올림 하지 마세요) (함수 사용(x) >> 날짜 - 날짜 >> 150일 )요)

select empno,ename, trunc((sysdate-hiredate)/31,0) as 근속월수 from emp;

 --입사일이 12월인 사원의 사번 , 이름 , 입사일, 입사년도 , 입사월을 출력하세요
 --hint) 
 select empno , ename , hiredate , to_char(hiredate,'YYYY') as hire , to_char(hiredate,'MM') as mm
 from emp
 where to_char(hiredate,'MM') = '12'; 
 
select sysdate ,
to_char(sysdate,'YYYY') || '년' as "YYYY",
to_char(sysdate,'YEAR') as "YEAR",
to_char(sysdate,'MM') as "MM",
to_char(sysdate,'DD') as "DD",
to_char(sysdate,'DAY') as "DAY",
to_char(sysdate,'DY') as "DY"
from dual;
 

--------------------------------------------------------------------------------
show user;
--USER이(가) "HR"입니다.

select * from employees;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select hire_date from employees;
/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 
부여해서 출력하고 입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 
연봉의 10%(연봉 * 1.1)인상한 값을 출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
select employee_id , first_name , last_name , hire_date , salary
from employees;

select employee_id, 
       last_name||first_name as fullname, 
       to_char(hire_date,'YYYY-MM-DD') as hire_date,
       salary,
       salary *12 as 연봉 ,
       to_char((salary *12)*1.1,'$999,999,999') as 인상분
from employees
where to_char(hire_date,'YYYY') >= '2005' --substr(hire_date,1,4)>2005 
--order by (salary *12) desc;
order by 연봉 desc;
--order by절은 select 다음에 실행 >> select 된 결과 컬럼값을 사용가능 (가명칭)

--------------------------------------------------------------------------------
show user;
--USER이(가) "KOSA"입니다.
CREATE TABLE t_emp2(
id NUMBER(2),
jumin CHAR(7)
);

INSERT INTO t_emp2(id, jumin) VALUES(1,'1234567');
INSERT INTO t_emp2(id, jumin) VALUES(2,'2234567');
INSERT INTO t_emp2(id, jumin) VALUES(3,'3234567');
INSERT INTO t_emp2(id, jumin) VALUES(4,'4234567');
INSERT INTO t_emp2(id, jumin) VALUES(5,'5234567');
COMMIT;


/*
일반함수: nvl() , decode() >> java if , case() >> java switch

decode ..
t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin 컬럼의 앞자리가 1이면
'남성' 출력 2이면 '여성' 3이면 '중성' 그외는  '기타' 라고 출력하세요
컬럼명은 '성별'
*/
select * from t_emp2;

select decode(substr(jumin,1,1),1,'남성',
                                2,'여성',
                                3,'중성',
                                '기타' ) as 성별 from t_emp2;

/*
CASE 조건식 WHEN 결과1 THEN 출력1
           WHEN 결과2 THEN 출력2
           WHEN 결과3 THEN 출력3
           ELSE 출력4
END "컬럼명"           

/*
사원테이블에서 사원급여가 1000달러 이하면 4급
1001달러 2000달라 이하면 3급
2001달러 3000달라 이하면 2급
3001달러 4000달라 이하면 1급
4001달러 이상이면 '특급'이라는 데이터를 출력하세요

-- 1. case 컬럼명 when 결과 the 출력

-- 2. 비교식이 필요하다면
      case when 조건 비교식 then
           when ...
           when ...
*/
select case when sal <= 1000 then '4급'
            when sal between 1001 and 2000 then '3급'
            when sal between 2001 and 3000 then '2급'
            when sal between 3001 and 4000 then '1급'
            else '특급'
       end  "급수"
       ,empno
       ,ename
from emp;

--문자함수 , 숫자함수 , 날짜함수 , 변환함수(to_char, to_number , to_date)
--일반함수 (nvl , decode() , case구문)
--기본함수  end

--집계함수
/*
1. count(*) >> row수  , count(컬럼명) >> 데이터 건수 >(null 은 포함하지 않아요)
2. sum()
3. avg()
4. max()
5. min()
--기타

1. 집계함수는 group by 절과 같이 사용
2. 모든 집계함수는 null 무시
3. select 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 group by 절에 명시

*/
select sum(sal) from emp;

--사장님 우리회의 총 수당이 얼마나 지급 되었나
select sum(comm) from emp;

--수당의 평균 ....
select trunc(avg(comm)) from emp; --721

select comm from emp;
select (300+200+30+300+3500+0) / 6 from dual; --721
------------------------------------------------------

select sum(comm) / 14  from emp; --309

-------------------------------------------------------
--avg(comm) 전체 사원수 ....
select avg(nvl(comm,0)) from emp;

--------------------------------------------------------
--부서별 평균 급여를 구하세요
select deptno, avg(sal) 
from emp
group by deptno;

--직종별 평균 급여를 구하세요
select job, avg(sal)
from emp
group by job;

--직종별 ,평균급여 , 급여합 , 최대급여 , 최소급여 , 건수를 출력하세요
select job, avg(sal) , sum(sal) , max(sal) , min(sal) , count(sal)
from emp
group by job;

--부서별 , 직종별 급여의 합을 구하세요

select deptno , job , sum(sal) as sumsal ,count(sal)
from emp
group by deptno, job
order by deptno;
/*
select 절         4 
from 절           1
where 절          2
group by 절       3
order by 절       5 
*/
--직종별 평균급여가 3000달러 이상인 사윈의 직종고 평균급여를 출력하세요
--from >> where
--group by >> having 조건(집계된 결과에 대한 조건)
select job, avg(sal) as avgsal
from emp
group by job
having avg(sal) >= 3000 ;
/*
select    5
from      1
where     2 
group by  3
having    4
order by  6
*/
/* 
사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 5000 이상인 
사원들의 목록을 출력하세요  (comm 0인 놈도 받는 것으로 ....)
급여의 합이 낮은 순으로 출력하세요 
PRESIDENT	5000
SALESMAN	5600
*/
select job, sum(sal) as sumsal
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by sumsal asc;

/* 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 ,인원수 , 급여의 합을 출력하세요 
30	6	9400
20	5	10875
*/
select deptno , count(*) as "부서별인원" , sum(sal) as "부서별 급여의 합"
from emp
group by deptno
having count(*) > 4;

/* 사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종(salesman) 은 제외하고 급여합으로 내림차순 정렬하세요 
MANAGER	8275
ANALYST	6000
*/
select job, sum(sal) as sumsal
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000
order by sumsal desc;

--------------------------------------------------------------------------------
--여기까지 단일 테이블 조회 END----------------------------------------------------
show user;
/*
HR 계정으로 이동하세요
show user
1. EMPLOYEES 테이블을 이용하여 다음 조건에 만족하는 행을 검색하세요. 
2005년이후에 입사한 사원 중에 부서번호가 있고, 급여가 5000~10000 사이인 사원을 검색합니다. 
'2005-01-01'
*/
SELECT employee_id, last_name, hire_date, job_id, salary, department_id 
FROM employees 
WHERE hire_date > '2005/01/01' 
       AND department_id IS NOT NULL 
       AND salary BETWEEN 5000 AND 10000; 
/*
2. EMPLOYEES 테이블을 이용하여 다음 조건에 만족하는 행을 검색하세요. 
부서번호가 있고, 부서별 근무 인원수가 2명 이상인 행을 검색하여 부서별 최대 급여와 최소 급여를 계산하
고 그 차이를 검색합니다. 
*/
SELECT department_id, MAX(salary), MIN(salary) ,MAX(salary) - MIN(salary) AS difference 
FROM employees 
WHERE department_id IS NOT NULL 
GROUP BY department_id 
HAVING COUNT(*) >= 2
order by department_id asc;
--------------------------------------------------------------------------------
--JOIN
/*
2 Join 의 종류 
Join 방법 설명
Cartesian Product 모든 가능한 행들의 Join
*Equijoin Join 조건이 정확히 일치하는 경우 사용(일반적으로 PK 와 FK 사용)
*Non-Equijoin Join 조건이 정확히 일치하지 않는 경우에 사용(등급,학점)
*Outer Join Join 조건이 정확히 일치하지 않는 경우에도 모든 행들을 출력
*Self Join 하나의 테이블에서 행들을 Join 하고자 할 경우에 사용
Set Operators 여러 개의 SELECT 문장을 연결하여 작성한다

Equijoin Join
Non-Equijoin Join
Outer Join Join
Self Join

관계형 DB (RDBMS)

관계 (테이블과 테이블과의 관계)
(클래스 (자바) 비교) >> 연관관계 존재

1 : 1
1 : N (70%)
M : N
create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;
*/
show user;

select * from emp;

select * from m;
select * from s;
select * from x;

-------------------------------------------
--SQL 문법
--ANSI 문법

select m.m1 , m.m2 , s.s2
from m , s
where m.m1 = s.s1;

--ANSI (표준)
select *
from m join s -- m inner join s
on m.m1 = s.s1;

select *
from s join x
on s.s1 = x.x1;

select * 
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;
--A == B , B == C , A == C

select *
from m join s on m.m1 = s.s1 
       join x on s.s1 = x.x1;
       
--사원번호 ,이름 , 부서번호 , 부서이름을 출력하세요 (ANSI)
select emp.empno, emp.ename , dept.deptno , dept.dname
from emp join dept on emp.deptno = dept.deptno;

select e.empno, e.ename , d.deptno , d.dname
from emp e join dept d on e.deptno = d.deptno;

--HR이동
select * from employees;
select * from departments;
select * from locations;


select count(*) from employees;  --107

--사번 , 이름( last_name) ,부서번호 , 부서이름 
select e.employee_id , e.last_name , e.department_id , d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;
--null
--106 ,,,,, 107(누락자)
select * from employees where department_id is null;
--178	Kimberely	Grant	KGRANT 문제확인

--사번 , 이름(last_name) , 부서번호 , 부서이름 , 지역코드 , 도시명 을 출력하세요
select e.employee_id , e.last_name , e.department_id , d.department_name ,d.location_id , l.city
from employees e join departments d on e.department_id = d.department_id
                 join locations l   on d.location_id = l.location_id;

--------------------------------------------------------------------------------
show user;

select * 
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

--------------------------------------------------------------------------------
--outer join (equi 조인 선행되고 나서 >> 남아있는 데이터를 가져오는 방법)
--1. 주종 관계 (주인이 되는 쪽에 남아있는 데이터를 가져오는 방법)
--2.  left outer join 
--2.1 right outer join
--2.2 full outer join (left , right >> union)

select *
from m left outer join s
on m.m1 = s.s1;

select *
from m right outer join s
on m.m1 = s.s1;

select *
from m full outer join s
on m.m1 = s.s1;

--------------------------------------------------------------------------------
--self join(자기참조) -> 문법(x) -> 의미만 존재 -> 등가조인 문법
--하나의 테이블에 있는 컬럼이 자신의 테이블에 있는 특정 컬럼을 참조하는 경우 

select e.empno , e.ename , m.empno , m.ename
from emp e join emp m
on e.mgr = m.empno;

--14 >> 13명
--컬럼에  null 허용 여부 확인
select count(*) from emp where mgr is null;

select e.empno , e.ename , m.empno , m.ename
from emp e left outer join emp m
on e.mgr = m.empno;

--ETC
--기타
--NATURAL JOIN
--Equijoin과 동일하다고 보시면 됩니다.
-- [두 테이블]의 [동일한 이름]을 가지는 칼럼은 [모두 조인]이 됩니다.
SELECT empno, ename, deptno , dname 
FROM emp NATURAL JOIN dept ;

--JOIN ~ USING 
--NATURAL JOIN의 단점은 동일한 이름을 가지는 칼럼은 모두 조인이 되었는데 
--USING 문을 사용하면 컬럼을 선택해서 조인을 할 수가 있습니다.
SELECT e.empno, e.ename, deptno , dname 
FROM emp e JOIN dept d USING(deptno);

select * from emp , dept;
select * from emp cross join dept;
--------------------------------------------------------------------------------
--20 분입니다 
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
 
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE  D.LOC='DALLAS';
 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';

-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
SELECT E.ENAME, D.DNAME, E.SAL 
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;
 
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.JOB='SALESMAN';
 
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
SELECT         E.EMPNO AS "사원번호",
               E.ENAME AS "사원이름",
               E.SAL*12 AS "연봉",
               --E.SAL*12+NVL(COMM,0) AS "실급여",
               E.SAL*12+COMM AS "실급여",
               S.GRADE AS "급여등급"
FROM EMP E  join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;
 
-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
-- inner 는 생략 가능
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
            join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;
 
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
-- inner 는 생략 가능
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D        on E.DEPTNO=D.DEPTNO
            join SALGRADE S    on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE  E.DEPTNO<=20 --WHERE E.DEPTNO IN (10,20)  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;
 
 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
 
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;
--------------------------------------------------------------------------------
--subquery 
-- sql 꽃 .... 만능 해결사
-- 단일 : 함수 (집계)
-- 다중 : join , union >> 해결 안되요 >> subquery(in line view)  or view ( 가상테이블)

--사원테이블에서 사원들의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름, 급여를 출력하세요
select avg(sal) from emp; --2073

select * from emp 
where sal > (select avg(sal) from emp);
/*
1. single row subquery : 실행 결과가 단일컬럼에 단일로우값 인 경우 (한개의 값)
ex) select sum(sal) from emp ,   select max(sal) from emp
연산자 : =  , != ,  <  , >

2. multi row subquery : 실행 결과가 단일컬럼에 여러개의로우값인 경우
ex) select deptno  from  emp , select sal from emp
연산자 : IN , NOT IN , ANY  , ALL
ALL : sal > 1000 and sal > 40000 and ....
ANY : sal > 1000 or sal > 40000 or .....

문법)
1. 괄호안에 있어야 한다   (select max(sal) from emp)
2. 단일 컬럼 구성        (select max(sal) ,min(sal) from emp) 서브쿼리 안되요 (x)
3. 서브쿼리가 단독으로 실행 가능

서브 쿼리 와 메인 쿼리
1. 서브 쿼리 실행되고 그 결과를 가지고
2. 메인 쿼리가 실행된다

TIP)
select (subquery) >> scala  >> select (select  ..) , empno 
from (subquery)   >> in line view (가상테이블)
where (subquery)  >> 조건
*/

--사원테이블에서 jones 의 급여보다 더 많은 급여를 받는 사원의 사번 , 이름 , 급여를 출력하세요
select sal from emp where ename ='JONES';

select * from emp 
where sal > (select sal from emp where ename ='JONES');

--부서번호가 30번인 사원과 같은 급여를 받는 모든 사원의 정보를 출력하세요
select sal from emp where deptno=30;

select * 
from emp 
where  sal in (select sal from emp where deptno=30); --sal=1600 or ....

--부서번호가 30번인 사원과 다른 급여를 받는 모든 사원의 정보를 출력하세요
select * 
from emp 
where  sal not in (select sal from emp where deptno=30);
--sal != 1600 and sal != 800 

--부하직원이 있는 사원의 사번과 이름을 출력하세요
select *
from emp 
where empno in(select mgr from emp);

--부하직원이 없는 사원의 사번과 이름을 출력하세요
select *
from emp 
where empno not in(select nvl(mgr,0) from emp); -- and ... and ... and null > null

--20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의 
--사번 , 이름 , 급여 , 부서번호를 출력하세요
select empno, ename , sal , deptno
from emp
where sal > (select max(sal) from emp where deptno=20);

--스칼라 서브 쿼리
select e.empno , e.ename , (select d.dname from dept d where d.deptno = e.deptno) as dept_name
from emp e
where e.sal >= 3000; 

--실무에서 많이 사용(중급)
--hint) 만약에 부서번호와 부서의 평균 월급을 담고있는 테이블이 존재하다면 (메모리에)
--자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번 , 이름 , 부서번호 , 부서별 평균월급  출력하세요
--in line view
--select deptno , trunc(avg(sal)) as avgsal from emp group by deptno
select *
from emp e join (select deptno , trunc(avg(sal)) as avgsal from emp group by deptno) s
on e.deptno = s.deptno  and e.sal > s.avgsal;
--where e.sal > s.avgsal;

/*
SQL 실행 순서 
FROM > ON > JOIN > -- > GROUP BY > HAVING > SELECT > ORDER BY

ON절의 조건인 JOIN이 되면서 실행되고, WHERE절의 조건은 JOIN이 모두 끝나고 나서 실행됩니다.
ON과 WHERE를 같이 사용할 때와, ON만 사용할 때의 결과가 같다면
ON만 사용하는 것이 좋습니다.

*/
--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT SAL
           FROM EMP
           WHERE ENAME='SMITH');
 
--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN(SELECT SAL
             FROM EMP
             WHERE DEPTNO=10);
 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
              FROM EMP
              WHERE ENAME='BLAKE')
AND ENAME!='BLAKE';
 
--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;
 
--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM EMP
                WHERE ENAME LIKE '%T%');
--where deptno = 20 or deptno= 30


--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO=30);
 
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO=30)
 
--where sal > 1600 and sal > 1250 and sal > 2850 and sal > 1500 and sal > 950
 
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO    -- = 이 맞는데  IN
                FROM DEPT
                WHERE LOC='DALLAS');
 
--8. SALES 부서에서 일하는 사원들의  같은 부서번호, 이름, 직업을 갖는 사원정보를 출력하라.
SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM DEPT
                WHERE DNAME='SALES')
 

 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
           FROM EMP
           WHERE ENAME='KING');
 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP)
AND DEPTNO IN(SELECT DEPTNO
              FROM EMP
              WHERE ENAME LIKE '%S%');
 
--select * from emp
--where  deptno in  (
--                      select deptno from emp where sal > (select avg(sal) from emp)
--                      and ename like '%S%'
--                   )
 
--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM EMP
                WHERE COMM IS NOT NULL)
AND SAL IN( SELECT SAL
            FROM EMP
            WHERE COMM IS NOT NULL);
 
--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=30)
AND COMM NOT IN(SELECT NVL(COMM, 0)
                FROM EMP
                WHERE DEPTNO=30 and comm is not null);

--------------------------------------------------------------------------------
select * from emp order by 1,2,3; --1,2,3번째 컬럼 순으로 오름차순 정렬
                                  -- order by empno , ename , job 동일
                                  
select deptno ,sal , empno from emp order by 1 desc,2; 
                                  -- order by deptno desc , sal asc 동일
                                  
 /*                                  
지금까지 초급 개발자 필수 사항
select
from 
where 
group by
having
order by
+
기본 함수 (문자,숫자,날짜,변환,일반,집계)
+ 
다중테이블 (JOIN , UNION)
+
subquery 까지 (in line view)
+ 
기본적인 DML 구문 (필수 암기) 입니다
                                 
*/                                  
--데이터 조작(DML) 입니다
--insert  , update , delete (반드시 암기)

/*
DDL(데이터 정의어) : [create , alter  , drop , truncate] , rename , modify
DML(데이터 조작어) : 트랜잭션을 일으키는 작업 : insert , update , delete
ex) 개발자 ... 회사 갑자기 ...DB select 잘되는데 insert, update, delete 안되요
    >> 갑자기 log write 를 수행하는 작업 (어떤놈이 .언제.어떤.무슨 기록)
    >> DISK 기록 (log file full) >> log write 안되면 >> DML 작업 못해요
    >> log backup >> log 삭제 ....
    
    >> commit 하지 않은 경우 .....  실습 .... 일상다반사 .....
DQL(데이터 질의어) : select 
DCL(데이터 제어어) : 관리자 : grant , revoke
TCL(트랜잭션)     : commit , rollback , savepoint 
*/  

--대량 데이터 삽입

--pl-sql
create table temp(id varchar2(50));

desc temp;

--pl-sql
-- for(int i = 0 ; i<= 100 ; i++){}
/*
BEGIN
    FOR i IN 1..100 LOOP
        insert into temp(id) values('A' ||to_char(i));
    END LOOP;    
END;
*/
select * from temp;
commit;

create table temp2(num number);
create table temp3(num varchar2(50));

select * from temp;
select * from temp2;

--insert into 테이블명() values()
--insert into 테이블명() select 절

insert into temp3(num)
select id from temp;

commit;

select * from temp3;

--2 대량 데이터 삽입
create table copyemp
as
  select empno ,ename from emp;
  
select * from copyemp;  

create table copyemp2
as
  select empno ,ename from emp where 1=2;
  
desc copyemp2;
--------------------------------------------------------------------------------
--DB개발자
/*
초급 개발자 (SQL)
1. CRUD (insert , select , update , delete)
2. JAVA >> JDBC API >> APP  -  DB 
3. JAVA >> CRUD 함수를 만들어서 데이터 작업이 가능하다

패턴 >> MVC 패턴

model (DTO, DAO (쿼리) , SERVICE)

EMP CRUD > 

mybatis >> xml >> 

*/

--오라클 (가상 컬럼 (조합 컬럼))
--학생 성적 테이블
--국어 , 영어 , 수학 , 평균 ( 무결성 )

create table vtable(
  no1 number,
  no2 number,
  no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);

insert into vtable(no1 , no2) values(100,50);

select * from vtable;
  
  --실무에서 활용되는 코드
-- 제품정보 (입고) : 분기별 데이터 추출(4분기)
create table vtable2(
   no number, --순번
   p_code char(4), --제품코드 (A001 , B003)
   p_date char(8), --입고일 (20230101)
   p_qty number, --수량
   p_bungi number(1) GENERATED ALWAYS as (
                                            case when substr(p_date,5,2) in ('01','02','03') then 1
                                                 when substr(p_date,5,2) in ('04','05','06') then 2
                                                 when substr(p_date,5,2) in ('07','08','09') then 3
                                                 else 4
                                            end 
                                         ) VIRTUAL
);
select * from col where lower(tname)= 'vtable2';

insert into vtable2(p_date) values('20220101');
insert into vtable2(p_date) values('20220522');
insert into vtable2(p_date) values('20220601');
insert into vtable2(p_date) values('20221111');
insert into vtable2(p_date) values('20221201');
commit;

select * from vtable2 where p_bungi=2;
--------------------------------------------------------------------------------
/*
제 약 조 건 설 명
PRIMARY KEY(PK)    : 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족)
FOREIGN KEY(FK)    : 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.
UNIQUE key(UK)     : 테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL 을 허용)
NOT NULL(NN)       : 열은 NULL 값을 포함할 수 없습니다.
CHECK(CK)          : 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정

제약은 아니지만 default sysdate ....
 */
create table temp7(
 -- id number primary key 권장하지 않아요 (제약이름 자동설정 ... 제약 편집 ...)
 id number constraint pk_temp7_id primary key , --개발자 제약 이름 : pk_temp7_id
 name varchar2(20) not null ,
 addr varchar2(50)
 );
 
 create table temp10(
  id number constraint pk_temp10_id primary key,
  name varchar2(20) not null,
  jumin char(6) not null constraint uk_temp10_jumin unique,
  addr varchar2(30),
  age number constraint ck_temp10_age check(age >= 19) --where age >= 19
);
/*
--영문테이블 , 영문 컬럼명

--[학생 성적 테이블]
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--값을 입력하지 않으면 default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드

?

--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다

?

--학과코드 , 학과명

?

--샘플 데이터 insert ..

--그리고 select 결과는

--학번 , 이름 , 총점, 평균 , 학과코드 , 학과명 을 출력하세요

*/
/* 사원 */
CREATE TABLE EMP (
	empno NUMBER NOT NULL, /* 사번 */
	ename VARCHAR2(20), /* 이름 */
	sal NUMBER, /* 급여 */
	deptno NUMBER /* 부서번호 */
);

/* 부서 */
CREATE TABLE DEPT (
	deptno NUMBER, /* 부서번호 */
	dname VARCHAR2(20) /* 부서명 */
);

ALTER TABLE EMP
ADD CONSTRAINT PK_EMP_EMPNO	PRIMARY KEY (empno);

ALTER TABLE DEPT
ADD CONSTRAINT PK_DEPT_DEPTNO 	PRIMARY KEY (deptno);

ALTER TABLE EMP
ADD CONSTRAINT FK_DEPT_TO_EMP 	FOREIGN KEY (deptno)	REFERENCES DEPT (deptno);
--------------------------------------------------------------------------------
create table grade(
  s_number number ,
  s_name varchar2(20) not null,
  k_score number default 0,
  e_score number default 0,
  m_score number default 0,
  m_code number ,
  avg_score number GENERATED always as (round((k_score + e_score + m_score)/3,2)) VIRTUAL,
  sum_score number GENERATED always as (k_score + e_score + m_score) VIRTUAL,
  
  constraint pk_grade_snum primary key(s_number), --복합키
  constraint fk_grade_mcode foreign key(m_code) references major(m_code) 
  --나중에 걸거나 (테이블 생성 후에)
);
 
create table major(
  m_code number,
  m_name varchar2(20) not null,
  constraint pk_major_mcode primary key(m_code)
);
--------------------------------------------------------------------------------
--가상 테이블 (subquery >> in line view >> from () )
--필요한 가상테이블을 객체형태로 만들기 (영속적으로)

/*
CREATE [OR REPLACE] [FORCE | NOFORCE] VIEW view_name [(alias[,alias,...])]
AS Subquery 
[WITH CHECK OPTION [CONSTRAINT constraint ]]
[WITH READ ONLY

옵션
OR REPLACE 이미 존재한다면 다시 생성한다.
FORCE Base Table 유무에 관계없이 VIEW 을 만든다.
NOFORCE 기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
view_name VIEW 의 이름
Alias Subquery 를 통해 선택된 값에 대한 Column 명이 된다.
Subquery SELECT 문장을 기술한다.
WITH CHECK OPTION VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다. 
Constraint CHECK OPTON 제약 조건에 대해 지정된 이름이다.
WITH READ ONLY 이 VIEW 에서 DML 이 수행될 수 없게 한다.

*/

create view view001
as
  select * from emp;

--뷰는 sql 문자 덩어리
select * from view001; --사용방법은 table 처럼

select * from view001 where sal > 3000;

--VIEW (가상 테이블)
--사용법 : 일반 테이블과 동일 (select , insert , update , delete)
--단 VIEW 볼 수 있는 데이터에 한해서
--View 통해서 원본 테이블에 insert , update , delete (DML) 가능 ... 가능정도만 ...

--VIEW 목적
--1. 개발자의 편리성 : join , subquery 복잡한 쿼리 미리 생성두었다가 사용 
--2. 쿼리 단순화 : view생성해서 JOIN 편리성
--3. DBA 보안 : 원본테이블은 노출하지 않고 view 만들어서 제공 (특정 컬럼을 노출하지 않는다)


/*
select *
from emp e join v_001 s
on e.deptno = s.deptno  and e.sal > s.avgsal;

*/
create or replace view v_001
as 
  select deptno , trunc(avg(sal)) as avgsal from emp group by deptno;

--직종별 평균 급여를 볼수 있는 view 를 만들어라
create or replace view v_002
as
   select job , avg(sal) as avgsal  from emp group by job;
   
-- 30번 부서 사원들의  직종, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직종, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.  view101
create or replace view view101
as
   select job , ename , sal
   from emp
   where deptno=30 and sal > 300;

select * from view101;

--부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
--부서만 출력하도록 하라.  view102
create or replace view view102
as
  select deptno , avg(sal) as avgsal
  from emp
  group by deptno
  having avg(sal) >=2000;
  
select * from view102;
--------------------------------------------------------------------------------
--개발자 관점에서 SQL  사용하기
/*
 SEQUENCE 특징 
1) 자동적으로 유일 번호를 생성합니다.
2) 공유 가능한 객체 (테이블간에)
3) 주로 기본 키 값을 생성하기 위해 사용됩니다.
4) 어플리케이션 코드를 대체합니다. (로직 만들 필요 없다)
5) 메모리에 CACHE 되면 SEQUENCE 값을 액세스 하는 효율성을 향상시킵니다


CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}];

sequence_name           SEQUENCE 의 이름입니다.
INCREMENT BY            n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정.
                        이 절이 생략되면 SEQUENCE 는 1 씩 증가.
START WITH             n 생성하기 위해 첫번째 SEQUENCE 를 지정.
이 절이 생략되면 SEQUENCE 는 1 로 시작.
MAXVALUE n SEQUENCE 를 생성할 수 있는 최대 값을 지정.
NOMAXVALUE 오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정.
MINVALUE n 최소 SEQUENCE 값을 지정.
NOMINVALUE 오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정.
CYCLE | NOCYCLE 최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를
지정. NOCYCLE 이 디폴트.
CACHE | NOCACHE 얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지
하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE
*/
create table board(
    boardid number constraint pk_board_boardid primary key,
    title nvarchar2(50)
);

--게시판 글쓰기 작업
insert into board(boardid, title) values(1,'처음글');
insert into board(boardid, title) values(2,'두번째');

--처음 글을 쓰면 글번호가 1번 ... 그 다음글 순차적인 증가값 ... 2번 , 3번
--어떤 논리 ...
insert into board(boardid, title) 
values((select count(boardid) + 1 from board),'처음글');

insert into board(boardid, title) 
values((select count(boardid) + 1 from board),'두번쨰글');

select * from board;
--게시물 삭제 입력 ( 중복 출돌)

--데이터가 삭제되어도 문제없는 순번을 가지고 싶어요
insert into board(boardid, title)
values((select  nvl(max(boardid),0) + 1 from board) , '새글');
--------------------------------------------------------------------------------
--규칙적인 논리 .....
--
/*
TIP)
sequence 모든 DB에 ...
오라클 (0)
MS-SQL 2012버전(0) (sequence)
My-SQL (x)
Mariadb (0) (엔진 (my-sql)) : https://mariadb.com/kb/ko/sequence-overview/
PostgreSQL에서 시퀀스(Sequence) (0)

--순번을 생성(테이블 종속적으로) 
Ms-sql
create table board(boardnum int identity(1,1) ... title
insert into board(title) values('제목');  >> boardnum >> 1이 자동

my-sql
create table board(boardnum int auto_increment, ... title
insert into board(title) values('제목');  >> boardnum >> 1이 자동
*/

create sequence seq_num;

select seq_num.nextval from dual;
select seq_num.currval from dual;

--create table 공지   insert into 공지.... values(seq_num.nextval,'방가'...
--create table 자유   insert into 자유.... values(seq_num.nextval,'방가'...
--create table 자료실 insert into 자유실.... values(seq_num.nextval,'방가'...

--num :1, 2, 3, 4, 5, 6, ...
--일반게시판 .... 쿼리문
--select * from board order by num desc;

--rownum : 의사컬럼 : 실제 물리적으로 존재하는 컬럼이 아니고 논리적 존재 (create table (x) 사용안되요)
--rownum  : 실제로 테이블에 컬럼으로 존재하지 않지만 내부적으로 행 번호를 부여하는 컬럼
 
select * from emp;

select rownum , empno , ename , sal from emp;


select rownum , empno , ename , sal
from emp
order by sal;

--Top n 쿼리 .....
--Top-n 쿼리 (기준이 되는 데이터 순으로 정렬 시키고 상위 n 개 가지고 오기)
--MS-SQL : select top 10 , * from emp order by sal desc;
select *
from (
        select rownum as num , e.*
        from (
                select empno , ename , sal
                from emp
                order by sal
              ) e  
      ) n where num <= 5;  --대용량 데이터 페이지 처리 ( POINT )

/*      
 tataldata = 100건
 pagesize = 10  (100건 10건씩 묶겠다)
 page 개수 >> 10개

*/
-- [1][2][3][4][5] ......
--<a href ='page.jsp?page=1'>1번</a>
--1page 클릭 : select ... where num between 1 and 10
--2page 클릭 : select ... where num between 11 and 20
-- 1~ 10
-- 11 ~ 20 

--1. rownum
--2. between 
--공식화 ...
--------------------------------------------------------------------------------
--HR 계정
/*
107건
pagesize=10
--[][][][][][][][][][][11]
--[1] >> 1~10
--[2] >> 11~20
...
--[5] >> 41 ~50 클릭가정....
*/

--1단계{ (기준 데이터 만들기) 정렬
--사번이 낮은 순으로 정렬
select * from employees order by employee_id asc;

--2단계 (기준 데이터 순번 부여하기)
select rownum as num , e.*
from (
        select * from employees order by employee_id asc
     ) e
where rownum <= 50;

--3단계 
select *
from  (
            select rownum as num , e.*
            from (
                    select * from employees order by employee_id asc
                  ) e
            where rownum <= 50
      ) n where num >=41;
-------------------------------------------------------------------------------
select *
from (
        select rownum as num , e.*
        from (
                select * from employees order by employee_id asc
             ) e
      ) n where num between 40 and 51;
      
------------------------------------------------------------------------------
--분석함수
--PL-SQL
      
 select deptno, count(*) as cnt
 from emp
 group by deptno
 order by deptno asc;
 
 select deptno, case when deptno=10 then 1 else 0 end as dept_10,
 case when deptno=20 then 1 else 0 end as dept_20,
 case when deptno=30 then 1 else 0 end as dept_30
 from emp
 order by deptno asc;
 
 select deptno, sum(case when deptno=10 then 1 else 0 end) as dept_10,
 sum(case when deptno=20 then 1 else 0 end) as dept_20,
 sum(case when deptno=30 then 1 else 0 end) as dept_30
 from emp
 group by deptno;
 
 select job, to_char(hiredate,'FMMM') || '월' as hiremonth
 from emp;
 
 select * 
 from (
  select job, to_char(hiredate,'FMMM') || '월' as hiremonth from emp
 )pivot (
  count(*) for hiremonth in('1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월')
 );
 
 select job, sum(sal)
 from emp
 group by rollup(job);
 
 select job,deptno,sum(sal)
 from emp
 group by rollup(job,deptno);
 
 select deptno, job, sum(sal)
 from emp
 group by cube(deptno,job)
 order by deptno, job;
 
 select * from emp;
 
 select ename, sal,
 rank() over(order by sal desc) as 순위,
 dense_rank() over(order by sal desc) as 순위2
 from emp
 order by sal desc;
                
select ename, sal, comm,
rank() over(order by sal desc, comm desc) as 순위
from emp
order by sal desc;

--분석함수([칼럼]) OVER(PARTITION BY 칼럼1, 칼럼2... [ORDER BY 절] [WINDOWING 절])
SELECT empno , ename , job , sal , SUM(sal) OVER(PARTITION BY job) 
FROM emp WHERE job IN ('MANAGER', 'SALESMAN') ORDER BY job;

SELECT empno , ename , job , sal , MAX(sal) OVER(PARTITION BY job) 
FROM emp WHERE job IN ('MANAGER', 'SALESMAN') ORDER BY job;

SELECT empno , ename , job , sal , ROW_NUMBER() OVER(PARTITION BY job ORDER BY sal) AS rn 
FROM emp WHERE job IN ('MANAGER', 'SALESMAN') ORDER BY job;

-----------------------------------------------------------
--TABLE 설계 (비인증형 일반 게시판)
CREATE TABLE jspboard(
  idx NUMBER constraint pk_jspboard_idx PRIMARY KEY , -- 글번호 (DB : 오라클(sequence 객체) , Ms-sql, Mysql(테이블 종속 자동증가)
  writer VARCHAR2(30) NOT NULL , --글쓴이 (회원전용: 로그인한 ID , 별칭     비회원용: 입력값 )
  pwd VARCHAR2(20) NOT NULL , --회원전용(x)  , 비회원전용(0 : 수정 ,삭제 )
  subject VARCHAR2(50) NOT NULL, --글제목
  content VARCHAR2(100) NOT NULL, --글내용
  writedate DATE DEFAULT SYSDATE, -- 작성일
  readnum NUMBER DEFAULT 0 , --글조회 (insert default 0)
  filename VARCHAR2(200),  --파일명 (test.txt)
  filesize NUMBER ,        --파일크기(byte)
  homepage VARCHAR2(50) ,
  email VARCHAR2(100) --필수 입력 사항 (not null) null값을 허용
)

SELECT * FROM jspboard;

--TABLE 설계 (비인증형 답변(계층형)  게시판)
CREATE TABLE jspboard(
  idx NUMBER PRIMARY KEY , -- 글번호 (DB : 오라클(sequence 객체) , Ms-sql, Mysql(테이블 종속 자동증가)
  writer VARCHAR2(30) NOT NULL , --글쓴이 (회원전용: 로그인한 ID , 별칭     비회원용: 입력값 )
  pwd VARCHAR2(20) NOT NULL , --회원전용(x)  , 비회원전용(0 : 수정 ,삭제 )
  subject VARCHAR2(50) NOT NULL, --글제목
  content VARCHAR2(100) NOT NULL, --글내용
  writedate DATE DEFAULT SYSDATE, -- 작성일
  readnum NUMBER DEFAULT 0 , --글조회 (insert default 0)
  filename VARCHAR2(200),  --파일명 (test.txt)
  filesize NUMBER ,              --파일크기(byte)
  homepage VARCHAR2(50) ,
  email VARCHAR2(100), --필수 입력 사항 (not null) null값을 허용
  --답변형 게시판 구축
  refer   NUMBER DEFAULT 0 , -- 답변형 게시판 (참조글 or 글의 그룹번호)
  depth   NUMBER DEFAULT 0,  -- 답변형 게시판(depth(글의 깊이 , 들여쓰기)
  step    NUMBER DEFAULT 0   -- 답변형 게시판 (글의 정렬 순서 : 답글정렬순서)
);

   
    

--순번 처리 (oracle)
CREATE SEQUENCE jspboard_idx
START WITH 1
INCREMENT BY 1
NOCACHE;


--덧글(꼬리말) 을 위한 테이블 생성
--누구의 덧글인지를 판단 ....
CREATE TABLE reply(
  no NUMBER PRIMARY KEY ,
  writer VARCHAR2(30),
  userid VARCHAR2(30),
  pwd VARCHAR2(30),
  content VARCHAR2(100),
  writedate DATE DEFAULT SYSDATE ,
  idx_fk  REFERENCES jspboard(idx)
);

CREATE SEQUENCE reply_no
START WITH 1
INCREMENT BY 1
NOCACHE;


SELECT * FROM jspboard  ORDER BY idx DESC ;
SELECT * FROM jspboard ORDER BY refer DESC , step ASC
select * from reply;

update emp set sal=9000 where empno='7369';
update employees set salary=20, email='email' where emplyee_id=206;


     
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
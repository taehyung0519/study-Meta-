
/*
[1���� ����]
1. ����Ŭ ����Ʈ���� �ٿ�ε�
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (���ἳġ)

3. Oracle ��ġ(SYS, SYSTEM ������ ���� ��ȣ : 1004)

4.Sqlplus ���α׷� ����(CMD) : GUI ȯ�� �Ϲݰ����� ��� ����

5.������ Tool ��ġ ����(SqlDeveloper , https://dbeaver.io/)  ,
                 ����(��� , ������ , SqlGate) ������Ʈ�� ��ġ Ȱ�� ^^

6. SqlDeveloper ���� ���ؼ� Oracle Server ���� ....
   >> HR ���� : ��ȣ 1004 , Unlock 2���� ��밡�� .... (������� �ǽ� ���̺�)
   >> ���ο� ���� : KOSA

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


7. ���� ���� ���� Ȯ�� : show user;   >> USER��(��) "BITUSER"�Դϴ�.


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
�ǽ��ڵ�

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

--������̺��� ����� �޿��� 100�޶� �λ��� ����� ����ϼ���
select  empno , sal , sal + 100 as "�λ�޿�" from emp;

--����� �̸��� king �� ����� ���, �̸�,  �޿� ������ ����ϼ���
select empno , ename , sal   --3
from emp                     --1
where ename='KING';          --2


--�޿��� 2000�޷� �ʰ��̸鼭 ������ manager �� ����� ��� ������ ����ϼ���
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

--�μ���ȣ�� 10�� �Ǵ� 20�� �Ǵ� 30���� ����� ��� , �̸�, �޿� , �μ���ȣ�� ����ϼ���
select *
from emp 
where deptno in (10,20,30);
--where deptno=10 or deptno=20 or deptno=30;

--�μ���ȣ�� 10�� �Ǵ� 20���� �ƴ�  ����� ��� , �̸�, �޿� , �μ���ȣ�� ����ϼ���
select *
from emp
--where deptno != 10 and deptno != 20;
where deptno not in(10,20);

--����(comm) �� ���� �ʴ� ��� ����� ������ ����ϼ���  (������ null)
--select  * from emp where  comm = null;  (x)
select  * from emp where  comm is null;

select  * from emp where  comm is not null;

--������̺��� ��� , �̸�  , �޿� , ���� , �ѱ޿��� ����ϼ���
--�ѱ޿� ����(�޿� + ����)
select empno , ename , sal , comm , sal+nvl(comm,0)
from emp;

/*
null �̶� �༮ ...
1. null ���� ��� ������ ����� null ex) 100 + null > null , 100-null > null
2. �� ������ �ذ��ϱ� ���ؼ�  �Լ� >> nvl() , nvl2()  >> �ϱ�
ex) nvl(�÷���,��ü��) >> ġȯ 

Tip) ms-sql > null > convert()
     Mysql  > null > IFNULL()  >> SELECT IFNULL(NULL, "W3Schools.com");
*/
--����� �޿��� 1000�̻��̰� ������ ���� �ʴ� ����� ���, �̸� , ����, �޿�, ������ 
--����ϼ���
select * 
from emp
where sal >= 1000 and comm is null;

--������̺��� ����� �̸��� A �� �� �ִ� ��� ��������� ����ϼ���
--LIKE �˻�
--select * from emp where regexp_like(ename,'[A-C]');
select * from emp where ename like '%A%';

select * from emp where ename like '%A%A%';

select * from emp where ename like '_A%';

--�Ի����� ���� ���� ������ �����ؼ� ��� , �̸� , �޿� , �Ի����� ����ϼ���
--���� �ֱٿ� �Ի��� ������ 
select *
from emp
order by hiredate desc;

/*
select       3
from         1
where        2
order by     4  (select ����� ����)
*/
select empno , ename, sal , job , hiredate
from emp
where job='MANAGER'
order by hiredate desc;

select job , deptno
from emp
order by job asc , deptno desc;
--����Ŭ �Լ� ����ϱ�
/*
 ���� �� �Լ��� ���� 
1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�.
2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�.
3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ���
   �����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�.
4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�. (to_char() , to_date())
5) �Ϲ����� �Լ� : NVL, DECODE
*/
--������̺��� ename  �÷��� �����Ϳ� ���ؼ� ù���ڴ� �ҹ��ڷ� ������ ���ڴ� �빮�ڷ�
--����ϵ� �ϳ��� �÷����� ����� ����Ͻð� �÷��� ��Ī�� fullname �ϰ� ù���ڿ� ������
--���� ���̿��� ���� �ϳ��� ��������

select lower(substr(ename,1,1)) from emp;
select upper(substr(ename,2)) from emp;

select lower(substr(ename,1,1)) || ' ' ||upper(substr(ename,2))  as fullname
from emp;

/*
1. Date + Number >> Date
2. Date - Number >> Date
3. Date - Date   >> Number  (�ϼ�)
*/
select sysdate + 100 from dual;
select sysdate + 1000 from dual;
--1. ��� ���̺��� ������� �Ի��Ͽ��� ���糯¥������ �ټӿ����� ���ϼ���
--����̸�, �Ի��� , �ټӿ��� ���
--�� �ټӿ����� �����κи� ��� (�ݿø� ���� ������)

--���ܰ� ����� gpt �˻� ,,, �ذ� �ϸ� �ǿ� ....

select empno,ename, trunc(months_between(sysdate,hiredate),0) as �ټӿ��� from emp;

--2. �Ѵ��� 31 �� �̶�� ���ؿ��� �ټӿ����� ���ϼ��� 
-- (�ݿø� ���� ������) (�Լ� ���(x) >> ��¥ - ��¥ >> 150�� )��)

select empno,ename, trunc((sysdate-hiredate)/31,0) as �ټӿ��� from emp;

 --�Ի����� 12���� ����� ��� , �̸� , �Ի���, �Ի�⵵ , �Ի���� ����ϼ���
 --hint) 
 select empno , ename , hiredate , to_char(hiredate,'YYYY') as hire , to_char(hiredate,'MM') as mm
 from emp
 where to_char(hiredate,'MM') = '12'; 
 
select sysdate ,
to_char(sysdate,'YYYY') || '��' as "YYYY",
to_char(sysdate,'YEAR') as "YEAR",
to_char(sysdate,'MM') as "MM",
to_char(sysdate,'DD') as "DD",
to_char(sysdate,'DAY') as "DAY",
to_char(sysdate,'DY') as "DY"
from dual;
 

--------------------------------------------------------------------------------
show user;
--USER��(��) "HR"�Դϴ�.

select * from employees;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select hire_date from employees;
/*
������̺�(employees)���� ����� �̸��� last_name , first_name ���ļ� fullname ��Ī 
�ο��ؼ� ����ϰ� �Ի�����  YYYY-MM-DD �������� ����ϰ� ����(�޿� *12)�� ���ϰ� 
������ 10%(���� * 1.1)�λ��� ���� ����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���
*/
select employee_id , first_name , last_name , hire_date , salary
from employees;

select employee_id, 
       last_name||first_name as fullname, 
       to_char(hire_date,'YYYY-MM-DD') as hire_date,
       salary,
       salary *12 as ���� ,
       to_char((salary *12)*1.1,'$999,999,999') as �λ��
from employees
where to_char(hire_date,'YYYY') >= '2005' --substr(hire_date,1,4)>2005 
--order by (salary *12) desc;
order by ���� desc;
--order by���� select ������ ���� >> select �� ��� �÷����� ��밡�� (����Ī)

--------------------------------------------------------------------------------
show user;
--USER��(��) "KOSA"�Դϴ�.
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
�Ϲ��Լ�: nvl() , decode() >> java if , case() >> java switch

decode ..
t_emp2 ���̺��� id, jumin �����͸� ����ϵ� jumin �÷��� ���ڸ��� 1�̸�
'����' ��� 2�̸� '����' 3�̸� '�߼�' �׿ܴ�  '��Ÿ' ��� ����ϼ���
�÷����� '����'
*/
select * from t_emp2;

select decode(substr(jumin,1,1),1,'����',
                                2,'����',
                                3,'�߼�',
                                '��Ÿ' ) as ���� from t_emp2;

/*
CASE ���ǽ� WHEN ���1 THEN ���1
           WHEN ���2 THEN ���2
           WHEN ���3 THEN ���3
           ELSE ���4
END "�÷���"           

/*
������̺��� ����޿��� 1000�޷� ���ϸ� 4��
1001�޷� 2000�޶� ���ϸ� 3��
2001�޷� 3000�޶� ���ϸ� 2��
3001�޷� 4000�޶� ���ϸ� 1��
4001�޷� �̻��̸� 'Ư��'�̶�� �����͸� ����ϼ���

-- 1. case �÷��� when ��� the ���

-- 2. �񱳽��� �ʿ��ϴٸ�
      case when ���� �񱳽� then
           when ...
           when ...
*/
select case when sal <= 1000 then '4��'
            when sal between 1001 and 2000 then '3��'
            when sal between 2001 and 3000 then '2��'
            when sal between 3001 and 4000 then '1��'
            else 'Ư��'
       end  "�޼�"
       ,empno
       ,ename
from emp;

--�����Լ� , �����Լ� , ��¥�Լ� , ��ȯ�Լ�(to_char, to_number , to_date)
--�Ϲ��Լ� (nvl , decode() , case����)
--�⺻�Լ�  end

--�����Լ�
/*
1. count(*) >> row��  , count(�÷���) >> ������ �Ǽ� >(null �� �������� �ʾƿ�)
2. sum()
3. avg()
4. max()
5. min()
--��Ÿ

1. �����Լ��� group by ���� ���� ���
2. ��� �����Լ��� null ����
3. select ���� �����Լ� �̿ܿ� �ٸ� �÷��� ���� �ݵ�� �� �÷��� group by ���� ���

*/
select sum(sal) from emp;

--����� �츮ȸ�� �� ������ �󸶳� ���� �Ǿ���
select sum(comm) from emp;

--������ ��� ....
select trunc(avg(comm)) from emp; --721

select comm from emp;
select (300+200+30+300+3500+0) / 6 from dual; --721
------------------------------------------------------

select sum(comm) / 14  from emp; --309

-------------------------------------------------------
--avg(comm) ��ü ����� ....
select avg(nvl(comm,0)) from emp;

--------------------------------------------------------
--�μ��� ��� �޿��� ���ϼ���
select deptno, avg(sal) 
from emp
group by deptno;

--������ ��� �޿��� ���ϼ���
select job, avg(sal)
from emp
group by job;

--������ ,��ձ޿� , �޿��� , �ִ�޿� , �ּұ޿� , �Ǽ��� ����ϼ���
select job, avg(sal) , sum(sal) , max(sal) , min(sal) , count(sal)
from emp
group by job;

--�μ��� , ������ �޿��� ���� ���ϼ���

select deptno , job , sum(sal) as sumsal ,count(sal)
from emp
group by deptno, job
order by deptno;
/*
select ��         4 
from ��           1
where ��          2
group by ��       3
order by ��       5 
*/
--������ ��ձ޿��� 3000�޷� �̻��� ������ ������ ��ձ޿��� ����ϼ���
--from >> where
--group by >> having ����(����� ����� ���� ����)
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
������̺��� ������ �޿����� ����ϵ� ������ ���� �ް� �޿��� ���� 5000 �̻��� 
������� ����� ����ϼ���  (comm 0�� �� �޴� ������ ....)
�޿��� ���� ���� ������ ����ϼ��� 
PRESIDENT	5000
SALESMAN	5600
*/
select job, sum(sal) as sumsal
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by sumsal asc;

/* ������̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ ,�ο��� , �޿��� ���� ����ϼ��� 
30	6	9400
20	5	10875
*/
select deptno , count(*) as "�μ����ο�" , sum(sal) as "�μ��� �޿��� ��"
from emp
group by deptno
having count(*) > 4;

/* ������̺��� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���
�� �Ǹ�����(salesman) �� �����ϰ� �޿������� �������� �����ϼ��� 
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
--������� ���� ���̺� ��ȸ END----------------------------------------------------
show user;
/*
HR �������� �̵��ϼ���
show user
1. EMPLOYEES ���̺��� �̿��Ͽ� ���� ���ǿ� �����ϴ� ���� �˻��ϼ���. 
2005�����Ŀ� �Ի��� ��� �߿� �μ���ȣ�� �ְ�, �޿��� 5000~10000 ������ ����� �˻��մϴ�. 
'2005-01-01'
*/
SELECT employee_id, last_name, hire_date, job_id, salary, department_id 
FROM employees 
WHERE hire_date > '2005/01/01' 
       AND department_id IS NOT NULL 
       AND salary BETWEEN 5000 AND 10000; 
/*
2. EMPLOYEES ���̺��� �̿��Ͽ� ���� ���ǿ� �����ϴ� ���� �˻��ϼ���. 
�μ���ȣ�� �ְ�, �μ��� �ٹ� �ο����� 2�� �̻��� ���� �˻��Ͽ� �μ��� �ִ� �޿��� �ּ� �޿��� �����
�� �� ���̸� �˻��մϴ�. 
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
2 Join �� ���� 
Join ��� ����
Cartesian Product ��� ������ ����� Join
*Equijoin Join ������ ��Ȯ�� ��ġ�ϴ� ��� ���(�Ϲ������� PK �� FK ���)
*Non-Equijoin Join ������ ��Ȯ�� ��ġ���� �ʴ� ��쿡 ���(���,����)
*Outer Join Join ������ ��Ȯ�� ��ġ���� �ʴ� ��쿡�� ��� ����� ���
*Self Join �ϳ��� ���̺��� ����� Join �ϰ��� �� ��쿡 ���
Set Operators ���� ���� SELECT ������ �����Ͽ� �ۼ��Ѵ�

Equijoin Join
Non-Equijoin Join
Outer Join Join
Self Join

������ DB (RDBMS)

���� (���̺�� ���̺���� ����)
(Ŭ���� (�ڹ�) ��) >> �������� ����

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
--SQL ����
--ANSI ����

select m.m1 , m.m2 , s.s2
from m , s
where m.m1 = s.s1;

--ANSI (ǥ��)
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
       
--�����ȣ ,�̸� , �μ���ȣ , �μ��̸��� ����ϼ��� (ANSI)
select emp.empno, emp.ename , dept.deptno , dept.dname
from emp join dept on emp.deptno = dept.deptno;

select e.empno, e.ename , d.deptno , d.dname
from emp e join dept d on e.deptno = d.deptno;

--HR�̵�
select * from employees;
select * from departments;
select * from locations;


select count(*) from employees;  --107

--��� , �̸�( last_name) ,�μ���ȣ , �μ��̸� 
select e.employee_id , e.last_name , e.department_id , d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;
--null
--106 ,,,,, 107(������)
select * from employees where department_id is null;
--178	Kimberely	Grant	KGRANT ����Ȯ��

--��� , �̸�(last_name) , �μ���ȣ , �μ��̸� , �����ڵ� , ���ø� �� ����ϼ���
select e.employee_id , e.last_name , e.department_id , d.department_name ,d.location_id , l.city
from employees e join departments d on e.department_id = d.department_id
                 join locations l   on d.location_id = l.location_id;

--------------------------------------------------------------------------------
show user;

select * 
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

--------------------------------------------------------------------------------
--outer join (equi ���� ����ǰ� ���� >> �����ִ� �����͸� �������� ���)
--1. ���� ���� (������ �Ǵ� �ʿ� �����ִ� �����͸� �������� ���)
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
--self join(�ڱ�����) -> ����(x) -> �ǹ̸� ���� -> ����� ����
--�ϳ��� ���̺� �ִ� �÷��� �ڽ��� ���̺� �ִ� Ư�� �÷��� �����ϴ� ��� 

select e.empno , e.ename , m.empno , m.ename
from emp e join emp m
on e.mgr = m.empno;

--14 >> 13��
--�÷���  null ��� ���� Ȯ��
select count(*) from emp where mgr is null;

select e.empno , e.ename , m.empno , m.ename
from emp e left outer join emp m
on e.mgr = m.empno;

--ETC
--��Ÿ
--NATURAL JOIN
--Equijoin�� �����ϴٰ� ���ø� �˴ϴ�.
-- [�� ���̺�]�� [������ �̸�]�� ������ Į���� [��� ����]�� �˴ϴ�.
SELECT empno, ename, deptno , dname 
FROM emp NATURAL JOIN dept ;

--JOIN ~ USING 
--NATURAL JOIN�� ������ ������ �̸��� ������ Į���� ��� ������ �Ǿ��µ� 
--USING ���� ����ϸ� �÷��� �����ؼ� ������ �� ���� �ֽ��ϴ�.
SELECT e.empno, e.ename, deptno , dname 
FROM emp e JOIN dept d USING(deptno);

select * from emp , dept;
select * from emp cross join dept;
--------------------------------------------------------------------------------
--20 ���Դϴ� 
-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
 
-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.
SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE  D.LOC='DALLAS';
 
-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.
SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';

-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�.
SELECT E.ENAME, D.DNAME, E.SAL 
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;
 
-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�.
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.JOB='SALESMAN';
 
-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����
SELECT         E.EMPNO AS "�����ȣ",
               E.ENAME AS "����̸�",
               E.SAL*12 AS "����",
               --E.SAL*12+NVL(COMM,0) AS "�Ǳ޿�",
               E.SAL*12+COMM AS "�Ǳ޿�",
               S.GRADE AS "�޿����"
FROM EMP E  join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;
 
-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����϶�.
-- inner �� ���� ����
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
            join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;
 
 
-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������
-- �����϶�.
-- inner �� ���� ����
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D        on E.DEPTNO=D.DEPTNO
            join SALGRADE S    on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE  E.DEPTNO<=20 --WHERE E.DEPTNO IN (10,20)  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;
 
 
-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)
 
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;
--------------------------------------------------------------------------------
--subquery 
-- sql �� .... ���� �ذ��
-- ���� : �Լ� (����)
-- ���� : join , union >> �ذ� �ȵǿ� >> subquery(in line view)  or view ( �������̺�)

--������̺��� ������� ��� ���޺��� �� ���� ������ �޴� ����� ���, �̸�, �޿��� ����ϼ���
select avg(sal) from emp; --2073

select * from emp 
where sal > (select avg(sal) from emp);
/*
1. single row subquery : ���� ����� �����÷��� ���Ϸο찪 �� ��� (�Ѱ��� ��)
ex) select sum(sal) from emp ,   select max(sal) from emp
������ : =  , != ,  <  , >

2. multi row subquery : ���� ����� �����÷��� �������Ƿο찪�� ���
ex) select deptno  from  emp , select sal from emp
������ : IN , NOT IN , ANY  , ALL
ALL : sal > 1000 and sal > 40000 and ....
ANY : sal > 1000 or sal > 40000 or .....

����)
1. ��ȣ�ȿ� �־�� �Ѵ�   (select max(sal) from emp)
2. ���� �÷� ����        (select max(sal) ,min(sal) from emp) �������� �ȵǿ� (x)
3. ���������� �ܵ����� ���� ����

���� ���� �� ���� ����
1. ���� ���� ����ǰ� �� ����� ������
2. ���� ������ ����ȴ�

TIP)
select (subquery) >> scala  >> select (select  ..) , empno 
from (subquery)   >> in line view (�������̺�)
where (subquery)  >> ����
*/

--������̺��� jones �� �޿����� �� ���� �޿��� �޴� ����� ��� , �̸� , �޿��� ����ϼ���
select sal from emp where ename ='JONES';

select * from emp 
where sal > (select sal from emp where ename ='JONES');

--�μ���ȣ�� 30���� ����� ���� �޿��� �޴� ��� ����� ������ ����ϼ���
select sal from emp where deptno=30;

select * 
from emp 
where  sal in (select sal from emp where deptno=30); --sal=1600 or ....

--�μ���ȣ�� 30���� ����� �ٸ� �޿��� �޴� ��� ����� ������ ����ϼ���
select * 
from emp 
where  sal not in (select sal from emp where deptno=30);
--sal != 1600 and sal != 800 

--���������� �ִ� ����� ����� �̸��� ����ϼ���
select *
from emp 
where empno in(select mgr from emp);

--���������� ���� ����� ����� �̸��� ����ϼ���
select *
from emp 
where empno not in(select nvl(mgr,0) from emp); -- and ... and ... and null > null

--20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� 
--��� , �̸� , �޿� , �μ���ȣ�� ����ϼ���
select empno, ename , sal , deptno
from emp
where sal > (select max(sal) from emp where deptno=20);

--��Į�� ���� ����
select e.empno , e.ename , (select d.dname from dept d where d.deptno = e.deptno) as dept_name
from emp e
where e.sal >= 3000; 

--�ǹ����� ���� ���(�߱�)
--hint) ���࿡ �μ���ȣ�� �μ��� ��� ������ ����ִ� ���̺��� �����ϴٸ� (�޸𸮿�)
--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� ����� ��� , �̸� , �μ���ȣ , �μ��� ��տ���  ����ϼ���
--in line view
--select deptno , trunc(avg(sal)) as avgsal from emp group by deptno
select *
from emp e join (select deptno , trunc(avg(sal)) as avgsal from emp group by deptno) s
on e.deptno = s.deptno  and e.sal > s.avgsal;
--where e.sal > s.avgsal;

/*
SQL ���� ���� 
FROM > ON > JOIN > -- > GROUP BY > HAVING > SELECT > ORDER BY

ON���� ������ JOIN�� �Ǹ鼭 ����ǰ�, WHERE���� ������ JOIN�� ��� ������ ���� ����˴ϴ�.
ON�� WHERE�� ���� ����� ����, ON�� ����� ���� ����� ���ٸ�
ON�� ����ϴ� ���� �����ϴ�.

*/
--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.
SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT SAL
           FROM EMP
           WHERE ENAME='SMITH');
 
--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,
-- �μ���ȣ�� ����϶�.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN(SELECT SAL
             FROM EMP
             WHERE DEPTNO=10);
 
--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
              FROM EMP
              WHERE ENAME='BLAKE')
AND ENAME!='BLAKE';
 
--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����϶�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;
 
--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
-- �ִ� ����� �����ȣ�� �̸��� ����϶�.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM EMP
                WHERE ENAME LIKE '%T%');
--where deptno = 20 or deptno= 30


--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)
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
 
 
--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
-- �̸�, �μ���ȣ, ������ ����϶�.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO    -- = �� �´µ�  IN
                FROM DEPT
                WHERE LOC='DALLAS');
 
--8. SALES �μ����� ���ϴ� �������  ���� �μ���ȣ, �̸�, ������ ���� ��������� ����϶�.
SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM DEPT
                WHERE DNAME='SALES')
 

 
--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���)
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
           FROM EMP
           WHERE ENAME='KING');
 
--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����
-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,
-- �޿��� ����϶�.
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
 
--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����
-- �̸�, ����, �μ���ȣ�� ����϶�.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM EMP
                WHERE COMM IS NOT NULL)
AND SAL IN( SELECT SAL
            FROM EMP
            WHERE COMM IS NOT NULL);
 
--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����
-- ������� �̸�, ����, Ŀ�̼��� ����϶�.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=30)
AND COMM NOT IN(SELECT NVL(COMM, 0)
                FROM EMP
                WHERE DEPTNO=30 and comm is not null);

--------------------------------------------------------------------------------
select * from emp order by 1,2,3; --1,2,3��° �÷� ������ �������� ����
                                  -- order by empno , ename , job ����
                                  
select deptno ,sal , empno from emp order by 1 desc,2; 
                                  -- order by deptno desc , sal asc ����
                                  
 /*                                  
���ݱ��� �ʱ� ������ �ʼ� ����
select
from 
where 
group by
having
order by
+
�⺻ �Լ� (����,����,��¥,��ȯ,�Ϲ�,����)
+ 
�������̺� (JOIN , UNION)
+
subquery ���� (in line view)
+ 
�⺻���� DML ���� (�ʼ� �ϱ�) �Դϴ�
                                 
*/                                  
--������ ����(DML) �Դϴ�
--insert  , update , delete (�ݵ�� �ϱ�)

/*
DDL(������ ���Ǿ�) : [create , alter  , drop , truncate] , rename , modify
DML(������ ���۾�) : Ʈ������� ����Ű�� �۾� : insert , update , delete
ex) ������ ... ȸ�� ���ڱ� ...DB select �ߵǴµ� insert, update, delete �ȵǿ�
    >> ���ڱ� log write �� �����ϴ� �۾� (����� .����.�.���� ���)
    >> DISK ��� (log file full) >> log write �ȵǸ� >> DML �۾� ���ؿ�
    >> log backup >> log ���� ....
    
    >> commit ���� ���� ��� .....  �ǽ� .... �ϻ�ٹݻ� .....
DQL(������ ���Ǿ�) : select 
DCL(������ �����) : ������ : grant , revoke
TCL(Ʈ�����)     : commit , rollback , savepoint 
*/  

--�뷮 ������ ����

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

--insert into ���̺��() values()
--insert into ���̺��() select ��

insert into temp3(num)
select id from temp;

commit;

select * from temp3;

--2 �뷮 ������ ����
create table copyemp
as
  select empno ,ename from emp;
  
select * from copyemp;  

create table copyemp2
as
  select empno ,ename from emp where 1=2;
  
desc copyemp2;
--------------------------------------------------------------------------------
--DB������
/*
�ʱ� ������ (SQL)
1. CRUD (insert , select , update , delete)
2. JAVA >> JDBC API >> APP  -  DB 
3. JAVA >> CRUD �Լ��� ���� ������ �۾��� �����ϴ�

���� >> MVC ����

model (DTO, DAO (����) , SERVICE)

EMP CRUD > 

mybatis >> xml >> 

*/

--����Ŭ (���� �÷� (���� �÷�))
--�л� ���� ���̺�
--���� , ���� , ���� , ��� ( ���Ἲ )

create table vtable(
  no1 number,
  no2 number,
  no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);

insert into vtable(no1 , no2) values(100,50);

select * from vtable;
  
  --�ǹ����� Ȱ��Ǵ� �ڵ�
-- ��ǰ���� (�԰�) : �б⺰ ������ ����(4�б�)
create table vtable2(
   no number, --����
   p_code char(4), --��ǰ�ڵ� (A001 , B003)
   p_date char(8), --�԰��� (20230101)
   p_qty number, --����
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

CREATE TABLE grade (
    id NUMBER PRIMARY KEY NOT NULL,
    name VARCHAR2(10) NOT NULL,
    kor NUMBER DEFAULT 0,
    eng NUMBER DEFAULT 0,
    math NUMBER,
    total NUMBER GENERATED ALWAYS AS (kor + eng + math) VIRTUAL,
    avr NUMBER GENERATED ALWAYS AS (TRUNC((kor + eng + math) / 3, 0)) VIRTUAL,
    depno VARCHAR2 REFERENCES college(id) 
);


create table college (
    id varchar2(10) not null primary key,
    name varchar2(10) not null
);

select * from college;

create or replace view v_01
as select job, avg(sal) as avgsal from emp group by job;

select * from v_02;

create or replace view v_02 as 
select ename, sal from emp where sal>300;

create table board(
    boardid number constraint pk_board primary key,
    title nvarchar2(50)
);

insert into board 
values((select max(nvl(boardid,0))+1 from board),'����°');

select * from board;

select rownum, empno, ename, sal from emp;














show user;

/*
1. EMPLOYEES ���̺��� �̿��Ͽ� ���� ���ǿ� �����ϴ� ���� �˻��ϼ���. 
2005�����Ŀ� �Ի��� ��� �߿� �μ���ȣ�� �ְ�, �޿��� 5000~10000 ������ ����� �˻��մϴ�. 


2. EMPLOYEES ���̺��� �̿��Ͽ� ���� ���ǿ� �����ϴ� ���� �˻��ϼ���. 
�μ���ȣ�� �ְ�, �μ��� �ٹ� �ο����� 2�� �̻��� ���� �˻��Ͽ� �μ��� �ִ� �޿��� �ּ� �޿��� �����
�� �� ���̸� �˻��մϴ�. 
*/

select * from employees;

select employee_id
from employees
where salary between 5000 and 10000 and
department_id is not null and
to_char(hire_date,'YY') >= 2005;

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

--sql����
select *
from m, s
where m.m1 = s.s1;

--ANSI(ǥ��)
select * 
from m join s
on m.m1=s.s1;

select e.empno,e.ename,d.dptno,d.dname
from emp e join dept d
on e.deptno = d.deptno;

--hr--
select e.employee_id, e.last_name, d.department_id,d.department_name
from employees e join departments d
on e.department_id = d.department_id;

select *
from employees e join departments d
on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

show user;

--�� ����--
select * 
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
select e.ename, e.deptno, d.dname 
from emp e join dept d
on e.deptno = d.deptno;

?
select * from emp;
select * from dept;
-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.
select *
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';
?

-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.

?

?

?

-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������

--����ϴµ� ������ 3000�̻��� ����� ����϶�.

?

-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���

-- �� ����� ���� �μ� �̸��� ����϶�.

?

?

-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,

-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',

-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.

--(�� ) 1 : 1 ���� ��� �÷��� ����

?

-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,

-- ����, �޿������ ����϶�.

?

-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,

-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�

-- ������� �μ���ȣ�� ���� ������, ������ ���� ������

-- �����϶�.
select e.deptno,d.dname,e.ename,e.sal, g.grade
from emp e join dept d
on e.deptno = d.deptno join salgrade g 
on e.sal between g.losal and g.hisal
where e.deptno in (10,20)
order by 1 asc, 4 desc;
?

-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������

-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',

-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.

--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)


SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E left outer join EMP M
on e.MGR = m.EMPNO;

select * from emp
where empno not in(select nvl(mgr,0) from emp);

select e.ename,e.sal
from emp e join
(   select deptno,avg(sal) as avgsal 
    from emp
    group by deptno) v
 on e.deptno = v.deptno 
 and e.sal>v.avgsal
;

select deptno,avg(sal)
from emp
group by deptno;

--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.

select ename, sal
from emp
where sal>(select sal from emp where ename = 'SMITH');


?

?

?

--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,

-- �μ���ȣ�� ����϶�.

?select * from emp;


?

?

?

?

--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�

-- 'BLAKE'�� ���� ����϶�.

?

?

?

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������

-- ����ϵ�, ������ ���� ��� ������ ����϶�.

?

?

?

?

?

--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�

-- �ִ� ����� �����ȣ�� �̸��� ����϶�.

?

?

?

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������

-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.

--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)

?

?

?

?

?

--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����

-- �̸�, �μ���ȣ, ������ ����϶�.

?

?

?

--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.

?

?

?

?

?

--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�

--king �� ����� ��� (mgr �����Ͱ� king ���)

?

?

?

?

?

--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����

-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,

-- �޿��� ����϶�.

?

?

?

?

?

--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����

-- �̸�, ����, �μ���ȣ�� ����϶�.

?

?

?

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����

-- ������� �̸�, ����, Ŀ�̼��� ����϶�.

create table copyemp
as 
    select empno, ename from emp;
    
select * from copyemp;

create table copyemp2
as 
    select empno, ename from emp where 1=2;
    
desc copyemp2;

create table vtable(
    no1 number,
    no2 number,
    no3 number generated always as(no1+no2) virtual
);

insert into vtable(no1,no2) values(100,50);
select * from vtable;













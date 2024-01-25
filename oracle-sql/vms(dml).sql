INSERT INTO ROLES VALUES(1,USER);
INSERT INTO ROLES VALUES(2,MGR);

insert into departments values(1,'market',null);

INSERT INTO SCHEDULE (CALENDER_ID, TITLE, START_DATE, END_DATE,dept_id,type_id)
VALUES(8, 'ø¨∞°', '2024-01-16', '2024-01-18',2,1);
commit;


		    SELECT 
		        CALENDER_ID as calender_Id,
		        TITLE as title,
		        START_DATE as start_date,
		        END_DATE as end_date,
		        EMP_ID as emp_id,
		        DEPT_ID as dept_id,
		        TYPE_ID as type_id
		    FROM 
		        SCHEDULE
		    WHERE
		    	DEPT_ID = 2;
                
SELECT * FROM vacation_type;                
INSERT INTO vacation_type VALUES(4,'±‚≈∏',NULL);

ALTER session set NLS_DATE_FORMAT = 'YYYY/MM/DD';

SELECT NVL(MAX(CALENDER_ID),0) FROM SCHEDULE; 

-------------------------------------------------

select * from vacation_reg vr 
join employees e on vr.emp_id=e.emp_id join schedule s on vr.reg_id= s.reg_id
where vr.state ='Ω¬¿Œ' and e.dept_id=1;

SELECT s.START_DATE AS startDate,
			       s.END_DATE AS endDate,
			       vr.CONTENT AS content,
			       s.EMP_ID AS empId,
			       s.TITLE as title from vacation_reg vr 
                   join employees e on vr.emp_id=e.emp_id join schedule s on vr.reg_id= s.reg_id
where vr.state ='Ω¬¿Œ' and e.dept_id=1;


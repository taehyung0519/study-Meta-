drop table employee_roles;
drop table roles;
drop table certification;
drop table schedule;
drop table upload_files;
drop table vacation_reg;
drop table vacation_type;
drop table scheduler;
drop table employees;
drop table departments;


-- 사원 테이블
CREATE TABLE EMPLOYEES (
   EMP_ID VARCHAR2(50) NOT NULL, /* 사원아이디 */
   NAME VARCHAR2(50), /* 사원이름 */
   PASSWORD VARCHAR2(70), /* 비밀번호 */
   EMAIL VARCHAR2(70), /* 이메일 */
   POSITION VARCHAR2(50), /* 직책 */
   GENDER VARCHAR2(10), /* 성별 */
   BIRTH DATE NULL, /* 생년월일 */
   HIRE_DATE DATE NULL, /* 입사년일 */
   RETIRE_DATE DATE NULL, /* 퇴직년일 */
   PHONE VARCHAR2(50), /* 전화번호 */
   STATUS VARCHAR2(50), /* 재직상태 */
   REMAINS NUMBER, /* 잔여휴가 */
   DEPT_ID NUMBER /* 부서 아이디 */
);


CREATE UNIQUE INDEX PK_EMPLOYEES
   ON EMPLOYEES (
      EMP_ID ASC
   );

ALTER TABLE EMPLOYEES
   ADD
      CONSTRAINT PK_EMPLOYEES
      PRIMARY KEY (
         EMP_ID
      );

/* 일정 */
CREATE TABLE SCHEDULE (
   CALENDER_ID NUMBER NOT NULL, /* 일정 아이디 */
   TITLE VARCHAR2(50), /* 일정 이름 */
   START_DATE DATE, /* 시작날짜 */
   END_DATE DATE, /* 종료날짜 */
   TYPE_ID NUMBER, /* 유형 아이디 */
   EMP_ID VARCHAR2(50), /* 사원아이디 */
   DEPT_ID NUMBER /* 부서 아이디 */
);

CREATE UNIQUE INDEX PK_SCHEDULE
   ON SCHEDULE (
      CALENDER_ID ASC
   );

ALTER TABLE SCHEDULE
   ADD
      CONSTRAINT PK_SCHEDULE
      PRIMARY KEY (
         CALENDER_ID
      );

/* 휴가신청 */
CREATE TABLE VACATION_REG (
   REG_ID NUMBER NOT NULL, /* 신청서 아이디 */
   STATE VARCHAR2(50), /* 승인상태 */
   START_DATE DATE, /* 시작날짜 */
   END_DATE DATE, /* 종료날짜 */
   REG_DATE DATE, /* 신청날짜 */
   DENIED_CONTENT VARCHAR2(500), /* 거절사유 */
   CONTENT VARCHAR2(500), /* 휴가사유 */
   EMP_ID VARCHAR2(50), /* 사원아이디 */
   TYPE_ID NUMBER /* 유형아이디 */
);

CREATE UNIQUE INDEX PK_VACATION_REG
   ON VACATION_REG (
      REG_ID ASC
   );

ALTER TABLE VACATION_REG
   ADD
      CONSTRAINT PK_VACATION_REG
      PRIMARY KEY (
         REG_ID
      );

-- 부서 테이블
CREATE TABLE DEPARTMENTS (
   DEPT_ID NUMBER NOT NULL, /* 부서 아이디 */
   NAME VARCHAR2(50), /* 부서 이름 */
   SUPERVISOR NUMBER /* 팀장 */
);

CREATE UNIQUE INDEX PK_DEPARTMENTS
   ON DEPARTMENTS (
      DEPT_ID ASC
   );

ALTER TABLE DEPARTMENTS
   ADD
      CONSTRAINT PK_DEPARTMENTS
      PRIMARY KEY (
         DEPT_ID
      );

/* 업로드된 파일 */
CREATE TABLE UPLOAD_FILES (
   FILE_ID NUMBER NOT NULL, /* 파일아이디 */
   NAME VARCHAR2(128), /* 파일이름 */
   FILE_SIZE NUMBER, /* 파일크기 */
   CONTENT_TYPE VARCHAR2(500), /* 파일 유형 */
   FILE_DATA BLOB, /* 내용 */
   REG_ID NUMBER /* 신청서 아이디 */
);

CREATE UNIQUE INDEX PK_UPLOAD_FILES
   ON UPLOAD_FILES (
      FILE_ID ASC
   );

ALTER TABLE UPLOAD_FILES
   ADD
      CONSTRAINT PK_UPLOAD_FILES
      PRIMARY KEY (
         FILE_ID
      );

-- 권한 테이블
CREATE TABLE ROLES (
   ROLE_ID NUMBER NOT NULL, /* 권한 아이디 */
   NAME VARCHAR2(50) /* 권한 이름 */
);

CREATE UNIQUE INDEX PK_ROLES
   ON ROLES (
      ROLE_ID ASC
   );

ALTER TABLE ROLES
   ADD
      CONSTRAINT PK_ROLES
      PRIMARY KEY (
         ROLE_ID
      );

-- 사원_권한 테이블
CREATE TABLE EMPLOYEE_ROLES (
   EMP_ID VARCHAR2(50) NOT NULL, /* 사원아이디 */
   ROLE_ID NUMBER NOT NULL /* 권한 아이디 */
   --CONSTRAINT PK_EMPLOYEE_ROLES PRIMARY KEY (EMP_ID, ROLE_ID),
   --CONSTRAINT FK_EMPLOYEES_TO_EMPLOYEE_ROLES FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES (EMP_ID),
   --CONSTRAINT FK_ROLES_TO_EMPLOYEE_ROLES FOREIGN KEY (ROLE_ID) REFERENCES ROLES (ROLE_ID)
);

CREATE UNIQUE INDEX PK_EMPLOYEE_ROLES
   ON EMPLOYEE_ROLES (
      ROLE_ID ASC,
      EMP_ID ASC
   );

ALTER TABLE EMPLOYEE_ROLES
   ADD
      CONSTRAINT PK_EMPLOYEE_ROLES
      PRIMARY KEY (
         ROLE_ID,
         EMP_ID
      );

/* 휴가유형 */
CREATE TABLE VACATION_TYPE (
   TYPE_ID NUMBER NOT NULL, /* 유형아이디 */
   NAME VARCHAR2(50), /* 유형이름 */
   DAYS NUMBER /* 휴가일수 */
);

CREATE UNIQUE INDEX PK_VACATION_TYPE
   ON VACATION_TYPE (
      TYPE_ID ASC
   );

ALTER TABLE VACATION_TYPE
   ADD
      CONSTRAINT PK_VACATION_TYPE
      PRIMARY KEY (
         TYPE_ID
      );

/* 증명서 발급 */
CREATE TABLE CERTIFICATION (
   CERTIFICATE_ID NUMBER NOT NULL, /* 증명서 아이디 */
   REG_DATE DATE, /* 신청날짜 */
   TYPE VARCHAR2(50), /* 유형 */
   REASON VARCHAR2(500), /* 용도 */
   EMP_ID VARCHAR2(50) /* 사원아이디 */
);

CREATE UNIQUE INDEX PK_CERTIFICATION
   ON CERTIFICATION (
      CERTIFICATE_ID ASC
   );

ALTER TABLE CERTIFICATION
   ADD
      CONSTRAINT PK_CERTIFICATION
      PRIMARY KEY (
         CERTIFICATE_ID
      );

/* 스케줄러 동작 내역 */
CREATE TABLE SCHEDULER (
   SCHEDULE_ID NUMBER NOT NULL, /* 내역아이디 */
   WORK_DATE DATE, /* 동작시간 */
   CONTENT VARCHAR2(500), /* 동작내용 */
   SUCCESS NUMBER /* 성공여부 */
);

ALTER TABLE EMPLOYEES
   ADD
      CONSTRAINT FK_DEPARTMENTS_TO_EMPLOYEES
      FOREIGN KEY (
         DEPT_ID
      )
      REFERENCES DEPARTMENTS (
         DEPT_ID
      );

ALTER TABLE SCHEDULE
   ADD
      CONSTRAINT FK_VACATION_TYPE_TO_SCHEDULE
      FOREIGN KEY (
         TYPE_ID
      )
      REFERENCES VACATION_TYPE (
         TYPE_ID
      );

ALTER TABLE SCHEDULE
   ADD
      CONSTRAINT FK_EMPLOYEES_TO_SCHEDULE
      FOREIGN KEY (
         EMP_ID
      )
      REFERENCES EMPLOYEES (
         EMP_ID
      );

ALTER TABLE SCHEDULE
   ADD
      CONSTRAINT FK_DEPARTMENTS_TO_SCHEDULE
      FOREIGN KEY (
         DEPT_ID
      )
      REFERENCES DEPARTMENTS (
         DEPT_ID
      );

ALTER TABLE VACATION_REG
   ADD
      CONSTRAINT FK_EMPLOYEES_TO_VACATION_REG
      FOREIGN KEY (
         EMP_ID
      )
      REFERENCES EMPLOYEES (
         EMP_ID
      );

ALTER TABLE VACATION_REG
   ADD
      CONSTRAINT FK_VACATION_TYPE_TO_REG
      FOREIGN KEY (
         TYPE_ID
      )
      REFERENCES VACATION_TYPE (
         TYPE_ID
      );

ALTER TABLE UPLOAD_FILES
   ADD
      CONSTRAINT FK_VACATION_REG_TO_UPLOAD
      FOREIGN KEY (
         REG_ID
      )
      REFERENCES VACATION_REG (
         REG_ID
      );

ALTER TABLE EMPLOYEE_ROLES
   ADD
      CONSTRAINT FK_ROLES_TO_EMPLOYEE_ROLES
      FOREIGN KEY (
         ROLE_ID
      )
      REFERENCES ROLES (
         ROLE_ID
      );

ALTER TABLE EMPLOYEE_ROLES
   ADD
      CONSTRAINT FK_EMPLOYEES_TO_EMPLOYEE_ROLES
      FOREIGN KEY (
         EMP_ID
      )
      REFERENCES EMPLOYEES (
         EMP_ID
      );

ALTER TABLE CERTIFICATION
   ADD
      CONSTRAINT FK_EMPLOYEES_TO_CERTIFICATION
      FOREIGN KEY (
         EMP_ID
      )
      REFERENCES EMPLOYEES (
         EMP_ID
      );
      
ALTER TABLE CERTIFICATION
modify CERTIFICATE_ID VARCHAR2(250);

ALTER TABLE VACATION_REG
MODIFY STATE DEFAULT '결재대기';

ALTER TABLE UPLOAD_FILES
DROP CONSTRAINT FK_VACATION_REG_TO_UPLOAD;

ALTER TABLE UPLOAD_FILES
ADD CONSTRAINT FK_VACATION_REG_TO_UPLOAD
FOREIGN KEY (REG_ID)
REFERENCES VACATION_REG (REG_ID)
ON DELETE CASCADE;

alter table scheduler rename column schedule_id to scheduler_id;

delete from schedule;

alter table schedule add reg_id number not null;

alter table schedule
add constraint fk_reg_schedule 
foreign key(reg_id)
REFERENCES vacation_reg(reg_id)
on delete cascade;

alter table vacation_reg add vacation_days number;

ALTER TABLE EMPLOYEES
MODIFY REMAINS NUMBER DEFAULT 0;

commit;

----------------트리거 commit하지 말것-------------------

CREATE OR REPLACE TRIGGER update_remaining_vacation
BEFORE INSERT OR DELETE ON VACATION_REG
FOR EACH ROW
DECLARE
   v_days_difference NUMBER;
BEGIN
   IF INSERTING AND :NEW.TYPE_ID = 1 THEN
      -- 새로운 휴가가 신청되었을 때, TYPE_ID가 1인 경우
      v_days_difference := :NEW.vacation_days;

      UPDATE EMPLOYEES
      SET REMAINS = REMAINS - v_days_difference
      WHERE EMP_ID = :NEW.EMP_ID;

   ELSIF DELETING AND :OLD.TYPE_ID = 1 THEN
      -- 휴가가 취소되었을 때, TYPE_ID가 1인 경우
      v_days_difference := :OLD.vacation_days;

      UPDATE EMPLOYEES
      SET REMAINS = REMAINS + v_days_difference
      WHERE EMP_ID = :OLD.EMP_ID;
   END IF;
END;


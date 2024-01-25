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


-- ��� ���̺�
CREATE TABLE EMPLOYEES (
   EMP_ID VARCHAR2(50) NOT NULL, /* ������̵� */
   NAME VARCHAR2(50), /* ����̸� */
   PASSWORD VARCHAR2(70), /* ��й�ȣ */
   EMAIL VARCHAR2(70), /* �̸��� */
   POSITION VARCHAR2(50), /* ��å */
   GENDER VARCHAR2(10), /* ���� */
   BIRTH DATE NULL, /* ������� */
   HIRE_DATE DATE NULL, /* �Ի���� */
   RETIRE_DATE DATE NULL, /* �������� */
   PHONE VARCHAR2(50), /* ��ȭ��ȣ */
   STATUS VARCHAR2(50), /* �������� */
   REMAINS NUMBER, /* �ܿ��ް� */
   DEPT_ID NUMBER /* �μ� ���̵� */
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

/* ���� */
CREATE TABLE SCHEDULE (
   CALENDER_ID NUMBER NOT NULL, /* ���� ���̵� */
   TITLE VARCHAR2(50), /* ���� �̸� */
   START_DATE DATE, /* ���۳�¥ */
   END_DATE DATE, /* ���ᳯ¥ */
   TYPE_ID NUMBER, /* ���� ���̵� */
   EMP_ID VARCHAR2(50), /* ������̵� */
   DEPT_ID NUMBER /* �μ� ���̵� */
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

/* �ް���û */
CREATE TABLE VACATION_REG (
   REG_ID NUMBER NOT NULL, /* ��û�� ���̵� */
   STATE VARCHAR2(50), /* ���λ��� */
   START_DATE DATE, /* ���۳�¥ */
   END_DATE DATE, /* ���ᳯ¥ */
   REG_DATE DATE, /* ��û��¥ */
   DENIED_CONTENT VARCHAR2(500), /* �������� */
   CONTENT VARCHAR2(500), /* �ް����� */
   EMP_ID VARCHAR2(50), /* ������̵� */
   TYPE_ID NUMBER /* �������̵� */
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

-- �μ� ���̺�
CREATE TABLE DEPARTMENTS (
   DEPT_ID NUMBER NOT NULL, /* �μ� ���̵� */
   NAME VARCHAR2(50), /* �μ� �̸� */
   SUPERVISOR NUMBER /* ���� */
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

/* ���ε�� ���� */
CREATE TABLE UPLOAD_FILES (
   FILE_ID NUMBER NOT NULL, /* ���Ͼ��̵� */
   NAME VARCHAR2(128), /* �����̸� */
   FILE_SIZE NUMBER, /* ����ũ�� */
   CONTENT_TYPE VARCHAR2(500), /* ���� ���� */
   FILE_DATA BLOB, /* ���� */
   REG_ID NUMBER /* ��û�� ���̵� */
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

-- ���� ���̺�
CREATE TABLE ROLES (
   ROLE_ID NUMBER NOT NULL, /* ���� ���̵� */
   NAME VARCHAR2(50) /* ���� �̸� */
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

-- ���_���� ���̺�
CREATE TABLE EMPLOYEE_ROLES (
   EMP_ID VARCHAR2(50) NOT NULL, /* ������̵� */
   ROLE_ID NUMBER NOT NULL /* ���� ���̵� */
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

/* �ް����� */
CREATE TABLE VACATION_TYPE (
   TYPE_ID NUMBER NOT NULL, /* �������̵� */
   NAME VARCHAR2(50), /* �����̸� */
   DAYS NUMBER /* �ް��ϼ� */
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

/* ���� �߱� */
CREATE TABLE CERTIFICATION (
   CERTIFICATE_ID NUMBER NOT NULL, /* ���� ���̵� */
   REG_DATE DATE, /* ��û��¥ */
   TYPE VARCHAR2(50), /* ���� */
   REASON VARCHAR2(500), /* �뵵 */
   EMP_ID VARCHAR2(50) /* ������̵� */
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

/* �����ٷ� ���� ���� */
CREATE TABLE SCHEDULER (
   SCHEDULE_ID NUMBER NOT NULL, /* �������̵� */
   WORK_DATE DATE, /* ���۽ð� */
   CONTENT VARCHAR2(500), /* ���۳��� */
   SUCCESS NUMBER /* �������� */
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
MODIFY STATE DEFAULT '������';

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

----------------Ʈ���� commit���� ����-------------------

CREATE OR REPLACE TRIGGER update_remaining_vacation
BEFORE INSERT OR DELETE ON VACATION_REG
FOR EACH ROW
DECLARE
   v_days_difference NUMBER;
BEGIN
   IF INSERTING AND :NEW.TYPE_ID = 1 THEN
      -- ���ο� �ް��� ��û�Ǿ��� ��, TYPE_ID�� 1�� ���
      v_days_difference := :NEW.vacation_days;

      UPDATE EMPLOYEES
      SET REMAINS = REMAINS - v_days_difference
      WHERE EMP_ID = :NEW.EMP_ID;

   ELSIF DELETING AND :OLD.TYPE_ID = 1 THEN
      -- �ް��� ��ҵǾ��� ��, TYPE_ID�� 1�� ���
      v_days_difference := :OLD.vacation_days;

      UPDATE EMPLOYEES
      SET REMAINS = REMAINS + v_days_difference
      WHERE EMP_ID = :OLD.EMP_ID;
   END IF;
END;


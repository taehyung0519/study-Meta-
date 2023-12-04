package kr.or.kosa;

import lombok.Data;

/*
create table Emp (
   empno number,
   ename varchar2(20)
)

*/
@Data
public class EmpDTO {
	private int empno;
	private String ename;
	private String job;
}

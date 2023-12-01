<%@page import="java.util.Calendar"%>
<%@page import="kr.or.kosa.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 //서버코드(java 코드)
 //jsp ... Model 별도로 작성
 	Emp emp = new Emp();
 	emp.setEmpno(9999);
 	emp.setEname("홍길동");
 
 	Calendar cal = Calendar.getInstance();
 	int year = cal.get(Calendar.YEAR);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h3>출력 표현식</h3>
	 <%=emp.getEmpno()%><br>
	 <%=emp.getEname()%><br>
	 <%=emp.toString()%><br>
	 년도<%=year%>
</body>
</html>







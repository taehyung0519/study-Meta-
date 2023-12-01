<%@page import="net.sf.json.JSONArray"%>
<%@page import="kr.or.kosa.dto.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = null; //Connection 인터페이스 ...
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","kosa","1004");
		
		Statement stmt = conn.createStatement(); //명령 객체 얻어오기
		String sql = "select empno , ename , sal , job ,comm from emp";
		//select to_char(date) from  >> DTO 에서 String  으로 
		ResultSet rs = stmt.executeQuery(sql); //DB서버에서 실행되고 결과를 생성
		
		//POINT
		//DTO 객체 데이터 담아야 -> JSON변환 가능
		List<Emp> list = new ArrayList<Emp>();
		
		while(rs.next()){
			Emp emp = new Emp();
			emp.setEmpno(rs.getInt("empno"));
			emp.setEname(rs.getString("ename"));
			emp.setSal(rs.getInt("sal"));
			emp.setJob(rs.getString("job"));
			emp.setComm(rs.getInt("comm"));
			
			list.add(emp);
		}
		
		JSONArray jsonlist = JSONArray.fromObject(list);
		
		stmt.close();
		rs.close();
		conn.close();
%>
<%=jsonlist %>
</body>
</html>
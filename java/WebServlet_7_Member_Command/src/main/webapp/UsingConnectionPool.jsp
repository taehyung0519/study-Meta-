<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Connection Pool 사용하기</title>
</head>
<body>
	<%
		//JNDI
		Context context = new InitialContext();
		//현재 [프로젝트]에서 특정 이름을 가진 객체를 검색 (이름기반 검색)
	
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); //lookup 함수안에 정해진 형식의 이름 제공 
		//java:comp/env/ + 이름 jdbc/oracle
		//튜브 가게 ..  ^^  (반드시 다 놀고 반환하자)
		
		Connection conn = null;
		//튜브를 주세요
		conn = ds.getConnection();
		
		out.print("db연결여부(false) : " + conn.isClosed() + "<br>");
		
		//놀아요
		//집에가요
		//반환
		conn.close(); //자원 해제가 아니고 connection pool 반환
		out.print("db연결여부(true) : " + conn.isClosed() + "<br>");
		
		//그래서 Pool 객체의 scope >> method 단위로 >> 사용하고 반환 
	%>
</body>
</html>
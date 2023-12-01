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
<title>Insert title here</title>
</head>
<body>
<%
	//JNDI
	Context context = new InitialContext();
    //현재 프로젝트 에서 특정 이름을 가진 객체를 검색 (이름 기반 검색)
    
    DataSource ds =  (DataSource)context.lookup("java:comp/env/jdbc/oracle");
    // java:comp/env (정해진 약속) + 개발자 마음 name="jdbc/oracle" 
    
    Connection conn = null;
    
    conn = ds.getConnection(); //상점갔어요 (튜브 하나 주세요)
    
    out.print("db 연결  false: " + conn.isClosed());		
   
    //놀아요
    //집에....
    //반드시 반환
    conn.close(); //자원해제가 아니고 반환 (상점에서 튜브 반환 )
    out.print("db 연결  true: " + conn.isClosed());	
    
    //그래서 pool 객체의 scope > 함수로 제한하다 (method)
%>
</body>
</html>
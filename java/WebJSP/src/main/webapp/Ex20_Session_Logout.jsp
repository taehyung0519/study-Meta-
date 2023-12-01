<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃 (session 객체 소멸 )
	session.invalidate();
	out.print("<script>location.href='Ex20_Session_Login.jsp'</script>");
%>

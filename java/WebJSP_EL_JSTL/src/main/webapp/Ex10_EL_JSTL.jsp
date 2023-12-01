<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JTSL 출력 - EL 출력</h3>
	<c:out value="<p>문단 태그입니다</p>" />
	<p>문단태그</p>
	<hr>
	<p> 태그는 문단 태그입니다
	&lt;p&gt; 태그는 설명..... 
	
	<hr>
	<h3>예외처리</h3>
	<!--
		c:catch 안에 구문이 예외가 발생하면 예외객체가 생성되고
		예외객체주소를 받아서 처리 ....
		
		var="msg" 자바 Exception msg
	  -->
		<c:catch  var="msg">
		name: <%= request.getParameter("name") %>
		<%
			if(request.getParameter("name").equals("hong")){
				out.print("당신의 이름은 : " + request.getParameter("name"));
			}
		%>
		</c:catch>
		<c:if test="${msg != null}">
			<h3>예외발생</h3>
			오류메시지 : ${msg}<br>
		</c:if>
	<!-- http://localhost:8090/WebJSP_EL_JSTL/Ex10_EL_JSTL.jsp?name=hong  -->
	<!-- http://localhost:8090/WebJSP_EL_JSTL/Ex10_EL_JSTL.jsp  예외상황  -->
</body>
</html>
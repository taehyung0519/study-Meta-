<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
	String id = request.getParameter("ID");
	if(id.equals("hong")){
%>
	<%=id%><img src="images/1.jpg" style="width:100px;height:100px">
<%		
	}
%>  

<%
 /*
 
	EL & JSTL 구문 WAS해석(서버쪽 스크립트)
	<c:set  변수생성, 값을 저장
	<c:if test="">
	<c:choose> 여러가지 조건 처리 (if 활용도가 높아요)
	<c:forEach  반복문(개선된 for문) javascript > foreach
	<c:forTokens   자바 for하고 split 결합
	<c:out 출력식  ${} 사용
	<c:catch 예외처리 가능 
*/
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL&JSTL</h3>
	<c:if test="${param.ID == 'hong'}">
		${param.ID}<img src="images/1.jpg" style="width:100px;height:100px">
	</c:if>
	<!--  
	http://localhost:8090/WebJSP_EL_JSTL/Ex03_EL_JSTL.jsp?ID=hong&age=50
	age parameter  값이 20 보다 크면 나이 출력
	-->
	<br>
	<c:if test="${param.age > 20}" var="result">
		param.value : ${param.age}
	</c:if>
	<br>
	result : ${result}
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	EL parameter : ${param.id} - ${param.pwd}<br>
	
	<h3>param 값 변수 저장</h3>
	<c:set var="userid" value="${param.id}" />
	<c:set var="pwd" value="${param.pwd}" />

	<h3>변수값 출력</h3>
	id:${userid}<br>
	pwd:${pwd}<br>
	
	<c:if test="${!empty pwd}"> <!-- 비번이 있으면 -->
		<h3>not empty password</h3>
		<c:if test="${pwd == '1004'}">
			<h3>welcome admin^^</h3>
		</c:if>
	</c:if>
</body>
</html>
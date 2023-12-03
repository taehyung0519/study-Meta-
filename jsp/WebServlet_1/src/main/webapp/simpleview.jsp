<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>forward된 페이지 (request 객체 공유)</h3>
	결과출력 : <%= request.getAttribute("result") %>
	
	<h3>EL</h3>
	${requestScope.result}<br>
</body>
</html>
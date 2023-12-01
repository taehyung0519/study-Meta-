<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/commonError.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  
Error(예외 상황) >> 특정 처리 페이지 제작

1. 페이지 마다 설정 통해서 예외 페이지 강제
2. 전역적인 방법으로 웹 사이트 전체 예외 페이지 강제 (web.xml)

실제 개발시에는 오류페이지 보고요 최종 배포시에는 처리 ...
-->
<%
	String data = request.getParameter("name");
	String data2 = data.toLowerCase(); //null 인 경우
%>
전달받은 내용 : <%=data %>
</body>
</html>
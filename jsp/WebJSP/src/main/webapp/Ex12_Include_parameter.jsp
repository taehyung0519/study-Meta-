<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//http://localhost:8090/WebJSP/Ex12_Include_parameter.jsp?type=A&userid=hong
	request.setCharacterEncoding("UTF-8");
	
	String type= request.getParameter("type");
	String userid = request.getParameter("userid");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	type:<%=type %>
	<br>
	userid:<%=userid%>
	<hr>
	<!-- 
	반드시 암기
	include  페이지는 request객체를 공유가능 
	또는 변수를 만들어서 include 페이지 전달 가능 (공유가능)
	-->
	<jsp:include page="Ex12_param.jsp">
		<jsp:param value="baseball" name="hobby"/>
	</jsp:include>
</body>
</html>







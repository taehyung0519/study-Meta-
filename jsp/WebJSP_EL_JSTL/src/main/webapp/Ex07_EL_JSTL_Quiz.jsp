<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	//Ex07_EL_JSTL_Quiz.jsp?hobby=농구&hobby=야구
   
	//String[] hobbys = request.getParameterValues("hobby");

   // EL ${param.id}
   //getParameterValues  >> EL ${paramValues.hobby}
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>다중값 처리</h3>
	<c:choose>
	   <c:when test="${not empty paramValues.hobby}">
	   	   당신의 선택은
	   	   <ul>
	   	   		<c:forEach var="hobby" items="${paramValues.hobby}" varStatus="status">
	   	   			<li>${hobby}-${status.index}-${status.count}</li>
	   	   		</c:forEach>
	   	   </ul>
	   </c:when>
	   <c:otherwise>
	   		선택을 하세요 <br>
	   </c:otherwise>
	</c:choose>
</body>
</html>







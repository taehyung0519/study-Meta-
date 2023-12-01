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
  <c:forEach var="i" begin="0" end="10">
  	  <c:set var="sum" value="${sum+i}" />
  	  ${i}<br>
  </c:forEach>
  sum : ${sum}<br>
  
  <ul>
  	<c:forEach var="i" begin="1" end="9">
  		<li>3*${i}=${3*i}</li>
  	</c:forEach>
  </ul>
  
  <h3>구구단 출력</h3>
    <c:forEach var="i" begin="2" end="9">
  		<c:forEach var="j" begin="0" end="9">
  			 <c:choose>
  			 		<c:when test="${j == 0}">
  			 			${i}단
  			 		</c:when>
  			 		<c:otherwise>
  			 			${i}*${j}=${i*j}&nbsp;&nbsp;
  			 		</c:otherwise>
  			 </c:choose>
  		</c:forEach>
  		<br>
  	</c:forEach>
  	
  	<h3>JSTL forEach</h3>
  	<%
  		int[] arr = new int[]{10,20,30,40,50};
  		//for(int i : arr){
  		//	out.print("출력값 : " + i + "<br>");
  		//}
  		
  		//문제: EL 은 자바객체에 직접 접근 불가 (1.request , session >> setAttribute >> EL )
  		
  		request.setAttribute("intarr",arr);
  	%>
  	<c:set var="intarray" value="<%=arr %>" />
  	
  	<c:forEach var="data" items="${intarr}"><!-- requestScope.intarr -->
  	   배열값 : ${data}<br>
  	</c:forEach>
  	
</body>
</html>
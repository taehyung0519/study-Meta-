<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  
    jsp:include : 공통 UI 작업 (필요한 페이지에서 사용)
    
    header.jsp
    footer.jsp
    
    
    a.jsp >> include header.jsp ...
    b.jsp >> include header.jsp ...
    c.jsp >> include header.jsp ...
    -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  SITE MAIN PAGE 상단
	  <hr>
	  		<jsp:include page="/commonmodule/sub.jsp" />
	  <hr>
	  SITE MAIN PAGE 하단
</body>
</html>
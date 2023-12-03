<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
/*  
JAVA : IO >> Buffer >> default (8kb) >> buffer (비워지는 시점) : 1. 8kbyte 채워지면 , 2. flush( close() )

설정을 강제하지 않으면 
buffer="8kb"  autoFlush="true" default값
*/

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		for(int i = 0 ; i < 10 ; i++){
			out.print("<b>" + i + "<b><br>");
		}
	%>
</body>
</html>
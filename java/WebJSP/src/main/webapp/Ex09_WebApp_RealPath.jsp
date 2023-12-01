<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--

URI (Universal Resource Identifier)
- 인터넷상의 자원을 식별하기 위한 표기법 및 규약
- URL + URN = URI
- 인터넷 환경에서 URI는 대부분 URL을 의미, URN은 사용이 제한적

​URL (Uniform Resource Locator)
- 물리적인 경로, 즉 자원의 위치 정보를 포함
- 프로토콜, 도메인, 아이피, 포트 등
- 컴퓨터로부터 접근 가능한 형태의 자원만 검색될 수 있어 제한적
- 우리가 흔히 보는 'http://test.com/test.jpg' 형태

​​URN (Uniform Resource Name)
- 독립적인 이름을 제공하기 위해 존재
- 자원에 대해 영속적이고 유일
- 자원의 위치와는 무관
- 예를들어 우리나라에서는 주민등록번호가 대표적

​
StringBuffer url = request.getRequestURL(); // URL : 전체주소 (프로토콜 + IP + 포트 + 상세경로)
String uri = request.getRequestURI(); // URI : 프로젝트 이하 경로 (CP + SP)
String cp = request.getContextPath(); // CP : 프로젝트 명
String sp = request.getServletPath(); // SP : 패키지 + 파일명

​

System.out.println("URL : " + url);
System.out.println("URI : " + uri);
System.out.println("CP : " + cp);
System.out.println("SP : " + sp);

​

​-----------------------------------------------------------------
URL : http://192.168.0.12:8090/WebJSP/Ex11_WebApp_RealPath.jsp

URI : /WebJSP/Ex11_WebApp_RealPath.jsp

CP : /WebJSP

SP : /WebJSP/Member/Ex11_WebApp_RealPath.jsp


이클립스 톰켓 내장 
실제 배포 경로 : 실제 서비스 되고 있는 소스는 아래 폴더 소스
D:\Duzon\Web\WebBack\WebLabs\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP
------------------------------------------------------------------->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String resourcepath = "/download/note.txt";
		out.print(resourcepath + "<br>");
		
		String realcontextpath = application.getRealPath(request.getContextPath()); //    /WebJSP
		out.print("getRealPath  실제 경로 "  + realcontextpath  +"<br>");
		//실 배포 경로
		//D:\Duzon\Web\WebBack\WebLabs\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\WebJSP
		
		String filepath = application.getRealPath(resourcepath); //
		out.print("file real path 실제 경로 "  + filepath  +"<br>");
		//실 배포 경로
		//D:\Duzon\Web\WebBack\WebLabs\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebJSP\download\note.txt
	
		//개발 소스 경로
		//D:\Duzon\Web\WebBack\WebLabs\WebJSP\src\main\webapp\download\note.txt
	
	
	
	StringBuffer url = request.getRequestURL(); // URL : 전체주소 (프로토콜 + IP + 포트 + 상세경로)
	String uri = request.getRequestURI(); // URI : 프로젝트 이하 경로 (CP + SP)
	String cp = request.getContextPath(); // CP : 프로젝트 명
	String sp = request.getServletPath(); // SP : 패키지 + 파일명
	System.out.println("URL : " + url);
	System.out.println("URI : " + uri);
	System.out.println("CP : " + cp);
	System.out.println("SP : " + sp);
	/*
		URL : http://localhost:8090/WebJSP/Ex09_WebApp_RealPath.jsp
		URI : /WebJSP/Ex09_WebApp_RealPath.jsp
		CP : /WebJSP
		SP : /Ex09_WebApp_RealPath.jsp
	*/	
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*  
	
	1.한글처리
	2.데이터 받기
	3.로직처리 (비지니스) >> DB 작업 >> 암호화 작업 >> 요구사항 정의 ....
	
	내장객체 (WAS : 톰켓) 가지고 있는 자원 
	1. request
	2. response
	3. session
	4. application 
	5. out (출력담당 객체)
	
	*/
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	
	//MemberDao  dao = new MemberDao();
	//MemberDto  dto = dao.getEmpListById(id);
	//dto 화면에 출력
	
	//Client 요청당 한개의 request 만들어 진다
	//request객체는 client 정보를 담고 있다 (입력값 포함)
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=id %><hr>
	EL:${id}
	접속한 IP : <%=request.getRemoteAddr()%>
	포트 : <%=request.getServerPort() %>
	파일 업로드 <%=request.getContextPath() %>
</body>
</html>
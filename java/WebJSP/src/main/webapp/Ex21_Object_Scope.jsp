
<%@page import="kr.or.kosa.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  
Tomcat제공(WAS) : 기본적인 내장 객체
1. request  (요청: 클라이언트 정보)
2. response (응답: 특정 페이지 이동 , 정보 출력 , 쿠키 쓰기)
3. application(전역객체: web.xml 자원 접근 read , 전역변수)
4. session(고유객체(접속한 사용자에게 부여되는): 고유한 변수)
5. out (출력)
....

​

*session객체 (활용도 ^^)
[내부에 session변수 생성]
scope : a.jsp(session.setAtt.."member" 변수 생성)
        b.jsp(session.getAtt.. "member" 사용가능) 
    session 변수는 (현재 Webapp  폴더 안에 있는 모든 페이지에서 사용 가능)
    Life-cycle : 1. session변수는 session객체와 동일 
                 2. session 소멸 : 서버 리부팅 , Tomcat 재실행 , session.invaildate()

    *application 객체
    [내부에 application변수 생성 : 전역변수 >>모든 session (접속한 모든 사용자) 공유
    scope :   (현재 Webapp  폴더 안에 있는 모든 페이지에서 사용 가능) >> java >> static
    Life-cycle : 소멸 (서버 리부팅)   , Tomcat 재실행  

     

    *request 객체
    [내부에 변수 생성] : request.setAttribute("type","A"); *****~~~~~
    scope: 요청 페이지(login.jsp >> 요청당 request 생성 >> scope >> page
    예외적으로 ^^^^^^^^^
    login.jsp >> ok.jsp(include or forward) request 객체는 ok.jsp 공유된다

    

              

-->  

<%
	Emp emp = new Emp();
	emp.setEmpno(2000);
	emp.setEname("홍길동");

	//emp변수는 scope page한정
	session.setAttribute("empobj", emp);
	//다른 페이지에서도 사용 가능
	
	//aa.jsp한다면
	Emp e = (Emp)session.getAttribute("empobj");
	out.print(e.getEmpno() + "<br>");
	out.print(e.getEname() + "<br>");
	
	
	request.setAttribute("who", "king");
	//현재 페이지(scope)
	
	//include , forward 된 페이지가 있다면
	//bb.jsp (forward)
	String who = (String)request.getAttribute("who");
	out.print(who);
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	EL & JSTL 와 내장객체 (4가지) & 기본 개념
</body>
</html>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//java 코드를 쓰는 영역	
	//jsp 파일에서는 우리가 원하는 모든 작업 가능 (DB연결 > 실행 > 결과 > 화면 출력) > jsp (웹에서 필요한 모든 작업 가능)
	//jsp 장점: 빠르고 , 쉬워요 ... 모든 개발자 쉽게 웹을 ....
	//    단점: 분업화 힘들어요 , 유지보수 ( 모든 코드가 한곳에 ) >> 관심사가 분리 되어 있지 않아요 
	
	Date date = new Date();
	/*  
		JSP 페이지 : UI(html+css+javascript) + JAVA코드(<% 스크립트릿 안에 구현)
		>> 디자인코드 + 서버의 로직코드 구현 : 문제점> 협업, 유지보수 하기 어려워요 
		
		servlet(형) > 웹 전용 java 파일 > jsp(동생)
		>>java 웹 기반 기술이 아니예요 > 계산기 , 그림판 , 원도우 프로그램(awt , swing) > 웹 전향(객체:request,response)
		>>java 페이지 Web을 서비스 하자 > login.java > loginok.java (웹객체 상속 ...) > 웹에서 사용하는 자바(servlet)
		>>단점 : 배우기 어렵다 , 디자인 작업 (힘들어요 ) , 협업(x)
		
				[ 서블릿에서 디자인 코드 ]
			  	response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print("<html>");
					out.print("<head><title>HELLO</title></head>");
					out.print("<body>");
						out.print("현재 날짜 : " + new Date() + "<br>");
						out.print("<script>alert('경고')</script>");
					out.print("</body>");
				out.print("</html>");	
		>> JSP 탄생 >> 장점 >> UI 작업 >> web page >> html base >> 디자인 good >> 단점 java코드 <% ...안에
		>> 혼재 (JAVA + UI) >> 힘들어....
				
	정리)
	서로의 장점을 살리자 (현대적인 프로그래밍은 잘하는 것을 키워 주자 , 업무의 효율 ) >> MVC 패턴 도입
	>> JSP(UI) + JAVA(순수한 자바 코드) + servlet(웹 요청,응답 조정의 역할)
	분업 하자
	Model (DTO , DAO 、ＳＥＲＶＩＣＥ)  >> 순수한 JAVA
	View  (UI)                       >> JSP
	Controller(중앙통제) >> Servlet 
	
	MVC 패턴으로 현재까지 개발 되고 있어요 >> 추가적으로 MSA등등 나오고 있어요
	>> model1 (JSP 모든 요청과 응답을 처리 ) + Model  >> 동생에게 게시판 하나 만들어 주고 싶어요
	>> model2 (Servlet 통한 요청과 응답을 처리 ) + MVC >> model2 기반의 MVC 패턴으로 프로젝트 해 보았어 >> 기업환경
	
	서버
	html 서비스 
	웹서버 있으면 되요 (아파치)
	ex) 아파치 설치 >> 특정 폴더 >> index.html, login.html , login.css >> 요청 >>http://www.it.co.kr/login.html
    >> 아파치 웹서버 >> 요청을 받아서 >> login.html 존재 확인 >> 클라이언트에게 전달 >> 받느 클라이언트 웹브라우져 해서 화면 출력

    jsp or servlet 사용 (서버로 기술)
    ex) 톰켓(아파치 톰켓 설치) >> 웹서버 + WAS >> 요청 >> http://www.it.co.kr/login.jsp >> 실행 파일 (없어요) >>
        jsp 컴파일 >> class 파일 생성 >> class 파일 실행 (정적 데이터 + 서버코드 실행>동적데이터>서버코드 실행해서 만든 결과 Text)
        >>결과된 결과(클라이언트 웹 브라우져가 해서 가능한 파일) >> 전달(응답 : response)
        
        WAS > jsp요청 > compile(login.jsp.java) > 실행(login.jsp.class) > 실행 (정적+동적) > 응답
        C:\Metanet_edu\java\Labs\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\WebJSP\org\apache\jsp
	
    	상식 퀴즈)
 		asp , aspx , php , jsp 공통점은 무었일까
 		코드 노출이 안되요 >> 보안에 좋아요 >> 클라이언트는 실행 결과만 보아요 (text 또는 html 형태로)
 		
 		서버 오픈 (2023 05 18 12:00)
 		홍길동 최초 요청자 >> http://www.it.or.kr/default.jsp -> WAS (처음 , 기존 실행한적이 있는지)
 		처음(실행파일이 없어요) > 컴파일 > class 만들고 > 실행 > 정적+동적 결합 > 서비스
 		
 		길동 두번쨰 요청자 >> http://www.it.or.kr/default.jsp -> WAS (처음 , 기존 실행적이 있는지)
 		>> 실행파일 존재 (실행) >> 정적 + 동적 결합 > 서비스
 		
 		질문) jsp 다시 컴파일하고 실행파일이 만들어지는 언제 
       
		1. 개발자가 코드 수정 배포
        2. 웹 서버 재시작
        
 		
    */
%>    
<%
	/*  
		JSP 구성요소
		1. 선언부 : page지시자 >> 사용언어 , 인코딩 , import ...
		<%@ page language="java"
		<%@ page import
		
		2. 스크립트 요소
		2.1 스크립트 릿 <% java코드 쓰는 영역
		2.2 표현식(출력하는 방법) : 출력하는 대상(Client 브라우져) : <%=  >> response.write 
		2.3 선언부(공통자원 : 공통함수 모아서 : page scope) : 
	 */
%>

<%
	//java코드
	String name="hello world";
%>
<%!
	//공통함수 영역
	//page 안에서만 사용
	public int add(int i , int j){
		return i+j;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>JSP 실행하기</h3>
날짜:<%=date %><hr>
<%=name %><br>
<%=add(100,200)%><br>
<%
	int result = add(1,2);
%>
결과 : <%= result %>
</body>
</html>
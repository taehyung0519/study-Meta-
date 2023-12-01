package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.RegisterDto;
import kr.or.kosa.service.RegisterOkServiceAction;
import kr.or.kosa.service.loginOkServiceAction;

/*
Url 방식 (command 방식 상관 없다)
http://192.168.0.46:8090/WebSite/list.do >> *.do 매핑
http://192.168.0.46:8090/WebSite/write.do >> *.do 매핑

Command방식(parameter 업무 파악)
@WebServlet("site.do")
http://192.168.0.46:8090/WebSite/site.do?cmd=list
http://192.168.0.46:8090/WebSite/site.do?cmd=write

*/
@WebServlet("*.do")
public class FrontRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FrontRegisterController() {
        super();
       
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.한글
    	//2.데이터 받기
    	//3.요청 판단하기 ... 판단에 따른 서비스 실행
    	
    	
    	// register 라면 회원가입 주세요 >> register.jsp
    	// registerok 라면 회원데이터 받아서 DB insert 하세요 그리고 webcome 페이지 forward
    	// request 에 "회원 id 하고 환영인사" 담아서 view 에서 출력 >> register_welcome.jsp
    	
    	//4.데이터 담기
    	//5.뷰지정
    	//6.뷰 forward

    	//1. 한글
    	request.setCharacterEncoding("UTF-8");
    	//2. 데이터 받기  (입력데이터 , 판단데이터(command)
    	//String command = request.getParameter("cmd");    	
    	
    	//Url 방식으로 요청 판단하기
    	//http://192.168.0.46:8090/WebSite/list.do
    	
    	String requestUri = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestUri.substring(contextPath.length());
    	
    	System.out.println("requestUri : " + requestUri);
    	System.out.println("contextPath : " + contextPath);
    	System.out.println("urlcommand : " + urlcommand);
    	/*
    	requestUri  : /WebServlet_8_Member_Url/register.do
		contextPath : /WebServlet_8_Member_Url
		urlcommand  : /register.do
    	*/
    	
    	//3. 요청 서비스 판단 (command 통해서) 문자열 비교
    	//3.1 판단에 의해서 서비스 동작 (DB작업 , 암호화 , ....)
    	
    	//Action 인터페이스 처리
    	//ActionForward 처리
    	
    	Action action = null;
    	ActionForward forward=null;
    	
    	//화면이냐 , 처리냐 판단
    	//화면주세요 (service 필요없어요) , 처리해 주세요 (별도의 service 객체 필요)
    	if(urlcommand.equals("/register.do")) {
    		//UI 제공
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/register/register.jsp");
    		
       	}else if(urlcommand.equals("/registerok.do")) {
    		//UI + 서비스 로직
    		action = new RegisterOkServiceAction();
    		forward = action.execute(request, response);
    		
    	}else if(urlcommand.equals("/login.do")) {
    		//UI
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("/WEB-INF/views/login/login.jsp");
    		
    	}else if(urlcommand.equals("/loginok.do")) {
    		
    		action = new loginOkServiceAction();
    		forward = action.execute(request, response);
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { // true // location.href="" 새로운 페이지 처리
    			response.sendRedirect(forward.getPath());
    		}else {
	    	    	RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
	      	    	dis.forward(request, response);
    			}
    		}
    	}
    	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.RegisterDto;

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
    	String viewpage="";
    	
    	if(urlcommand.equals("/register.do")) {
    		//회원가입 페이지(VIEW)
    		//VIEW 만 전달
    		viewpage="/WEB-INF/views/register/register.jsp";
    		
    		//필요에 따라서 request 데이터 저장
    		
    	}else if(urlcommand.equals("/registerok.do")) {
    		//회원가입 처리 (DB작업)
    		//입력 데이터 >> DB 연결 >> insert >> 여부 > 처리
    		int id = Integer.parseInt(request.getParameter("id"));
    		String pwd = request.getParameter("pwd");
    		String email = request.getParameter("email");
    		
    		RegisterDao dao = new RegisterDao();
    		
    		RegisterDto dto = new RegisterDto();
    		dto.setId(id);
    		dto.setPwd(pwd);
    		dto.setEmail(email);
    		
    		int result = dao.writeOk(dto);
    		
    		String resultdata="";
    		if(result > 0) {
    			resultdata = "welcome to kosa " + dto.getId() + "님";
    		}else {
    			resultdata = "Insert Fail ..... retry...";
    		}
     	   //4. 데이터 저장
    		request.setAttribute("data", resultdata);
    	   //뷰설정하기
    		viewpage="/WEB-INF/views/register/register_welcome.jsp";
    	}
    	//5. View 지정하기
    	RequestDispatcher dis = request.getRequestDispatcher(viewpage);
 	
    	//6. View forward
    	dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

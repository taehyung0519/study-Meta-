package com.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
		    	description = "게시판 처리하는 컨트롤러 입니다", 
		    	urlPatterns = { "/Board" }
		    )
public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public FrontServletController() {
        super();
       
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response , String method) throws ServletException, IOException {
	  System.out.println("클라이언트 전송방식 : " + method);	
		
	  request.setCharacterEncoding("UTF-8");
	  
	  String cmd= request.getParameter("cmd");
	  
	  String viewpage=null;
	  //cmd > null > error.jsp
	  //cmd > boardlist  > list.jsp
	  //cmd > boardwrite > write.jsp 서비스
	  
	  if(cmd == null) {
		  viewpage = "/error/error.jsp";
	  }else if(cmd.equals("boardlist")) {
		  //업무수행
		  //DB연결 .... select .... 데이터 담기
		  //boardDao dao = new boardDao();
		  //List<Board> boardlist = dao.getBoardList();
		  //저장 : request.setAttribute("list",boardlist);
		  //view 지정
		  //forward > view > jsp > request.getAttribute("list")
		  //했다 치고......
		  viewpage = "/board/boardlist.jsp";
		  
	  }else if(cmd.equals("boardwrite")) {
		 //업무수행
		  viewpage = "/board/boardwrite.jsp";
	  
	  }else if(cmd.equals("login")) {
		  //업무수행
		  viewpage = "/WEB-INF/views/login/login.jsp"; //있다면  
	  }else {
		  viewpage = "/error/error.jsp";
	  }
	  
	  //결과 저장 .... (request)
	  RequestDispatcher dis = request.getRequestDispatcher(viewpage);
	  
	  dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "GET");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "POST");
		
	}

}

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
import kr.or.kosa.service.ContentService;
import kr.or.kosa.service.DeleteOkService;
import kr.or.kosa.service.EditOkService;
import kr.or.kosa.service.EditService;
import kr.or.kosa.service.ListService;
import kr.or.kosa.service.ReWriteOkService;
import kr.or.kosa.service.ReWriteService;
import kr.or.kosa.service.WriteService;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String urlcommand = requestURI.substring(contextPath.length());

		Action action = null;
		ActionForward forward = null;

		if (urlcommand.equals("/board_content.do")) { //게시판 상세 내용
			
			action = new ContentService();
			forward = action.execute(request, response);
			
		} else if(urlcommand.equals("/board_delete.do")) { //게시판 글 삭제
			
			forward = new ActionForward();
		    forward.setRedirect(false);
		    forward.setPath("/WEB-INF/views/board/board_delete.jsp");
			
		} else if(urlcommand.equals("/board_deleteok.do")) {
			
			action = new DeleteOkService();
	        forward = action.execute(request, response);
			
		} else if(urlcommand.equals("/board_list.do")) { //게시판 목록
			
			action = new ListService();
			forward = action.execute(request, response);
			
		} else if(urlcommand.equals("/board_rewrite.do")) { //게시판 답글 작성
			
			action = new ReWriteService();
	        forward = action.execute(request, response);
			
		} else if(urlcommand.equals("/board_rewriteok.do")) { //게시판 글 작성
	          
	          action = new ReWriteOkService();
	          forward = action.execute(request, response);
	          
	    } else if(urlcommand.equals("/board_write.do")) { //게시판 글 작성
			
			forward = new ActionForward();
		  	forward.setRedirect(false);
		  	forward.setPath("/WEB-INF/views/board/board_write.jsp");
			
		} else if(urlcommand.equals("/board_writeok.do")) {
			
			action = new WriteService();
			forward = action.execute(request, response);
		
		} else if(urlcommand.equals("/board_edit.do")) {
			
			action = new EditService();
	        forward = action.execute(request, response);
	        
		} else if(urlcommand.equals("/board_editok.do")) { //게시판 글 작성
	          
	        action = new EditOkService();
	        forward = action.execute(request, response);
	          
	      }

		if (forward != null) {
			if (forward.isRedirect()) { // true 페이지 재 요청 (location.href="페이지"
				response.sendRedirect(forward.getPath());
			} else { // 기본적으로 forward ....
						// 1. UI 전달된 경우
						// 2. UI + 로직
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
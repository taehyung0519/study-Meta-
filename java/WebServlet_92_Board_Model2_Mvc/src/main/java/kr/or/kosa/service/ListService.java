package kr.or.kosa.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dto.Board;

public class ListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = null;
		
		try {
			
			BoardDao dao = new BoardDao();
			
			//게시물 총 건수
			int totalboardcount = dao.totalBoardCount();
			
			//상세보기 >> 다시  LIST 넘어올때  >> 현재 페이지 설정
			String ps = request.getParameter("ps");
			String cp = request.getParameter("cp");
			
			//List 페이지 처음 호출 경우
			if(ps == null || ps.trim().equals("")) {
				ps = "5"; //5개씩 
			}
			
			if(cp == null || cp.trim().equals("")) {
				//default 값 설정
				cp = "1"; // 1번째 페이지 보겠다 
			}
			
			int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
			int pagecount=0;
			
			//23건  % 5
			if(totalboardcount % pagesize == 0) {
				pagecount = totalboardcount / pagesize;
			}else {
				pagecount = (totalboardcount / pagesize) + 1; 
			}
			
			List<Board> list = dao.list(cpage, pagesize);
			
			request.setAttribute("pagesize", pagesize);
			request.setAttribute("cpage", cpage);
			request.setAttribute("pagecount", pagecount);
			request.setAttribute("totalboardcount", totalboardcount);
			request.setAttribute("list", list);
			
			forward = new ActionForward();
		  	forward.setRedirect(false);
		  	forward.setPath("/WEB-INF/views/board/board_list.jsp");
		  	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}

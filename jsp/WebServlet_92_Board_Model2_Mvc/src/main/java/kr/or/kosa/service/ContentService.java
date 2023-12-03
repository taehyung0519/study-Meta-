package kr.or.kosa.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Reply;

public class ContentService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = null;
		
		try {
			
			BoardDao dao = new BoardDao();
			
			String idx= request.getParameter("idx");
			
			String url = "";
			
			//글 번호를 가지고 오지  않았을 경우 예외처리
			if(idx == null || idx.trim().equals("")){
				url = "/WEB-INF/views/board/board_list.jsp";
			}else {
				
				idx=idx.trim();
				
				String cpage = request.getParameter("cp");
				String pagesize = request.getParameter("ps");
				
				//List 페이지 처음 호출 ...
				if(cpage == null || cpage.trim().equals("")){
					//default 값 설정
					cpage = "1"; 
				}
				
				if(pagesize == null || pagesize.trim().equals("")){
					//default 값 설정
					pagesize = "5"; 
				}
				
				//옵션
				//조회수 증가
				boolean isread = dao.getReadNum(idx);
				if(isread)System.out.println("조회증가 : " + isread);
				
				//데이터 조회 (1건 (row))
				Board board = dao.getContent(Integer.parseInt(idx));
				
				request.setAttribute("idx", idx);
				request.setAttribute("board", board);
				request.setAttribute("cpage", cpage);
				request.setAttribute("pagesize", pagesize);
				
				List<Reply> replylist = dao.replylist(idx);
				
				request.setAttribute("replylist", replylist);
				
				url = "/WEB-INF/views/board/board_content.jsp";
				
			}
			
			
			forward = new ActionForward();
		  	forward.setRedirect(false);
		  	forward.setPath(url);
			
		} catch (Exception e) {
			e.getMessage();
		}
		
		return forward;
	}

}

package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dto.Board;

public class EditService implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      
      String url = "";
      ActionForward forward = new ActionForward();
      String idx = request.getParameter("idx");
      
      try {
         if(idx == null || idx.trim().equals("")){
            url = "/board_list.do";
         }else {
            url = "/WEB-INF/views/board/board_edit.jsp";
         }
         BoardDao dao = new BoardDao();
         Board board = dao.getEditContent(idx);
         if(board == null){
//            out.print("데이터 오류");
//            out.print("<hr><a href='board_list.jsp'>목록가지</a>");
         }
         
         request.setAttribute("board", board);
      } catch (Exception e) {
         // TODO: handle exception
      }
      
      forward.setRedirect(false);
      forward.setPath(url);
        
      return forward;
   }

}
package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BoardDao;

public class DeleteOkService implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      
      ActionForward forward = new ActionForward();
      String idx = request.getParameter("idx");
      String pwd = request.getParameter("pwd");
      
      System.out.println(idx + pwd);

      try {
         
         BoardDao dao = new BoardDao();
         int result =dao.deleteOk(idx, pwd);
         
         String msg="";
         String url="";
         if(result > 0){
            msg="delete success";
            url="board_list.do";
         }else{
            msg="delete fail";
            url="board_list.do";
         }
         
         request.setAttribute("board_msg",msg);
         request.setAttribute("board_url",url);
      } catch (Exception e) {
         // TODO: handle exception
      }
      
      forward.setRedirect(false);
      forward.setPath("/WEB-INF/views/board/redirect.jsp");
        
      return forward;
   }

}
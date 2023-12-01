package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;

public class ReWriteService implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      
      ActionForward forward = new ActionForward();
      String url = "/WEB-INF/views/board/board_rewrite.jsp";
      
      String idx = request.getParameter("idx");
      String cpage = request.getParameter("cp");
      String pagesize = request.getParameter("ps");
      String subject = request.getParameter("subject");
      
      try {
         
         if(idx == null || subject == null || idx.trim().equals("") || subject.trim().equals("")){
            url = "/board_list.do";
         }
         if(cpage == null || pagesize == null){
            cpage ="1";
            pagesize = "5";
         }
         
      } catch (Exception e) {
         // TODO: handle exception
      }
      
      
      request.setAttribute("idx", idx);
      request.setAttribute("cpage", cpage);
      request.setAttribute("pagesize", pagesize);
      request.setAttribute("subject", subject);
      
      
      forward.setRedirect(false);
      forward.setPath(url);
        
      return forward;
   }

}
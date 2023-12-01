package kr.or.kosa.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Reply;


@WebServlet("/ReplyList")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReplyList() {
        super();
    }


    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	System.out.println("도착");
    	
    	try {
    		
    		String ps = request.getParameter("ps");
			String cp = request.getParameter("cp");
			String idx= request.getParameter("idx");
    		
    		int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
    		
    		BoardDao dao = new BoardDao();
    		List<Reply> replylist = dao.replylist(idx);
    		
    		for(Reply reply : replylist) {
    			out.print("<tr align='left'>");
        			out.print("<td width='80%'>[" + reply.getWriter() + "] : " + reply.getContent());
        				out.print("<br> 작성일:" + reply.getWritedate());
        			out.print("</td>");
        			out.print("<td width='20%'>");
        			out.print("<div>");
        				out.print("<input type='hidden' class='no' name='no' value='" + reply.getNo() + "'>");
        				out.print("<input type='hidden' class='idx' name='idx' value='" + reply.getIdx_fk() + "'>");
        				out.print("password :<input type='password' class='delPwd' name='delPwd' size='4'> ");
        				out.print("<input type='button' class='btn2' value='삭제'>");
        			out.print("</div>");
        			out.print("</td>");
        		out.print("</tr>");
    		}
    	
    		
    	} catch(Exception e) {
    		System.out.println(e.getMessage());
    	}
    	
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

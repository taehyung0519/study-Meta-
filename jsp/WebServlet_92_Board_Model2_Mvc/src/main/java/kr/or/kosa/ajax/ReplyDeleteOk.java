package kr.or.kosa.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.BoardDao;


@WebServlet("/ReplyDeleteOk")
public class ReplyDeleteOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ReplyDeleteOk() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	String idx_fk=request.getParameter("idx");//댓글의 원본 게시글 번호
    	String no = request.getParameter("no");//댓글의 순번(PK)
    	String pwd = request.getParameter("delPwd");//댓글의 암호
    	
    	if(idx_fk == null || no == null || pwd == null || no.trim().equals("")) {
    		out.print("잘못된 접근입니다.");
    	}else {
    		try {
    			
        		BoardDao dao = new BoardDao();
        		int result = dao.replyDelete(no, pwd);
        		
        		String msg="";
        	    String url="";
        	    
        	    if(result > 0){
        	    	msg ="댓글 삭제 성공";
        	    }else{
        	    	msg="댓글 삭제 실패";
        	    }
        	    
        	    out.print(msg);
        		
    		} catch (Exception e) {
    			e.getMessage();
    		}
    	}
    	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}

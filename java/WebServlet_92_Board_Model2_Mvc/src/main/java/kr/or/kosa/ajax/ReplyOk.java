package kr.or.kosa.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.BoardDao;


@WebServlet("/ReplyOk")
public class ReplyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReplyOk() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	
    	String writer = request.getParameter("reply_writer");
		String content = request.getParameter("reply_content");
		String pwd = request.getParameter("reply_pwd");
		String idx_fk = request.getParameter("idx");
		String userid = "empty";
		
		String msg="";
		
		BoardDao dao;
		try {
			dao = new BoardDao();
			int result = dao.replywrite(Integer.parseInt(idx_fk), writer, userid, content, pwd);
			
			if(result > 0){
		    	msg ="댓글 입력 성공";
		    }else{
		    	msg="댓글 입력 실패";
		    }
			
			out.print(msg);
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
    	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

package kr.or.kosa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.MemoDao;
import kr.or.kosa.dto.Memo;


@WebServlet("/MemoList")
public class MemoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public MemoList() {
        super();
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	System.out.println("목록보기");
    	
    	// 현재 요청당  하나의 servlet 
    	// 어떤 요청인지 파악 필요 없어요 
    	
    	// 업무 (목록보기)
    	MemoDao dao = new MemoDao();
    	try {
			  List<Memo> memolist = dao.getMemoList();
			  
			  //데이터 저장
			  request.setAttribute("memolist", memolist);
			  //view 지정
			  RequestDispatcher dis = request.getRequestDispatcher("/memolist.jsp");
			  //데이터 전달(forward)
			  dis.forward(request, response);
		} catch (Exception e) {
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

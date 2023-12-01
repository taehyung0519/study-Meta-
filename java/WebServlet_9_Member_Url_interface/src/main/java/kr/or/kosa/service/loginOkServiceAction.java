package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;

public class loginOkServiceAction  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		 HttpSession session = request.getSession(); //기존 session 있으면 리턴 , 없으면 생성
		   if(session != null) {
			   System.out.println(session.getAttribute("ID"));
		   }else {
			   System.out.println("session null");
		   }
		   
		System.out.println();
		return null;
	}

}

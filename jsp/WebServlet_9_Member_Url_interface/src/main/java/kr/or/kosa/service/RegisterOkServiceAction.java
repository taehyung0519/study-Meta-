package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.RegisterDao;
import kr.or.kosa.dto.RegisterDto;

public class RegisterOkServiceAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		
		HttpSession session = request.getSession();
		session.setAttribute("ID", "abcd");
		
		RegisterDao dao = new RegisterDao();
		
		RegisterDto dto = new RegisterDto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		
		int result = dao.writeOk(dto);
		
		String resultdata="";
		if(result > 0) {
			resultdata = "welcome to kosa " + dto.getId() + "님";
		}else {
			resultdata = "Insert Fail ..... retry...";
		}
 	   //4. 데이터 저장
		request.setAttribute("data", resultdata);
	   

		ActionForward forward = new ActionForward();
		forward.setRedirect(false); //forward 방식
		forward.setPath("/WEB-INF/views/register/register_welcome.jsp");
		
		return forward;
	}

}

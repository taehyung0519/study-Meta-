package kr.or.kosa.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BoardDao;

public class EditOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();

		String msg = "";
		String url = "";

		String uploadpath = request.getSession().getServletContext().getRealPath("upload");
		int size = 1024 * 1024 * 10;

		try {

			MultipartRequest multi = new MultipartRequest(request, uploadpath, size, "UTF-8",
					new DefaultFileRenamePolicy());

			BoardDao dao = new BoardDao();

			String idx = multi.getParameter("idx");

			if (idx == null || idx.trim().equals("")) {
				url = "board_list.do";
			} else {

				int result = dao.boardEdit(multi);
				
				if (result > 0) {
					msg = "수정 성공";
					url = "board_list.do";
				} else {
					msg = "수정 실패";
					url = "board_edit.do?idx=" + idx;
				}

				request.setAttribute("board_msg", msg);
				request.setAttribute("board_url", url);
				
			}


		} catch (Exception e) {
			e.getMessage();
		}

		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/board/redirect.jsp");

		return forward;
	}

}

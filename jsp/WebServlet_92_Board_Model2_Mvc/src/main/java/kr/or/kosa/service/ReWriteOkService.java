package kr.or.kosa.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dto.Board;

public class ReWriteOkService implements Action {

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

			String strIdx = multi.getParameter("idx").trim();
			String subject = multi.getParameter("subject");
			String writer = multi.getParameter("writer");
			String email = multi.getParameter("email");
			String homepage = multi.getParameter("homepage");
			String content = multi.getParameter("content");
			String pwd = multi.getParameter("pwd");

			Enumeration filenames = multi.getFileNames();

			String file1 = (String) filenames.nextElement();
			String filename1 = multi.getFilesystemName(file1);

			int idx = Integer.parseInt(strIdx);

			Board board = new Board();

			board.setSubject(subject);
			board.setWriter(writer);
			board.setEmail(email);
			board.setHomepage(homepage);
			board.setContent(content);
			board.setPwd(pwd);
			if (filename1 == null) {
				board.setFilename("");
			} else {
				board.setFilename(filename1);
			}
			board.setIdx(idx);

			BoardDao dao = new BoardDao();

			int result = dao.reWriteOk(board);

			if (result > 0) {
				msg = "rewrite insert success";
				url = "board_list.do";
			} else {
				msg = "rewrite insert fail";
				url = "board_content.do?idx=" + board.getIdx();
			}

		} catch (Exception e) {
			e.getMessage();
		}

		request.setAttribute("board_msg", msg);
		request.setAttribute("board_url", url);
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/board/redirect.jsp");

		return forward;
	}

}
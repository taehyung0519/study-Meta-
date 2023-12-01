<%@page import="kr.or.kosa.dto.Board"%>
<%@page import="kr.or.kosa.dto.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//수정하기
	String idx = request.getParameter("idx");
	Board board = (Board)request.getAttribute("board");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="Stylesheet"
	href="<%=request.getContextPath()%>/style/default.css" />
	<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	function editCheck() {

		if (!edit.writer.value) {

			alert("이름을 입력하세요");
			edit.writer.focus();
			return false;
		}
		if (!edit.pwd.value) {
			alert("비밀번호를 입력해야 합니다.");
			edit.pwd.focus();
			return false;
		}

		if (!edit.email.value) {
			alert("이메일을 입력해야합니다.");
			edit.email.focus();
			return false;
		}

		if (!edit.subject.value) {
			alert("제목을 입력하세요");
			edit.subject.focus();
			return false;
		}

		if (!edit.content.value) {
			alert("글 내용을 입력하세요");
			edit.content.focus();
			return false;
		}

		document.edit.submit();

	}
</script>
</head>
<body>
	<%
	pageContext.include("/WEB-INF/views/include/header.jsp");
	%>
	<div id="pageContainer">
		<div style="padding-top: 25px; text-align: center">
			<!-- form 시작 -->
			<form name="edit" action="board_editok.do" method="POST" enctype="multipart/form-data">
				<center>
					<table width="90%" border="1">
						<tr>
							<td width="20%" align="center"><b> 글번호 </b></td>
							<td width="30%">
									<%=idx%> 
									<input type="hidden" name="idx" value="<%=idx%>" ></td>
							<td width="20%" align="center"><b>작성일</b></td>
							<td><%=board.getWritedate()%></td>
						</tr>
						<tr>
							<td width="20%" align="center"><b>글쓴이</b></td>
							<td width="30%">
								<input type="text" name="writer" value="<%=board.getWriter()%>">
							</td>
							<td width="20%" align="center"><b>홈페이지</b></td>
							<td>
								<input type="text" name="homepage" value="<%=board.getHomepage()%>">
							</td>
						</tr>
						<tr>
							<td width="20%" align="center"><b>비밀번호(기존)</b></td>
							<td>
								<input type="text" name="pwd">
							</td>
							<td width="20%" align="center"><b>이메일</b></td>
							<td>
								<input type="text" name="email" value="<%=board.getEmail()%>">
							</td>
						</tr>

						<tr>
							<td width="20%" align="center"><b>제목</b></td>
							<td colspan="3">
								<input type="text" name="subject" value="<%=board.getSubject()%>" size="40">
							</td>
						</tr>
						<tr height="100">
							<td width="20%" align="center"><b>글내용</b></td>
							<td colspan="3">
								<textarea rows="7" cols="50" name="content" class="ckeditor">
									<%=board.getContent()%>
								</textarea>
							</td>
						</tr>

						<tr>
							<td width="20%" align="center"><b>첨부파일</b></td>
							<td colspan="3"><%=board.getFilename()%> (<%=board.getFilesize()%>bytes)<br /> 
								<input type="file" accept="image/*" id="getfile" name="filename">
								<input type="hidden" name="orifile" value="<%=board.getFilename()%>">
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<input type="button" value="수정하기" onclick="editCheck();"> 
								<input type="reset" value="다시쓰기">
							</td>
						</tr>
						<tr>
							<td colspan="4" align="center">
								<a href="board_list.do">목록</a>
							</td>
						</tr>
					</table>
				</center>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	var file = document.querySelector('#getfile');

	file.onchange = function() {
		var fileList = file.files;

		// 읽기
		var reader = new FileReader();
		reader.readAsDataURL(fileList[0]);

		//로드 한 후
		reader.onload = function() {
			
			console.log(reader);
			
			$('#pageContainer').css("display", "flex");
			$('#pageContainer').css("justify-content", "center");
			$('#pageContainer').append("<img id='preview' src='' width='800px' style='padding-top: 25px;'>")
			document.querySelector('#preview').src = reader.result;
		};
	};
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_content</title>
<link rel="Stylesheet"
	href="<%=request.getContextPath()%>/style/default.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<script type="text/javascript">
	
		$(function(){
			
			function del(data2){
					$.ajax(
							{
								url: "ReplyDeleteOk",
								data: data2,
								dataType: "html",
								success: function(responseText){
								console.log(responseText);
								alert(responseText.trim());
								
								list();
							}
						}
					);
			}
			
			function list(){
				const req2 = {"ps": ${pagesize}, "cp": ${cpage}, "idx": ${idx}};
				
					$.ajax(
							{
								url: "ReplyList",
								data: req2,
								dataType: "html",
								success: function(responseText){
									
								console.log(responseText);
										
								$('#display').empty();
								$('#display').append(responseText);
										
							}
						}
					);
			}
			
			function inser(data){
					$.ajax(
							{
								url: "ReplyOk",
								data: data,
								dataType: "html",
								success: function(responseText){
								console.log(responseText);
								alert(responseText.trim());
								
								list();
								}
							}		
					);
			}
			
			/* 댓글 작성 버튼 클릭 */
			$("#btn").click(function(){
				const data = {"idx": $('#idx').val(), "reply_writer": $('#reply_writer').val(), "reply_content": $('#reply_content').val(), "reply_pwd": $('#reply_pwd').val()};
				
				inser(data);
				
				$('#reply_writer').val("");
				$('#reply_content').val("");
				$('#reply_pwd').val("");
			});
			
			/* 댓글 삭제 버튼 클릭 */
			$(document).on('click', '.btn2', function(){
				const tag = this.closest("div");
				const data2 = {"no": $(tag).children(".no").val(), "idx": $(tag).children(".idx").val(), "delPwd": $(tag).children(".delPwd").val()};
				
				del(data2);
			});
			
		});
	
	</script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<c:set var="idx" value='<%=request.getAttribute("idx")%>' />
	<c:set var="board" value='<%=request.getAttribute("board")%>' />
	<c:set var="cpage" value='<%=request.getAttribute("cpage")%>' />
	<c:set var="pagesize" value='<%=request.getAttribute("pagesize")%>' />
	<c:set var="replylist" value='<%=request.getAttribute("replylist")%>' />

	<div id="pageContainer">
		<div style="padding-top: 30px; text-align: center">
			<center>
				<b>게시판 글내용</b>
				<table width="80%" border="1">
					<tr>
						<td width="20%" align="center"><b> 글번호 </b></td>
						<td width="30%">${idx}</td>
						<td width="20%" align="center"><b>작성일</b></td>
						<td>${board.writedate}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>글쓴이</b></td>
						<td width="30%">${board.writer}</td>
						<td width="20%" align="center"><b>조회수</b></td>
						<td>${board.readnum}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>홈페이지</b></td>
						<td>${board.homepage}</td>

						<c:set var="originalfilename" value="${board.filename}" />
						<c:set var="lowerfilename"
							value="${fn:toLowerCase(originalfilename)}" />
						<c:forTokens var="file" items="${lowerfilename}" delims="."
							varStatus="status">
							<c:if test="${status.last}">
								<c:choose>
									<c:when
										test="${empty board.filename || board.filename eq 'null'}">
										첨부파일이 없습니다
									</c:when>
									<c:when
										test="${file eq 'jpg' || file eq 'png' || file eq 'gif'}">
										<a href="upload/${originalfilename}" target="_blank">미리보기</a>
										<a href="filedownload.board?file_name=${originalfilename}"
											id="download">다운로드</a>
									</c:when>
									<c:otherwise>
										<a href="filedownload.board?file_name=${originalfilename}"
											id="download">${originalfilename}</a>
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:forTokens>

						<td width="20%" align="center"><b>첨부파일</b></td>
						<td>${board.filename}</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3">${board.subject}</td>
					</tr>
					<tr height="100">
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">${fn:replace(board.content, newLineChar, "<br>")}</td>
					</tr>
					<tr>
						<td colspan="4" align="center"><a
							href="board_list.do?cp=${cpage}&ps=${pagesize}">목록가기</a> |<a
							href="board_edit.do?idx=${idx}&cp=${cpage}&ps=${pagesize}">편집</a>
							|<a href="board_delete.do?idx=${idx}&cp=${cpage}&ps=${pagesize}">삭제</a>
							|<a
							href="board_rewrite.do?idx=${idx}&cp=${cpage}&ps=${pagesize}&subject=${board.subject}">답글</a>
						</td>
					</tr>
				</table>
				<!--  꼬리글 달기 테이블 -->
				<form name="reply" action="board_replyok.do" method="POST">
					<!-- hidden 태그  값을 숨겨서 처리  -->
					<input type="hidden" id="idx" name="idx" value="${idx}"> <input
						type="hidden" name="userid" value="">
					<!-- 추후 필요에 따라  -->
					<!-- hidden data -->
					<table width="80%" border="1">
						<tr>
							<th colspan="2">덧글 쓰기</th>
						</tr>
						<tr>
							<td align="left">작성자 : <input type="text" id="reply_writer"
								name="reply_writer"><br /> 내&nbsp;&nbsp;용 : <textarea
									id="reply_content" name="reply_content" rows="2" cols="50"></textarea>
							</td>
							<td align="left">비밀번호: <input type="password" id="reply_pwd"
								name="reply_pwd" size="4"> <input type="button"
								value="등록" id="btn">
							</td>
						</tr>
					</table>
				</form>
				<!-- 유효성 체크	 -->
				<script type="text/javascript">
					function reply_check() {
						var frm = document.reply;
						if (frm.reply_writer.value == ""
								|| frm.reply_content.value == ""
								|| frm.reply_pwd.value == "") {
							alert("리플 내용, 작성자, 비밀번호를 모두 입력해야합니다.");
							return false;
						}
						frm.submit();
					}
					function reply_del(frm) {
						//alert("del");
						//var frm = document.replyDel;
						//alert(frm);
						if (frm.delPwd.value == "") {
							alert("비밀번호를 입력하세요");
							frm.delPwd.focus();
							return false;
						}
						frm.submit();
					}
				</script>
				<br>
				<!-- 꼬리글 목록 테이블 -->

				<table width="80%" border="1">
					<thead>
						<tr>
							<th colspan="2">REPLY LIST</th>
						</tr>
					</thead>
					<tbody id="display">
						<c:if test="${replylist != null && fn:length(replylist) > 0}">
							<c:forEach var="reply" items="${replylist}">
								<tr align="left">
									<td width="80%">[${reply.writer}] : ${reply.content} <br>
										작성일:${reply.writedate}
									</td>
									<td width="20%">
										<div>
											<input type="hidden" class="no" name="no" value="${reply.no}">
											<input type="hidden" class="idx" name="idx"
												value="${reply.idx_fk}"> password :<input
												type="password" class="delPwd" name="delPwd" size="4">
											<input type="button" class="btn2" value="삭제">
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>


			</center>
		</div>
	</div>
</body>
</html>






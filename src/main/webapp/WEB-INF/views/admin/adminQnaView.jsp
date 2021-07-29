<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h2 class="title">문의내역</h2>
	<table class="table">
		<tr>
			<td class="col-md-2 text-center">제목</td>
			<td class="col-md-10">${qna.QA_title }</td>
		</tr>
		<tr>
			<td class="col-md-2 text-center">내용</td>
			<td>
				<pre class="textBox"><c:out value="${qna.QA_content }" /></pre>
			</td>
		</tr>
		<tr>
			<td class="col-md-2 text-center">첨부파일</td>
			<td><img alt="${qna.QA_fileName }" src="/tiger/resources/upload/${qna.QA_fileName }" width="300"></td>
		</tr>
		<tr>
			<td colspan="2">
				<div align="right">
					<a href="adminQnaList.do?pageNum=${pageNum}" class="btn_sm_stroke">목록</a>
					<a href="adminQnaReplyForm.do?num=${qna.QA_num }&pageNum=${pageNum}" class="btn_sm_full">답글 작성</a>
					<a href="adminQnaDelete.do?num=${qna.QA_num }&pageNum=${pageNum}" class="btn_sm_stroke">삭제</a>
				</div>
			</td>
		</tr>
		</table>
	</div>
</body>
</html>
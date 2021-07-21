<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.btnDiv{
	margin-top: 20px;
}
</style>
</head>
<body>
	<h2 class="title">공지사항</h2>
	<table class="table">
		<tr>
			<td class="text-center">제목</td>
			<td colspan="3">${notice.NT_title }</td>
		</tr>
		<tr>
			<td class="col-md-2 text-center">작성자</td>
			<td class="col-md-4">관리자</td>
			<td class="col-md-2 text-center">작성일</td>
			<td class="col-md-4">${notice.NT_regDate }</td>
		</tr>
		<tr>
			<td class="text-center">내용</td>
			<td colspan="3"><pre class="textBox">${notice.NT_content }</pre></td>
		</tr>
	</table>
	<div class="btnDiv" align="right">
		<a href="noticeList.do?pageNum=${pageNum }" class="btn_prev">목록</a>
	</div>
</body>
</html>
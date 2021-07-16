<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn_prev {
	padding: 5px 16px;
	border: 1px solid #242526;
	/* background: #242526; */
	line-height: 40px;
	font-size: 14px;
	/* color: #eee; */
	color: #242526;
}

.btn_prev:hover {
	color: orange;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="title">공지사항 상세</h2>
		<table class="table narrowWidth">
			<tr>
				<td class="col-md-2 text-center">제목</td>
				<td colspan="3" class="col-md-10">${notice.NT_title }</td>
			</tr>
			<tr>
				<td class="col-md-2 text-center">작성자</td>
				<td class="col-md-2 text-center">관리자</td>
				<td class="col-md-2 text-center">작성일</td>
				<td class="col-md-2 text-center">${notice.NT_regDate }</td>
			</tr>
			<tr>
				<td class="col-md-2 text-center">내용</td>
				<td colspan="3" class="col-md-2 text-center">${notice.NT_content }</td>
			</tr>
		</table>
		<div align="right">
			<a href="noticeList.do?pageNum=${pageNum }" class="btn_prev">목록</a>
		</div>
	</div>
</body>
</html>
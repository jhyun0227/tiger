<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
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
	<div align="center">
		<h2 class="title">문의내역</h2>
		<table class="table narrowWidth">
			<tr>
				<td class="col-md-2 text-center">제목</td>
				<td class="col-md-10">${qna.QA_title }</td>
			</tr>
			<tr>
				<td class="col-md-2 text-center">내용</td>
				<td><textarea rows="10" cols="100" class="inputLine">
					<c:out value="${qna.QA_content }" /></textarea></td>
			</tr>
			<tr>
				<td class="col-md-2 text-center">첨부파일</td>
				<td><img alt="${qna.QA_fileName }"
						src="${path }/resources/upload/${qna.QA_fileName }" width="300"></td>
			</tr>
		</table>
	</div>
	<div align="right">
		<a href="qnaList.do?pageNum=${pageNum}" class="btn_prev">목록</a>
		<a href="qnaDelete.do?num=${qna.QA_num }&pageNum=${pageNum}" class="btn_prev">삭제</a>
	</div>
</body>
</html>
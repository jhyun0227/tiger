<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div align="center">
	<h2 class="title"> 문의내역 </h2>
	<table class="table">
		<tr>
			<td class="col-md-2 text-center">제목</td>
			<td class="col-md-10">${qna.QA_title }</td>
		</tr>
		<tr>
			<td class="col-md-2 text-center">내용</td>
			<td><pre class="textBox"><c:out value="${qna.QA_content }"/></pre></td>
		</tr>
		<tr>
			<td class="col-md-2 text-center">첨부파일</td>
			<td><img alt="${qna.QA_fileName }" src="/tiger/resources/upload/${qna.QA_fileName }" width="300"></td>
		</tr>
	</table>
</div>
<div align="right" >
	<a href="qnaList.do?pageNum=${pageNum}" class="btn_prev">목록</a>
	<c:if test="${MB_num == qna.MB_num}">
		<a href="qnaDelete.do?num=${qna.QA_num }&pageNum=${pageNum}" class="btn_prev">삭제</a>
	</c:if>
</div>	
</body>
</html>
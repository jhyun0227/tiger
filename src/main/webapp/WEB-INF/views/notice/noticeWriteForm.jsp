<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">공지사항 작성</h2>
		<form action="noticeWrite.do" method="post" name="frm">
			<input type="hidden" name="num" value="${num }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<table class="table table-bordered">
				<tr>
					<td>제목</td>
					<td><input type="text" name="NT_title" required="required" autofocus="autofocus"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${sessionScope.MB_id }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="40" name="NT_content"
							required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="작성"
						class="btn btn-warning"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
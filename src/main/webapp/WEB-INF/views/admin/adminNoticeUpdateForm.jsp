<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">공지사항 수정</h2>
		<form action="adminNoticeUpdateResult.do" method="post" name="frm">
			<input type="hidden" name="NT_num" value="${notice.NT_num }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<table class="table table-bordered">
				<tr>
					<td>제목</td>
					<td><input type="text" name="NT_title" value="${notice.NT_title }" required="required"
						autofocus="autofocus"></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${memberDB.MB_name }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="40" name="NT_content"
							required="required">${notice.NT_content }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정"
						class="btn btn-warning"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
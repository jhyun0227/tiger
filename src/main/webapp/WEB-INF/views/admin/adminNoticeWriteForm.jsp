<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">공지사항 작성</h2>
		<form action="adminNoticeWriteResult.do" method="post" name="frm">
			<input type="hidden" name="NT_num" value="${NT_num }">
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
					<td><textarea class="summernote" rows="5" cols="40" name="NT_content"
							required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="작성"
						class="btn btn-warning"></td>
				</tr>
			</table>
		</form>
	</div>
	<script>
	$('.summernote').summernote({
		  height: 300,
		  lang: "ko-KR"
		});
</script>
</body>
</html>
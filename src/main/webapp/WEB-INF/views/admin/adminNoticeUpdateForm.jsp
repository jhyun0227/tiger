<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>
<body>
	<h2 class="title">공지사항 수정</h2>
		<form action="adminNoticeUpdateResult.do" method="post" name="frm">
			<input type="hidden" name="NT_num" value="${notice.NT_num }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<table class="table">
				<tr>
					<td class="col-md-1 text-center">제목</td>
					<td class="col-md-11"><input type="text" name="NT_title" value="${notice.NT_title }" required="required"
						autofocus="autofocus" class="inputLine"></td>
				</tr>
				<tr>
					<td class="col-md-1 text-center">작성자</td>
					<td>${memberDB.MB_name }</td>
				</tr>
				<tr>
					<td class="col-md-1 text-center">내용</td>
					<td><textarea class="summernote" rows="5" cols="40" name="NT_content"
							required="required">${notice.NT_content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<input type="submit" value="수정" class="btn_sm_stroke">
					</td>
				</tr>
			</table>
		</form>
	<script>
	$('.summernote').summernote({
		  height: 300,
		  lang: "ko-KR"
		});
	</script>
</body>
</html>
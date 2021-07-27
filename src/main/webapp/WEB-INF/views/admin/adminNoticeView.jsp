<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function del() {
		var cf = confirm("공지사항을 삭제하시겠습니까?");
		if(cf) {
			location.href="adminNoticeDelete.do?NT_num=${notice.NT_num }&pageNum=${pageNum }";
		} else {
			alert("삭제가 취소 되었습니다");
			return;
		}
	}
</script>
</head>
<body>
	<h2 class="title">공지사항</h2>
	<table class="table">
		<tr>
			<th class="text-center col-lg-2">제목</th>
			<td colspan="3" class="col-lg-10">${notice.NT_title }</td>
		</tr>
		<tr>
			<th class="col-lg-2 text-center">작성자</th>
			<td class="col-lg-4">관리자</td>
			<th class="col-lg-2 text-center">작성일</th>
			<td class="col-lg-4">${notice.NT_regDate }</td>
		</tr>
		<tr>
			<th class="text-center">내용</th>
			<td colspan="3"><pre class="textBox">${notice.NT_content }</pre></td>
		</tr>
	</table>
	<div align="right">
		<a href="adminNoticeList.do?pageNum=${pageNum }" class="btn_prev">목록</a>
		<a href="adminNoticeUpdateForm.do?NT_num=${notice.NT_num }&pageNum=${pageNum }" class="btn_prev">수정</a>
		<a onclick="del()" class="btn_prev">삭제</a>
	</div>
</body>
</html>
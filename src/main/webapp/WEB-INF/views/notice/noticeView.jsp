<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del() {
		var cf = confirm("공지사항을 삭제하시겠습니까?");
		if(cf) {
			location.href="noticeDelete.do?NT_num=${notice.NT_num }&pageNum=${pageNum }";
		} else {
			alert("삭제가 취소 되었습니다");
			return;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">공지사항 상세</h2>
		<table class="table table-striped table-bordered">
			<tr>
				<td>제목</td>
				<td colspan="3">${notice.NT_title }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<%-- <td>${memberDB.MB_name }</td> --%>
				<td>관리자</td>
				<td>작성일</td>
				<td>${notice.NT_regDate }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><pre>${notice.NT_content }</pre></td>
			</tr>
			<c:if test="${memberDB.MB_name == 'admin' }">
				<tr>
					<td colspan="4" align="center">
						<a href="noticeList.do?pageNum=${pageNum }" class="btn btn-info">공지사항 목록</a>
						<a href="noticeUpdateForm.do?NT_num=${notice.NT_num }&pageNum=${pageNum }"
						class="btn btn-warning">수정</a>
						<a onclick="del()" class="btn btn-danger">삭제</a>
					</td>
				</tr>
			</c:if>
		</table>
	</div>
</body>
</html>
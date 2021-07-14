<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del() {
		var cf = confirm("회원을 탈퇴시키겠습니까?");
		if(cf) {
			location.href="adminMbDelete.do?MB_id=${member.MB_id }&pageNum=${pageNum }";
		} else {
			alert("탈퇴가 취소 되었습니다");
			return;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="title">회원정보 상세</h2>
		<table class="table table-striped table-bordered">
			<tr>
				<td>아이디</td>
				<td>${member.MB_id }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${member.MB_pw }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${member.MB_name }</td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td>${member.MB_regNum }</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${member.MB_nickName }</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${member.MB_tel }</td>
			</tr>
			<tr>
				<td>성별</td>
				<c:if test="${member.MB_gender == 1 || member.MB_gender == 3}">
					<td>남자</td>
				</c:if>
				<c:if test="${member.MB_gender == 2 || member.MB_gender == 4}">
					<td>여자</td>
				</c:if>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<a href="adminMbList.do?pageNum=${pageNum }" class="btn btn-info">회원정보 목록</a>
					<a href="adminMbUpdateForm.do?MB_id=${member.MB_id }&pageNum=${pageNum }"
					class="btn btn-warning">수정</a>
					<a onclick="del()" class="btn btn-danger">탈퇴</a></td>
			</tr>
		</table>
	</div>
</body>
</html>
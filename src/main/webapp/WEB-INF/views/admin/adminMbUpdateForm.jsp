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
		<h2 class="text-primary">회원정보 수정</h2>
		<form action="adminMbUpdateResult.do" method="post" name="frm">
			<input type="hidden" name="MB_id" value="${member.MB_id }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>${member.MB_id }</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="MB_pw" value="${member.MB_pw }"
						autofocus="autofocus" required="required"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="MB_name" value="${member.MB_name }"
						required="required"></td>
				</tr>
				<tr>
					<td>주민등록번호</td>
					<td>${member.MB_regNum }</td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="MB_nickName" value="${member.MB_nickName }"
						required="required"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="MB_tel" value="${member.MB_tel }"
						required="required"></td>
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
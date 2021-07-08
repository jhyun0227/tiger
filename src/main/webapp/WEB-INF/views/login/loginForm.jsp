<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login">
	<table class="table table-bordered">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="MB_id" required="required" autofocus="autofocus">
		</td>
		<tr>
			<td>암호</td>
			<td><input type="password" name="MB_pw" required="required"></td>
		<tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="로그인">
			</td>
		</tr>
	</table>
</form>
</body>
</html>
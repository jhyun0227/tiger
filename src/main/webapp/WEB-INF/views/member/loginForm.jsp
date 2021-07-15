<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/common.css">
	<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div align="center">
	<h2 class="title">로그인</h2>
	<form action="login.do" method="post">
		<table class="table narrowWidth">
			<tr>
				<td class="col md-2 text-center">이메일</td>
				<td class="col md-10"><input type="text" name="MB_id" required="required" autofocus="autofocus" placeholder="이메일" class="inputLine">
			</td>
			<tr>
				<td class="col md-2 text-center">비밀번호</td>
				<td class="col md-10"><input type="password" name="MB_pw" required="required" placeholder="비밀번호" class="inputLine"></td>
			<tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="submit" value="로그인" class="btn_small">
				</td>
			</tr>	
		</table>
		<a href="findIdForm.do">아이디 찾기</a> |
		<a href="findPwForm.do">비밀번호 찾기</a>
	</form>
</div>
</body>
</html>
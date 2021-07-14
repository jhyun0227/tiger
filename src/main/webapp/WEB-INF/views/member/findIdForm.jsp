<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- ${path }를 사용하면 패키지 내의 정보가 절대 경로로 변경됨 --%>
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/common.css">
	<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<form action="findIdResult.do">
	<h2 class="title">아이디 찾기</h2>
	<table class="table table-bordered">
		<tr>
			<td>이름</td>
			<td><input type="text" name="MB_name" required="required" autofocus="autofocus"></td>
		</tr>
		<tr>
			<td>핸드폰 번호</td>
			<td><input type="tel" name="MB_tel" id="tel" required="required" title="전화번호 형식 3-4-4"
						pattern="\d{3}-\d{4}-\d{4}" placeholder="000-0000-0000"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="아이디 찾기">
			</td>
		</tr>
	</table>
	<a href="findPwForm.do">비밀번호 찾기</a>
</form>
</body>
</html>
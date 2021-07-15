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
<style type="text/css">
	.narrowWidth1 {
   	 	width: 30%;
	}
	
	.inputLine1{
	width: 100%;
	border: none;
	border-bottom: 1px solid #000000;
	}
	
	td, th {
    	padding: 10px 20px;
	}
</style>
<body>
<div align="center">
	<h2 class="title">아이디 찾기</h2>
	<form action="findIdResult.do" method="post">
		<table class="narrowWidth1">
			<tr>
				<td class="col md-2 text-center">이름</td>
				<td class="col md-10"><input type="text" name="MB_name" required="required" autofocus="autofocus" placeholder="이름" class="inputLine1"></td>
			</tr>
			<tr>
				<td class="col md-2 text-center">핸드폰</td>
				<td class="col md-10"><input type="tel" name="MB_tel" id="tel" required="required" title="전화번호 형식 3-4-4"
							pattern="\d{3}-\d{4}-\d{4}" placeholder="000-0000-0000" class="inputLine1"></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="submit" value="아이디 찾기" class="btn_small">
				</td>
			</tr>
		</table>
		<a href="findPwForm.do">비밀번호 찾기</a>
	</form>
</div>
</body>
</html>
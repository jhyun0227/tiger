<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	.narrowWidth1 {
   	 	width: 35%;
	}
	
	.inputline1 {
		border: none;
		outline: 0;
		width: 80%;
	}
	
	td, th {
		padding: 10px 20px;
	}
	
	#idBtn {
		margin-top: 30px;
	}
</style>
<body>
<div align="center" class="container  narrowWidth1"">
	
	<form action="findIdResult.do" method="post">
	<h2 class="title ">아이디 찾기</h2>
		<table  class="table " >
			<tr>
				<td class="col-md-3 text-center">이름</td>
				<td class="col-md-9">
					<input type="text" name="MB_name" required="required" autofocus="autofocus" 
					       placeholder="이름" class="inputline1">
				</td>
			</tr>
			<tr>
				<td class="col-md-3 text-center">핸드폰</td>
				<td class="col-md-9">
					<input type="tel" name="MB_tel" id="tel" required="required"
						   title="전화번호 형식 3-4-4" 	pattern="\d{3}-\d{4}-\d{4}" 
						   placeholder="000-0000-0000" class="inputline1">
				 </td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="submit" value="아이디 찾기" class="btn_sm_full" id="idBtn">
				</td>
			</tr>
		</table>
		<a href="findPwForm.do">비밀번호 찾기</a>&nbsp; |
		<a href="joinForm.do">회원가입</a>&nbsp; |
		<a href="loginForm.do">로그인</a>&nbsp; |
	</form>
</div>
</body>
</html>
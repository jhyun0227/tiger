<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
td, th {
    padding: 14px 0px;
}
   	
#idBtn {
	margin-top: 30px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
<div class="narrowWidth1"  align="center">
	<h2 class="title">로그인</h2>
	<form action="login.do?prevUrl=${prevUrl }" method="post">
		<table>  
			<tr>
				<td class="inputUnderLine">
					<input type="text" name="MB_id" required="required" 
							autofocus="autofocus" placeholder="이메일" class="inputLine">
				</td>
			<tr>
				<td class="inputUnderLine">
					<input type="password" name="MB_pw" required="required" 
					       placeholder="비밀번호" class="inputLine">
				</td>
			<tr>
			<tr>
				<td class="text-center">
					<input type="submit" value="로그인" class="btn_large" id="idBtn">
				</td>
			</tr>  
		</table>
		
		<a href="findIdForm.do" class="inputLineA">아이디 찾기</a>&nbsp; |      
		<a href="findPwForm.do" class="inputLineA">비밀번호 찾기</a>&nbsp;
	</form>
</div>  
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="findPwResult.do">
	<h2>비밀번호 찾기</h2>
	<table class="table table-bordered">
		<tr>
			<td>이름</td>
			<td><input type="text" name="MB_name" required="required" autofocus="autofocus"></td>
		</tr>
		
		<!-- 아이디 찾기 후 비밀번호를 찾으면 값이 자동으로 넘어가게 하기 위함 -->
		<c:if test="${MB_id != null }">
		<tr>
			<td>아이디(이메일)</td>			
			<td>
				<input type="email" name="MB_id" id="email" required="required" value="${MB_id }">
			</td>
		</tr>
		</c:if>
		<c:if test="${MB_id == null }">
		<tr>
			<td>아이디(이메일)</td>			
			<td>
				<input type="email" name="MB_id" id="email" required="required" placeholder="이메일을 입력해주세요.">
			</td>
		</tr>
		</c:if>
		
		<tr>
			<td colspan="2">
				<input type="submit" value="비밀번호 찾기">
			</td>
		</tr>
	</table>
	<a href="findIdForm.do">아이디 찾기</a>
</form>
</body>
</html>
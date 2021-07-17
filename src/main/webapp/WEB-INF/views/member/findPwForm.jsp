<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/common.css">
	<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
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
</head>
<body>
<div align="center">
	<h2 class="title">비밀번호 찾기</h2>
	<form action="findPwResult.do" method="post">
		<table class="narrowWidth1">
			<tr>
				<td class="col md-2 text-center">이름</td>
				<td class="col md-10"><input type="text" name="MB_name" required="required" autofocus="autofocus" placeholder="이름" class="inputLine1"></td>
			</tr>
			
			<!-- 아이디 찾기 후 비밀번호를 찾으면 값이 자동으로 넘어가게 하기 위함 -->
			<c:if test="${MB_id != null }">
			<tr>
				<td class="col md-2 text-center">이메일</td>			
				<td class="col md-10">
					<input type="email" name="MB_id" id="email" required="required" value="${MB_id }" class="inputLine1">
				</td>
			</tr>
			</c:if>
			<c:if test="${MB_id == null }">
			<tr>
				<td class="col md-2 text-center">이메일</td>			
				<td class="col md-10">
					<input type="email" name="MB_id" id="email" required="required" placeholder="이메일" class="inputLine1">
				</td>
			</tr>
			</c:if>
			
			<tr>
				<td colspan="2" class="text-center">
					<input type="submit" value="비밀번호 찾기" class="btn_small">
				</td>
			</tr>
		</table>
		<a href="findIdForm.do">아이디 찾기</a>
	</form>
</div>
</body>
</html>
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
<div align="center">
	<h2 class="title">비밀번호 찾기</h2>
	<c:if test="${result == 1 }">
		<table class="table narrowWidth">
			<tr>
				<th class="text-center">회원님의 아이디로 임시비밀번호를 전송하였습니다. 로그인 후 비밀번호를 변경해주세요.</th>
			</tr>
		</table>
		<a href="findIdForm.do?">아이디 찾기</a>
	</c:if>
	<c:if test="${result == 0 }">
		<table class="table narrowWidth">
			<tr>
				<th>${msg }</th>
			</tr>
		</table>
		<a href="findIdForm.do?">아이디 찾기</a>
	</c:if>
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("찾을 수 없는 계정입니다. 정보를 확인해주세요.");
			history.go(-1);
		</script>
	</c:if>
</div>
</body>
</html>
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
<h2 class="title">아이디 찾기</h2>
<c:if test="${result == 1 }">
	<table class="table narrowWidth">
		<tr>
			<th class="text-center">회원님의 아이디는 '${member.MB_id }' 입니다.</th>
		</tr>
		<tr>
			<td class="text-center">
				<!-- 아이디 찾기 후 비밀번호를 찾으면 값이 자동으로 넘어가게 하기 위함 -->
				<button onclick="location.href='findPwForm.do?MB_id=${member.MB_id }'" class="btn_small">비밀번호 찾기</button>
			</td>
		</tr>
	</table>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function prev(){
	/* 이전 페이지 넘겨주기 - 우림이코드 참고하기 */
}
</script>
</head>
<body>
<table class="table">
	<tr>
		<th>보낸 사람</th>
		<td>${message.nicknameS }</td>
	</tr>
	<tr>
		<th>받는 사람</th>
		<td>${message.nicknameR }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${message.MSG_content }</td>
	</tr>
	<tr>
		<td colspan="2"><a onclick="prev()">이전</a></td>
	</tr>
</table>
</body>
</html>
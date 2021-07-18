<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function closeMsg() {
		self.close();
	}
</script>
<style type="text/css">
.btnMsg{
	background: #3243A8;
	color: #eee;
	width: 60px;
	border-radius: 8px;
	text-align: center;
	border: none;
}

.msgTitle {
    font-size: 24px;
    color: #3243A8;
    text-align: left;
    margin-left: 22px;
}
</style>
</head>
<body>
<form action="msgWriteResult.do" method="post"> 
	<h1 class="msgTitle">쪽지 쓰기</h1>
	<table class="table tableBG">
		<tr>
			<th class="col-xs-3 text-center">받는사람</th>
			<td class="col-xs-9 text-left">${nickname}<input type="hidden" name="MB_numR" value="${member.MB_num}"></td>
		</tr>
		<tr>
			<td colspan="2"><textarea name="MSG_content" cols="50" rows="10" required="required" autofocus="autofocus"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="보내기" class="btnMsg">
				<button class="btnMsg" onclick="closeMsg()">닫기</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
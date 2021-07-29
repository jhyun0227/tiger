<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/tiger/resources/bootstrap/css/common.css">
<script type="text/javascript">
function prev(){
	var preUrl = document.referrer.split("/")[4];
	location.href=preUrl;
}
</script>
</head>
<body>
<div class="narrowWidth">
<h2 class="title">쪽지</h2>
<table class="table">
	<tr>
		<th class="col-md-2 text-center">보낸 사람</th>
		<td class="col-md-4">${nicknameS }</td>
		<th class="col-md-2 text-center">받는 사람</th>
		<td class="col-md-4">${nicknameR }</td>
	</tr>
	<tr>
		<th class="text-center">내용</th>
		<td colspan="3"><pre class="textBox">${message.MSG_content }</pre></td>
	</tr>
	<tr>
		<td colspan="4" class="text-center">
			<a onclick="prev()" class="btn_prev">이전</a>
				<c:if test="${prevUrl == 'msgRecieveList'}">
					<a onclick="window.open('msgWriteForm.do?MB_num=${message.MB_numS }','쪽지 보내기',
					'width=430,height=400,location=no,status=no,scrollbars=yes');" class="btn_prev">답장</a>
				</c:if>
		</td>
	</tr>
</table>
</div>
</body>
</html>
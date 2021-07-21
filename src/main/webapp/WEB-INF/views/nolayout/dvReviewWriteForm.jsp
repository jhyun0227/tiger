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
<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert("이미 리뷰를 등록한 대상입니다.");
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 0 }">
	<form action="dvReviewWriteResult.do" method="post">
		<input type="hidden" name="RV_writer" value="${review.RV_writer }">
		<input type="hidden" name="RV_reader" value="${review.RV_reader }">
		<input type="hidden" name="RSV_num" value="${review.RSV_num }">
		<h1 class="msgTitle">후기 작성</h1>
		<table class="table tableBG">
			<tr>
				<th class="col-xs-3 text-center">탑승자</th>
				<td class="col-xs-9 text-left">${MB_nickName}</td>
			</tr>	
			<tr>
				<th class="col-xs-3 text-center">별점</th>
				<td class="col-xs-9 text-left">
					<input type="number" name="RV_star" min="0" max="5" value="5" required="required" autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="RV_content" cols="50" rows="10" required="required">상대방 후기를 작성해주세요.</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="후기 작성" class="btnMsg">
					<button class="btnMsg" onclick="closeMsg()">닫기</button>
				</td>
			</tr>
		</table>
	</form>
</c:if>
</body>
</html>
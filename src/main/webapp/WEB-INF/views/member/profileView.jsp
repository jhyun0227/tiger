<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<%-- ${path }를 사용하면 패키지 내의 정보가 절대 경로로 변경됨 --%>
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/common.css">
	<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h2 class="title">${member.MB_nickName }님의 프로필</h2>
<table class="table table-bordered">
	<tr align="center">
		<th colspan="2">
			<img alt="" src="${path }/resources/memberImg/${member.MB_img}" height="300px" width="300px">
		</th>
	</tr>
	<tr>
		<td>닉네임</td>
		<td>
			<input type="text" name="MB_nickName" value="${member.MB_nickName }" readonly="readonly">
		</td>
	</tr>
	
	<c:if test="${member.MB_gender == '1' || member.MB_gender == '3'}">
		<tr>
			<td>성별</td>
			<td><input type="text" value="남자" readonly="readonly"></td>
		</tr>	
	</c:if>
	<c:if test="${member.MB_gender == '2' || member.MB_gender == '4'}">
		<tr>
			<td>성별</td>
			<td><input type="text" value="여자" readonly="readonly"></td>
		</tr>	
	</c:if>

</table>
</body>
</html>
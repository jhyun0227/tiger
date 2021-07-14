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
<h2 class="title">마이페이지</h2>
<table class="table table-bordered">
	<tr align="center">
		<th colspan="2">
			<img alt="" src="${path }/resources/memberImg/${member.MB_img}" height="300px" width="300px">
		</th>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${member.MB_id }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${member.MB_name }</td>
	</tr>
	<tr>
		<td>주민등록번호</td>
		<td>
			${member.MB_regNum }
			<span>―</span>
			<span>*******</span>
		</td>
	</tr>
	<tr>
		<td>닉네임</td>
		<td>${member.MB_nickName }</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${member.MB_tel }</td>
	</tr>
	
	<c:if test="${member.MB_gender == '1' || member.MB_gender == '3'}">
		<tr>
			<td>성별</td>
			<td>남자</td>
		</tr>	
	</c:if>
	<c:if test="${member.MB_gender == '2' || member.MB_gender == '4'}">
		<tr>
			<td>성별</td>
			<td>여자</td>
		</tr>	
	</c:if>
	
	<c:if test="${member.MB_driverConfirm == 'Y'}">
	<tr>
		<td>드라이버</td>
		<td>O</td>
	</tr>
	</c:if>
	<c:if test="${member.MB_driverConfirm == 'N'}">
	<tr>
		<td>드라이버</td>
		<td>X</td>
	</tr>
	</c:if>
	
	<tr>
		<td>가입일</td>
		<td>${member.MB_regDate }</td>
	</tr>
</table>
</body>
</html>
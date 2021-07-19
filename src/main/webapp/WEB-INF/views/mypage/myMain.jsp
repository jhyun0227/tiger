<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/common.css">
	<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div align="center">
	<h2 class="title">마이페이지</h2>
	<table class="table narrowWidth">
		<tr align="center">
			<th colspan="2" class="text-center">
				<img alt="" src="${path }/resources/memberImg/${member.MB_img}" height="300px" width="300px">
			</th>
		</tr>
		<tr>
			<td class="col md-2 text-center">이메일</td>
			<td class="col md-10">${member.MB_id }</td>
		</tr>
		<tr>
			<td class="col md-2 text-center">이름</td>
			<td class="col md-10">${member.MB_name }</td>
		</tr>
		<tr>
			<td class="col md-2 text-center">주민등록번호</td>
			<td class="col md-10">
				${member.MB_regNum }
				<span>　―　</span>
				<span>${member.MB_gender }******</span>
			</td>
		</tr>
		<tr>
			<td class="col md-2 text-center">닉네임</td>
			<td class="col md-10">${member.MB_nickName }</td>
		</tr>
		<tr>
			<td class="col md-2 text-center">연락처</td>
			<td class="col md-10">${member.MB_tel }</td>
		</tr>
		
		<c:if test="${member.MB_gender == '1' || member.MB_gender == '3'}">
			<tr>
				<td class="col md-2 text-center">성별</td>
				<td class="col md-10">남자</td>
			</tr>	
		</c:if>
		<c:if test="${member.MB_gender == '2' || member.MB_gender == '4'}">
			<tr>
				<td class="col md-2 text-center">성별</td>
				<td class="col md-10">여자</td>
			</tr>	
		</c:if>	
		
		<tr>
			<td class="col md-2 text-center">가입일</td>
			<td class="col md-10">${member.MB_regDate }</td>
		</tr>
		
		<c:if test="${member.MB_driverConfirm == 'Y'}">
			<tr>
				<td class="col md-2 text-center">드라이버</td>
				<td class="col md-10">승인</td>
			</tr>
		</c:if>
		<c:if test="${member.MB_driverConfirm == 'I'}">
			<tr>
				<td class="col md-2 text-center">드라이버</td>
				<td class="col md-10">심사중</td>
			</tr>
		</c:if>
		<c:if test="${member.MB_driverConfirm == 'N'}">
			<tr>
				<td class="col md-2 text-center">드라이버</td>
				<td class="col md-10">미신청/거절(재신청 가능)</td>
			</tr>
		</c:if>
	</table>
</div>
</body>
</html>
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
		<h2 class="title">좋아요</h2>
		<table class="table narrowWidth">
			<tr>
				<th class="col md-5 text-center">아이디</th>
				<th class="col md-4 text-center">닉네임</th>
				<th class="col md-3 text-center">성별</th>
			</tr>
			<c:if test="${empty fvList }">
				<tr>
					<td colspan="3" class="text-center">좋아요 목록이 없습니다.</td>
				</tr>		
			</c:if>
			<c:if test="${not empty fvList }">
				<c:forEach var="favorite" items="${fvList }">
					<tr>
						<td class="col md-4 text-center"><a href="profileView.do?MB_num=${favorite.MB_numT }">${favorite.MB_id }</a></td>
						<td class="col md-4 text-center">${favorite.MB_nickName }</td>
						
						<c:if test="${favorite.MB_gender == '1' || favorite.MB_gender == '3'}">
							<td class="col md-4 text-center">남자</td>
						</c:if>
						<c:if test="${favorite.MB_gender == '2' || favorite.MB_gender == '4'}">
							<td class="col md-4 text-center">여자</td>
						</c:if>
						
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>
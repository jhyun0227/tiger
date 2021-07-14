<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${path }/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript"
	src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>좋아요</h2>
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>이름</th>
			</tr>
			<c:if test="${empty fvList }">
				<tr align="center">
					<td colspan="2">목록이 없습니다.</td>
				</tr>		
			</c:if>
			<c:if test="${not empty fvList }">
				<c:forEach var="favorite" items="${fvList }">
					<tr>
						<td>${favorite.FV_num }</td>
						<td><a href="profileView.do?MB_num=${favorite.MB_numT }">${favorite.MB_numT }</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/common.css">
	<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
</head>
<body>
<div align="center">
<h2 class="title">내 차 정보</h2>
	<table class="table narrowWidth">
		<tr>
			<td class="col md-2 text-center">차량 번호</td>
			<td class="col md-10">${vehicle.VH_carNum }</td>
		</tr>
		<tr>
			<td class="col md-2 text-center">차량 이름</td>
			<td class="col md-10">${vehicle.VH_carName }</td>
		</tr>
		<tr>
			<td class="col md-2 text-center">차량 연식</td>
			<td class="col md-10">${vehicle.VH_carYear}</td>
		</tr>
		<tr>
			<td class="col md-2 text-center">차종</td>
			<td class="col md-10">
				<c:if test="${vehicle.VH_carType == '1' }">
				소형
				</c:if>
				<c:if test="${vehicle.VH_carType == '2' }">
				중형
				</c:if>
				<c:if test="${vehicle.VH_carType == '3' }">
				대형
				</c:if>
				<c:if test="${vehicle.VH_carType == '4' }">
				승합
				</c:if>
			</td>
		</tr>
		<tr>
			<td class="col md-2 text-center">주행거리</td>
			<td class="col md-10">${vehicle.VH_km } km</td>
		</tr>
		<tr>
			<td class="col md-2 text-center">보험여부</td>
			<td class="col md-10">
				<c:if test="${vehicle.VH_insu == 'Y' }">
				O
				</c:if>
				<c:if test="${vehicle.VH_insu == 'N' }">
				X
				</c:if>
			</td>
		</tr>
		<tr>
			<td>차량 앞면 사진</td>
			<td>
				<img alt="" src="${path}/resources/vehicleImg/${vehicle.VH_carPicture }" width="300px" height="300px">
		<tr>
			<th colspan="2" class="text-center">
				<a href="vehicleList.do" class="btn_prev">목록</a>
			</th>
		</tr>
	</table>
</div>
</body>
</html>
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
<h2>내 차 정보</h2>
<table class="table table-bordered">
	<tr>
		<td>차량 번호</td>
		<td>
			<input type="text" name="VH_carNum" value="${vehicle.VH_carNum }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td>차량 이름</td>
		<td><input type="text" name="VH_carName" required="required" value="${vehicle.VH_carName }" readonly="readonly"></td>
	</tr>
	<tr>
		<td>차량 연식</td>
		<td>
			<input type="text" name="MB_carYear" required="required" value="${vehicle.VH_carYear}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td>차종</td>
		<td>
			<c:if test="${vehicle.VH_carType == '1' }">
			<input type="text" name="VH_carType" required="required" value="소형" readonly="readonly">
			</c:if>
			<c:if test="${vehicle.VH_carType == '2' }">
			<input type="text" name="VH_carType" required="required" value="중형" readonly="readonly">
			</c:if>
			<c:if test="${vehicle.VH_carType == '3' }">
			<input type="text" name="VH_carType" required="required" value="대형" readonly="readonly">
			</c:if>
			<c:if test="${vehicle.VH_carType == '4' }">
			<input type="text" name="VH_carType" required="required" value="승합" readonly="readonly">
			</c:if>
		</td>
	</tr>
	<tr>
		<td>주행거리</td>
		<td><input type="text" name="VH_km" required="required" value="${vehicle.VH_km }" readonly="readonly">km</td>
	</tr>
	<tr>
		<td>보험여부</td>
		<td>
			<c:if test="${vehicle.VH_insu == 'Y' }">
			<input type="text" name="VH_insu" required="required" value="있음" readonly="readonly">
			</c:if>
			<c:if test="${vehicle.VH_insu == 'N' }">
			<input type="text" name="VH_insu" required="required" value="없음" readonly="readonly">
			</c:if>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<a href="vehicleList.do" class="btn btn-info">목록</a>
		</th>
	</tr>
</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
</head>
<body>
<div align="center">
	<h2 class="title">드라이버 신청 정보</h2>
	<table class="table narrowWidth">
		<tr>
			<th class="col md-2 text-center">아이디</th>
			<td class="col md-10">${apply.MB_id }</td>
		</tr>
		<tr>
			<th class="col md-2 text-center">이름</th>
			<td class="col md-10">${apply.MB_name }</td>
		</tr>
		<tr align="center">
			<th class="col md-2 text-center">운전면허증 사진</th>
			<th colspan="2" class="text-center">
				<img alt="" src="${path }/resources/applyImg/${apply.AP_picture}" height="300px" width="300px">
			</th>
		</tr>
		<%-- <tr>
			<td class="col md-2 text-center">연락처</td>
			<td class="col md-10">${member.MB_tel }</td>
		</tr> --%>
		<tr>
			<th class="col md-2 text-center">성별</th>
			<c:if test="${apply.MB_gender == '1' || apply.MB_gender == '3'}">
				<td class="col md-10">남자</td>
			</c:if>
			<c:if test="${apply.MB_gender == '2' || apply.MB_gender == '4'}">
				<td class="col md-10">여자</td>
			</c:if>	
		</tr>
		<tr>
			<th class="col md-2 text-center">차량 번호</th>
			<td class="col md-10">${vehicle.VH_carNum }</td>
		</tr>
		<tr>
			<th class="col md-2 text-center">차량 이름</th>
			<td class="col md-10">${vehicle.VH_carName }</td>
		</tr>
		<tr>
			<th class="col md-2 text-center">차량 연식</th>
			<td class="col md-10">${vehicle.VH_carYear}</td>
		</tr>
		<tr>
			<th class="col md-2 text-center">차종</th>
			<td class="col md-10">
				<c:if test="${vehicle.VH_carType == '1' }">소형</c:if>
				<c:if test="${vehicle.VH_carType == '2' }">중형</c:if>
				<c:if test="${vehicle.VH_carType == '3' }">대형</c:if>
				<c:if test="${vehicle.VH_carType == '4' }">승합</c:if>
			</td>
		</tr>
		<tr>
			<th class="col md-2 text-center">주행거리</th>
			<td class="col md-10">${vehicle.VH_km } km</td>
		</tr>
		<tr>
			<th class="col md-2 text-center">보험 여부</th>
			<td class="col md-10">
				<c:if test="${vehicle.VH_insu == 'Y' }">O</c:if>
				<c:if test="${vehicle.VH_insu == 'N' }">X</c:if>
			</td>
		</tr>
		<tr>
			<th class="col md-2 text-center">차량 앞면 사진</th>
			<th colspan="2" class="text-center">
				<img alt="" src="${path }/resources/vehicleImg/${vehicle.VH_carPicture}" height="300px" width="300px">
			</th>
		</tr>
		<tr>
			<th class="col md-2 text-center">드라이버 승인여부</th>
			<c:if test="${apply.MB_driverConfirm == 'Y'}">
				<td class="col md-10">승인</td>
			</c:if>
			<c:if test="${apply.MB_driverConfirm == 'I'}">
				<td class="col md-10">심사중</td>
			</c:if>
			<c:if test="${apply.MB_driverConfirm == 'N'}">
				<td class="col md-10">미신청/거절(재신청 가능)</td>
			</c:if>
		</tr>	
	</table>
	<div align="center">
		<a href="adminPermitList.do?pageNum=${pageNum}" class="btn_prev">목록</a>
		<c:if test="${apply.MB_driverConfirm == 'I' }">
			<a href="adminPermitResult.do?MB_num=${apply.MB_num }&pageNum=${pageNum}" class="btn_prev">승인</a>
			<a href="adminRejectResult.do?MB_num=${apply.MB_num }&pageNum=${pageNum}" class="btn_prev">거절</a>
		</c:if>
	</div>
</div>
</body>
</html>
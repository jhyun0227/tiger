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
<!-- 드라이버 등록을 안했을 경우 -->
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("드라이버 등록 후 이용가능한 서비스입니다.");
		history.go(-1)
	</script>
</c:if>

<!-- 드라이더 등록 했을 경우 -->
<c:if test="${result == 1 }">
	<div class="container">
		<h2 class="title">차량 관리</h2>
		<table class="table table-bordered">
			<tr>
				<th>차량번호</th>
				<th>차랑명</th>
				<th>연식</th>
				<th>삭제</th>
			</tr>
			<c:if test="${empty vcList }">
				<tr align="center">
					<td colspan="4">등록된 차량이 없습니다.</td>
				</tr>		
			</c:if>
			<c:if test="${not empty vcList }">
				<c:forEach var="vehicle" items="${vcList }">
					<tr>
						<c:if test="${vehicle.VH_del == 'Y' }">
							<th colspan="4">삭제된 차량입니다.</th>
						</c:if>
						<c:if test="${vehicle.VH_del == 'N' }">
							<td><a href="vehicleView.do?VH_num=${vehicle.VH_num }">${vehicle.VH_carNum }</a></td>
							<td>${vehicle.VH_carName }</td>
							<td>${vehicle.VH_carYear }</td>
							<td><a href="vehicleDelete.do?VH_num=${vehicle.VH_num }">삭제</a></td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<a href="vehicleInsertForm.do">차량 등록</a>
	</div>
</c:if>
</body>
</html>
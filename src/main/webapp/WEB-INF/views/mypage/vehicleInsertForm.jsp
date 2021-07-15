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
<style type="text/css">
.err {
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>
<div align="center">
	<h2 class="title">차량 정보 등록</h2>
	<form action="vehicleInsertResult.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="MB_num" value="${MB_num }">
		<table class="table narrowWidth">
			<tr>
				<td class="col md-2 text-center">차량번호</td>
				<td class="col md-10">
					<input type="text" name="VH_carNum" required="required" autofocus="autofocus" 
					 placeholder="ex)000가 0000" class="inputLine">
				</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">차량명</td>
				<td class="col md-10">
					<input type="text" name="VH_carName" required="required" placeholder="ex)아반떼AD" class="inputLine">
				</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">연식</td>
				<td class="col md-10">
					<input type="number" name="VH_carYear" required="required" value="2010" class="inputLine">
				</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">차종</td>
				<td class="col md-10">
					<input type="radio" name="VH_carType" id="small" value="1" checked="checked">
					<label for="small">소형</label>
					&nbsp;
					<input type="radio" name="VH_carType" id="middle" value="2">
					<label for="middle">중형</label>
					&nbsp;
					<input type="radio" name="VH_carType" id="big" value="3">
					<label for="big">대형</label>
					&nbsp;
					<input type="radio" name="VH_carType" id="bbig" value="4">
					<label for="bbig">승합</label>
				</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">주행거리</td>
				<td class="col md-10">
					<input type="text" name="VH_km" required="required" placeholder="주행거리를 입력해주세요" class="inputLine">km
				</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">보험</td>
				<td class="col md-10">
					<input type="radio" name="VH_insu" id="y" value="Y" checked="checked">
					<label for="y">있음</label>
					&nbsp;
					<input type="radio" name="VH_insu" id="n" value="N">
					<label for="n">없음</label>
				</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">차량 앞면 사진</td>
				<td>
					<input type="file" name="file" id="cp" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="차량 등록" class="btn_small">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
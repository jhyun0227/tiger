<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<style type="text/css">
.err {
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>
<div class="container" align="center">
	<form action="vehicleInsertResult.do" method="post" enctype="multipart/form-data">
	<h2 class="text-primary">차량 정보 등록</h2>
	<input type="hidden" name="MB_num" value="${MB_num }">
		<table class="table table-bordered table-hover">
			<tr>
				<td><label for="carNum">차량번호</label></td>
				<td><input type="text" name="VH_carNum" id="carNum" required="required" autofocus="autofocus" 
					 placeholder="ex)000가 0000"></td>
			</tr>
			<tr>
				<td><label for="carName">차량명</label></td>
				<td><input type="text" name="VH_carName" id="carName" required="required" placeholder="ex)아반떼AD"></td>
			</tr>
			<tr>
				<td><label for="carYear">연식</label></td>
				<td><input type="number" name="VH_carYear" id="carYear" required="required" value="2010"></td>
			</tr>
			<tr>
				<td><label for="carType">차종</label></td>
				<td>
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
				<td><label for="km">주행거리</label></td>
				<td><input type="text" name="VH_km" id="km" required="required">km</td>
			</tr>
			<tr>
				<td><label for="insu">보험</label></td>
				<td>
					<input type="radio" name="VH_insu" id="y" value="Y" checked="checked">
					<label for="y">있음</label>
					&nbsp;
					<input type="radio" name="VH_insu" id="n" value="N">
					<label for="n">없음</label>
				</td>
			</tr>
			<tr>
				<td><label for="cp">차량 앞면 사진</label></td>
				<td><input type="file" name="file" id="cp" required="required"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="차량 등록" class="btn btn-success">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
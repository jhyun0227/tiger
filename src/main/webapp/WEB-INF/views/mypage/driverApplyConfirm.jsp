<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script type="text/javascript">
/* 이전페이지 */
function prev(){
	var preUrl = document.referrer.split("/")[4];
	location.href=preUrl;
}
</script>
<style type="text/css">
	.row{
		margin-top: -30px;
	}
	.narrowWidth1 {
   	 width: 70%;
   	}
   	
	.narrowWidth2 {
   	 width: 80%;
   	} 
	
	.inputline1{
	    border: none;
	    outline: 0;
	    width: 50%;
	}
	
	#labelUp{
		padding-left: 0;
	}
	
	#inform_box {
		float: right !important;
		margin-top: 15px;
		padding-left: 0px;	} 
	
	#img_box {
		float: left !important;
	} 
	 
	.thumbnail {
		height: 150px;
		width: 150px; 
		margin-top: 55px;
		margin-bottom: 10px;
	}     

</style>
</head>
<body>
	<div class="container narrowWidth1" align="center">
		<h2 class="title">${member.MB_nickName }님의 드라이버 신청 서류</h2>
		<div class="row">
			<div class="col-md-2" id="img_box">
				<img alt=""  class="thumbnail"   
				     src="${path}/resources/applyImg/${apply.AP_picture}">
			</div>
			<div class="col-md-9" id="inform_box">
			<h4 class="text-center">차량 신청 정보</h4>
			<table class="table narrowWidth2">
				<tr>
					<th class="col md-2 text-center">차량번호</th>
					<td class="col md-2 text-center">${vehicle.VH_carNum }</td>
				</tr>
				<tr>
					<th class="col md-2 text-center">차랑명</th>
					<td class="col md-2 text-center">${vehicle.VH_carName }</td>
				</tr>
				<tr>
					<th class="col md-1 text-center">연식</th>
					<td class="col md-1 text-center">${vehicle.VH_carYear }</td>
				</tr>
				<tr>
					<th class="col md-1 text-center">차종</th>
					<td class="col md-1 text-center">
						<c:if test="${vehicle.VH_carType == '1' }">소형</c:if>
						<c:if test="${vehicle.VH_carType == '2' }">중형</c:if>
						<c:if test="${vehicle.VH_carType == '3' }">대형</c:if>
						<c:if test="${vehicle.VH_carType == '4' }">승합</c:if>
					</td>
				</tr>
				<tr>
					<th class="col md-2 text-center">주행거리</th>
					<td class="col md-2 text-center">${vehicle.VH_km }</td>
				</tr>
				<tr>
					<th class="col md-2 text-center">보험여부</th>
					<td class="col md-2 text-center">
						<c:if test="${vehicle.VH_insu == 'Y' }">O</c:if>
						<c:if test="${vehicle.VH_insu == 'N' }">X</c:if>
					</td>
				</tr>
				<tr>
					<th class="col md-2 text-center">차량앞면사진</th>
					<td class="col md-2 text-center">
						<img alt=""  class="thumbnail"   
				     		src="${path}/resources/vehicleImg/${vehicle.VH_carPicture}">
					</td>
				</tr>
			</table>
			
		</div>
		</div>
	</div>
	<div class="container narrowWidth1" align="center">
		<input type="button" value="이전" class="btn_sm_stroke" onclick="prev()">
	</div>
</body>
</html>
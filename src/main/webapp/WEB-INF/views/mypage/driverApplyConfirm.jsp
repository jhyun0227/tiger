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
	.row {
		margin-top: -20px;
	}  
		
	#inform_box {
		float: right !important;
		 margin-top: 15px; 
		 padding-left: 0px;	
    }  
	   
	#img_box {
		float: left !important;
		 margin-left: -40px; 
	}  
	
	.thumbnail{
		width: 130px;
		height: 170px;
		margin-top: 20px; 
	}      
</style>
</head>
<body>
	<div class="container narrowWidth" align="center">
		<h2 class="title">${member.MB_nickName }님의 드라이버 신청 상세내역</h2>
		<div class="row">
			<%-- <div class="col-md-1"  id="title_box">
				<h5>운전면허증</h5>
				<h5 id="plate">차량 번호판</h5>
			</div>
			<div class="col-md-2"  id="img_box">
				<img alt="" src="${path }/resources/applyImg/${apply.AP_picture}" class="thumbnail">
				<img alt="" src="${path }/resources/vehicleImg/${vehicle.VH_carPicture}" 
			 		class="thumbnail">
			</div>	 --%>	     
			<div class="col-md-3"  id="title_box">
				<img alt="" src="${path }/resources/applyImg/${apply.AP_picture}" class="thumbnail">
				<h5>운전면허증</h5>
			</div>
			<div class="col-md-3"  id="img_box">
				<img alt="" src="${path }/resources/vehicleImg/${vehicle.VH_carPicture}" 
			 		class="thumbnail">
			 	<h5 id="plate">차량 번호판</h5>		
			</div>	           
			<div class="col-md-6" id="inform_box">
				<!-- <h4 class="text-center">차량 정보</h4>  -->
				<table class="table">    
					<tr>
						<th class="col-md-4 text-center">차량번호</th>
						<td class="col-md-8">${vehicle.VH_carNum }</td>
					</tr>
					<tr>
						<th class="col-md-4 text-center">차랑명</th>
						<td class="col-md-8 ">${vehicle.VH_carName }</td>
					</tr>
					<tr>
						<th class="col-md-4 text-center">연식</th>
						<td class="col-md-8">${vehicle.VH_carYear }</td>
					</tr>
					<tr>
						<th class="col-md-4 text-center">차종</th>
						<td class="col-md-8 ">
							<c:if test="${vehicle.VH_carType == '1' }">소형</c:if>
							<c:if test="${vehicle.VH_carType == '2' }">중형</c:if>
							<c:if test="${vehicle.VH_carType == '3' }">대형</c:if>
							<c:if test="${vehicle.VH_carType == '4' }">승합</c:if>
						</td>
					</tr>
					<tr>
						<th class="col-md-4 text-center">주행거리</th>
						<td class="col-md-8">${vehicle.VH_km } km</td>
					</tr>
					<tr>
						<th class="col-md-4 col md-2 text-center">보험여부</th>
						<td class="col-md-8 ">
							<c:if test="${vehicle.VH_insu == 'Y' }">있음</c:if>
							<c:if test="${vehicle.VH_insu == 'N' }">없음</c:if>
						</td>
					</tr>   
					<tr>
						<td  colspan="2">
							<div align="right">
								<input type="button" value="이전" class="btn_sm_full" 
										onclick="prev()">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>
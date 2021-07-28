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
	.narrowWidth2 {
   	 width: 85%;  
   	}
   	#inform_box {  
		float: right !important;
	} 
	#img_box {
		float: left !important;
	}  
	.title2 {
		width: 10px;
	}  
	img {
		margin-top: 10px;
		margin-bottom: 20px;
	}  
	#imgTitle {
		margin-top: 75px;
	}
	#ing {
		font-size: 16px;
		font-weight: bolder;
		color: #242526;
	}
</style>
<script type="text/javascript">
/* 이전페이지 */
	function prev(){
		var preUrl = document.referrer.split("/")[4];
		location.href=preUrl;
	}
</script>
</head>
<body>
<div class="container narrowWidth1" align="center">
	<h2 class="title">드라이버 신청 내역</h2>
	<div class="row">
		<div class="col-md-1 title2" >
			<h4 class="text-center">운전면허증 </h4>
			<h4 class="text-center" id="imgTitle" >차량 번호판</h4>
		</div>
		<div class="col-md-2"  id="img_box">
			<!-- <h5 class="text-center">운전면허 앞면 사진</h5> -->
			<img alt="" src="${path }/resources/applyImg/${apply.AP_picture}" 
					height="140px" width="115px">
		<!-- 	<h5 class="text-center">자동차 번호판</h5> -->
			<img alt="" src="${path }/resources/vehicleImg/${vehicle.VH_carPicture}" 
			 		height="140px" width="115px">
		</div>	
		<div class="col-md-9" id="inform_box">   
			<table class="table narrowWidth2 ">
				<tr>
					<th class="col-md-5 text-center">아이디</th>
					<td class="col-md-7">${apply.MB_id }</td>
					</tr>
					<tr>
						<th class="col-md-5 text-center">이름</th>
						<td class="col-md-7">${apply.MB_name }</td>  
					</tr>
						<%-- <tr>
						<td class="col-md-3 text-center">연락처</td>
						<td class="col-md-6">${member.MB_tel }</td>
					</tr> --%>
					<tr>
						<th class="col-md-5 text-center">성별</th>
						<c:if test="${apply.MB_gender == '1' || apply.MB_gender == '3'}">
							<td class="col-md-7">남자</td>
						</c:if>
						<c:if test="${apply.MB_gender == '2' || apply.MB_gender == '4'}">
							<td class="col-md-7">여자</td>
						</c:if>	
					</tr>
					<tr>
						<th class="col-md-5 text-center">차량 번호</th>
						<td class="col-md-7">${vehicle.VH_carNum }</td>
					</tr>
					<tr>
						<th class="col-md-5 text-center">차량 이름</th>
						<td class="col-md-7">${vehicle.VH_carName }</td>
					</tr>
					<tr>
						<th class="col-md-5 text-center">차량 연식</th>
						<td class="col-md-7">${vehicle.VH_carYear} 년식</td>
					</tr>
					<tr>
						<th class="col-md-5 text-center">차종</th>
						<td class="col-md-7">
							<c:if test="${vehicle.VH_carType == '1' }">소형</c:if>
							<c:if test="${vehicle.VH_carType == '2' }">중형</c:if>
							<c:if test="${vehicle.VH_carType == '3' }">대형</c:if>
							<c:if test="${vehicle.VH_carType == '4' }">승합</c:if>
						</td>
					</tr>
					<tr>
						<th class="col-md-5 text-center">주행거리</th>
						<td class="col-md-7">${vehicle.VH_km } km</td>
					</tr>
					<tr>
						<th class="col-md-5 text-center">보험 여부</th>
						<td class="col-md-7">
							<c:if test="${vehicle.VH_insu == 'Y' }">있음</c:if>
							<c:if test="${vehicle.VH_insu == 'N' }">없음</c:if>
						</td>
					</tr>
					
				</table>
			<div class="container narrowWidth1" align="center">
				<input type="button" value="이전" class="btn_sm_full" onclick="prev()">
			</div>	  
		</div>
	</div>
</div>
</body>
</html>
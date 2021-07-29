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
   	#inform_box {
		float: right !important;
		/* margin-top: 15px;
		padding-left: 0px;	 */
	} 
		
	#img_box {
		float: left !important;
	} 
	#line{
		margin-top: 15px;
	} 
	
	.thumbnail {
		height: 130px;  
		width: 130px;; 
		margin-top: 0; 
		margin-bottom: 8px; 
	}
</style>
</head>
<body>     
<div class="container narrowWidth" align="center">
	<h2 class="title">내 차 정보</h2>
	<div class="row">  
		<div class="col-md-3" id="img_box"  > 
			<img alt="" src="${path}/resources/vehicleImg/${vehicle.VH_carPicture }" 
				class="thumbnail" >차량 번호판
		</div>
		<div class="col-md-9" id="inform_box">	  
			<table class="table ">  
				<tr>  
					<td class="col-md-4 text-center">차량 번호</td>
					<td class="col-md-8">${vehicle.VH_carNum }</td>
				</tr>
				<tr>
					<td class="col-md-4 text-center">차량 이름</td>
					<td class="col-md-8">${vehicle.VH_carName }</td>
				</tr>
				<tr>
					<td class="col md-4 text-center">차량 연식</td>
					<td class="col md-8">${vehicle.VH_carYear}</td>
				</tr>
				<tr>
					<td class="col-md-4 text-center">차종</td>
					<td class="col-md-8">
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
					<td class="col-md-4 text-center">주행거리</td>
					<td class="col-md-8">${vehicle.VH_km } km</td>
				</tr>
				<tr>
					<td class="col-md-4 text-center">자차보험</td>
					<td class="col-md-8">
						<c:if test="${vehicle.VH_insu == 'Y' }">
						있음
						</c:if>
						<c:if test="${vehicle.VH_insu == 'N' }">
						없음
						</c:if>
					</td>
				</tr>
				<%-- <tr>
					<td class="col-md-4 text-center">차량 앞면 사진</td>
					<td class="col-md-8">
						<img alt="" src="${path}/resources/vehicleImg/${vehicle.VH_carPicture }" width="300px" height="300px">
					</td>
				</tr> --%>
				<tr>
					<th colspan="2" class="text-center" >
						<div align="right" id="line">
							<a href="vehicleList.do" class="btn_sm_full" >목록</a>
						</div>
					</th>  
				</tr>
			</table>
		</div>
	</div>	
</div>
</body>
</html>
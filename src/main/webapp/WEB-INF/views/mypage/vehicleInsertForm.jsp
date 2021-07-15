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
	.filebox input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
	}
	.filebox label {
	    display: inline-block;
	    width: 80px;
	    height: 30px;
	    border: none;
	    background: #242526;
	    color: #eee;
	    font-size: 16px;
	    text-align: center;
	    cursor: pointer;
	    line-height: 30px;
	} 
	/* named upload */
	.filebox .upload-name {
		display: inline-block;
		background-color: white;
		cursor: pointer;
		border: none;
		-webkit-appearance: none; /* 네이티브 외형 감추기 */
		-moz-appearance: none;
		appearance: none;
	}
	
	.inputKm{
		border: none;
	    outline: 0;
		width: 90px;
	}
</style>

<script type="text/javascript">
	$(document).ready( function(){ 
		var fileTarget = $('.filebox .upload-hidden'); 
		
		fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name;
			} 
			else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} 
		// 추출한 파일명 삽입 
		$(this).siblings('.upload-name').val(filename);
		}); 
	});
</script>

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
					<input type="text" name="VH_km" required="required" placeholder="ex)100,000" class="inputKm">km
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
					<div class="filebox"> 
						<label for="ex_filename">업로드</label> 
						<input class="upload-name" disabled="disabled"> 
						<input type="file" name="file" id="ex_filename" required="required" class="upload-hidden"> 	
					</div>
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
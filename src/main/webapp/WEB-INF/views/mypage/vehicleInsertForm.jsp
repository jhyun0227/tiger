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
	.inputKm1{
		border: none;
	    outline: 0;
		width: 90px;
	}
	.inputKm2{
		border: none;
	    outline: 0;
		width: 70px;
	}   
	
	.err {
		color: red;
		font-weight: bold;
	}
	
	td, th {
    padding: 14px 0px;	
}
	
</style>

<script type="text/javascript">
	// 차량 번호가 중복인지  확인하는 ajax
	$(function() {
		$("#vhChk").hide();
		$("#carNum").keyup(function() {
			$.post('vhChk.do', 'VH_carNum='+frm.VH_carNum.value, function(data) {
				$('#vhChk').html(data);
				if (data == '등록가능한 차량번호입니다.') {
					$("#vhChk").show();
					$("#submit").attr('disabled', false);
				} else {
					$("#vhChk").show();
					$("#submit").attr('disabled', true);
				}
			});
		});
	});
	
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
	
// 차량주행거리에 천단위로 콤마(,) 넣기 
	$( function () {
	 	const input = document.querySelector('#comma');
		input.addEventListener('keyup', function(e) {
 			 let value = e.target.value;
  			 value = Number(value.replaceAll(',', ''));
  		if(isNaN(value)) {
   			 input.value = 0;
 		 }else {
  			  const formatValue = value.toLocaleString('ko-KR');
   			 input.value = formatValue;
 		 }
		});
	});
</script>

</head>
<body>
<div align="center">
	<h2 class="title">차량 정보 등록</h2>
	<form action="vehicleInsertResult.do" method="post" name="frm" enctype="multipart/form-data">
	<input type="hidden" name="MB_num" value="${MB_num }">
		<table class="table narrowWidth1">
			<tr>
				<td class="col-md-4 text-center">차량번호</td>
				<td class="col-md-8">
					<input type="text" name="VH_carNum" id="carNum" required="required" autofocus="autofocus" 
					 placeholder="ex)000가 0000" maxlength="9" class="inputLine">
					 <div id="vhChk" class="err"></div>
				</td>
			</tr>
			<tr>
				<td class="col-md-4 text-center">차량명</td>
				<td class="col-md-8">
					<input type="text" name="VH_carName" required="required" placeholder="ex)아반떼AD" class="inputLine">
				</td>
			</tr>
			<tr>
				<td class="col-md-4 text-center">연식</td>
				<td class="col-md-8">
					<input type="number" name="VH_carYear" required="required" value="2010" 
							class="inputKm2"> 년식
				</td>
			</tr>     
			<tr>
				<td class="col-md-2 text-center">차종</td>
				<td class="col-md-8">
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
				<td class="col-md-2 text-center">주행거리</td>
				<td class="col-md-8">
					<input type="text" name="VH_km" required="required" placeholder="ex)100,000" 
							class="inputKm1" id="comma">km
				</td>
			</tr>
			<tr>
				<td class="col-md-4 text-center">자차보험</td>
				<td class="col-md-8">
					<input type="radio" name="VH_insu" id="y" value="Y">
					<label for="y">있음</label>
					&nbsp;
					<input type="radio" name="VH_insu" id="n" value="N" checked="checked">
					<label for="n">없음</label>
				</td>
			</tr>
			<tr>
				<td class="col-md-2 text-center">차량 앞면 사진</td>
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
				    <div align="right">
					<input type="submit" id="submit" value="차량 등록" class="btn_sm_full" disabled="">
					</div>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>  
<head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<style type="text/css">
	.inputLine_s {  
		border: none;
		outline: 0;
		width: 35%;  
	}    
	#file_len {
		width: 100%;
		text-align: center;
	}
	 #box{
	 	margin-top: -20px;  
	 } 
	 .thumbnail {
		height: 170px;  
		width: 140px;; 
		margin-top: 0; 
		margin-bottom: 8px; 
	} 
	.err {
		color: #3243A8;
		font-weight: bold;add
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
   
// 파일 업로드 미리보기
	 function preView(fis) {  
		   var str = fis.value;
	       $('.thumb').text(fis.value.substring(str.lastIndexOf("\\")+1));
	       // 이미지를 변경한다.
	       var reader = new FileReader();
		   reader.onload = function(e){  
		   $('.thumb').attr('src',e.target.result);
	      }
	   	 reader.readAsDataURL(fis.files[0]);
	}  

// 파일 이름 
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
<!-- 드라이버 신청 중인 경우 중복 신청 못하게 -->
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("이미 신청하셨습니다.");
		history.go(-1);
	</script>
</c:if>

<!-- 드라이버 등록이 된 경우 -->
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("드라이버 등록이 완료된 계정입니다.");
		history.go(-1);
	</script>
</c:if>

<!-- 신청기록이 없거나 신청 후 거절당해서 다시 신청이 가능한 경우 -->
<c:if test="${result == 1 }">

<div class="narrowWidth" align="center" >
	<h2 class="title">드라이버 신청</h2>
	<form action="driverApplyResult.do" method="post" name="frm" enctype="multipart/form-data"> 
	 	<input type="hidden" name="MB_num" value="${member.MB_num }">
	 <div class="row">
	 	<div class="col-md-3" id="img_box"  > 
	 		<c:if test="${empty AP_picture}">  
			<img alt="" src="${path }/resources/main/none_dr.png" class="thumb" 
					data-toggle="tooltip" data-placement="left" 
					title="운전면허증 앞면 사진을 첨부해 주세요">
			</c:if>  
			<c:if test="${not empty AP_picture}">
				<img alt=""  class="thumbnail"   
				     src="${path }/resources/applyImg/${apply.AP_picture}">	
			</c:if>	     		
			<div class="filebox" id="box">   
				<label for="AP_picture" class="btn_sm_full">운전면허증</label> 
				<input class="upload-name" disabled="disabled" id="file_len">    
				<input type="file" name="fileAp" id="AP_picture" class="upload-hidden"
					       style="display:none;" onchange="preView(this);"  required="required">
			</div>      
	 	</div>
	 	<div class="col-md-9 " id="inform_box">
	 			<h4 class="text-center">차량 정보 입력</h4>  
			    <table class="table narrowWidth80 ">  
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
							        class="inputLine_s">연식
						</td>
					</tr>
					<tr>
						<td class="col-md-4 text-center">차종</td>
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
						<td class="col-md-4 text-center">주행거리</td>
						<td class="col-md-8">
							<input type="text" name="VH_km" required="required" id="comma"
									placeholder="ex)100,000" class="inputLine_s">km
						</td>
					</tr>   
					<tr>
						<td class="col-md-4 text-center">자차보험</td>
						<td class="col-md-8">
							<input type="radio" name="VH_insu" id="y" value="Y" checked="checked">
							<label for="y">있음</label>
							&nbsp;
							<input type="radio" name="VH_insu" id="n" value="N">
							<label for="n">없음</label>
						</td>
					</tr>
					<tr>
						<td class="col-md-4 text-center">차량 앞면 사진</td>
						<td class="col-md-8">
							 <div class="filebox"> 
								<label for="ex_filename">차량 번호판 첨부</label> 
								<input class="upload-name" disabled="disabled"> 
								<input type="file" id="ex_filename" name="file" class="upload-hidden"> 	
							</div>
						 </td>	 
					 </tr>
					 <tr >
					 	<td colspan="2">
					 		<div align="right">
								<input type="submit" id="submit" value="신청하기" disabled="disabled"
										class="btn_sm_full">
						     </div>
					 	</td>
					 </tr>
 			 </table>     
	 	</div>
	 </div>	
	</form>
</div>
</c:if>
</body>
</html>  
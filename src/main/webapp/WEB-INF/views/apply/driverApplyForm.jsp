<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>  
<head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<style type="text/css">
	.inputline1{
	    border: none;
	    outline: 0;
	    width: 40%;
	}
	
	#labelUp{
		text-align: left;	
	}
	
	.filebox label {
    	width: 100%;
    	padding: 0;
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
   
   
// 파일 업로드 미리보기
	 function fileUpload(fis) {  
		   var str = fis.value;
	       $('.thumb').text(fis.value.substring(str.lastIndexOf("\\")+1));
	       // 이미지를 변경한다.
	       var reader = new FileReader();
		   reader.onload = function(e){
		   $('.thumb').attr('src',e.target.result);
	      }
	   	 reader.readAsDataURL(fis.files[0]);
	}

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

<div class="narrowWidth1" align="center" >
	<h2 class="title">드라이버 신청</h2>
	<form action="driverApplyResult.do" method="post" name="frm" enctype="multipart/form-data"> 
	 	<input type="hidden" name="MB_num" value="${member.MB_num }">
	 <div class="">
	 	<div class="col-md-4 col-lg-3" id="img_box"  > 
	 		<c:if test="${empty AP_picture}">  
			<img alt="" src="${path }/resources/main/none_dr.png" class="thumb" 
					data-toggle="tooltip" data-placement="left" 
					title="운전면허증 사진을 첨부해 주세요" id="togText">
			</c:if>  
			<c:if test="${not empty AP_picture}">
				<img alt=""  class="thumb"   
				     src="${path }/resources/applyImg/${apply.AP_picture}">	
			</c:if>	     		
			<div class="filebox">   
				<label for="AP_picture" class="btn_sm_full">운전면허증 등록</label> 
				<input class="upload-name" disabled="disabled" >    
				<input type="file" name="fileAp" id="AP_picture" class="upload-hidden"
					       style="display:none;" onchange="fileUpload(this);" 
					       multiple="multiple"> 
			</div>    
	 	</div>
	 	<div class="col-md-8 col-lg-9" id="inform_box">
	 			<h4 class="text-center">차량 정보 입력</h4>  
			    <table class="table narrowWidth80">  
					<tr>
						<td class="col-md-4 text-center">차량번호</td>
						<td class="col-md-8">
							<input type="text" name="VH_carNum" id="carNum" required="required" autofocus="autofocus" 
						  	 		placeholder="ex)000가 0000" maxlength="9" class="inputLine">
							 <div id="vhChk" class="err"></div>
						</td>
					</tr>
					<tr>
						<td class="col-md-3 text-center">차량명</td>
						<td class="col-md-9">
							<input type="text" name="VH_carName" required="required" placeholder="ex)아반떼AD" class="inputLine">
						</td>
					</tr>
					<tr>
						<td class="col-md-3 text-center">연식</td>
						<td class="col-md-9">
							<input type="number" name="VH_carYear" required="required" value="2010" class="inputLine">
						</td>
					</tr>
					<tr>
						<td class="col-md-3 text-center">차종</td>
						<td class="col-md-9">
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
						<td class="col-md-3 text-center">주행거리</td>
						<td class="col-md-9">
							<input type="text" name="VH_km" required="required" class="inputline1"
									placeholder="ex)100,000" class="inputKm">km
						</td>
					</tr>
					<tr>
						<td class="col-md-3 text-center">보험</td>
						<td class="col-md-9">
							<input type="radio" name="VH_insu" id="y" value="Y" checked="checked">
							<label for="y">있음</label>
							&nbsp;
							<input type="radio" name="VH_insu" id="n" value="N">
							<label for="n">없음</label>
						</td>
					</tr>
					<tr>
						<td class="col-md-3 text-center">차량 앞면 사진</td>
						<td class="col-md-9">
							<div class="filebox" > 
								<label for="ex_filename" id="labelUp">업로드</label> 
								<input class="upload-name" disabled="disabled"> 
								<input type="file" name="file" id="ex_filename" required="required"
								       class="upload-hidden" > 	
							</div>
						 </td>	
					 </tr>
 			 </table> 
		 	 <div align="center">
				<input type="submit" id="submit" value="신청하기" disabled="disabled"
						class="btn_small">
		     </div>
	 	</div>
	 </div>	
	</form>
	 
</div>
</c:if>
</body>
</html>  
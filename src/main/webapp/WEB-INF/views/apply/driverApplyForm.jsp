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
	    position: relative; 
	    width: 80px;
	    height: 30px;
	    border: none;  
	    background: #242526;
	    color: #eee;
	    font-size: 16px; 
	    text-align: center; 
	    cursor: pointer;
	    line-height: 30px;
	    left : 60px;  
	  }     
	/* named upload */
	.filebox .upload-name {
	 	display: inline-block; 
	    position: relative;  
		background-color: white;
		cursor: pointer;
		border: none;
		-webkit-appearance: none; /* 네이티브 외형 감추기 */
		-moz-appearance: none;
		appearance: none;
		left : 70px;
	}
	
	.inputKm {
		border: none;  
	    outline: 0;
		width: 90px;
	}
	
	.narrowWidth1 {
   	 width: 60%;
   	}
   	
	.narrowWidth2 {
   	 width: 100%;
   	} 
	
	.inputline1{
	    border: none;
	    outline: 0;
	    width: 35%;
	}
	
	#inform_box {
		float: right !important;
		margin-top: 15px;
		padding-left: 0px;	} 
	
	#img_box {
		float: left !important;
	} 
	 
	.thumbnail {
		height: 170px;
		width: 170px; 
		margin-top: 20px;
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
	       $('.thumbnail').text(fis.value.substring(str.lastIndexOf("\\")+1));
	       // 이미지를 변경한다.
	       var reader = new FileReader();
		   reader.onload = function(e){
		   $('.thumbnail').attr('src',e.target.result);
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
<div align="center">
	<h2 class="title">드라이버 등록</h2>
	<form action="driverApplyResult.do" method="post" name="frm" enctype="multipart/form-data"> 
		<input type="hidden" name="MB_num" value="${member.MB_num }">
	<div class="table narrowWidth1">	
	  	<div class="col md-2" id="img_box">
			<h4 class="text-center" >${member.MB_nickName }</h4>
			<c:if test="${empty AP_picture}">
				<img alt="" src="${path }/resources/main/none_dr.jpg" class="thumbnail" >
				<div class="filebox">   
					<label for="AP_picture" >upload</label> 
					<input type="file" name="fileAp" id="AP_picture" class="upload-hidden"
					         style="display:none;" onchange="fileUpload(this);"> 
					<input class="upload-name" disabled="disabled" >         
				</div>  
			</c:if>
			<c:if test="not empty AP_picture">
				<img alt=""  class="thumbnail"   
				     src="${path }/resources/upload_driverLicense/${apply.AP_picture}">
	  		    <div class="filebox">   
					<label for="AP_picture" >upload</label> 
					<input type="file" name="fileAp" id="AP_picture" class="upload-hidden"
					         style="display:none;" onchange="fileUpload(this);"> 
					<input class="upload-name" disabled="disabled" >         
				</div>   
			 </c:if>	     
		 </div>	
	     <div class="col md-10" id="inform_box" >
			 <h4 class="text-center">차량 정보 입력</h4>  
			     <table class="table narrowWidth2">
					<tr>
						<td class="col md-2 text-center">차량번호</td>
						<td class="col md-10">
							<input type="text" name="VH_carNum" id="carNum" required="required" autofocus="autofocus" 
							 placeholder="ex)000가 0000" maxlength="9" class="inputLine">
							 <div id="vhChk" class="err"></div>
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
								<input type="file" name="file" id="ex_filename" required="required"
								       class="upload-hidden"> 	
							</div>
						</td>
					</tr>
 			 </table> 
		 	<div align="center">
				<input type="submit" id="submit" value="드라이버등록신청" disabled="">
		</div>
	</div>
	</div>	
	</form> 
</div>
</c:if>
</body>
</html>  
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
<script type="text/javascript">
   // 파일 업로드 해서 같은 화면에 띄우기
    $(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/upload_driverLicense" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#preview');
        }
      });//arr.forEach
    }
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

<!-- 신청기록이 없거나 신청 후 거절당해서 다시 신청이 가능한 경우 -->
<c:if test="${result == 1 }">
<div align="center">
	<h2 class="title">드라이버 등록</h2>
	<form action="driverApplyResult.do" enctype="multipart/form-data" method="post"> 
		<input type="hidden" name="MB_id" value="${MB_id }">
		<h2>드라이버 정보 입력</h2>
		<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>${member.MB_id}</td>
				</tr>
				<tr>
					<td>운전면허증 사진</td>  
				    <td><input type="file" name="fileAp" id="AP_picture"  required="required">
					<div id="preview"></div> 
		    	</tr>
		</table>
		<br>
		<h2>차량 정보 입력</h2>
		<table class="table table-bordered">
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
		</table> 
		
		<tr>
		<td colspan="2" align="center">
					<input type="submit" value="드라이버등록신청">
					<input type="reset" value="다시 작성"> 
		</tr>  
	</form> 
</div>
</c:if>
</body>
</html>  
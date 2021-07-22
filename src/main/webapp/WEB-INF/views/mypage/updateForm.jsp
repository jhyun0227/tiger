<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<style type="text/css">
	.err {
		color: red;
		font-weight: bold;
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
		/* margin-top: 15px;
		padding-left: 0px;	 */
	} 
	
	#img_box {
		float: left !important;
	} 
	 
	.thumbnail {
		height: 200px;
		width: 200px; 
		margin-top: 20px;
	}     
	.btn_SM {
		width: 90%;
		height: 40px;  
		border: none;
		background: #242526;
		color: #eee;   
		font-size: 18px;
		text-align: center;
	}  
</style>
<script type="text/javascript">
// 닉네임 중복체크
	function nickChk() {
		if(!frm.MB_nickName.value) {
			alert("닉네임을 입력하세요")
			frm.MB_nickName.focus();
			frm.MB_nickName.value="";
			return false;
		} else {
			// 마이페이지에서 닉네임 중복 체크 로직 회원가입과 다르다 기존 사용하는 닉네임의 판별 여부를 위해 만들었음
			$.post('nickChkMy.do', 'MB_nickName='+frm.MB_nickName.value+'&MB_num='+'${member.MB_num}', function(data) {
				$('#nickChk').html(data);
				if (data == '사용가능한 닉네임입니다.') {
					$("#submit").attr('disabled', false);
				} else {
					$("#submit").attr('disabled', true);
				}
			});
		}
	}
	
 // 파일 업로드 미리보기 완성
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
 
 //
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
	
// 탈퇴 확인
	function del() {
		var cf = confirm("정말로 탈퇴하시겠습니까?");
		if (cf) {
			location.href = "delete.do";
		} else {
			alert("탈퇴가 취소되었습니다.");
			return;
		}
	}
</script>
</head>
<body>   
	<div align="center">
		<h2 class="title">${member.MB_nickName } 정보 변경</h2>
		<form action="updateResult.do" method="post" enctype="multipart/form-data" 
				name="frm" onsubmit="return chk()">
			<input type="hidden" name="MB_id" value="${member.MB_id }">
			<div class="table narrowWidth1" >    
				<div class="col-sm-2 col-md-3 col-lg-4" id="img_box"  >  
					 <c:if test="${empty member.MB_img}">
				     	<img alt="" src="${path }/resources/main/none_img1.jpg" class="thumbnail" id="preview" >
				     </c:if>
				     <c:if test="${not empty member.MB_img }">   
						<img alt="" src="${path }/resources/memberImg/${member.MB_img }" class="thumbnail" id="preview"> 
					 </c:if>	      
						<div class="filebox">   
						      <label for="ex_filename" >upload</label>
	   					      <input class="upload-name" disabled="disabled" > 
						      <input type="file" name="file" id="ex_filename" class="upload-hidden"
						             style="display:none;"  onchange="fileUpload(this);">  
  					     </div>  
				</div>	  
				<div class="col-sm-10 col-md-9 col-lg-8" id="inform_box" >		      
			  		<table class="table narrowWidth2"  >
						<tr>
							<td class="col md-3 text-center">이메일</td>
							<td class="col md-9">${member.MB_id }</td>
						</tr>
						<tr>
							<td class="col md-3 text-center">이름</td>
							<td class="col md-9"><input type="text" name="MB_name"
								required="required" autofocus="autofocus"
								value="${member.MB_name }" class="inputline1"></td>
						</tr>
						<tr>
							<td class="col md-3 text-center">주민등록번호</td>
							<td class="col md-9">${member.MB_regNum }
							 <span>―</span><span>*******</span>
					    </td>
						</tr>
						<tr>
							<td class="col md-3 text-center">닉네임</td>
							<td class="col md-9 text-center">
							   <input type="text" name="MB_nickName" required="required" 
							           value="${member.MB_nickName }" class="inputline1"> 
							   <input type="button" onclick="nickChk()" class="btn_s" value="중복체크">
							   <div id="nickChk" class="err"></div></td>
						</tr>  
						<tr>
							<td class="col md-3 text-center">연락처</td>
							<td class="col md-9">
							    <input type="tel" name="MB_tel" required="required" 
							           title="전화번호 형식 3-4-4" pattern="\d{3}-\d{4}-\d{4}" 
							            placeholder="000-0000-0000" value="${member.MB_tel }" 
							            class="inputline1">
							</td>
						<tr>
						<tr>
							<td colspan="2" align="center" class="text-center">
								<input type="submit" id="submit" value="정보 수정" 
							       class="btn_small" disabled="">
							 	<input onclick="del()" class="btn_s text-center" type="button" 
							 			value="회원 탈퇴" >
							 </td>    
						</tr>
			  		</table>
					<!-- <div align="center">
						<a onclick="del()" class="btn_prev">회원 탈퇴</a>
					</div> -->  
	    		</div>
			</div>      
		</form>  
	</div>
</body>  
</html>
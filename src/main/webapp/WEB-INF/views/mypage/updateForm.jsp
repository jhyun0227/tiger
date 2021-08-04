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
 	
	#inform_box {
		float: right !important;
		/* margin-top: 15px;
		padding-left: 0px;	 */
	} 
	
	.delBtn {
		color: darkgray;
		margin-top: -10px;
	}
	.delBtn:hover {
		color: #3243A8;
		margin-top: -10px;
		font-size: 16px;
		font-weight: bold;
	}
	
	
	#img_box {
		float: left !important;
	} 
	   
	.thumbnail {
		height: 190px;  
		width: 190px;; 
		margin-top: 0; 
		margin-bottom: 8px;
		margin-left : 100px
	}  
		 
	#fileA {
		width: 100%;
		text-align: center;
		margin-left: 50px;
	} 
	#nameA {
		width: 100%;  
		text-align: center;
	} 
	input:hover {
		color: #3243A8;
		font-size: 18px;
		font-weight: bold;
	}
	input{
		color: #637DBA;
	}
	
	.filebox label {
    margin-left: 53px;
  } 
</style>
<script type="text/javascript">
// 중복체크안해도 submit 버튼 활성화
	$(function() {
		var MB_nickName = '${member.MB_nickName }';
		if (MB_nickName == frm.MB_nickName.value || MB_nickName.equals(frm.MB_nickName.value)) {
			$("#submit").attr('disabled', false);
		} else {
			$("#submit").attr('disabled', true);
		}
	});

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
	function preView(fis) {  
	   var str = fis.value;
       $('.thumbnail').text(fis.value.substring(str.lastIndexOf("\\")+1));
       // 이미지를 변경한다.
       var reader = new FileReader();
	   reader.onload = function(e){
	   $('.thumbnail').attr('src',e.target.result);
      }
   	 reader.readAsDataURL(fis.files[0]);
	}  
 
 //파일이름
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
<div class="container narrowWidth" align="center">
	<h2 class="title">${member.MB_nickName }님의 프로필 설정</h2>
	<form action="updateResult.do" method="post" enctype="multipart/form-data" 
				name="frm" onsubmit="return chk()">
		<!-- 엔터키 전송 막기 -->
		<div style="display:none">
			<input type="submit" onclick="return false"/>
			<input type="text"/>
		</div>
	<input type="hidden" name="MB_id" value="${member.MB_id }">			
		<div class="row">  
			<div class="col-md-5" id="img_box"  > 
				<c:if test="${empty member.MB_img }">
					<img alt="" src="${path }/resources/main/none_img3.jpg" class="thumbnail" >
				</c:if> 
				<c:if test="${not empty member.MB_img  }">  
					<img alt="" src="${path }/resources/memberImg/${member.MB_img }" class="thumbnail" >  
				 </c:if>    
			     <div class="filebox">   
											<!-- 그림있는 곳에 커셔가 가면 메세지 나옴 -->
					<label for="ex_filename"  data-toggle="tooltip" data-placement="left" 	
					                          title="이미지를 선택하세요" id="nameA">upload</label>
					     <input class="upload-name " disabled="disabled" id="fileA" ><br> 
				         <input type="file" name="file" id="ex_filename" class="upload-hidden"
					              style="display:none;"  onchange="preView(this);">  
	  		     </div> 
	  
			</div>
			<div class="col-md-7" id="inform_box">	
				<table class="table">  
					   <tr>
							<td class="col-md-4 text-center">이메일</td>
							<td class="col-md-8">${member.MB_id }</td>
						</tr>
						<tr>
							<td class="col-md-4 text-center">이름</td>
							<td class="col-md-8"><input type="text" name="MB_name"
								required="required" autofocus="autofocus"
								title="변경을 원하시면 이름을 입력해주세요" 
								value="${member.MB_name }" class="inputLine"></td>  
		 				</tr>
						<tr>
							<td class="col-md-4 text-center">주민등록번호</td>
							<td class="col-md-8">${member.MB_regNum }
							 &nbsp; <span>―</span> &nbsp; <span>*******</span>
					    </td>
						</tr>
						<tr>
							<td class="col-md-4 text-center">닉네임</td>
							<td class="col-md-8">
								<input type="text" name="MB_nickName" id="nickName" required="required" 
								        placeholder="닉네임을 입력해주세요" class="inputLine" value="${member.MB_nickName }" onchange="nickChk()" 
								        title="변경을 원하시면 닉네임을 입력해주세요" >
								<div id="nickChk" class="err"></div>
							</td>
					 	 </tr> 
						<tr>  
							<td class="col-md-4 text-center">연락처</td>
							<td class="col-md-8">
							    <input type="tel" name="MB_tel" required="required" 
							           title="전화번호 형식 3-4-4" pattern="\d{3}-\d{4}-\d{4}" 
							            placeholder="000-0000-0000" value="${member.MB_tel }" 
							            class="inputLine">
							</td>
						<tr>
						<tr>
							<td colspan="2" align="center" class="text-center">
								<div class="text-right">
									<a onclick="del()" class="delBtn" >회원 탈퇴</a>  
								</div>
								<div>
									<input type="submit" id="submit" value="정보 수정" 
							       				class="btn_sm_full" disabled="disabled" style="text-decoration: none">
							       	</div>  
							 </td>    
						</tr>
				</table>
			</div>
		</div>
	</form>
</div>	
</body>  
</html>
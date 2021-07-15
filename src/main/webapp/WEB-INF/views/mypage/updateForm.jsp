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
	.err {
		color: red;
		font-weight: bold;
	}

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
	
	.narrowWidth1 {
   	 width: 60%;
	}
	
	.btn_s {
	width: 100px;
    height: 30px;
    border: none;
    background: #242526;
    color: #eee;

	}
	
	.inputline1{
	    border: none;
	    outline: 0;
	    width: 35%;
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
			// 닉네임 중복 체크 로직
			$.post('nickChk.do', 'MB_nickName='+frm.MB_nickName.value, function(data) {
				$('#nickChk').html(data);
			});
		}
	}
	
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
	<h2 class="title">정보 수정</h2>
	<form action="updateResult.do" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
		<input type="hidden" name="MB_id" value="${member.MB_id }">
		<table class="table narrowWidth1">
			<tr>
				<td class="col md-2 text-center">프로필 사진</td>
				<td class="col md-10">
					<img alt="" src="${path }/resources/memberImg/${member.MB_img }" width="300px" height="300px">
					<br>
					<div class="filebox"> 
						<label for="ex_filename">업로드</label> 
						<input class="upload-name" disabled="disabled"> 
						<input type="file" name="file" id="ex_filename" class="upload-hidden">
					</div>
				</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">이메일</td>
				<td class="col md-10">${member.MB_id }</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">이름</td>
				<td class="col md-10">
					<input type="text" name="MB_name" required="required" autofocus="autofocus" value="${member.MB_name }" class="inputline1">
				</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">주민등록번호</td>
				<td class="col md-10">${member.MB_regNum }<span>―</span><span>*******</span></td>
			</tr>
			<tr>
				<td class="col md-2 text-center">닉네임</td>
				<td class="col md-10">
					<input type="text" name="MB_nickName" required="required" value="${member.MB_nickName }" class="inputline1">
					<input type="button" onclick="nickChk()" class="btn_s" value="중복체크">
					<div id="nickChk" class="err"></div>
				</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">연락처</td>
				<td class="col md-10">
					<input type="tel" name="MB_tel" required="required" title="전화번호 형식 3-4-4"
							pattern="\d{3}-\d{4}-\d{4}" placeholder="000-0000-0000" value="${member.MB_tel }" class="inputline1">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="정보 수정" class="btn_small">
				</td>
			</tr>
		</table>
		<div align="center">
			<a onclick="del()" class="btn_prev">회원 탈퇴</a>
		</div>
	</form>
</div>
</body>
</html>
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
	// 현재 비밀번호가 맞는지  확인하는 ajax
		$(function() {
			$("#correct").hide();
			$("#fail").hide();
			$("#now_pw").keyup(function() {
				var MB_pw_db = "${member.MB_pw}";
				var MB_pw_now = $("#now_pw").val();
				if (MB_pw_now != "") {
					if (MB_pw_db == MB_pw_now) {
						$("#correct").show();
						$("#fail").hide();
						$("#submit").attr('disabled', false)
					} else {
						$("#correct").hide();
						$("#fail").show();
						$("#submit").attr('disabled', true)
					}
				}
			});
		});
	
	
	// 비밀번호 일치 불일치 ajax , function chk() 보다 먼저 작성해야 함
		$(function() {
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("#pw_confirm").keyup(function() {
				var MB_pw = $("#pw").val();
				var MB_pw_confirm = $("#pw_confirm").val();
				if (MB_pw != "" || MB_pw_confirm != "") {
					if (MB_pw == MB_pw_confirm) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").attr('disabled', false)
					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr('disabled', true)
					}
				}
			});
		});
	
	// 비밀번호와 비밀번호 확인 체크   
		function chk() {
			if (frm.MB_pw.value != frm.MB_pw_confirm.value) {
				alert("암호와 암호 확인이 일치하지 않습니다.");
				boo.MB_pw.focus(); 
				boo.MB_pw.value=""; 
				return false; 
			}
		}
</script>
<style type="text/css">
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
	    border-bottom: 1px solid #000000;
	}
</style>
</head>
<body>
<div align="center">
	<h2 class="title">비밀번호 변경</h2>
	<form action="updatePwResult.do"  method="post" name="frm" onsubmit="return chk()">
	<input type="hidden" name="MB_id" value="${member.MB_id }">
	<table class="table narrowWidth1">  
			<tr>
				<td class="col md-2 text-center">현재 비밀번호</td>
				<td class="col md-10">
					<input type="password" name="MB_now_pw" id="now_pw" required="required" placeholder="현재 비밀번호" class="inputline1">
					<br>
					<div class="alert alert-success" id="correct">현재 비밀번호와 일치합니다.</div>
					<div class="alert alert-danger" id="fail">현재 비밀번호와 일치하지 않습니다.</div>
				</td>
			</tr>
			<tr>
				<td class="col md-2 text-center">변경 비밀번호</td>
				<td class="col md-10">
					<input type="password" name="MB_pw" id="pw" required="required" placeholder="변경 비밀번호 입력" class="inputline1">
				</td>
			</tr>  
			<tr>
				<td class="col md-2 text-center">변경 비밀번호 확인</td>
				<td class="col md-10">
					<input type="password" name="MB_pw_confirm" id="pw_confirm" placeholder="변경 비밀번호 확인" required="required" class="inputline1">
					<br>
					<div class="alert alert-success" id="alert-success">변경 비밀번호가 일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">변경 비밀번호가 일치하지 않습니다.</div>
				</td>
			</tr>
			<tr>  
				<td colspan="2" align="center">
					<input type="submit" id="submit" value="비밀번호 변경" class="btn_small" disabled="">
				</td>
			</tr>
	</table>
	</form>
</div>
</body>
</html>
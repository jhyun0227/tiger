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
.err {
	color: red;
	font-weight: bold;
}
</style>
<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
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
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="title">정보 수정</h2>
	<form action="updateResult.do" method="post" enctype="multipart/form-data" name="frm" onsubmit="return chk()">
		<input type="hidden" name="MB_id" value="${member.MB_id }">
		<table class="table table-bordered table-hover">
			<tr>
				<td>프로필 사진</td>
				<td>
					<img alt="" src="${path }/resources/memberImg/${member.MB_img }" width="100">
					<input type="file" name="file">${member.MB_img }
				</td>
			</tr>
			<tr>
				<td><label for="email">이메일</label></td>
				<td>${member.MB_id }</td>
			</tr>
			<tr>
				<td><label for="name">이름</label></td>
				<td><input type="text" name="MB_name" id="name" required="required" autofocus="autofocus" value="${member.MB_name }"></td>
			</tr>
			<tr>
				<td><label for="regNum">주민등록번호</label></td>
				<td>${member.MB_regNum }<span>―</span><span>*******</span></td>
			</tr>
			<tr>
				<td><label for="nickName">닉네임</label></td>
				<td>
					<input type="text" name="MB_nickName" id="nickName" required="required" value="${member.MB_nickName }">
					<input type="button" onclick="nickChk()" class="btn btn-info btn-sm" value="중복체크">
					<div id="nickChk" class="err"></div>
				</td>
			</tr>
			<tr>
				<td><label for="tel">연락처</label></td>
				<td><input type="tel" name="MB_tel" id="tel" required="required" title="전화번호 형식 3-4-4"
							pattern="\d{3}-\d{4}-\d{4}" placeholder="000-0000-0000" value="${member.MB_tel }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="정보 수정" class="btn btn-success">
					<input type="reset" value="다시 작성" class="btn btn-danger">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>
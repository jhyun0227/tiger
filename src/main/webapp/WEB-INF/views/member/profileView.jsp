<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${path }/resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${path }/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript"
	src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h2>프로필 조회</h2>
<table class="table table-bordered">


	<tr>
		<td><label for="nickName">닉네임</label></td>
		<td>
			<input type="text" name="MB_nickName" id="nickName" required="required" value="${member.MB_nickName }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td><label for="tel">연락처</label></td>
		<td><input type="tel" name="MB_tel" id="tel" required="required" value="${member.MB_tel }" readonly="readonly"></td>
	</tr>
	<c:if test="${member.MB_gender == '1' || member.MB_gender == '3'}">
		<tr>
			<td><label for="gender">성별</label></td>
			<td><input type="text" name="MB_gender" id="gender" required="required" value="남자" readonly="readonly"></td>
		</tr>	
	</c:if>
	<c:if test="${member.MB_gender == '2' || member.MB_gender == '4'}">
		<tr>
			<td><label for="gender">성별</label></td>
			<td><input type="text" name="MB_gender" id="gender" required="required" value="여자" readonly="readonly"></td>
		</tr>	
	</c:if>
	<tr>
		<td><label for="driver">드라이버 등록</label></td>
		<td><input type="text" name="MB_driverConfirm" id="driver" required="required" value="${member.MB_driverConfirm }" readonly="readonly"></td>
	</tr>
	<tr>
		<td><label for="regDate">가입일</label></td>
		<td><input type="text" name="MB_regDate" id="regDate" required="required" value="${member.MB_regDate }" readonly="readonly"></td>
	</tr>
</table>
</body>
</html>
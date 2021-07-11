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
<table class="table table-bordered">
	<tr align="center">
		<th>
			<a href="updateForm.do">회원정보 수정</a> |
			<a href="chkPw.do">비밀번호 변경</a> |
			<a href="driverApplyForm.do">드라이버 등록</a> |
			<a href="vehicleList.do">차량관리</a> |
			<a href="likeList.do">좋아요</a> |
		</th>
	</tr>
</table>
<table class="table table-bordered">
	<tr>
		<td><label for="email">이메일</label></td>
		<td>
			<input type="email" name="MB_id" id="email" required="required" value="${member.MB_id }" readonly="readonly">
		</td>
	</tr>
	<tr>
		<td><label for="name">이름</label></td>
		<td><input type="text" name="MB_name" id="name" required="required" value="${member.MB_name }" readonly="readonly"></td>
	</tr>
	<tr>
		<td><label for="regNum">주민등록번호</label></td>
		<td>
			<input type="text" name="MB_regNum" id="regNum" required="required" readonly="readonly" value="${member.MB_regNum }" style="width:11%;">
			<span>―</span>
			<span>*******</span>
		</td>
	</tr>
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
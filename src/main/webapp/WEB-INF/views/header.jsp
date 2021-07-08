<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initialscale=1">
<style>
	caption {
		font-size:30px;
	}
	.err {
		color:red; font-weight:bold;
	}
</style>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<%-- ${path }를 사용하면 패키지 내의 정보가 절대 경로로 변경됨 --%>
	<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="${path }/resources/bootstrap/js/jquery.js"></script>
	<script type="text/javascript" src="${path }/resources/bootstrap/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.header{
	position: relative;
	height: 100px;
	
}
.logo{
	height: 40px;
	margin-top: 30px;
}

.right{
    position: absolute;
    top: 50%; 
	right: 0;
	transform: translateY(-50%);

}

.right a{
	color: #000000;
	padding-left: 15px;
}

</style>
</head>
<body>
<div class="header">
	<span class="left">
		<img alt="" src="${path }/resources/main/logo.png" class="logo">
	</span>
	<span class="right">
		<a>회원가입</a>
		<a href="loginForm.do">로그인</a>
	</span>
</div>
</body>
</html>
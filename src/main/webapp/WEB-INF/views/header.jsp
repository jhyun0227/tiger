<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
		<img alt="" src="../resources/main/logo.png" class="logo">
	</span>
	<span class="right">
		<a>회원가입</a>
		<a>로그인</a>
	</span>
</div>
</body>
</html>
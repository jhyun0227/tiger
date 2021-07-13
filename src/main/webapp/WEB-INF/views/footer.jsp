<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${path }/resources/bootstrap/css/common.css">
</head>
<body>
<footer>
		<div class="footer_inner">
			<img alt="" src="${path}/resources/main/logo.png" class="footer_logo">
			<p>Copyright © 2021 All Rights Reserved</p>
		</div>
	</footer>
</body>
</html>
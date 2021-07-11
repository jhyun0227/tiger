<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.MB_id != 'admin' }">
		<a href="">타세요</a>
		<a href="">이용내역</a>
		<a href="">쪽지함</a>
		<a href="">마이페이지</a>
		<a href="">고객센터</a>
		<a href="noticeList.do">공지사항</a>
	</c:if>
	<c:if test="${sessionScope.MB_id == 'admin' }">
		<a href="">타세요 관리</a>
		<a href="adminMbList.do">회원관리</a>
		<a href="">드라이버 승인</a>
		<!-- 고객센터 및에 공지사항, 신고, 문의내역 -->
		<a href="">고객센터</a>
		<a href="noticeList.do">공지사항</a>
		
	</c:if>
</body>
</html>
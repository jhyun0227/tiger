<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/tiger/resources/bootstrap/css/style.css">
</head>
<body>
	<div id="dropMenu">
			<ul class="myMenu">
				<li class="menu1"><a href="#">타세요 관리</a></li>
				<li class="menu2"><a href="adminMbList.do">회원관리</a></li>
				<li class="menu3"><a href="adminPermitList.do">드라이버 승인</a></li>
				<li class="menu4"><a href="#">고객센터</a>
					<ul class="menu4_s submenu">
						<li><a href="adminNoticeList.do">공지사항</a></li>
						<li><a href="adminQnaList.do">문의내역</a></li>
						<li><a href="#">신고내역</a></li>
					</ul></li>
			</ul>
	</div>
</body>
</html>
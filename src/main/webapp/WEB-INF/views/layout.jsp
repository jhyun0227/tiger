<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="must.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타:이거</title>
</head>
<body>
	<div class="container">
		<div>
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		</div>
		<div>
		<tiles:insertAttribute name="menu"></tiles:insertAttribute>
		</div>
		<div>
		<tiles:insertAttribute name="body"></tiles:insertAttribute>		
		</div>
		<%-- <tiles:insertAttribute name="footer"></tiles:insertAttribute> --%>
	</div>
</body>
</html>
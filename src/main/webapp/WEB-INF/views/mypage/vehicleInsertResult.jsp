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
<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert("차량을 등록하였습니다.");
		location.href="vehicleList.do"
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("중복된 차량이 있습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>
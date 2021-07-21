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
		alert("더 좋은 서비스로 찾아뵙겠습니다.");
		location.href="main.do";
	</script>
</c:if>
<c:if test="${result != 1 }">
	<script type="text/javascript">
		alert("탈퇴가 실패하였습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>
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
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("좋은 서비스로 보답 하겠습니다");
		location.href="loginForm.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("다시 한번 시도해 주세요");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("아이디가 중복입니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>
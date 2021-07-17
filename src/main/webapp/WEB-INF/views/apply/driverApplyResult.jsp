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
	<c:if test="${resultAp == 1 && resultVh == 1 && resultMb == 1 }">
		<script type="text/javascript">
			alert("신청이 완료되었습니다. 심사결과는 마이페이지에서 확인하실 수 있습니다.");
			location.href="myMain.do";
		</script>
	</c:if>
	<c:if test="${resultAp != 1 || resultVh != 1 || resultMb != 1 }">
		<script type="text/javascript">
			alert("신청이 실패하였습니다.");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>
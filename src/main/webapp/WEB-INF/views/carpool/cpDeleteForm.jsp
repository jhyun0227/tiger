<!-- 회원 게시판일 경우에는 불필요한 화면 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.pwChk.value != frm.MB_pw.value) {
			alert("암호가 틀렸습니다");
			frm.pwChk.focus();
			frm.pwChk.value = "";
			return false;
		}
	}
</script>
</head>
<body>
<!-- 컨텐츠 시작  -->
<div class="searchDIV">
	<!-- 컨텐츠 헤더 부분(Page header) -->
	<h1 class="title">타세요 글 삭제</h1>
	<div align="center">
	<section class="content container-fluid">
		<div class="box box-danger">
			<form action="cpDeleteResult.do" name="frm" class="form-horizontal" method="post" onsubmit="return chk()">
				<input type="hidden" name="MB_pw" value="${member.MB_pw }">
				<input type="hidden" name="CP_num" value="${carpool.CP_num }">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<div class="form-group">
					<label>암호 확인</label>
					<div class="input-group">
						<input type="password" id="pwChk" name="pwChk" class="form-control" placeholder="암호 입력.." required="required" autofocus="autofocus" />
					</div>
					<div class="input-group">
						<input type="button" class="btn_sm_stroke" onclick="history.back()" value="취소">
						<input type="submit" class="btn_sm_full" value="확인">
					</div>
				</div>
			</form>	
		</div>
	</section>
	</div>	
</div>
</body>
</html>
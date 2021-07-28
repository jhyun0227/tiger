<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initialscale=1">
<script src="<c:url value="/"/>src/main/webapp/resources/bootstrap/js/adminlte.min.js"></script>
</head>
<body>
<!-- 컨텐츠 시작  -->
<div class="searchDIV">
	<!-- 컨텐츠 헤더 부분(Page header) -->
	<h1 class="title">신고하기</h1>
	<!-- 메인 컨텐츠 부분 -->
	
	<section class="content container-fluid">
		<div class="box box-danger">
			<form action="cpReportResult.do" class="form-horizontal" method="post">
				<%-- <input type="hidden" name="RP_num" value="${report.RP_num}" /> --%>
				<input type="hidden" name="CP_num" value="${report.CP_num}" />
				<input type="hidden" name="MB_num" value="${report.MB_num}" />
				<input type="hidden" name="MB_numR" value="${report.MB_numR}" />
				<div class="box-body">
					<div class="form-group" align="center">
						<div>
							<label class="radio-inline"> <input type="radio" name="RP_reason" value="1"> 광고성/홍보성 </label>
						</div>
						<div>	
							<label class="radio-inline"> <input type="radio" name="RP_reason" value="2"> 음란물/성적수치심 유발 </label>
						</div>
						<div>	
							<label class="radio-inline"> <input type="radio" name="RP_reason" value="3"> 욕설 및 비방 </label>
						</div>
						<div>	
							<label class="radio-inline"> <input type="radio" name="RP_reason" value="4"> 불법정보 유통 </label>
						</div>
						<div>	
							<label class="radio-inline"> <input type="radio" name="RP_reason" value="5"> 불쾌한 표현 </label>
						</div>
						<div>
							<label class="radio-inline"> <input type="radio" name="RP_reason" value="6"> 개인정보 노출 </label>
						</div>
					</div>
				</div>
				<div align="center">
					<input type="button" class="btn_sm_stroke" onclick="history.back()" value="취소">
					<input type="submit" class="btn_sm_full" value="신고">				
				</div>
			</form>
		</div>
	</section>
</div>
<!-- 컨텐츠 끝  -->
</body>
</html>
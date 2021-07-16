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
<div class="content-wrapper">
	<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1>
				<i class="fa fa-car" aria-hidden="true"></i>신고하기
			</h1>
		</section>
		<!-- 메인 컨텐츠 부분 -->
		<section class="content container-fluid">
			<div class="box box-danger">
				<form action="cpReportResult.do" class="form-horizontal" method="post">
					<input type="hidden" name="RP_num" value="${report.RP_num}" />
					<input type="hidden" name="CP_num" value="${CP_num}" />
					<div class="box-body">
						<div class="form-group">
							<div>
								<label class="radio-inline"> <input type="checkbox" name="RP_reason" value=" 광고성/홍보성"> 광고성/홍보성 </label>
							</div>
							<div>	
								<label class="radio-inline"> <input type="checkbox" name="RP_reason" value=" 음란물/성적수치심 유발"> 음란물/성적수치심 유발 </label>
							</div>
							<div>	
								<label class="radio-inline"> <input type="checkbox" name="RP_reason" value=" 욕설 및 비방"> 욕설 및 비방 </label>
							</div>
							<div>	
								<label class="radio-inline"> <input type="checkbox" name="RP_reason" value=" 불법정보 유통"> 불법정보 유통 </label>
							</div>
							<div>	
								<label class="radio-inline"> <input type="checkbox" name="RP_reason" value=" 불쾌한 표현"> 불쾌한 표현 </label>
							</div>
							<div>	
								<label class="radio-inline"> <input type="checkbox" name="RP_reason" value=" 개인정보 노출"> 개인정보 노출 </label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary pull-right" value="신고">
						<input class="btn btn-default pull-right" onclick="history.back()" value="취소">
					</div>
				</form>
			</div>
		</section>
	</div>
</div>
<!-- 컨텐츠 끝  -->
</body>
</html>
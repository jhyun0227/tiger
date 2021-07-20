<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initialscale=1">
<script src="<c:url value="/"/>src/main/webapp/resources/bootstrap/js/adminlte.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8b456750e8b8df57944ed224806efd0"></script>
<script>
	function find(){
		var url = "http://map.daum.net/"
		var start=document.getElementById('CP_startPoint').value
		var end=document.getElementById('CP_endPoint').value
		
		url=url+"?sName="+start
		url=url+"&eName="+end
		window.open(url,"실제경로검색");
	}
</script>
</head>
<body>
	<!-- 컨텐츠 시작  -->
	<div class="container">
		<form class="form-horizontal" method="post">
		<input type="text" name="CP_num" value="${carpool.CP_num}" />
		<input type="text" name="MB_num" value="${member.MB_num}" />
			<!-- 컨텐츠 헤더 부분(Page header) -->
			<section class="content-header">
				<h1>
					<i class="fa fa-car" aria-hidden="true"></i>타세요 상세보기
				</h1>
				<!-- 신고 버튼(해당 글 작성자는 안보임)-->
				<!--          로그인한 회원 정보 != 작성자 정보   -->
				<c:if test="${member.MB_num != carpool.MB_num}">
					<div align="right">
						<a href="cpReportForm.do?CP_num=${carpool.CP_num }&pageNum=${pageNum }" class="btn btn-danger">신고</a>
					</div>
				</c:if>
			</section>
			<!-- 메인 컨텐츠 부분 -->
			<section class="content container-fluid">
				<div class="box box-danger">
					<form class="form-horizontal" method="post">
						<div class="box-body">
							<div class="form-group">
								<label for="CP_startPoint" class="col-sm-2 control-label">출발지</label>
								<div class="col-sm-10">
									<div class="input-group">
										<input type="text" id="CP_startPoint" name="CP_startPoint" class="form-control" readonly="readonly" value="${carpool.CP_startPoint }" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="endPoint" class="col-sm-2 control-label">도착지</label>
								<div class="col-sm-10">
									<div class="input-group">
										<input type="text" id="CP_endPoint" name="CP_endPoint" class="form-control" readonly="readonly" value="${carpool.CP_endPoint }" />
									</div>
								</div>
							</div>
							<div class="form-group">
								<button class="btn btn-primary" style="margin-left: 200px" onclick="find()">실제 경로보기</button>
							</div>
							<div class="form-group">
								<label for="CP_startDate" class="col-sm-2 control-label">출발일</label>
								<div class="col-sm-4">
									<div class="input-group">
										<span class="input-group-addon">
										<span class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
										<input type="date" name="CP_startDate" class="form-control form_datetime" readonly="readonly" value="${carpool.CP_startDate }">
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="CP_startTime" class="col-sm-2 control-label">출발시간</label>
								<div class="col-sm-4">
									<div class="input-group">${carpool.CP_startTime }</div>
								</div>
							</div>
							<div class="form-group">
								<label for="CP_fee" class="col-sm-2 control-label">금액</label>
								<div class="col-sm-3">
									<div class="input-group">
										<input type="text" class="form-control" name="CP_fee" id="CP_fee" readonly="readonly" value="${carpool.CP_fee }">
										<span class="input-group-addon">원/인당</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="CP_duration" class="col-sm-2 control-label">소요시간</label>
								<div class="col-sm-3">
									<div class="input-group">
										<input type="text" class="form-control" name="CP_duration" id="CP_duration" readonly="readonly" value="${carpool.CP_duration }">
										<span class="input-group-addon">분</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="CP_passNum" class="col-sm-2 control-label">카풀 인원</label>
								<div class="col-sm-3">${carpool.CP_passNum } 명</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">성별제한</label>
								<div class="col-sm-10 mt-3">
									<div>${carpool.CP_gendertype }</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">참고사항</label>
								<div class="col-sm-10 mt-3">
									<div>${carpool.CP_option }</div>
								</div>
							</div>
						</div>

						<!-- 지도 표시 -->
						<!-- <div id="map" style="width: 90%; height: 400px; margin: 10px auto;"></div> -->

						<div class="form-group">
							<label for="CP_comment" class="col-sm-2 control-label">기타요구사항</label>
							<div class="col-sm-10">
								<textarea name="CP_comment" id="CP_comment" rows="5" class="form-control" readonly="readonly">${carpool.CP_comment }</textarea>
							</div>
						</div>
					</form>
				</div>
			</section>
		</form>
		
		<!-- 상세보기 신청현황 -->
		
		<!-- 탑승자일때 -->
		<c:if test="${member.MB_num != carpool.MB_num}">
			<section class="content-header text-center">
				<h1>신청 현황</h1>
			</section>
			<table class="table table-striped">
			<tr>
				<th>닉네임</th>
				<th>성별</th>
				<th>매칭여부</th>
			</tr>
			<c:if test="${empty reservationList }">
				<tr>
					<th colspan="3">신청한 탑승자가 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty reservationList }">
				<c:forEach var="reservation" items="${reservationList }">
					<tr>
						<td>회원 닉네임 들어갈 자리</td>
						<td>회원 성별 들어갈 자리</td>
						<c:if test="${reservation.RSV_confirm == 'Y' }">
							<c:if test="${reservation.RSV_mConfirm == 'Y' }">
								<td class="btn btn-success btn-sm">매칭완료</td>
							</c:if>
							<c:if test="${reservation.RSV_mConfirm == 'N' }">
								<td class="btn btn-info btn-sm">매칭대기</td>
							</c:if>
						</c:if>
						<c:if test="${reservation.RSV_confirm == 'N' }">
							<c:if test="${reservation.RSV_mConfirm == 'N' }">
								<td class="btn btn-danger btn-sm">매칭실패</td>
							</c:if>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			</table>
			<div class="form-group text-right">
				<a href="cpList.do?pageNum=${pageNum }" class="btn btn-info ">뒤로가기</a>
				<a href="cpRequestResult.do?CP_num=${carpool.CP_num}&MB_num=${member.MB_num}&pageNum=${pageNum}" class="btn btn-primary ">신청</a>
			</div>
		</c:if>
		
		<!-- 드라이버일때 -->
		<c:if test="${member.MB_num == carpool.MB_num}">
			<%-- <c:if test="${carpool.CP_num == reservation.CP_num}"> --%>
				<section class="content-header text-center">
					<h1>신청 현황</h1>
				</section>
				<table class="table table-striped">
				<tr>
					<th>닉네임</th>
					<th>성별</th>
					<th>매칭여부</th>
				</tr>
				<c:if test="${empty reservationList }">
					<tr>
						<th colspan="3">신청한 탑승자가 없습니다</th>
					</tr>
				</c:if>
				<c:if test="${not empty reservationList }">
					<c:forEach var="reservation" items="${reservationList }">
						<tr>
							<td>회원 닉네임 들어갈 자리</td>
							<td>회원 성별 들어갈 자리</td>
							<c:if test="${reservation.RSV_confirm == 'Y' }">
								<c:if test="${reservation.RSV_mConfirm == 'Y' }">
									<td class="btn btn-success btn-sm">매칭완료</td>
								</c:if>
								<c:if test="${reservation.RSV_mConfirm == 'N' }">
									<td class="btn btn-info btn-sm mr-1">수락</td> 
									<td class="btn btn-danger btn-sm">거절</td>
								</c:if>
							</c:if>
							<c:if test="${reservation.RSV_confirm == 'N' }">
								<c:if test="${reservation.RSV_mConfirm == 'N' }">
									<td class="btn btn-primary btn-sm">취소한매칭</td>
								</c:if>
							</c:if>	
						</tr>
					</c:forEach>
				</c:if>
				</table>
				<div class="form-group text-right">
					<a href="cpList.do?pageNum=${pageNum }" class="btn btn-success ">뒤로가기</a>
					<a href="cpDeleteForm.do?CP_num=${carpool.CP_num}&pageNum=${pageNum }" class="btn btn-danger">삭제</a>
					<a href="cpUpdateForm.do?CP_num=${carpool.CP_num}&pageNum=${pageNum }" class="btn btn-warning">수정</a>
				</div>
			</c:if>
		<%-- </c:if> --%>
	</div>	
</body>
</html>
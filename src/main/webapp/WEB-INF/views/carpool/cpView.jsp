<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initialscale=1">
</head>
<body>
	<h1 class="title">타세요 상세</h1>
	<!-- 컨텐츠 시작  -->
	<div class="searchDIV">
		<form class="form-horizontal" method="post">
		<input type="hidden" name="CP_num" value="${carpool.CP_num}" />
		<input type="hidden" name="MB_num" value="${member.MB_num}" />
			<!-- 컨텐츠 헤더 부분(Page header) -->
			<section class="content-header">
				<!-- 신고 버튼(해당 글 작성자는 안보임)-->
				<!--          로그인한 회원 정보 != 작성자 정보   -->
				<c:if test="${sessionScope.MB_num != carpool.MB_num && sessionScope.MB_id != 'admin' }">
					<div align="right">
						<a href="cpReportForm.do?CP_num=${carpool.CP_num }&MB_num=${carpool.MB_num }&MB_numR=${sessionScope.MB_num }&pageNum=${pageNum }" class="btn btn-danger">신고</a>
					</div>
				</c:if>
			</section>
			<!-- 메인 컨텐츠 부분 -->
			<section class="content container-fluid">
				<div class="box box-danger">
					<form class="form-horizontal" method="post">
						<div class="box-body">
							<div class="form-group">
								<label class="col-sm-2 control-label">작성자 닉네임</label>
								<div class="col-sm-10">
									<div class="input-group">
										<input type="text" class="form-control" readonly="readonly" value="${memberDB.MB_nickName}" />
									</div>
								</div>
							</div>
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
								<button class="btn_sm_full" style="margin-left: 200px" onclick="find()">실제 경로보기</button>
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
								<pre name="CP_comment" id="CP_comment" rows="5" class="form-control textBox" readonly="readonly">${carpool.CP_comment }</pre>
							</div>
						</div>
					</form>
				</div>
			</section>
		</form>
		
		<!-- 상세보기 신청현황 -->
		
		<!-- 탑승자일때 -->
		<div align="center">
			<c:if test="${member.MB_num != carpool.MB_num}">
				<h1 class="title">신청 현황</h1>
				<table class="table table-striped narrowWidth40">
				<tr>
					<th class="text-center">닉네임</th>
					<th class="text-center">성별</th>
					<th class="text-center">매칭여부</th>
				</tr>
				<c:if test="${empty reservationList }">
					<tr>
						<th colspan="3" class="text-center">신청한 탑승자가 없습니다</th>
					</tr>
				</c:if>
				<c:if test="${not empty reservationList }">
					<c:forEach var="reservation" items="${reservationList }">
						<tr>
							<td class="text-center">${reservation.MB_nickName }</td>
							<td class="text-center">
								<c:if test="${reservation.MB_gender == '1' }">남</c:if>
								<c:if test="${reservation.MB_gender == '2' }">여</c:if>
							</td>
							<c:if test="${reservation.RSV_confirm == 'Y' }">
								<c:if test="${reservation.RSV_mConfirm == 'Y' }">
									<td class="text-center">매칭완료</td>
								</c:if>
								<c:if test="${reservation.RSV_mConfirm == 'N' }">
									<td class="text-center">매칭대기</td>
								</c:if>
							</c:if>
							<c:if test="${reservation.RSV_confirm == 'N' }">
								<c:if test="${reservation.RSV_mConfirm == 'N' }">
									<td class="text-center">거절</td>
								</c:if>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
				</table>
				<div align="center">
					<!-- 신청가능 인원수 다 채우면 신청 못하게 막음 -->
					<c:if test="${carpool.CP_passNumNow < carpool.CP_passNum }">
						<a href="cpRequestResult.do?CP_num=${carpool.CP_num}&MB_num=${member.MB_num}&pageNum=${pageNum}" class="btn_sm_full">신청</a>
					</c:if>
				</div>
			</c:if>
		</div>
		
		<!-- 드라이버일때 -->
		<div align="center">
			<c:if test="${member.MB_num == carpool.MB_num}">
				<h1 class="title">신청 현황</h1>
				<table class="table table-striped narrowWidth40">
					<tr>
						<th class="text-center">닉네임</th>
						<th class="text-center">성별</th>
						<th class="text-center">매칭여부</th>
					</tr>
					<c:if test="${empty reservationList }">
						<tr>
							<th colspan="3" class="text-center">신청한 탑승자가 없습니다</th>
						</tr>
					</c:if>
					<c:if test="${not empty reservationList }">
						<c:forEach var="reservation" items="${reservationList }">
							<tr>
								<td class="text-center">${reservation.MB_nickName }</td>
								<td class="text-center">
									<c:if test="${reservation.MB_gender == '1' || reservation.MB_gender == '3' }">남</c:if>
									<c:if test="${reservation.MB_gender == '2' || reservation.MB_gender == '4' }">여</c:if>
								</td>
								<c:if test="${reservation.RSV_confirm == 'Y' }">
									<c:if test="${reservation.RSV_mConfirm == 'Y' }">
										<td class="text-center">매칭완료</td>
									</c:if>
									<c:if test="${reservation.RSV_mConfirm == 'N' }">
										<td class="text-center">
											<a href="cpAcceptResult.do?MB_num=${reservation.MB_num}&CP_num=${carpool.CP_num}&pageNum=${pageNum }" class="btn btn_sm_stroke">수락</a>
											<a href="cpDenialResult.do?MB_num=${reservation.MB_num}&CP_num=${carpool.CP_num}&pageNum=${pageNum }" class="btn btn_sm_stroke">거절</a>
										</td>
									</c:if>
								</c:if>
								<c:if test="${reservation.RSV_confirm == 'N' }">
									<c:if test="${reservation.RSV_mConfirm == 'N' }">
										<td class="text-center">거절한 매칭</td>
									</c:if>
								</c:if>	
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<!-- 삭제/수정버튼은 신청자가 한명도 없을때만 사용 가능 -->
				<c:if test="${empty reservationList }">
					<div align="center">
						<a href="cpDeleteForm.do?CP_num=${carpool.CP_num}&pageNum=${pageNum }" class="btn_sm_full">삭제</a>
						<a href="cpUpdateForm.do?CP_num=${carpool.CP_num}&pageNum=${pageNum }" class="btn_sm_full">수정</a>
					</div>
				</c:if>
			</c:if>
		</div>
	</div>	
</body>
</html>
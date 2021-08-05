<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initialscale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=AppKey"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/tmap_cpView.js"></script>
<!-- 타세요 only CSS-->
<link href="${path }/resources/bootstrap/css/carpool.css" rel="stylesheet" />
</head>
<body onload="initTmap();">
	<h1 class="title">타세요 상세</h1>
	<!-- 컨텐츠 시작  -->
		<input type="hidden" name="CP_num" value="${carpool.CP_num}">
		<input type="hidden" name="MB_num" value="${member.MB_num}">
				
		<table class="table">
			<tr>
				<th class="width">작성자</th>
				<td colspan="5">${memberDB.MB_nickName}</td>
			</tr>
			<tr>
				<th class="width">출발지</th>
				<td colspan="5">
					<input type="text" id="CP_startPoint" readonly="readonly" value="${carpool.CP_startPoint }" size="35" class="inputLine2">
				</td>
			</tr>
			<tr>
				<th class="width">도착지</th>
				<td colspan="5">
					<input type="text" id="CP_endPoint" readonly="readonly" value="${carpool.CP_endPoint }" size="35" class="inputLine2">
				</td>
			</tr>
			<!-- 지도 공간 -->
			<tr>
				<td colspan="6">
					<div id="map_div"></div>
					<!-- <p id="result_s"></p>
					<p id="result_e"></p> -->
					<p id="resultInfo"></p>
				</td>
			</tr>
			<tr>
				<th class="width">출발일</th>
				<td>${carpool.CP_startDate }</td>
				<th class="width">출발시간</th>
				<td>${carpool.CP_startTime }</td>
				<th class="width">카풀 인원</th>
				<td>${carpool.CP_passNum } 명</td>
			</tr>
			<tr>
				<th class="width">금액</th>
				<td>${carpool.CP_fee } 원 / 1인</td>
				<th class="width">소요시간</th>
				<td colspan="3">${carpool.CP_duration } 분</td>
			</tr>
			<tr>
				<th class="width">성별 제한</th>
				<td>${carpool.CP_gendertype }</td>
				<th class="width">참고사항</th>
				<td colspan="3">${carpool.CP_option }</td>
			</tr>
			<tr>
				<th class="width">기타 요구사항</th>
				<td colspan="5">
					<pre style="width:100%;" class="textBox">${carpool.CP_comment }</pre>
				</td>
			</tr>
		</table>
		
		<!-- 상세보기 신청현황 -->
		
		<!-- 탑승자일때 -->
		<div align="center">
			<c:if test="${member.MB_num != carpool.MB_num}">
				<h1 class="title">신청 현황</h1>
				<table class="table table-striped narrowWidth60">
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
									<td class="text-center">매칭거절</td>
								</c:if>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>
				</table>
				<div align="center">
					<!-- 신고 버튼(해당 글 작성자는 안보임)-->
					<!-- 로그인한 회원 정보 != 작성자 정보   -->
					<c:if test="${sessionScope.MB_num != carpool.MB_num && sessionScope.MB_id != 'admin' }">
						<a href="cpReportForm.do?CP_num=${carpool.CP_num }&MB_num=${carpool.MB_num }&MB_numR=${sessionScope.MB_num }
							&pageNum=${pageNum }" class="btn_sm_full2">신고</a>
					</c:if>
					<!-- 신청가능 인원수 다 채우면 신청 못하게 막음 -->
					<c:if test="${carpool.CP_passNumNow < carpool.CP_passNum }">
						<a href="cpRequestResult.do?CP_num=${carpool.CP_num}&MB_num=${member.MB_num}&pageNum=${pageNum}" class="btn_sm_full">신청</a>
					</c:if>
					<!-- 매칭완료전 매칭대기상태인 탑승자 신청취소 기능 -->
					<c:if test="${carpool.CP_passNumNow != carpool.CP_passNum }">
						<c:if test="${reservation2.RSV_confirm == 'Y' || reservation2.RSV_mConfirm == 'N'}">
							<a href="cpCancelRequestResult.do?CP_num=${carpool.CP_num}&MB_num=${member.MB_num}&pageNum=${pageNum}" class="btn_sm_full">신청취소</a>
						</c:if>
					</c:if>
				</div>
			</c:if>
		</div>
		
		<!-- 드라이버일때 -->
		<div align="center">
			<c:if test="${member.MB_num == carpool.MB_num}">
				<h1 class="title">신청 현황</h1>
				<table class="table table-striped narrowWidth60">
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
											<a href="cpAcceptResult.do?MB_num=${reservation.MB_num}&CP_num=${carpool.CP_num}&pageNum=${pageNum }" class="btn btn_sm_stroke2">수락</a>
											<a href="cpDenialResult.do?MB_num=${reservation.MB_num}&CP_num=${carpool.CP_num}&pageNum=${pageNum }" class="btn btn_sm_stroke3">거절</a>
										</td>
									</c:if>
								</c:if>
								<c:if test="${reservation.RSV_confirm == 'N' }">
									<c:if test="${reservation.RSV_mConfirm == 'N' }">
										<td class="text-center">매칭거절</td>
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
</body>
</html>
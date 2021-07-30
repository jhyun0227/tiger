<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="row">    
	<div class="col-md-6 CP_contents">
		<h3 class="title">카풀 상세내역</h3>
		<table  class="table">
			<tr>
				<th class="col md-2 text-center">작성자</th>
				<td class="col md-10">${member.MB_nickName }</td>
			</tr>
			<tr>
				<th class="col md-2 text-center">출발지</th>
				<td class="col md-10">${carpool.CP_startPoint }</td>
			</tr>
			<tr>
				<th class="col md-2 text-center">도착지</th>
				<td class="col md-10">${carpool.CP_endPoint }</td>
			</tr>
			<tr>
				<th class="col md-2 text-center">출발일</th>
				<td class="col md-10">${carpool.CP_startDate }</td>
			</tr>
			<tr>
				<th class="col md-2 text-center">출발시간</th>
				<td class="col md-10">${carpool.CP_startTime }</td>
			</tr>
			<tr>
				<th class="col md-2 text-center">금액</th>
				<td class="col md-10">${carpool.CP_fee } 원 / 인</td>
			</tr>
			<tr>
				<th class="col md-2 text-center">소요시간</th>
				<td class="col md-10">${carpool.CP_duration } 분</td>
			</tr>
			<tr>
				<th class="col md-2 text-center">인원</th>
				<td class="col md-10">${carpool.CP_passNum } 명</td>
			</tr>
			<tr>
				<th class="col md-2 text-center">성별 제한</th>
				<td class="col md-10">${carpool.CP_gendertype }</td>
			</tr>
			<tr>
				<th class="col md-2 text-center">참고사항</th>
				<td class="col md-10">${carpool.CP_option }</td>
			</tr>
			<tr>
				<th class="col md-2 text-center">기타 요구사항</th>
				<td class="col md-10">${carpool.CP_comment }</td>
			</tr>
		</table>
	</div>
				
	<div  class="col-md-6 CP_apply" >
		<h3 class="title">카풀 신청 현황</h3>
		<table class="table ">
			<tr>
				<th class="col md-3 text-center">번호</th>
				<th class="col md-3 text-center">신청자</th>
				<th class="col md-3 text-center">성별</th>					
				<th class="col md-3 text-center">매칭여부</th>
			</tr>
			<c:if test="${empty adminRvList }">
				<th colspan="4" class="text-center">신청한 탑승자가 없습니다</th>
			</c:if>
			<c:if test="${not empty adminRvList }">
				<c:forEach var="reservation" items="${adminRvList }">
					<tr>
						<td class="col-md-3 text-center">${num }<c:set var="num" value="${num -1 }"></c:set></td>
						<td class="col-md-3 text-center">${reservation.MB_nickName }</td>
						<td class="col-md-3 text-center">
							<c:if test="${reservation.MB_gender == 1 || reservation.MB_gender == 3 }">남자</c:if>
							<c:if test="${reservation.MB_gender == 2 || reservation.MB_gender == 4 }">여자</c:if>
						</td>
						<td class="col-md-3 text-center">
							<c:if test="${reservation.RSV_confirm == 'Y' }">
								<c:if test="${reservation.RSV_mConfirm == 'N' }">매칭대기</c:if>
								<c:if test="${reservation.RSV_mConfirm == 'Y' }">매칭완료</c:if>
							</c:if>
							<c:if test="${reservation.RSV_confirm == 'N' }">
								<c:if test="${reservation.RSV_mConfirm == 'N' }">거절</c:if>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</div>
<div align="right">
	<a href="adminCpList.do?pageNum=${pageNum }" class="btn_sm_stroke">목록</a>
	<c:if test="${memberDB.MB_id == 'admin' }">
		<a href="adminCpDelete.do?CP_num=${carpool.CP_num }&pageNum=${pageNum }" class="btn_sm_stroke">삭제</a>
	</c:if>
</div>
</body>
</html>
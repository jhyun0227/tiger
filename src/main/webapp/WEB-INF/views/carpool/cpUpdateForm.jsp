<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 현재시간 불러와서 타세요 글 작성시 지난 날짜 입력 방지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<fmt:formatDate value="${now}" pattern="HH:mm" var="todayTime" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initialscale=1">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxb7514833e4e14e1492e2da0675e6772f"></script>
<script type="text/javascript" src="${path }/resources/bootstrap/js/tmap_cpWriteForm.js"></script>
<script>
	// 출발일이 현재날짜보다 이전으로 설정 못하게 막는 자바스크립트
	function Chk() {
		if (cp.CP_startDate.value < cp.now_date.value) {
			alert("이미 지난 날짜입니다. 출발일을 다시 설정해주세요.");
			cp.CP_startDate.value="";
			cp.CP_startDate.focus();
			return false;
		} else {// 출발일이 오늘이면서 출발시간으로 현재시간보다 이전으로 설정 못하게 막기
			if (cp.CP_startDate.value == cp.now_date.value) {
				if (CP_startTime.value < cp.now_time.value) {
					alert("출발시간은 ${now_time}부터 등록가능합니다.");
					cp.CP_startTime.value="";
					cp.CP_startTime.focus();
					return false;
				}
			}
		}
	}
</script>
</head>
<body onload="initTmap();">
<!-- 컨텐츠 시작  -->
<h1 class="title">타세요 글 수정</h1>
	<form action="cpUpdateResult.do" class="form-horizontal" method="post" name="cp" role="form" onsubmit="return Chk()">
			<input type="hidden" name="CP_num" value="${carpool.CP_num}">
			<!-- 출발일 날짜 설정값-->
			<input type="hidden" name="now_date" value="${now_date}">
			<input type="hidden" name="now_time" value="${now_time}">
				<!-- 메인 컨텐츠 부분 -->
			<table class="table">
				<tr>
					<th>출발지</th>
					<td>
						<input type="text" id="CP_startPoint" name="CP_startPoint" value="${carpool.CP_startPoint }" readonly="readonly">	
						<input type="button" class="btn" id="selectSP" value="출발지 등록">
					</td>
				</tr>
				<tr>
					<th>도착지</th>
					<td>
						<input type="text" id="CP_endPoint" name="CP_endPoint" value="${carpool.CP_endPoint }" readonly="readonly">
						<input type="button" class="btn" id="selectEP" value="도착지 등록">
					</td>
				</tr>
				<tr>
				<td colspan="6">
					<div class="ft_area">
						<div class="ft_select_wrap">
							<div class="ft_select">
								<select id="selectLevel">
									<option value="0" selected="selected">교통최적+추천</option>
									<option value="1">교통최적+무료우선</option>
									<option value="2">교통최적+최소시간</option>
									<option value="3">교통최적+초보</option>
									<option value="4">교통최적+고속도로우선</option>
									<option value="10">최단거리+유/무료</option>
									<option value="12">이륜차도로우선</option>
									<option value="19">교통최적+어린이보호구역 회피</option>
								</select>
								<select id="year">
									<option value="N" selected="selected">교통정보 표출 옵션</option>
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
								<button id="btn_select">경로탐색</button>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<div id="map_div"></div>
					<p id="resultInfo"></p>
				</td>
			</tr>
			<tr>
				<th>출발일</th>
				<td>
					<input type="date" name="CP_startDate" value="${carpool.CP_startDate }">
				</td>
				<th>출발시간</th>
				<td>
					<input type="text" name="CP_startTime" id="CP_startTime" value="${carpool.CP_startTime }">
				</td>
				<th>카풀 인원</th>
				<td>
					<select name="CP_passNum" class="form-control">
						<c:forEach var="val" begin="1" end="7">
							<option value="${val}">${val} 명</option>
						</c:forEach>	<!-- 수정 필요 -->
					</select>
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="text" name="CP_fee" required="required" value="${carpool.CP_fee }" class="inputLine">원 /인당
				</td>
				<th>소요시간</th>
				<td colspan="2">
					<input type="number" name="CP_duration" id="CP_duration" readonly="readonly" value="${carpool.CP_duration }" class="inputLine">분
				</td>
			</tr>
			<tr>
				<th>성별제한</th>
				<td>
					<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype1" value=" 무관"> 무관 </label>
					<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype2" value=" 남자"> 남자 </label>
					<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype2" value=" 여자"> 여자 </label>
				</td>
				<th>참고사항</th>
				<td colspan="3">
					<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option1" value=" 애완동물 허용"> 애완동물 허용 </label>
					<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option2" value=" 조용한 카풀"> 조용한 카풀 </label>
					<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option3" value=" 음식물 섭취"> 음식물 섭취 </label>
					<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option4" value=" 마스크 착용" checked="checked"> 마스크 착용 </label>
				</td>
			</tr>
			<tr>
				<th>기타 요구사항</th>
				<td colspan="5">
					<textarea name="CP_comment" rows="5">${carpool.CP_comment }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="6" class="text-center">
					<div align="center">
						<a href="cpList.do?pageNum=${pageNum }" class="btn_sm_stroke">타세요 목록</a>
						<input type="submit" class="btn_sm_full" onclick="Chk()" value="수정완료">
					</div>
				</td>
			</tr>
			</table>
		</form>
</body>
</html>
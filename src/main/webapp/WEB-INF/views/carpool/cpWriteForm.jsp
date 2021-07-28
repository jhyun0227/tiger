<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 현재시간 불러와서 타세요 글 작성시 지난 날짜 입력 방지 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<fmt:formatDate value="${now}" pattern="HH:mm" var="todayTime" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initialscale=1">
<script src="<c:url value="/"/>src/main/webapp/resources/bootstrap/js/adminlte.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8b456750e8b8df57944ed224806efd0"></script>
<script>
	// 다음지도 사용한 실제경로 찾기
	function find(){
		var url = "http://map.daum.net/"
		var start=document.getElementById('CP_startPoint').value
		var end=document.getElementById('CP_endPoint').value
		
		url=url+"?sName="+start
		url=url+"&eName="+end
		window.open(url,"실제경로검색");
	}
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
<body>
<!-- 컨텐츠 시작  -->
<div class="searchDIV">
	<!-- 컨텐츠 헤더 부분(Page header) -->
	<h1 class="title">타세요 작성</h1>
	<!-- 메인 컨텐츠 부분 -->
	<form action="cpWriteResult.do" class="form-horizontal" method="post" name="cp" role="form" onsubmit="return Chk()">
		<!-- 로그인된 회원번호 -->
		<input type="hidden" name="MB_num" value="${member.MB_num}" />
		<!-- 출발일 날짜 설정값-->
		<input type="hidden" name="now_date" value="${now_date}" />
		<input type="hidden" name="now_time" value="${now_time}" />
		<div class="box-body">
			<div class="form-group">
				<label for="CP_startPoint" class="col-sm-2 control-label">출발지</label>
				<div class="col-sm-10">
					<div class="input-group">
						<input type="text" id="CP_startPoint" name="CP_startPoint" class="form-control" placeholder="출발지 입력.." required="required" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="endPoint" class="col-sm-2 control-label">도착지</label>
				<div class="col-sm-10">
					<div class="input-group">
						<input type="text" id="CP_endPoint" name="CP_endPoint" class="form-control" placeholder="도착지 입력.." required="required" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="CP_startDate" class="col-sm-2 control-label">출발일</label>
				<div class="col-sm-4" id="checkStartDate">
					<div class="input-group">
						<span class="input-group-addon">
						<span class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
						<input type="date" name="CP_startDate" id="startDate" class="form-control form_datetime" required="required">		
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="CP_startTime" class="col-sm-2 control-label">출발시간</label>
				<div class="col-sm-4">
					<div class="input-group">
						<input type="text" class="form-control" name="CP_startTime" id="CP_startTime" placeholder="18:00" required="required">
					</div>
				</div>
			</div>
			<div class="form-group">
				<button class="btn_sm_full" id="roadfind" style="margin-left: 200px" onclick="find()">실제 경로찾기</button>(검색 후 금액을 설정해보세요)
			</div>	
			<div class="form-group">
                		<label for="CP_fee" class="col-sm-2 control-label">금액</label>
			    <div class="col-sm-3">
			   		<div class="input-group">
                  			<input type="text" class="form-control" name="CP_fee" id="CP_fee" placeholder="금액입력.." required="required">
			    		<span class="input-group-addon">원/인당</span>
			    	</div>
                		</div>               
              	</div>
              	<div class="form-group">
                		<label for="CP_duration" class="col-sm-2 control-label">소요시간</label>
			    <div class="col-sm-3">
			   		<div class="input-group">
                  			<input type="text" class="form-control" name="CP_duration" id="CP_duration" placeholder="소요시간 입력... (10분 단위)" required="required">
			    		<span class="input-group-addon">분</span>
			    	</div>
                		</div>               
              	</div>
              	<div class="form-group">
                		<label for="CP_passNum" class="col-sm-2 control-label">카풀 인원</label>
			    <div class="col-sm-3">
			   		<select name="CP_passNum" class="form-control">
		                <c:forEach var="val" begin="1" end="7">
		                	<option value="${val}">${val} 명</option>
		                </c:forEach>
	                </select>
                		</div>               
              	</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">성별제한</label>
				<div class="col-sm-10">
					<div>
						<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype1" value=" 무관" checked="checked"> 무관 </label>
						<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype2" value=" 남자"> 남자 </label>
						<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype2" value=" 여자"> 여자 </label>
					</div>
				</div>
				<label class="col-sm-2 control-label">참고사항</label>
				<div>
					<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option1" value=" 애완동물 허용"> 애완동물 허용 </label>
					<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option2" value=" 조용한 카풀"> 조용한 카풀 </label>
					<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option3" value=" 음식물 섭취"> 음식물 섭취 </label>
					<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option4" value=" 마스크 착용" checked="checked"> 마스크 착용 </label>
				</div>
			</div>
		</div>
		
		<!-- 지도 표시 -->
		<!-- <div id="map" style="width: 90%; height: 400px; margin: 10px auto;"></div> -->
		
		<div class="form-group">
			<label for="CP_comment" class="col-sm-2 control-label">기타요구사항</label>
			<div class="col-sm-10">
				<textarea name="CP_comment" id="CP_comment" rows="5" class="form-control"></textarea>
			</div>
		</div>
		<div align="center">
			<button class="btn_sm_stroke" onclick="history.back()">취소</button>
			<input type="submit" class="btn_sm_full" value="등록하기" onclick="Chk()">
		</div>
	</form>
</div>
<!-- 컨텐츠 끝  -->
</body>
</html>
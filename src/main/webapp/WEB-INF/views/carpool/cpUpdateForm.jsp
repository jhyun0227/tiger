<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initialscale=1">

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
<body>
<!-- 컨텐츠 시작  -->
<h1 class="title">타세요 글 수정</h1>
	
		<form action="cpUpdateResult.do" class="form-horizontal" method="post" name="cp" role="form" onsubmit="return Chk()">
			<input type="hidden" name="CP_num" value="${carpool.CP_num}" />
			<!-- 출발일 날짜 설정값-->
			<input type="hidden" name="now_date" value="${now_date}" />
			<input type="hidden" name="now_time" value="${now_time}" />
				<!-- 메인 컨텐츠 부분 -->
				
								<label for="CP_startPoint" class="col-sm-2 control-label">출발지</label>
								<input type="text" id="CP_startPoint" name="CP_startPoint" class="form-control" value="${carpool.CP_startPoint }" />
								
							
								<label for="endPoint" class="col-sm-2 control-label">도착지</label>
								<input type="text" id="CP_endPoint" name="CP_endPoint" class="form-control" value="${carpool.CP_endPoint }" />
									
							
								<label for="CP_startDate" class="col-sm-2 control-label">출발일</label>
								<input type="date" name="CP_startDate" class="form-control form_datetime" value="${carpool.CP_startDate }">
									
							
								<label for="CP_startTime" class="col-sm-2 control-label">출발시간</label>
								<input type="text" class="form-control" name="CP_startTime" id="CP_startTime" placeholder="18:00" required="required" value="${carpool.CP_startTime }">
									
							
								<label for="CP_fee" class="col-sm-2 control-label">금액</label>
								<input type="text" class="form-control" name="CP_fee" id="CP_fee" value="${carpool.CP_fee }">
								<span class="input-group-addon">원/인당</span>
									
							
								<label for="CP_duration" class="col-sm-2 control-label">소요시간</label>
								<input type="text" class="form-control" name="CP_duration" id="CP_duration" value="${carpool.CP_duration }">
								<span class="input-group-addon">분</span>
							
							
								<label for="CP_passNum" class="col-sm-2 control-label">카풀 인원</label>
								<select name="CP_passNum" class="form-control">
						                <c:forEach var="val" begin="1" end="7">
						                	<option value="${val}">${val} 명</option>
						                </c:forEach>
					             </select>
	                  			
							
								<label class="col-sm-2 control-label">성별제한</label>
								<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype1" value=" 무관" checked="checked"> 무관 </label>
								<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype2" value=" 남자"> 남자 </label>
								<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype2" value=" 여자"> 여자 </label>
									
							
								<label class="col-sm-2 control-label">참고사항</label>
								<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option1" value=" 애완동물 허용"> 애완동물 허용 </label>
								<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option2" value=" 조용한 카풀"> 조용한 카풀 </label>
								<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option3" value=" 음식물 섭취"> 음식물 섭취 </label>
								<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option4" value=" 마스크 착용" checked="checked"> 마스크 착용 </label>
									
						
							<label for="CP_comment" class="col-sm-2 control-label">기타요구사항</label>
							<textarea name="CP_comment" id="CP_comment" rows="5" class="form-control">${carpool.CP_comment }</textarea>
							

						<div align="center">
							<a href="cpList.do?pageNum=${pageNum }" class="btn_sm_stroke">타세요 목록</a>
							<input type="submit" class="btn_sm_full" onclick="Chk()" value="수정완료">
						</div>
					
		</form>

</body>
</html>
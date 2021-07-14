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
<div class="content-wrapper">
	<div class="container">
		<!-- 컨텐츠 헤더 부분(Page header) -->
		<section class="content-header">
			<h1>
				<i class="fa fa-car" aria-hidden="true"></i>타세요 작성
			</h1>
		</section>
		<!-- 메인 컨텐츠 부분 -->
		<section class="content container-fluid">
			<div class="box box-danger">
				<form role="form" action="cpWriteResult.do" method="post" class="form-horizontal">
					<!-- 로그인된 회원번호 -->
					<input type="hidden" name="MB_num" value="${member.MB_num}" />
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
							<div class="col-sm-4">
								<div class="input-group">
									<span class="input-group-addon">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
									<input type="date" name="CP_startDate" class="form-control form_datetime" required="required">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="CP_startTime" class="col-sm-2 control-label">출발시간</label>
							<div class="col-sm-4">
								<div class="input-group">
									<select name="CP_startTime" id="CP_startTime">
										<option value="07:00" >07:00</option>
										<option value="07:15" >07:15</option>
										<option value="07:30" >07:30</option>
										<option value="07:45" >07:45</option>
										<option value="08:00" >08:00</option>
										<option value="08:15" >08:15</option>
										<option value="08:30" >08:30</option>
										<option value="08:45" >08:45</option>
										<option value="09:00" >09:00</option>
										<option value="18:00" >18:00</option>
										<option value="18:15" >18:15</option>
										<option value="18:30" >18:30</option>
										<option value="18:45" >18:45</option>
										<option value="19:00" >19:00</option>
										<option value="19:15" >19:15</option>
										<option value="19:30" >19:30</option>
										<option value="19:30" >19:45</option>
										<option value="20:00" >20:00</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<button class="btn btn-primary" id="roadfind" style="margin-left: 200px" onclick="find()">실제 경로찾기</button>   (검색 후 금액을 설정해보세요)
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
									<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype1" value="무관" checked="checked"> 무관 </label>
									<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype2" value="남자"> 남자 </label>
									<label class="radio-inline"><input type="radio" name="CP_gendertype" id="CP_gendertype2" value="여자"> 여자 </label>
								</div>
							</div>
							<label class="col-sm-2 control-label">참고사항</label>
							<div>
								<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option1" value="애완동물 허용"> 애완동물 허용 </label>
								<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option2" value="조용한 카풀"> 조용한 카풀 </label>
								<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option3" value="음식물 섭취"> 음식물 섭취 </label>
								<label class="radio-inline"> <input type="checkbox" name="CP_option" id="CP_option4" value="마스크 착용" checked="checked"> 마스크 착용 </label>
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
					<div class="form-group">
						<button type="submit" class="btn btn-primary pull-right">등록하기</button>
						<button class="btn btn-default pull-right" onclick="javascript:history.back()">취소</button>
					</div>
				</form>
			</div>
		</section>
	</div>
</div>
<!-- 컨텐츠 끝  -->
</body>
</html>
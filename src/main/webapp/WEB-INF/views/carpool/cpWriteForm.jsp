<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initialscale=1">
<script src="<c:url value='/'/>bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="<c:url value='/'/>bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8b456750e8b8df57944ed224806efd0"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value="/"/>src/main/webapp/resources/bootstrap/js/adminlte.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8b456750e8b8df57944ed224806efd0"></script>
<script>
	//  지도 표시 부분 -----------------------------------------------------------------------------------------
	var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	
	var mapOptions = { //지도를 생성할 때 필요한 기본 옵션
		center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 8 //지도의 레벨(확대, 축소 정도)
	};
	var map = new daum.maps.Map(mapContainer, mapOptions); //지도 생성 및 객체 리턴

	function setCenter(latitude, longitude) {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng( latitude, longitude);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}

	function panTo(latitude, longitude) {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng( latitude, longitude);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}        
	
	function displayMaker(target, latitude, longitude) {
		// 출발 마커
		var startSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
	    startSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
	    startOption = { 
	        offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
	    };
		
		// 출발 마커 이미지를 생성합니다
		var startImage = new daum.maps.MarkerImage(startSrc, startSize, startOption);
		
		// 도착 마커
		var arriveSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
		arriveSize = new daum.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
		arriveOption = { 
		    offset: new daum.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		};
		// 도착 마커 이미지를 생성합니다
		var arriveImage = new daum.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
		
		switch(target) {
		case 'start' :
			// 출발 마커가 표시될 위치입니다 
			var startPosition = new daum.maps.LatLng(latitude, longitude); 

			// 출발 마커를 생성합니다
			var startMarker = new daum.maps.Marker({
			    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
			    position: startPosition,
			    draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
			    image: startImage // 출발 마커이미지를 설정합니다
			});
			break
		case 'end' : 
			var arrivePosition = new daum.maps.LatLng(latitude, longitude);
			// 도착 마커를 생성합니다 
			var arriveMarker = new daum.maps.Marker({  
			    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
			    position: arrivePosition,
			    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
			    image: arriveImage // 도착 마커이미지를 설정합니다
			});
			break;
		}
		panTo(latitude, longitude);
	}
	
	
	// 우편번호 검색  ------------------------------------------------------------------------------------------
	function searchAddress(target) {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById(target + 'Point').value = fullAddr;
				
                // 주소를 좌표로 변환하여 필드에 넣는다.
                addrToLoc(fullAddr, target);
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById(target + 'Point').focus();
            }
        }).open();
	}
	
	function addrToLoc(address, target) {
		$.ajax({
			url: "https://dapi.kakao.com/v2/local/search/address.json",
			type: "GET",
			data: "query=" + address,
			dataType: "json",
			beforeSend: function(xhr) {
				xhr.setRequestHeader("Authorization", "KakaoAK f8b456750e8b8df57944ed224806efd0");
			},
			success: function(data) {
				// console.log(data.documents[0]);
				var longitude = data.documents[0].x;
				var latitude = data.documents[0].y;
				console.log(longitude, latitude);
				$("input[name="+target+ "Long]").val(longitude);
				$("input[name="+target+ "Lat]").val(latitude);
				displayMaker(target, latitude, longitude);
			}
		});
	}
	
	$(function(){
		$(".form_datetime").datetimepicker({
			language: 'ko',
			format: 'yyyy-mm-dd - P HH:ii',
			showMeridian: true,
		    autoclose: true,
		    todayBtn: true
		});
		
		$("form[role=form]").submit(function(e) {
			e.preventDefault();
			
			this.submit();
		});
	});
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
				<form role="form" action="regist" method="post" class="form-horizontal">
					<input type="hidden" name="mno" value="${login.mno}" />
					<input type="hidden" name="cptype" value="2" />
					<div class="box-body">
						<div class="form-group">
							<label for="CP_startPoint" class="col-sm-2 control-label">출발지</label>
							<div class="col-sm-10">
								<div class="input-group">
									<input type="text" id="CP_startPoint" name="CP_startPoint" class="form-control" placeholder="출발지 입력.." readonly="readonly" required="required" />
									<input type="hidden" name="startLong" value="0" />
									<input type="hidden" name="startLat" value="0" />
									<div class="input-group-btn">
										<button type="button" class="btn btn-info" title="주소로 검색" onclick="searchAddress('start');">
											<i class="fa fa-location-arrow" aria-hidden="true"></i>주소 검색
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="endPoint" class="col-sm-2 control-label">도착지</label>
							<div class="col-sm-10">
								<div class="input-group">
									<input type="text" id="endPoint" name="endPoint" class="form-control" placeholder="도착지 입력.." readonly="readonly" required="required" />
									<input type="hidden" name="endLong" value="0" />
									<input type="hidden" name="endLat" value="0" />
									<div class="input-group-btn">
										<button type="button" class="btn btn-info" title="주소로 검색" onclick="searchAddress('end');">
											<i class="fa fa-location-arrow" aria-hidden="true"></i>주소 검색
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="CP_startDate" class="col-sm-2 control-label">출발일</label>
							<div class="col-sm-4">
								<div class="input-group">
									<span class="input-group-addon">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span></span>
									<input type="date" name="CP_startDate" class="form-control form_datetime">
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
	                  		<label for="CP_fee" class="col-sm-2 control-label">금액</label>
						    <div class="col-sm-3">
						   		<div class="input-group">
	                    			<input type="text" class="form-control" name="CP_fee" id="CP_fee" placeholder="금액입력.." required="required">
						    		<span class="input-group-addon">원/인</span>
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
					<div id="map" style="width:100%;height:350px;"></div>
					<div class="form-group">
						<label for="CP_comment" class="col-sm-2 control-label">기타요구사항</label>
						<div class="col-sm-10">
							<textarea name="CP_comment" id="CP_comment" rows="3" class="form-control"></textarea>
						</div>
					</div>
					<div class="box-footer">
						<button type="submit" class="btn btn-primary pull-right">
							<i class="fa fa-check"></i> 등록하기
						</button>
						<button class="btn btn-default" onclick="javascript:history.back()">취소</button>
					</div>
				</form>
			</div>
		</section>
	</div>
</div>
<!-- 컨텐츠 끝  -->
<div id="map" style="width:100%;height:350px;"></div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initialscale=1"> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxb7514833e4e14e1492e2da0675e6772f"></script>
<script type="text/javascript">									
var map, marker_s, marker_e;
var marker1;

function initTmap() {

	// 1. 지도 띄우기
	map = new Tmapv2.Map("map_div", {
		center : new Tmapv2.LatLng(37.570028, 126.986072),
		width : "100%",
		height : "400px",
		zoom : 15,
		zoomControl : true,
		scrollwheel : true

	});
	// 마커 초기화
	marker_s = new Tmapv2.Marker(
		{
			icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
			iconSize : new Tmapv2.Size(24, 38),
			map : map
		});

	$("#selectSP").click(function() {
		// 2. API 사용요청
		var fullAddr = $("#CP_startPoint").val();
		$.ajax({
			method : "GET",
			url : "https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=json&callback=result",
			async : false,
			data : {
				"appKey" : "l7xxb7514833e4e14e1492e2da0675e6772f",
				"coordType" : "WGS84GEO",
				"fullAddr" : fullAddr
			},
			success : function(response) {

				var resultInfo = response.coordinateInfo; // .coordinate[0];
				console.log(resultInfo);
				// 기존 마커 삭제
				marker_s.setMap(null);
				
				// 3.마커 찍기
				// 검색 결과 정보가 없을 때 처리
				if (resultInfo.coordinate.length == 0) {
					$("#result").text(
					"요청 데이터가 올바르지 않습니다.");
				} else {
					var lon, lat;
					var resultCoordinate = resultInfo.coordinate[0];
					
					if (resultCoordinate.lon.length > 0) {
						// 구주소
						lon = resultCoordinate.lon;
						lat = resultCoordinate.lat;
					} else { 
						// 신주소
						lon = resultCoordinate.newLon;
						lat = resultCoordinate.newLat
					}
				
					var lonEntr, latEntr;
					
					if (resultCoordinate.lonEntr == undefined && resultCoordinate.newLonEntr == undefined) {
						lonEntr = 0;
						latEntr = 0;
					} else {
						if (resultCoordinate.lonEntr.length > 0) {
							lonEntr = resultCoordinate.lonEntr;
							latEntr = resultCoordinate.latEntr;
						} else {
							lonEntr = resultCoordinate.newLonEntr;
							latEntr = resultCoordinate.newLatEntr;
						}
					}
					var markerPosition = new Tmapv2.LatLng(Number(lat),Number(lon));
					
					// 마커 올리기
					marker_s = new Tmapv2.Marker(
						{
							position : markerPosition,
							icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_s.png",
							iconSize : new Tmapv2.Size(24, 38),
							map : map
						});
					map.setCenter(markerPosition);
					
					// 검색 결과 표출
					var matchFlag, newMatchFlag;
					// 검색 결과 주소를 담을 변수
					var address = '', newAddress = '';
					var city, gu_gun, eup_myun, legalDong, adminDong, ri, bunji;
					var buildingName, buildingDong, newRoadName, newBuildingIndex, newBuildingName, newBuildingDong;
					
					// 새주소일 때 검색 결과 표출
					// 새주소인 경우 matchFlag가 아닌
					// newMatchFlag가 응답값으로
					// 온다
					if (resultCoordinate.newMatchFlag.length > 0) {
						// 새(도로명) 주소 좌표 매칭
						// 구분 코드
						newMatchFlag = resultCoordinate.newMatchFlag;
						
						// 시/도 명칭
						if (resultCoordinate.city_do.length > 0) {
							city = resultCoordinate.city_do;
							newAddress += city + "\n";
						}
						
						// 군/구 명칭
						if (resultCoordinate.gu_gun.length > 0) {
							gu_gun = resultCoordinate.gu_gun;
							newAddress += gu_gun + "\n";
						}
						// 읍면동 명칭
						if (resultCoordinate.eup_myun.length > 0) {
							eup_myun = resultCoordinate.eup_myun;
							newAddress += eup_myun + "\n";
						} else {
							// 출력 좌표에 해당하는
							// 법정동 명칭
							if (resultCoordinate.legalDong.length > 0) {
								legalDong = resultCoordinate.legalDong;
								newAddress += legalDong + "\n";
							}
							// 출력 좌표에 해당하는
							// 행정동 명칭
							if (resultCoordinate.adminDong.length > 0) {
								adminDong = resultCoordinate.adminDong;
								newAddress += adminDong + "\n";
							}
						}
						// 출력 좌표에 해당하는 리 명칭
						if (resultCoordinate.ri.length > 0) {
							ri = resultCoordinate.ri;
							newAddress += ri + "\n";
						}
						// 출력 좌표에 해당하는 지번 명칭
						if (resultCoordinate.bunji.length > 0) {
							bunji = resultCoordinate.bunji;
							newAddress += bunji + "\n";
						}
						// 새(도로명)주소 매칭을 한
						// 경우, 길 이름을 반환
						if (resultCoordinate.newRoadName.length > 0) {
							newRoadName = resultCoordinate.newRoadName;
							newAddress += newRoadName + "\n";
						}
						// 새(도로명)주소 매칭을 한
						// 경우, 건물 번호를 반환
						if (resultCoordinate.newBuildingIndex.length > 0) {
							newBuildingIndex = resultCoordinate.newBuildingIndex;
							newAddress += newBuildingIndex + "\n";
						}
						// 새(도로명)주소 매칭을 한
						// 경우, 건물 이름를 반환
						if (resultCoordinate.newBuildingName.length > 0) {
							newBuildingName = resultCoordinate.newBuildingName;
							newAddress += newBuildingName + "\n";
						}
						// 새주소 건물을 매칭한 경우
						// 새주소 건물 동을 반환
						if (resultCoordinate.newBuildingDong.length > 0) {
							newBuildingDong = resultCoordinate.newBuildingDong;
							newAddress += newBuildingDong + "\n";
						}
						// 검색 결과 표출
						if (lonEntr > 0) {
							var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
							var text = "검색결과(새주소) : " + newAddress + ",\n 응답코드:" + newMatchFlag + "(상세 코드 내역은 " + docs + " 에서 확인)" + "</br> 위경도좌표(중심점) : " + lat + ", " + lon;
							$("#result").html(text);
						} else {
							var docs = "<a style='color:orange' href='#webservice/docs/fullTextGeocoding'>Docs</a>"
							var text = "검색결과(새주소) : " + newAddress + ",\n 응답코드:" + newMatchFlag + "(상세 코드 내역은 " + docs + " 에서 확인)";
							$("#result").html(text);
						}
					}
					// 구주소일 때 검색 결과 표출
					// 구주소인 경우 newMatchFlag가
					// 아닌 MatchFlag가 응닶값으로
					// 온다
					if (resultCoordinate.matchFlag.length > 0) {
						// 매칭 구분 코드
						matchFlag = resultCoordinate.matchFlag;
						
						// 시/도 명칭
						if (resultCoordinate.city_do.length > 0) {
							city = resultCoordinate.city_do;
							address += city + "\n";
						}
						// 군/구 명칭
						if (resultCoordinate.gu_gun.length > 0) {
							gu_gun = resultCoordinate.gu_gun;
							address += gu_gun+ "\n";
						}
						// 읍면동 명칭
						if (resultCoordinate.eup_myun.length > 0) {
							eup_myun = resultCoordinate.eup_myun;
							address += eup_myun + "\n";
						}
						// 출력 좌표에 해당하는 법정동
						// 명칭
						if (resultCoordinate.legalDong.length > 0) {
							legalDong = resultCoordinate.legalDong;
							address += legalDong + "\n";
						}
						// 출력 좌표에 해당하는 행정동
						// 명칭
						if (resultCoordinate.adminDong.length > 0) {
							adminDong = resultCoordinate.adminDong;
							address += adminDong + "\n";
						}
						// 출력 좌표에 해당하는 리 명칭
						if (resultCoordinate.ri.length > 0) {
							ri = resultCoordinate.ri;
							address += ri + "\n";
						}
						// 출력 좌표에 해당하는 지번 명칭
						if (resultCoordinate.bunji.length > 0) {
							bunji = resultCoordinate.bunji;
							address += bunji + "\n";
						}
						// 출력 좌표에 해당하는 건물 이름
						// 명칭
						if (resultCoordinate.buildingName.length > 0) {
							buildingName = resultCoordinate.buildingName;
							address += buildingName + "\n";
						}
						// 출력 좌표에 해당하는 건물 동을
						// 명칭
						if (resultCoordinate.buildingDong.length > 0) {
							buildingDong = resultCoordinate.buildingDong;
							address += buildingDong + "\n";
						}
						// 검색 결과 표출
						/* if (lonEntr > 0) {
							var text = "검색결과(지번주소) : "+ address+ ","+ "\n"+ "응답코드:"+ matchFlag +"</br>"+ "위경도좌표(중심점) : "+ lat+ ", "+ lon+ "</br>";
							$("#result").html(text);
						} else {
							var text = "검색결과(지번주소) : "+ address+ ","+ "\n"+ "응답코드:"+ matchFlag + "</br>";
							$("#result").html(text);
						} */
					}
				}
			},
			error : function(request, status, error) {
				console.log(request);
				console.log("code:"+request.status + "\n message:" + request.responseText +"\n error:" + error);
				// 에러가 발생하면 맵을 초기화함
				// markerStartLayer.clearMarkers();
				// 마커초기화
				map.setCenter(new Tmapv2.LatLng(37.570028, 126.986072));
				$("#result").html("");
			
			}
		});
	});
}

</script>
</head>
<body onload="initTmap();">
	<h1 class="title">타세요 상세</h1>
	<!-- 컨텐츠 시작  -->
		<input type="hidden" name="CP_num" value="${carpool.CP_num}">
		<input type="hidden" name="MB_num" value="${member.MB_num}">
				
		<table class="table">
			<tr>
				<th>작성자</th>
				<td>${memberDB.MB_nickName}</td>
			</tr>
			<tr>
				<th>출발지</th>
				<td>
					<input type="text" id="CP_startPoint" readonly="readonly" value="${carpool.CP_startPoint }">
					<button id="selectSP">출발지 적용</button>
				</td>
			</tr>
			<tr>
				<th>도착지</th>
				<td>
					<input type="text" id="CP_endPoint" readonly="readonly" value="${carpool.CP_endPoint }">
					<button id="selectEP">도착지 적용</button>
				</td>
			</tr>
			<!-- 지도 공간 -->
			<tr>
				<td colspan="3">
					<div id="map_div"></div>
					<p id="result"></p>
				</td>
			</tr>
			<tr>
				<th>출발일</th>
				<td>${carpool.CP_startDate }</td>
			</tr>
			<tr>
				<th>출발시간</th>
				<td>${carpool.CP_startTime }</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>${carpool.CP_fee } 원 / 1인</td>
			</tr>
			<tr>
				<th>소요시간</th>
				<td>${carpool.CP_duration } 분</td>
			</tr>
			<tr>
				<th>카풀 인원</th>
				<td>${carpool.CP_passNum } 명</td>
			</tr>
			<tr>
				<th>성별 제한</th>
				<td>${carpool.CP_gendertype }</td>
			</tr>
			<tr>
				<th>참고사항</th>
				<td>${carpool.CP_option }</td>
			</tr>
			<tr>
				<th>기타 요구사항</th>
				<td>
					<textarea rows="5" cols="100">${carpool.CP_comment }</textarea>
				</td>
			</tr>
		</table>
		
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
							&pageNum=${pageNum }" class="btn btn-danger">신고</a>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>simpleMap</title>
<script 
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xxb7514833e4e14e1492e2da0675e6772f"></script>
<script type="text/javascript">									
	// TData 객체 생성
	var tData_s = new Tmapv2.extension.TData();
	var tData_e = new Tmapv2.extension.TData();

	var map,marker;
	var start = "경기도 고양시 일산서구 덕이동 1521"
	var startAddress = start.split(" ");
	
	var end = "서울특별시 은평구 갈현동 397"
	var endAddress = end.split(" ");
	
	var markerPosition;
	
	var startLon;
	var startLat;
	
	// 페이지가 로딩이 된 후 호출하는 함수입니다.
	function initTmap(){
		
		// map 생성
		// Tmap.map을 이용하여, 지도가 들어갈 div, 넓이, 높이를 설정합니다.
		map = new Tmapv2.Map("map_div", {
			center : new Tmapv2.LatLng(37.566481622437934, 126.98502302169841), // 지도 초기 좌표
			width : "100%", // map의 width 설정
			height : "400px" // map의 height 설정	
		});
		
	};
	
	function loadGetAddressFromLonLat() {
		var optionObj = {
			coordType: "WGS84GEO"       //응답좌표 타입 옵션 설정 입니다.
		};

		var params = {
			onComplete:onComplete,      //데이터 로드가 성공적으로 완료 되었을때 실행하는 함수 입니다.
			onProgress:onProgress,      //데이터 로드 중에 실행하는 함수 입니다.
			onError:onError             //데이터 로드가 실패했을때 실행하는 함수 입니다.
		};
		
		console.log("length: "+startAddress.length);
		
		// TData 객체의 지오코딩 함수
		if (startAddress.length == 5) {
			tData_s.getGeoFromAddressJson(startAddress[0]+startAddress[1], startAddress[2], startAddress[3], startAddress[4], optionObj, params);
		} else {
			tData_s.getGeoFromAddressJson(startAddress[0], startAddress[1], startAddress[2], startAddress[3], optionObj, params);
		}
		
		if (endAddress.length == 5) {
			tData_e.getGeoFromAddressJson(endAddress[1], endAddress[2], endAddress[3], endAddress[4], optionObj, params);
		} else {
			tData_e.getGeoFromAddressJson(endAddress[0], endAddress[1], endAddress[2], endAddress[3], optionObj, params);
		}
 	 
		/* console.log(tData_s._responseData.coordinateInfo.lon);
		console.log(tData_e._responseData.coordinateInfo.lat); */
		console.log("err");
		startLon = tData_s._responseData.coordinateInfo.lon;
		startLat = tData_s._responseData.coordinateInfo.lat;
		
		console.log("2: "+startLon);
		console.log("3: "+startLat);
		
		var endLon = tData_e._responseData.coordinateInfo.lon;
		var endLat = tData_e._responseData.coordinateInfo.lat;
		console.log("4: "+endLon);
		console.log("5: "+endLat);
	}
	
	//지오코딩
	function onComplete() {
		console.log("1: "+this._responseData); //json으로 데이터를 받은 정보들을 콘솔창에서 확인할 수 있습니다.

		lon = this._responseData.coordinateInfo.lon;//json으로 데이터를 받은 정보에서 경도정보를 추출합니다.
		lat = this._responseData.coordinateInfo.lat;//json으로 데이터를 받은 정보에서 위도정보를 추출합니다.

 		var marker = new Tmapv2.Marker({
			position : new Tmapv2.LatLng(lat, lon)
		});

		marker.setMap(map);
		map.setCenter(new Tmapv2.LatLng(lat, lon));
	}
	
	//데이터 로드중 실행하는 함수입니다.
    function onProgress(){
        
    }
	
  	//데이터 로드 중 에러가 발생시 실행하는 함수입니다.
    function onError(){
        alert("onError");
    }
	
</script>
</head>
<body onload="initTmap()"><!-- 맵 생성 실행 -->
	<div id="map_div">
	</div>
	<button onClick="loadGetAddressFromLonLat()">지오코딩 실행</button>
</body>
</html>

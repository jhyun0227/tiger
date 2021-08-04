var map, marker_s, marker_e;
var marker1;
var drawInfoArr = [];
var drawInfoArr2 = [];

var chktraffic = [];
var resultdrawArr = [];
var resultMarkerArr = [];

function initTmap() {

    // 1. 지도 띄우기
    map = new Tmapv2.Map("map_div", {
        center: new Tmapv2.LatLng(37.570028, 126.986072),
        width: "100%",
        height: "400px",
        zoom: 15,
        zoomControl: true,
        scrollwheel: true

    });
    
    
}
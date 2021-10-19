<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@600&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <meta charset="UTF-8">
<title>MAU</title>
<link rel="icon" type="image/png" sizes="16x16"  href="${pageContext.request.contextPath}/image/logo/mauicon.png">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="theme-color" content="#ffffff">
  </head>
  <body>
  <div class="p-3 mb-2 text-info " style="float: none; margin:100 auto; background-color:  #FFFE83;" >
    <!-- Optional JavaScript; choose one of the two! -->
    <nav class="navbar navbar-light" style="background-color:  #FFFE83;">
        <div class="container-fluid">
          <a style="font-family: 'Rajdhani', sans-serif;" class="navbar-brand" href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/image/logo/mau.png" alt="mau" height="50px"></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
              <h5 style="font-family: 'Rajdhani', sans-serif;" class="offcanvas-title" id="offcanvasNavbarLabel">Me And U<BR>
            MAU</h5>
              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
              <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index">홈으로</a>
                </li>
                <li class="nav-item">
					<a class="nav-link" href="javascript:kakaoLogin();">로그인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">나의 가이드 관리</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">내 정보 변경</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">로그아웃</a>
                  </li>
                  <%-- <li class="nav-item">
                  <form action="guiderMap" method="post">
                  <input type="hidden" name="map_seq" value="1">
                     <a class="nav-link" href="${pageContext.request.contextPath}/guiderMap?mapSeq=1">가이드맵</a>
                    </form>
                  </li> --%>
              </ul>
            </div>
          </div>
        </div>
      </nav>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->

<div id="map" style="width:100%;height:950px; "></div>

<div class="custom_geolocation position-upper position-left"	onclick="geolocation()"> 
	<img src="../image/map/mylocation.png" alt="현재위치"  width="100">
</div>

<div class="map-footer search">
	<div class="wrapper shadow">
		<form method="post" >
		<div class="text">
			<input type="text" autocomplete="off" id="search" name="keyword" placeholder="여기에서 장소를 검색하고 등록해 보세요"></input>
			<button class="float-button "><img src="../image/map/search.png" alt="찾아보기"  height="50" width="50"></button>
		</div>
		</form>
	</div>
</div>

<!-- map start -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e31943b9bfc138a7aaae61fa825c403c"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


// 현재 위치 버튼을 누르면 현지 위치로 중심을 바꾸고 지도를 확대하는 함수입니다
function geolocation() {

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
	
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {
		
		var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도
		
		var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		
		// 마커를 표시합니다
		displayMarker(locPosition);

	});
	
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	
	alert('현재 위치를 알 수 없어요 😨')
		
}
}
//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: '<div>카카오</div>', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        content: '<div>생태연못</div>', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        content: '<div>텃밭</div>', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        content: '<div>근린공원</div>',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

 // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    var iwContent = '<div style="padding:5px;"><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">Hello World!</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        position : iwPosition, 
        content : iwContent 
    });
      
    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
    infowindow.open(map, marker); 

}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}
//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
// var zoomControl = new kakao.maps.ZoomControl();
// map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMLEFT);

// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다

var positions = new Array();

//마커 리스트에 마커가 없는 경우를 위한 처리
if([{"id": 3258, "place_info_url": "http://place.map.kakao.com/21236378", "place_id": "21236378", "place_name": "\ub69d\ubc30\uae30", "place_lat": {"__Decimal__": "37.63126084770540"}, "place_lng": {"__Decimal__": "127.02358660871700"}, "ask_id": 337, "ask_icon": "\ud83c\udf4e\ud83c\udf4b\ud83e\udd6c\ud83e\udd52", "ask_sentence": "\uc2dc\uc7a5 \ub9db\uc9d1", "user_id": 1000, "user_avatar": "\ud83d\udc68\u200d\ud83c\udf3e"}, {"id": 3316, "place_info_url": "http://place.map.kakao.com/809954421", "place_id": "809954421", "place_name": "\uc0bc\ubbf8\uc2dd\ub2f9", "place_lat": {"__Decimal__": "37.53785361632620"}, "place_lng": {"__Decimal__": "127.05462725533300"}, "ask_id": 337, "ask_icon": "\ud83c\udf4e\ud83c\udf4b\ud83e\udd6c\ud83e\udd52", "ask_sentence": "\uc2dc\uc7a5 \ub9db\uc9d1", "user_id": 141, "user_avatar": "\ud83e\udd2b"}, {"id": 3570, "place_info_url": "http://place.map.kakao.com/23007647", "place_id": "23007647", "place_name": "\ub9dd\uc6d0\ub3d9\ud560\uba38\ub2c8\ube48\ub300\ub5a1", "place_lat": {"__Decimal__": "37.58431940415110"}, "place_lng": {"__Decimal__": "126.91947098120200"}, "ask_id": 337, "ask_icon": "\ud83c\udf4e\ud83c\udf4b\ud83e\udd6c\ud83e\udd52", "ask_sentence": "\uc2dc\uc7a5 \ub9db\uc9d1", "user_id": 1102, "user_avatar": "\ud83e\udd2a"}, {"id": 3860, "place_info_url": "http://place.map.kakao.com/2143093783", "place_id": "2143093783", "place_name": "\uace0\ud5a5\uc9d1", "place_lat": {"__Decimal__": "37.55652300416200"}, "place_lng": {"__Decimal__": "126.90630923067900"}, "ask_id": 337, "ask_icon": "\ud83c\udf4e\ud83c\udf4b\ud83e\udd6c\ud83e\udd52", "ask_sentence": "\uc2dc\uc7a5 \ub9db\uc9d1", "user_id": 1083, "user_avatar": "\ud83d\udc69\u200d\ud83d\ude80"}, {"id": 4337, "place_info_url": "http://place.map.kakao.com/7952092", "place_id": "7952092", "place_name": "\uc18c\ubb38\ub09c\uacf1\ucc3d", "place_lat": {"__Decimal__": "37.49758999233081"}, "place_lng": {"__Decimal__": "127.15061465724575"}, "ask_id": 337, "ask_icon": "\ud83c\udf4e\ud83c\udf4b\ud83e\udd6c\ud83e\udd52", "ask_sentence": "\uc2dc\uc7a5 \ub9db\uc9d1", "user_id": 1697, "user_avatar": "\ud83d\udc7b"}].length > 0){
	var ask_markers = [{"id": 3258, "place_info_url": "http://place.map.kakao.com/21236378", "place_id": "21236378", "place_name": "\ub69d\ubc30\uae30", "place_lat": {"__Decimal__": "37.63126084770540"}, "place_lng": {"__Decimal__": "127.02358660871700"}, "ask_id": 337, "ask_icon": "\ud83c\udf4e\ud83c\udf4b\ud83e\udd6c\ud83e\udd52", "ask_sentence": "\uc2dc\uc7a5 \ub9db\uc9d1", "user_id": 1000, "user_avatar": "\ud83d\udc68\u200d\ud83c\udf3e"}, {"id": 3316, "place_info_url": "http://place.map.kakao.com/809954421", "place_id": "809954421", "place_name": "\uc0bc\ubbf8\uc2dd\ub2f9", "place_lat": {"__Decimal__": "37.53785361632620"}, "place_lng": {"__Decimal__": "127.05462725533300"}, "ask_id": 337, "ask_icon": "\ud83c\udf4e\ud83c\udf4b\ud83e\udd6c\ud83e\udd52", "ask_sentence": "\uc2dc\uc7a5 \ub9db\uc9d1", "user_id": 141, "user_avatar": "\ud83e\udd2b"}, {"id": 3570, "place_info_url": "http://place.map.kakao.com/23007647", "place_id": "23007647", "place_name": "\ub9dd\uc6d0\ub3d9\ud560\uba38\ub2c8\ube48\ub300\ub5a1", "place_lat": {"__Decimal__": "37.58431940415110"}, "place_lng": {"__Decimal__": "126.91947098120200"}, "ask_id": 337, "ask_icon": "\ud83c\udf4e\ud83c\udf4b\ud83e\udd6c\ud83e\udd52", "ask_sentence": "\uc2dc\uc7a5 \ub9db\uc9d1", "user_id": 1102, "user_avatar": "\ud83e\udd2a"}, {"id": 3860, "place_info_url": "http://place.map.kakao.com/2143093783", "place_id": "2143093783", "place_name": "\uace0\ud5a5\uc9d1", "place_lat": {"__Decimal__": "37.55652300416200"}, "place_lng": {"__Decimal__": "126.90630923067900"}, "ask_id": 337, "ask_icon": "\ud83c\udf4e\ud83c\udf4b\ud83e\udd6c\ud83e\udd52", "ask_sentence": "\uc2dc\uc7a5 \ub9db\uc9d1", "user_id": 1083, "user_avatar": "\ud83d\udc69\u200d\ud83d\ude80"}, {"id": 4337, "place_info_url": "http://place.map.kakao.com/7952092", "place_id": "7952092", "place_name": "\uc18c\ubb38\ub09c\uacf1\ucc3d", "place_lat": {"__Decimal__": "37.49758999233081"}, "place_lng": {"__Decimal__": "127.15061465724575"}, "ask_id": 337, "ask_icon": "\ud83c\udf4e\ud83c\udf4b\ud83e\udd6c\ud83e\udd52", "ask_sentence": "\uc2dc\uc7a5 \ub9db\uc9d1", "user_id": 1697, "user_avatar": "\ud83d\udc7b"}];
}

// 중복제거
ask_markers = _.uniqBy(ask_markers, 'place_id');

for (marker of ask_markers) {
    var ask_marker =
		{
				content_prev:  '<div class="marker_overlay shadow">'+
									'<div class="place_name text-',
				content_primary: 'primary',
				content_sub: 'sub',
				content_next:'"><a href=\'javascript:void(0);\' onclick="restore_modal('+marker.id+');">'+marker.place_name+'</a></div>'+
				'<div class="avatar"><a href="/curation/curator/'+marker.user_id+'">'+marker.user_avatar+'</a></div>'+
				'</div>',
				latlng: new kakao.maps.LatLng(marker.place_lat['__Decimal__'],marker.place_lng['__Decimal__']),
				user_id: marker.user_id
		};

    positions.push(ask_marker);
  }


var marker_img,
		imageSrc = '../../static/img/icon-marker-blue.svg', // 마커이미지의 주소입니다
    imageSrc_red = '../../static/img/icon-marker-red.svg',
		imageSize = new kakao.maps.Size(26, 40), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(13, 40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

for (var i = 0; i < positions.length; i ++) {

		var content = positions[i].content_prev+positions[i].content_primary+positions[i].content_next;
		var position = positions[i].latlng;


    
			// 로그인 안한 상태
			marker_img = imageSrc
    


		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(marker_img, imageSize, imageOption),
		    markerPosition = positions[i].latlng; // 마커가 표시될 위치입니다


		var marker = new kakao.maps.Marker({
				map: map, // 마커를 표시할 지도
				position: markerPosition, // 마커의 위치,
			  image: markerImage // 마커이미지 설정
		});


		// 커스텀 오버레이를 생성합니다
		var customOverlay = new kakao.maps.CustomOverlay({
		    position: position,
		    content: content,
		    xAnchor: 0.5,
		    yAnchor: 2.1
		});

		customOverlay.setMap(map, marker);

}

//마커의 분포에 따라 지도의 크기를 재정의 합니다.
var points = new Array();

for (marker of ask_markers) {
    var ask_marker = new kakao.maps.LatLng(marker.place_lat['__Decimal__'],marker.place_lng['__Decimal__']);
	points.push(ask_marker);
  }

var bounds = new kakao.maps.LatLngBounds();

var i, marker;
for (i = 0; i < points.length; i++) {
	 marker =     new kakao.maps.Marker({ position : points[i] });
	 bounds.extend(points[i]);
}
map.setBounds(bounds);




// 현재 위치 버튼을 누르면 현지 위치로 중심을 바꾸고 지도를 확대하는 함수입니다
function geolocation() {

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
	
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {
		
		var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도
		
		var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		
		// 마커를 표시합니다
		displayMarker(locPosition);

	});
	
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	
	alert('현재 위치를 알 수 없어요 😨')
		
}
}

//지도에 현재 위치 마커를 표시하고 지도를 확대하는 함수입니다
function displayMarker(locPosition) {

var locimageSrc = '../../static/img/icon-mylocation.svg', // 마커이미지의 주소입니다    
locimageSize = new kakao.maps.Size(16, 16), // 마커이미지의 크기입니다
locimageOption = {offset: new kakao.maps.Point(8, 8)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var locmarkerImage = new kakao.maps.MarkerImage(locimageSrc, locimageSize, locimageOption);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({  
	map: map, 
	position: locPosition,
	image: locmarkerImage // 마커이미지 설정 
}); 

// 지도 중심좌표를 접속위치로 변경하고 맵 크기를 조정합니다
map.setCenter(locPosition);   
map.setLevel(5);   
}   
</script>
</body>
</html>
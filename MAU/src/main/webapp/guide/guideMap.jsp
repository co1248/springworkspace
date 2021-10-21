<%@page import="com.spring.mau.mapview.MapViewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<MapViewVO> placeList = (List<MapViewVO>)request.getAttribute("placeList");
%>
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
	
    <title>MAU</title>
    <link rel="icon" type="image/png" sizes="16x16"  href="${pageContext.request.contextPath}/image/logo/mauicon.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
  </head>
  <body>
    

    <!-- Optional JavaScript; choose one of the two! -->
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
                  <a class="nav-link active" aria-current="page" href="index">홈으로</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">로그인</a>
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
                  <li class="nav-item">
                    <a class="nav-link" href="guiderMap">가이드맵</a>
                  </li>
                  <%for(int i = 0; i<placeList.size(); i++){%>
                  <li class="nav-item">
                    <a><%=placeList.get(i).getPlaceSeq() %></a>
                  </li>
                  <%} %>
                  <%for(int i = 0; i<placeList.size(); i++){%>
                  <li class="nav-item">
                    <a><%=placeList.get(i).getPlaceNorthEast() %></a>
                  </li>
                  <%} %>
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
<!-- map start -->
    <div id="map" style="width:100%;height:950px; "></div>
<!-- 지도즐겨찾기 -->
<div class=""onclick="#"> 
	<img id="mapbutton" src="../image/map/blue_web-pict-35.png" alt="지도즐겨찾기" height="50px">
</div>
<!-- 내위치 -->
<div class="" onclick="geolocation()"> 
	<img id="mapbutton" src="../image/map/blue_web-pict-48.png" alt="현재위치" height="50px">
</div>
<!-- 지도공유 -->
<div class="map-footer search">
	<div class="wrapper shadow">
		<div class="text">
			<div id="share-place-btn" class="share-btn shadow link" onclick="trackOutboundLink('place_page','share','share-link');">
			    <img id="mapbutton" src="../image/map/blue_web-pict-10.png" alt="지도공유" height="50px">
			</div>
		</div>
	</div>
</div>
<!-- 장소 검색창(키워드) -->
<div class="map-footer search">
	<div class="wrapper shadow">
		<form method="post" action="${pageContext.request.contextPath}/guideMap/search/${mapSeq}">
		<div class="text">
			<input type="text" autocomplete="off" id="search" name="keyword" placeholder="여기에서 장소를 검색하고 등록해 보세요"></input>
			<button class="float-button"  id="mapbutton"><img id="mapbutton" src="../image/map/blue_web-pict-21.png" alt="장소찾기" height="50px"></button>
		</div>
		</form>
	</div>
</div>

</div>
<%for(int i = 0; i< placeList.size();i++){%>
<input type="hidden" name ="placeName" value ="<%=placeList.get(i).getPlaceName().toString() %>"><%=placeList.get(i).getPlaceName() %></input>
<input type="hidden" name ="SouthWest" value ="<%=placeList.get(i).getPlaceSouthWest() %>">
<input type="hidden" name ="NorthEast" value ="<%=placeList.get(i).getPlaceNorthEast() %>">
<input type="hidden" name ="time" value ="time">
<%} %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e31943b9bfc138a7aaae61fa825c403c"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.51822, 126.90471), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var cnt =$("input[name=SouthWest]").length;
var south = new Array(cnt);
var east = new Array(cnt);
var name; //= $("input[name=placeName]");//new Array(cnt);
/* name[2]=$("input[name=placeName]").val();
console.log(name[2]); */

var positions=[];

for(var i=0;i<cnt;i++){
	south[i]=$("input[name=SouthWest]").eq(i).val();
	east[i]=$("input[name=NorthEast]").eq(i).val();
	name=($("input[name=placeName]").eq(i).val());
	console.log(east[i]);
	console.log(name);
	positions.push({
		content:'<div>'+name+'</div>',
		latlng: new kakao.maps.LatLng(south[i],east[i])
	});
	
	
	
}

console.log(positions);
for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
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
kakao.maps.event.addListener(marker, 'click', function() {
    // 마커 위에 인포윈도우를 표시합니다 
   window.open("${pageContext.request.contextPath}/detail",'popup','width=300px,height=300px');
});

//마커들의 위치로 지도의 크기를 재정의 합니다.	
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

// 지도에 현재 위치 마커를 표시하고 지도를 확대하는 함수입니다
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

/* 아래와 같이도 할 수 있습니다 */
/*
for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });

    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    (function(marker, infowindow) {
        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            infowindow.open(map, marker);
        });

        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
        kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });
    })(marker, infowindow);
}
*/
</script>
  </body>
</html>
<%@page import="com.spring.mau.place.PlaceVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    List<PlaceVO> herePlaceList = (List<PlaceVO>)request.getAttribute("herePlaceList");
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

    <meta charset="UTF-8">
    <style type="text/css">
    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
/* .map_leftb {position:absolute;bottom:0;left:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;z-index: 1;font-size:12px;border-radius: 10px;} */
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
input[type="checkbox"]+label {
    display: block;
    width: 50px;
    height: 50px;
    background: url(${pageContext.request.contextPath}/image/favoriteCheck/heart_off.png) no-repeat 0 0px / contain;
}

input[type='checkbox']:checked+label {
    background: url(${pageContext.request.contextPath}/image/favoriteCheck/heart_on.png) no-repeat 0 0px / contain;
}

input[type="checkbox"] {
    display: none;
}
.card div{
background: #FEFFED;
border-radius: 20px;
}
.card:hover div{
background: #3384C6;

}
.modal {width: 50%; height: 50%; display: none; background-color: rgba(0, 0,0,0.4); }

</style>
<title>MAU</title>
    <link rel="icon" type="image/png" sizes="16x16"  href="${pageContext.request.contextPath}/image/logo/mauicon.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
  </head>
  <body>
   <div class="p-3 mb-2 " style="float: none; margin:100 auto; color: #3384C6; background-color:  #FEFFED;" >
    <!-- Optional JavaScript; choose one of the two! -->
    <nav class="navbar navbar-light" color: #3384C6; style="background-color:  #FEFFED;">
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
            <c:choose>
      <c:when test="${empty sessionScope.loginUser}">   
            <div class="offcanvas-body">
              <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index">홈으로</a>
                </li>
                <li class="nav-item">
               <a class="nav-link" href="javascript:kakaoLogin();">로그인</a>
              </ul>
            </div>
      </c:when>
      <c:otherwise>
         <div class="offcanvas-body">
              <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index">홈으로</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="#">${sessionScope.loginUser.userNickName}(No.${sessionScope.loginUser.userSeqId})님 환영합니다.</a>
                  </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/mypage">나의 가이드 관리</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/updateform?userSeqId=${sessionScope.loginUser.userSeqId}">내 정보 변경</a>
                  </li>
                   <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
                  </li>
              </ul>
            </div>
      </c:otherwise>
   </c:choose>
          </div>
        </div>
      </nav>

  	<div class="modal" style="width: 60%; height: 950px; margin: 0 auto;">
  	<div id = "detail"></div>
</div>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
    <div class="map_wrap">
    <div id="map" style="width:100%;height:950px;position:relative;overflow:hidden;"></div>

<!-- 지도이름 -->
<div>
<button class="btn btn-primary"  style="border-radius:20px; font-size : 15px; border-style: none; color: black;background-color: #F3B922; width: 70%; height:60px; margin-top: 10px;"  type="button" onclick="location.href='/mau/here?lat=37.566826&lng=126.9786567&retry=true'">지도에서 장소 찾기</button><br><br>
</div>
<!-- 중간표시 -->
<div class="container full-height">
	<div id="map" style="width:100%;height:100%;">
		<div class="center">
			<img src="./image/map/centermap.png">
		</div>
	</div>
</div>
<!-- 내위치 -->
<div class="map_leftb">
	<div class="" onclick="geolocation()"> 
		<img id="mapbutton" src="./image/map/mylocation.png" alt="현재위치" height="50px">
	</div><br><p id="result"></p>
<!-- 여기에서 다시 장소 찾기 -->
<div class="here-map re-search-btn">
	<div class="wrapper shadow">
		<div class="text">여기에서 다시 장소 찾기</div>
	</div>
</div>
	
    <div id="menu_wrap" >


   <%for(int i=0; i<herePlaceList.size();i++){ %>
<div class="card text-dark bg-warning mb-3 card" style="max-width: 18rem; height: 80px; font-size: 1.2em; cursor: pointer; " onclick="location.href='${pageContext.request.contextPath}/detailInfo/'+<%=herePlaceList.get(i).getPlaceSeq()%>">
  <div class="card-header"><%=herePlaceList.get(i).getPlaceName() %></div>
  <div class="card-body">
    <h5 class="card-title"><%=herePlaceList.get(i).getPlaceAddr() %></h5>
  </div>
</div>
<%} %>
    </div>
</div>
    
</div>
<%for(int i = 0; i< herePlaceList.size();i++){%>
<input type="hidden" name ="placeName" value ="<%=herePlaceList.get(i).getPlaceName().toString() %>">
<input type="hidden" name ="SouthWest" value ="<%=herePlaceList.get(i).getPlaceSouthWest() %>">
<input type="hidden" name ="NorthEast" value ="<%=herePlaceList.get(i).getPlaceNorthEast() %>">
<input type="hidden" name ="seq" value ="<%=herePlaceList.get(i).getPlaceSeq() %>">

<%} %>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e31943b9bfc138a7aaae61fa825c403c"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>


var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.51822, 126.90471), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var cnt =$("input[name=SouthWest]").length;
var south = new Array(cnt);
var east = new Array(cnt);
var name;
var seq=[];
var positions=[];
var points=[];
for(var i=0;i<cnt;i++){
	south[i]=$("input[name=SouthWest]").eq(i).val();//좌표 배열 만들기
	east[i]=$("input[name=NorthEast]").eq(i).val();//좌표 배열 만들기
	name=($("input[name=placeName]").eq(i).val());//가게 이름들 저장
	seq=($("input[name=seq]").eq(i).val());//각 마커에 placeSeq 저장
	positions.push({//포지션 배열에 push로 key,value값 전달
		seq: seq,
		content:'<div>'+name+'</div>',
		latlng: new kakao.maps.LatLng(south[i],east[i])
	});
	points.push(positions[i].latlng);//마커들을 기점으로 다시 지도의 중심좌표 설정으로 인한 코드
}

/* for(var i=0;i<cnt;i++){
	south[i]=$("input[name=SouthWest]").eq(i).val();
	east[i]=$("input[name=NorthEast]").eq(i).val();
	points.push(new kakao.maps.LatLng(south[i],east[i]));
	
} */

var bounds = new kakao.maps.LatLngBounds();

function setBounds(){
	map.setBounds(bounds);
}

console.log(positions);
if(points!=null){

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    seq = positions[i].seq;
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng // 마커의 위치
    });
    bounds.extend(points[i]);
	console.log(marker);
    // 마커에 표시할 인포윈도우를 생성합니다 
    infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });
    map.setBounds(bounds);



    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

    kakao.maps.event.addListener(marker, 'click', ClickListener(seq,map,marker,infowindow));

    
}

}else{
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    seq = positions[i].seq;
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	    bounds.extend(points[i]);
		console.log(marker);
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });



	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

	    kakao.maps.event.addListener(marker, 'click', ClickListener(seq,map,marker,infowindow));
	    
	    
	    //kakao.maps.event.addListener($('.card'), 'mouseover', makeOverListener(map, marker, infowindow));
	    
	    
}
}

function ClickListener(seq,map, marker, infowindow) {
    return function() {
    	/* const modal = document.querySelector('.modal');
    	modal.style.display='block';
           $(".modal").modal("show",function(){
        	   $("detail").on("show",function(){
        		   location.href="${pageContext.request.contextPath}/detailInfo/"+seq;
        	   });
           });  */
            
    	window.open("${pageContext.request.contextPath}/detailInfo/"+seq, "PopupWin", "width=500,height=600");
        console.log(seq);
    };
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

//현재 위치 버튼을 누르면 현지 위치로 중심을 바꾸고 지도를 확대하는 함수입니다
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

//지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'center_changed', function() {

    // 지도의  레벨을 얻어옵니다
    var level = map.getLevel();

    // 지도의 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 

    var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
    message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';

    var resultDiv = document.getElementById('result');
    resultDiv.innerHTML = message;

});


/* //현재위치를 가져오고, 근처의 장소까지 가져옵니다 (get_places() 포함)

function geolocation(option) {
    // 이 객체를 getCurrentPosition() 메서드의 세번째 인자로 전달한다.
    var options = {
        // 가능한 경우, 높은 정확도의 위치(예를 들어, GPS 등) 를 읽어오려면 true로 설정
        // 그러나 이 기능은 배터리 지속 시간에 영향을 미친다. 
        enableHighAccuracy: false, // 대략적인 값이라도 상관 없음: 기본값
        
        // 위치 정보가 충분히 캐시되었으면, 이 프로퍼티를 설정하자, 
        // 위치 정보를 강제로 재확인하기 위해 사용하기도 하는 이 값의 기본 값은 0이다.
        maximumAge: 30000,     // 5분이 지나기 전까지는 수정되지 않아도 됨
        
        // 위치 정보를 받기 위해 얼마나 오랫동안 대기할 것인가?
        // 기본값은 Infinity이므로 getCurrentPosition()은 무한정 대기한다.
        timeout: 15000    // 15초 이상 기다리지 않는다.
    }
 
    if(navigator.geolocation) // geolocation 을 지원한다면 위치를 요청한다. 
        navigator.geolocation.getCurrentPosition(success, error, options);
    else
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
    
    // geolocation 요청이 실패하면 이 함수를 호출한다.
    function error(e) {
        // 오류 객체에는 수치 코드와 텍스트 메시지가 존재한다.
        // 코드 값은 다음과 같다.
        // 1: 사용자가 위치 정보를 공유 권한을 제공하지 않음.
        // 2: 브라우저가 위치를 가져올 수 없음.
        // 3: 타임아웃이 발생됨.
        alert("Geolocation 오류 "+e.code +": " + e.message);
    }
    
    // geolocation 요청이 성공하면 이 함수가 호출된다.
    function success(pos) {
        

        var lat = pos.coords.latitude, // 위도
			lng = pos.coords.longitude; // 경도
			
        var locPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        
        // 마커를 표시합니다
        displayMarker(locPosition);

        // 현재위치부터 특정 거리의 위경도값 구하기
        distance = parseFloat(0.0035)
        latlng_info = { 
            "lat_plus" : parseFloat(lat + distance),
            "lat_minus" : parseFloat(lat - distance),
            "lng_plus" : parseFloat(lng + distance),
            "lng_minus" : parseFloat(lng - distance)
		};
		
		if(option == "getplaces"){
			get_places();
		};
    }    
}*/
$( '#map' ).mousedown(function() {
	$(".center").show();
	$(".re-search-btn").show();
});
$( '#map' ).bind("touchstart",function(e){
	$(".center").show();
	$(".re-search-btn").show();
});   

$( '.re-search-btn' ).click( function() {
	var center = map.getCenter(); 
	var lat = center.getLat();
	var lng = center.getLng();
	
	location.href="/mau/here?lat="+lat+"&lng="+lng+"&retry=true";


} );

/*
//현재위치, 첫 접근일 경우
geolocation("getplaces");







function get_places() {

	// AJAX

	$.ajax({
		url: "/find_places",
		dataType: 'JSON',
		data: latlng_info,
		success: function(data) {
			

			// 검색된 장소가 하나도 없는지 체크합니다.
			if ( data.length ) {


				// 한 공간에 같은 테마로 큐레이션한 경우를 제거합니다. (중복제거)
				data = _.uniqBy(data, function(obj){
							return obj.place_id + obj.ask_id;
						});
						

				// 중복 큐레이션을 찾아 중복되면 ask_set 에 테마 정보를 담습니다.

				var resultArr = [];

				for(var i = 0; i < data.length; i++){
					var idx = getKeyPlaceId(resultArr, data[i]);
					
					// 마커가 ask인지 mytheme인지 구분
					var type_url = ""
					if (data[i].marker_type == "ask") {
						type_url = "/curation/theme/"
					}else{
						type_url = "/mytheme/"
					};

					if(idx > -1){
						var ask_set= [{
										"ask_id" : data[i].ask_id, 
										"ask_icon" :data[i].ask_icon, 
										"ask_sentence" :data[i].ask_sentence,
										"type_url" :type_url,
									}];
						if(!resultArr[idx].ask_set){
							resultArr[idx].ask_set = new Array();
						}
						resultArr[idx].ask_set.push(ask_set);
					}else{
						resultArr.push(data[i]);
					}
				}

				function getKeyPlaceId(arr, obj){
					for(var i = 0; i < arr.length; i++){
						if(arr[i].place_id === obj.place_id){
							return i;
						}
					}
					return -1;
				}

				// 여기까지


				var ask_markers = eval(resultArr);

				for (marker of ask_markers) {

					// mytheme 의 myplace 와 같은 place 의 ID를 찾아와서 교체해줍니다.
					// 이 페이지에서는 place_modal을 띄울때 myplace ID로는 찾아올 수 없습니다.
					// DB 구조상 place.id를 바로 찾아올 수 없는 설계 오류가 있습니다.
					if(marker.marker_type == "mytheme"){
						$.ajax({
							type: 'POST',
							url: "/find_place_id",
							async:false,
							data: { 
								kakao_place_id: marker.place_id, 
							},
							success: function(data) {
								marker.id = data;
							},
							error: function(request,status,error){
								// alert("문제가 발생했습니다! 사용자 피드백을 통해 오류를 제보해주세요.");
							}
						});
					};


					var ask_marker = {
						content_prev:  
							'<div class="marker_overlay shadow">'+'<div class="place_name text-',
						content_primary: 'primary',
						content_sub: 'sub',
						content_next: '"><a href="https://map.kakao.com/?itemId='+marker.place_id+'" target="_blank">'+marker.place_name+'</a></div><hr>',
						content_next_2: '<div class="avatar"><a href="/curation/curator/'+marker.user_id+'">'+marker.user_avatar+'</a></div>'+'</div>',
						list_content:
							'<div class="list_overlay bg-white shadow border-radius">'+
							'<div class="place_name text-primary"><a href=\'javascript:void(0);\' onclick="restore_modal('+marker.id+');">'+marker.place_name+'</a></div>'+
							'<div class="place_address">'+marker.place_address+'</div>',
						list_content_next:
							'<div class=\"read-more\" onclick="restore_modal('+marker.id+');"><img src=\"/static/img/icon-more.svg\"></div>'+
							'</div>',
						latlng: 
							new kakao.maps.LatLng(marker.place_lat['__Decimal__'],marker.place_lng['__Decimal__']),
						user_id: marker.user_id
					};

					// 마커가 ask인지 mytheme인지 구분
					var type_url = ""
					if (marker.marker_type == "ask") {
						type_url = "/curation/theme/"
					}else{
						type_url = "/mytheme/"
					};


					// 마커 인포인도우 뷰의 복수 테마 리스팅을 위한 부분
					var popup_ask_content = '<div class="theme_name"><a href="'+type_url+marker.ask_id+'">'+marker.ask_icon+' '+marker.ask_sentence+'</a></div>'
					if(marker.ask_set){
						for (ask of marker.ask_set) {
							popup_ask_content += '<div class="theme_name"><a href="'+ask[0].type_url+ask[0].ask_id+'">'+ask[0].ask_icon+' '+ask[0].ask_sentence+'</a></div>';
						};
					};

					
					// [플레이스 리스트] 뷰의 복수 테마 리스팅을 위한 부분

					var ask_content = '<div class="theme_name"><a href="'+type_url+marker.ask_id+'">'+marker.ask_icon+
							' '+ marker.ask_sentence+'</a></div>'
					if(marker.ask_set){
						for (ask of marker.ask_set) {
							ask_content += '<div class="theme_name"><a href="'+ask[0].type_url+ask[0].ask_id+'">'+ask[0].ask_icon+' '+ ask[0].ask_sentence+'</a></div>';
						};
					};



					var content = ask_marker['content_prev']+ask_marker['content_primary']+ask_marker['content_next'] + popup_ask_content + ask_marker['content_next_2'];
					var position = ask_marker['latlng'];

					// 로그인 되어있는 경우, 내 마커는 빨간색으로 표시합니다.
					
						// 로그인 안한 상태
						marker_img = imageSrc
					

					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(marker_img, imageSize, imageOption),
						markerPosition = ask_marker['latlng']; // 마커가 표시될 위치입니다

					// 마커를 지도에 표시합니다
					var marker = new kakao.maps.Marker({
							map: map, // 마커를 표시할 지도
							position: markerPosition, // 마커의 위치,
							image: markerImage // 마커이미지 설정
					});
					marker.setMap(map);

					// 마커의 위치를 bounds 변수에 넣어 지도 크기를 확장합니다.
					bounds.extend(markerPosition);



					// [커스텀 오버레이]와 [플레이스 리스트] 내용을 변수에 저장합니다.
					var list_content = ask_marker['list_content'] + ask_content + ask_marker['list_content_next'];

					
					var position = ask_marker['latlng'];

					// [플레이스 리스트]를 생성합니다.
					var placeCard = document.createElement('div');
					placeCard.setAttribute("class", "list_item");
					placeCard.innerHTML = list_content;
					placesList.appendChild(placeCard);

					// 커스텀 오버레이를 생성합니다
					var customOverlay = new kakao.maps.CustomOverlay({
						position: position,
						content: content,
						xAnchor: 0.5,
						yAnchor: 1.6
					});

					(function(map, marker, customOverlay, position, placeCard) {

						// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
						kakao.maps.event.addListener(marker, 'mouseover', function(){
							customOverlay.setMap(map, marker);
							var firstChild = placeCard.firstChild;
							firstChild.classList.toggle( 'bg-white' );
							firstChild.classList.toggle( 'bg-primary' );
							firstChild.classList.toggle( 'text-white-all' );
						});
						kakao.maps.event.addListener(marker, 'mouseout', function(){
							customOverlay.setMap(null);
							var firstChild = placeCard.firstChild;
							firstChild.classList.toggle( 'bg-white' );
							firstChild.classList.toggle( 'bg-primary' );
							firstChild.classList.toggle( 'text-white-all' )
						});
						kakao.maps.event.addListener(marker, 'click', function(){
							$('.list_overlay').removeClass('bg-primary');
							$('.list_overlay').removeClass('text-white-all');
							$('.list_overlay').addClass('bg-white');
							var firstChild = placeCard.firstChild;
							firstChild.classList.toggle( 'bg-white' );
							firstChild.classList.toggle( 'bg-primary' );
							firstChild.classList.toggle( 'text-white-all' );
							placeCard.scrollIntoView({ behavior: 'smooth', block: 'center' });
						});

						// 리스트에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
						placeCard.onmouseover =  function (){
							$('.list_overlay').removeClass('bg-primary');
							$('.list_overlay').removeClass('text-white-all');
							$('.list_overlay').addClass('bg-white');
							customOverlay.setMap(map, marker);
						};
						placeCard.onmouseout =  function (){
							$('.list_overlay').removeClass('bg-primary');
							$('.list_overlay').removeClass('text-white-all');
							$('.list_overlay').addClass('bg-white');
							customOverlay.setMap(null);
						};
						placeCard.onclick =  function (){
							$('.list_overlay').removeClass('bg-primary');
							$('.list_overlay').removeClass('text-white-all');
							$('.list_overlay').addClass('bg-white');
							customOverlay.setMap(map, marker);
							map.panTo(position);
							map.setLevel(4);
						};

					})(map, marker,customOverlay, position, placeCard);

				}

			// 마커들의 위치로 지도의 크기를 재정의 합니다.	
			map.setBounds(bounds);
			
			};

		
			$('.spinner-cover').hide();


		},
		error: function(request,status,error){
			// alert("code:"+request.status+"\n"+"error:"+error);
		}
	});

} */
</script>
  </body>
</html>
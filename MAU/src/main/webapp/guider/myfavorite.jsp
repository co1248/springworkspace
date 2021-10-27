<%@page import="com.spring.mau.place.PlaceVO"%>
<%@page import="com.spring.mau.mapfavorite.MapFavoriteVO"%>
<%@page import="com.spring.mau.map.MapVO"%>
<%@page import="com.spring.mau.user.UserVO"%>
<%@page import="com.spring.mau.mapview.MapViewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <div id="menu_wrap" >
   <%for(int i=0; i<placeList.size();i++){ %>
<div class="card text-dark bg-warning mb-3 card" style="max-width: 18rem; height: 80px; font-size: 1.2em; cursor: pointer; " onclick="location.href='${pageContext.request.contextPath}/detailInfo/'+<%=placeList.get(i).getPlaceSeq()%>">
  <div class="card-header"><%=placeList.get(i).getPlaceName() %></div>
  <div class="card-body">
    <h5 class="card-title"><%=placeList.get(i).getPlaceAddr() %></h5>
  </div>
</div>
<%} %>
    </div>
</div>
    
</div>
<%for(int i = 0; i< placeList.size();i++){%>
<input type="hidden" name ="placeName" value ="<%=placeList.get(i).getPlaceName().toString() %>">
<input type="hidden" name ="SouthWest" value ="<%=placeList.get(i).getPlaceSouthWest() %>">
<input type="hidden" name ="NorthEast" value ="<%=placeList.get(i).getPlaceNorthEast() %>">
<input type="hidden" name ="seq" value ="<%=placeList.get(i).getPlaceSeq() %>">

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

</script>
  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <a class="nav-link" href="mypage">나의 가이드 관리</a>
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
      <div style="margin-top: 58px; text-align : center;"><h1>당신만의 장소를 공유하세요</h1><br></div>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
    
 <!--guide map carousel start-->
 <div id="carouselExampleInterval" class="carousel slided" data-bs-ride="carousel">
    <div class="carousel-inner">
		<div class="carousel-item active text-center" data-bs-interval="2000">
		  <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>가이드 지도 넣을거야<br>5명의 가이더
		</div>
		<div class="carousel-item text-center" data-bs-interval="2000">
		  <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>서울 핫한 빵집<br>4명의 가이더
		</div>
		<div class="carousel-item text-center" data-bs-interval="2000">
		  <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>서울 빵지순례<br>3명의 가이더
		</div>
		<div class="carousel-item text-center" data-bs-interval="2000">
		  <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>줄서서 먹는 빵집<br>2명의 가이더
		</div>
		<div class="carousel-item text-center" data-bs-interval="2000">
		  <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>강남 빵집<br>1명의 가이더
		</div>
   </div>
   <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
</div> 
<!--guide map carousel end-->
<!--guide map search start-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<div class="container">
    <br/>
	<div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                            <form class="card card-sm">
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col">
                                        <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="지도를 검색하세요.">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto">
                                        <button class="btn btn-lg btn-success" type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                            </form>
                        </div>
                        <!--end of col-->
                    </div>
</div>
	
<!--guide map search end-->
<!--card start 열혈가이더 넣을 예정-->
<div class="container">
    <hr class="divider-title">
    <div class="row center-block">
    
        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2  text-center">
            <div class="project">
                <figure class="img-responsive">
                    <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>
                    <span class="actions">
                        <span class="project-details">고객님<br>5개의 테마</span>
                    </span>
                </figure>
            </div>
        </div>
        
        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2  text-center">
            <div class="project">
                <figure class="img-responsive">
                    <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>
                    <span class="actions">
                         <span class="project-details">고객님<br>5개의 테마</span>
                    </span>
                </figure>
            </div>
        </div>
        
        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2  text-center">
            <div class="project">
                <figure class="img-responsive">
                    <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>
                    <span class="actions">
                        <span class="project-details">고객님<br>5개의 테마</span>
                    </span>
                </figure>
            </div>
        </div>
        
        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2  text-center">
            <div class="project">
                <figure class="img-responsive">
                    <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>
                    <span class="actions">
                        <span class="project-details">고객님<br>5개의 테마</span>
                    </span>
                </figure>
            </div>
        </div>
        
        
        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2  text-center">
            <div class="project">
                <figure class="img-responsive">
                    <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>
                    <span class="actions">
                        <span class="project-details">고객님<br>5개의 테마</span>
                    </span>
                </figure>
            </div>
        </div>
    <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2  text-center">
            <div class="project">
                <figure class="img-responsive">
                    <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>
                    <span class="actions">
                        <span class="project-details">고객님<br>5개의 테마</span>
                    </span>
                </figure>
            </div>
        </div>
    </div>
</div>
<!--card end-->
<%@include file="/index/randomMap.jsp"%>

   </div>
    <form id="form2" name="form2" action="${pageContext.request.contextPath}/login" method="post" >
      <input type="hidden" name="userId" id="userId" value=""/>
      <input type="hidden" name="userNickName" id="userNickName" value=""/>
   </form>
  </body>
	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
  //카카오로그인
  function kakaoLogin() {

    $.ajax({
        url: 'http://localhost:8181/mau/login/getKakaoAuthUrl',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  $(document).ready(function() {

      var kakaoInfo = '${kakaoInfo}';

      if(kakaoInfo != ""){
          var data = JSON.parse(kakaoInfo);

          /* alert("카카오로그인 성공 \n accessToken : " + data['accessToken']);
          alert(
          "user : \n" + "email : "
          + data['email']  
          + "\n nickname : " 
          + data['nickname']); */
          
          $("#userId").val(data['email']);
          $("#userNickName").val(data['nickname']);
          $("#form2").submit();
      }
  });  

  </script>



</html>
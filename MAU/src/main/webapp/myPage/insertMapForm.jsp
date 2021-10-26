<%@page import="com.spring.mau.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	UserVO user = (UserVO)session.getAttribute("loginUser");
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
              </ul>
            </div>
          </div>
        </div>
      </nav>
      <form action="createGuiderMap" method="post" style="text-align: center;">
	      <div class="mb-3" align="center">
	      
	  <label for="formGroupExampleInput" class="form-label"><b>가이더맵 이름</b></label>
	  <input style="width: 300px; border-radius: 50px;" type="text" class="form-control" name="mapName"id="formGroupExampleInput" placeholder="가이더맵의 이름을 지어주세요!" required>
	</div>
	<div class="mb-3" align="center">
	  <label for="formGroupExampleInput2" class="form-label"><b>메유콘</b></label>
	  <input  style="width: 300px; border-radius: 50px;" type="text" class="form-control" name ="mapIcon"id="formGroupExampleInput2" placeholder="입력칸에 우클릭으로 이모지를 선택하세요" required>
	</div>
	<div class="mb-3" align="center">
	  <label for="formGroupExampleInput3" class="form-label"><b>키워드</b></label>
	  <input  style="width: 300px; border-radius: 50px;" type="text" class="form-control" name="keyWord" id="formGroupExampleInput3" placeholder="키워드를 입력해주세요!" required>
	</div>
	<div class="mb-3" align="center">
	 <input type="radio" name="kateGory" value="음식점" checked>음식점
			<input type="radio" name="kateGory" value="편의점">편의점
			<input type="radio" name="kateGory" value="어린이집">어린이집
			<input type="radio" name="kateGory" value="학교">학교
			<input type="radio" name="kateGory" value="까페">까페
			<input type="radio" name="kateGory" value="가라오케">가라오케
	</div>
	<div class="mb-3" align="center">
	  <input type="radio" name="shareYn" checked="checked" value="1">네 공유하겠습니다.<br>
			<input type="radio" name="shareYn" value="0">아니요 공유 안하겠습니다
	</div>
	<%if(user.getAdminNum()==0){ %>
			<input type="hidden" name = "mapType" value=0>
			<%}else{ %>
			<input type="hidden" name = "mapType" value=1>
			<%} %>
			<input type="hidden" name="userSeqId" value="<%=user.getUserSeqId() %>">
			<input type="submit" value="등록">
</form>
      <div>
      
  
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</div>

	
  </body>
</html>
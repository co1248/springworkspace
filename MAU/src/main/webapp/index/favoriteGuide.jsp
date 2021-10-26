<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <div style="margin-top: 58px; text-align : center;"><h1>
    <img src="https://visualpharm.com/assets/198/Location-595b40b85ba036ed117da637.svg" class="card-img-top" width="50px"  height="50px" alt="...">인기 가이드지도
	</h1><br></div>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
    <c:forEach items="${favoriteGuide}" var="favoriteGuide" begin="0" end="8" step="1">
	    <div class="col" onclick="location.href='guiderMap/'+${favoriteGuide.mapSeq}">
	    <div class="card border-info h-100 text-center">
	      <img src="https://visualpharm.com/assets/320/World%20Map-595b40b75ba036ed117d6df7.svg" class="card-img-top" height="50px" alt="...">
	      <div class="card-body">
	        <h5 class="card-title">${favoriteGuide.mapName}</h5>
	        <p class="card-text">${favoriteGuide.mCnt}개의 추천</p>
	        
	      </div>
	    </div>
	  </div>
	</c:forEach>
	</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container">
    <hr class="divider-title">
    <div class="row center-block">
<c:forEach items="${getHotUser}" var="getHotUser" begin="0" end="5" step="1">
        <div class="col-xs-6 col-sm-4 col-md-3 col-lg-2  text-center">
            <div class="project">
                <figure class="img-responsive">
                    <img src="${pageContext.request.contextPath}/image/logo/mauicon.png" height="50px"><br>
                    <span class="actions">
                        <span class="project-details">${getHotUser.userNickName} 님<br>${getHotUser.placeCnt} 곳의 장소</span>
                    </span>
                </figure>
            </div>
        </div>
</c:forEach>
    </div>
</div>

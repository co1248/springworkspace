<%@page import="com.spring.mau.mapview.MapViewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MapViewVO map = (MapViewVO)request.getAttribute("map");
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset='utf-8'>
</head>
<body>
<!-- 장소등록 1차 시작-->
 <div class="modal fade" id="modal-group-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">장소저장</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center">
            <div class="place_name" style="font-size : large; color : #F3B922; font-weight: bold ;"><h2>여기</h2></div>
            <div><%if(map != null) {%><%=map.getMapIcon()%> <%=map.getMapName()%><%} else {%>첫 장소로 해당지도<%} %>에<br>선택한 장소를 저장하시겠습니까?</div>
            <div><br>해당장소는 공유됩니다.<br>공유를 원하지 않으시면 장소에서 비공개할 수 있습니다.(가이더지도만뜸)</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
        <div onclick="add_place(placeId, placeSouthWest, placeNorthEast , placeName, placeAddr)" class="add-place-btn btn btn-primary"><span>장소저장</span></div>
      </div>
    </div>
  </div>
</div>
<!--장소등록 1차 끝-->
<!-- 장소등록 2차 시작-->
<div class="modal fade" id="modal-group-2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">장소 저장 완료!</h5>
      </div>
      <div class="modal-body text-center">
		 <div>이 장소에 대해 하고 싶은 이야기가 있나요?</div>
	     <div>아래 이모지를 눌러서 의견을 남겨보세요!?</div>
	     
         <div class="info-box">
                        <div class="title">직접 의견을 남겨보세요!</div>
                        <div class="emoji-list">
                                    
                            <div class="uk-width-1-5">
                                <div class="emoji-box bg-white border-radius shadow" data-icon="1-a" data-score="1">
                                    <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/disappointed-face_1f61e.png" width="30px">
                                </div>
                            </div>
                            <div class="uk-width-1-5">
                                <div class="emoji-box bg-white border-radius shadow" data-icon="2-a" data-score="2">
                                    <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/expressionless-face_1f611.png" width="30px">
                                </div>
                            </div>
                            <div class="uk-width-1-5">
                                <div class="emoji-box bg-white border-radius shadow" data-icon="3-a" data-score="3">
                                    <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/grinning-face-with-smiling-eyes_1f604.png" width="30px">
                                </div>
                            </div>
                            <div class="uk-width-1-5">
                                <div class="emoji-box bg-white border-radius shadow" data-icon="4-a" data-score="4">
                                    <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/partying-face_1f973.png" width="30px">
                                </div>
                            </div>
                            <div class="uk-width-1-5">
                                <div class="emoji-box bg-white border-radius shadow" data-icon="5-a" data-score="5">
                                    <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/face-with-steam-from-nose_1f624.png" width="30px">
                                </div>
                            </div>

                            <div class="uk-width-1-6">
                                <div class="emoji-box bg-white border-radius shadow" data-icon="1-b" data-score="1">
                                    <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/pleading-face_1f97a.png" width="30px">
                                </div>
                            </div>
                            <div class="uk-width-1-6">
                                <div class="emoji-box bg-white border-radius shadow" data-icon="2-b" data-score="2">
                                    <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/zipper-mouth-face_1f910.png" width="30px">
                                </div>
                            </div>
                            <div class="uk-width-1-6">
                                <div class="emoji-box bg-white border-radius shadow" data-icon="3-b" data-score="3">
                                    <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/face-with-rolling-eyes_1f644.png" width="30px">
                                </div>
                            </div>
                            <div class="uk-width-1-6">
                                <div class="emoji-box bg-white border-radius shadow" data-icon="4-b" data-score="4">
                                    <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/kissing-face-with-smiling-eyes_1f619.png" width="30px">
                                </div>
                            </div>
                            <div class="uk-width-1-6">
                                <div class="emoji-box bg-white border-radius shadow" data-icon="5-b" data-score="5">
                                    <img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/apple/285/smiling-face-with-heart-eyes_1f60d.png" width="30px">
                                </div>
                            </div>
                            <div class="text_box">
	                            <div class="text">ㅠㅠ</div>
	                            <div class="text">음..?</div>
	                            <div class="text">괜찮아요</div>
	                            <div class="text">좋았어요!</div>
	                            <div class="text">완벽해요!!</div>
                            </div>
                            <div class="input-box">
                               <textarea id="comment_text" class="border-radius shadow-sm" name="" rows="4" placeholder="여기에 의견을 입력해주세요."></textarea>
                            <input type="hidden" id="place_id" value="">
                            <input type="hidden" id="input_score" value="">
                            <input type="hidden" id="input_icon" value="">
            </div>
                        </div><!-- emoji-list end -->
		</div><!--info-box end -->
		</div><!--modal-body end -->
		<div class="modal-footer">
              <div class="btn btn-secondary" onclick="next_step();">건너뛰기</div>
             <button type="button" class="btn btn-primary">리뷰 남기기</button>
        </div>
        </div>
	</div>	   
</div>
<!-- 장소등록 2차 끝 -->
<!-- 장소등록 3차 시작 -->
<div class="modal fade" id="modal-group-3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">사진을 추가해주세요.</h5>
      </div>
      <div class="modal-body text-center">
                <span class="icon">🙌</span><br>
                <span>잠시만요!</span>
            <div class="sub-title">혹시, <b><span id="place_name"></span></b> 사진이 있으신가요?</div>
			
			<form id="ajaxform" action="/submit_image" method="post" enctype="multipart/form-data">
				<input type="hidden" id="source_type" value="mytheme_add" name="source_type">
				<input style="display: none;" type="file" multiple name="image" id="photo_upload">
			</form>

            <div class="img-box">
                <!-- owl css
                <link rel="stylesheet" type="text/css" href="/static/css/owl.carousel.min.css?q=1627023708">
                <link rel="stylesheet" type="text/css" href="/static/css/owl.theme.default.min.css?q=1627023708"> -->
                <div id="image-waiting">
					<div class="image-waiting spinner-cover uk-flex uk-flex-cen/seq/1middle">
						<div class="lds-ring"><div></div><div></div><div></div><div></div></div>
						<div class="text">잠시만 기다려주세요.</div>
					</div>
				</div>
                <div class="info-images chocolat-parent owl-carousel owl-theme clear"></div>
            </div>

            <div class="desc">여기에 업로드한 사진은<br>장소 상세페이지에 공유됩니다.</div>
        </div>
        <div class="modal-footer">
                <div class="close-modal btn btn-secondary justify-content-center " onclick="last_step();">건너뛰기</div>
                <div onclick="upload_trigger();" class="btn btn-primary"><span>사진 추가하기</span></div>
        </div>
    </div>
  </div>
</div>
<!-- 장소등록 3차 끝 -->
</body>
</html>
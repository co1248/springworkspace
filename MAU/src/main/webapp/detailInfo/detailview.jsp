<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>mau</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mau.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	<script src="jquery-1.7.1.min.js"></script>  
<!-- 카카오 링크 공유 -->
  <!-- Kakao API -->
 <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	//카카오로 url 공유하기
	function kakao() { 
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('51c537c4b3603a65b8ba8a854278340e');
    
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: document.title,
        description: 'MAU - ME AND YOU',
        imageUrl: document.images[0].src,
        link: {
          webUrl: document.location.href,
          mobileWebUrl: "https://www.google.com" // 내용 클릭시 열리는 url 요기에 입력
        }
      },
      buttons: [
        {
          title: 'MAU에는 시크릿 스팟들이 숨어있어요!',
          link: {
            mobileWebUrl: "https://www.google.com", //버튼 클릭시 열리는 url 요기에 입력
            webUrl: "https://www.google.com" 
          }
        }  
      ]
    });
}
</script>

<script type="text/javascript">
	$('.uk-width-1-5').on('click', function() { 
		var name = prompt('Whats your name?'); 
		$('#comment_text').append(name + ' : ' + comment_text); });
</script>

</head>
<body>
    
    <div id="modal-overflow"  class="place-info-window" uk-modal>
        <div class="uk-modal-dialog border-radius shadow">
    
          
    
            <div class="uk-modal-header">
                <div id="modal_place_name" class="place_name_text">포비 합정점 <a href="#" id="popup_close">닫기</a> </div>   
                <!-- <div id="modal_place_address" class="place_address clear" onclick="trackOutboundLink('place_page','copy','copy-address');">
                    <span>서울 성동구 성수동1가 668-3</span>
                    <img src="/static/img/icon-copy.svg?q=1627023708(복사이미지)">
                    <input type="text" id="copyAddress">
                </div> -->
                
            </div>
    
            
            <div class="uk-modal-body" uk-overflow-auto>
    
                
                
                <form id="ajaxform" action="/submit_image" method="post" enctype="multipart/form-data">
                    <input type="hidden" id="source_type" value="place_modal" name="source_type">
                    <input style="display: none;" type="file" multiple name="image" id="photo_upload">
                </form>
                
                <div class="img-box">
                <!-- 이미지 업로드 css -->
                <div>
                    <div class="img_upload_box">
                        <img src="" class="img_upload">+
                        <div class="size"></div>
                        <div class="size">여기를 눌러서 장소와 관련된 사진을 올려주시면 <br> 페이지가 더 유익해질 것 같아요!
                            <form id="ajaxform" action="/submit_image" method="post" enctype="multipart/form-data">
                                <input type="hidden" id="source_type" value="place_modal" name="source_type">
                                <input style="display: none;" type="file" multiple name="image" id="photo_upload">
                             </form>
                    
                        </div>
                        <div class="size"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="info-box">
                            <div class="title">여기는 어떤 곳인가요?</div>
                                 <!-- 장소 키워드카드 -->
                            <div class="inline-theme-cards clear" onclick="trackOutboundLink('place_page','inbound','go-to-theme');">
                            </div>
                        </div>
                   
					<!--  카카오맵 지도 -->
                    <div class="info-box">
                        <div class="title">어디에 있나요?</div>
                        <a id="static_map" href="#" target="_blank" onclick="trackOutboundLink('place_page','outbound','click-map');">
                            <div id="info-map" class="map-box border-radius shadow">
                            <div id="map" style="width:100%;height:230px;"></div>
							<!-- <p><em>마커를 클릭해주세요!</em></p>  -->
							
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51c537c4b3603a65b8ba8a854278340e"></script>
							<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = { 
							        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							        level: 5 // 지도의 확대 레벨
							    };
							
							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							  
							// 마커를 표시할 위치입니다 
							var position =  new kakao.maps.LatLng(33.450701, 126.570667);
							
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							  position: position,
							  clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
							});
							
							// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
							// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
							// marker.setClickable(true);
							
							// 마커를 지도에 표시합니다.
							marker.setMap(map);
							
							// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
							var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
							
							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
							    content : iwContent,
							    removable : iwRemoveable
							});
							
							// 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'click', function() {
							      // 마커 위에 인포윈도우를 표시합니다
							      infowindow.open(map, marker);  
							      location.href="https://www.naver.com/" //여기에 url 등록
							});
							</script>
							      </div>
							                        
							   </a>
                    </div>
                    <div class="info-box">
                      <div class="title_2">이 장소 공유하기</div>
                        <div class="share-box">
                            <div id="share-place-btn" class="share-btn shadow link" onclick="trackOutboundLink('place_page','share','share-link');"></div>
                            <!-- <input type="text" id="SharePlaceUrl"> -->
                             <a href="javascript:kakao();" id="kakao-link-btn">
                                <div class="share-btn shadow kakao"><img id="kakao_url" src="${pageContext.request.contextPath}/resources/images/icon-kakao.png"></div>
                            </a>
                            <a class="share-place-btn" class="fb-share-button" target="_blank" href="https://www.facebook.com/sharer/sharer.php?src=sdkpreparse&u=https://jinjja-seoul.com" onclick="trackOutboundLink('place_page','share','share-fb');">
                                <div class="share-btn shadow facebook"><img id="kakao_url" src="${pageContext.request.contextPath}/resources/images/icon-facebook.png"></div>
                            </a>
                            
 
                        </div>
                    </div>
                </div> 
                <!-- 반응형 1단 끝 -->
                <!-- 반응형 2단 시작-->
                
                <div class="col-md-6" >
                    <div id="comment-box" class="info-box">
                        <div class="title">이 장소에 대한 이야기들</div>
                        <div class="comment-cards">
                            아래 이모지를 눌러서 의견을 남겨보세요!
                        </div>
                        <div onclick="get_more_place_comment()" class="load-more button shadow bg-white padding-15">
                            <!-- <span>더 불러오기</span> -->
                        </div>
                    </div>

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
                        </div>
                           
                </div>
                <!-- 반응형 2단 끝 -->
                    
                        
                           <!--  <div class="input-box">
                                <textarea id="comment_text" class="border-radius shadow-sm" name="" rows="4" placeholder="여기에 의견을 입력해주세요."></textarea>
                                <input type="hidden" id="place_id" value="">
                                <input type="hidden" id="input_score" value="">
                                <input type="hidden" id="input_icon" value="">
                                <div class="submit-button disabled button shadow bg-white padding-15">
                                    <span>저장하기</span>
                                </div>
                            </div> -->
                            <!-- <a class="login-href">
                                <div class="need-login bg-white border-radius shadow" onclick="trackOutboundLink('place_page','comment','comment-login');">
                                    <div class="info">의견을 남기려면 여기를 눌러서 로그인 해주세요</div>
                                    <div class="login-href login">3초만에 로그인하기</div>
                                </div>
                            </a> -->
                        </div>
                    </div>
                </div>
            </div>
       
        </div>
            <div class="uk-modal-footer info-footer">
                <a id="modal_place_info_url" class="go-kakao-btn" onclick="trackOutboundLink('place_page','outbound','go-to-kakaomap');">
                    <div class="d-grid gap-2">
                        <button class="btn btn-primary" type="button">카카오맵으로 자세히 보기</button>
                      </div>
                </a>
                <div onclick="favorite_place();" class="button save-btn shadow bg-white text-primary padding-15" onclick="trackOutboundLink('place_page','favorite','click-button');">
                </div>
            </div>
    
            <div class="external-panel">
                <!-- <embed class="kakao-embed" type="text/html" src=""> -->
             <!--    <div class="bg-embed">
                    <div class="close-box">
                        <div class="close">닫기</div>
                    </div>
                    <div class="embed-box"></div>
                </div> -->
            </div>
        </div>
    </div>
    


</body>
</html>
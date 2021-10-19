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
<!-- 장소등록 1차 시작-->
 <div class="modal fade" id="modal-group-1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">장소저장</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center"> 
            <div>장소이름</div>
            <div>맵아이콘 맵이름에<br>선택한 장소를 저장하시겠습니까?</div>
            <div><br>해당장소는 공유됩니다.<br>공유를 원하지 않으시면 장소에서 비공개할 수 있습니다.</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
        <div onclick="add_place()" class="btn btn-primary"><span>장소저장</span></div>
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
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="modal-body text-center">
		 이 장소에 대해 하고 싶은 이야기가 있나요?
	     아래 이모지를 눌러서 의견을 남겨보세요!
		<div onclick="get_more_place_comment()" class="load-more button shadow bg-white padding-15">

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
			<div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">건너뛰기</button>
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
          <h5 class="modal-title" id="exampleModalLabel">사진저장</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
                <span class="icon">🙌</span><br>
                <span>잠시만요!</span>
            </div>
            <div class="sub-title">혹시, <b><span id="place_name"></span></b> 사진이 있으신가요?</div>
			
			<form id="ajaxform" action="/submit_image" method="post" enctype="multipart/form-data">
				<input type="hidden" id="source_type" value="mytheme_add" name="source_type">
				<input style="display: none;" type="file" multiple name="image" id="photo_upload">
			</form>

            <div class="img-box">

                <!-- owl css -->
                <link rel="stylesheet" type="text/css" href="/static/css/owl.carousel.min.css?q=1627023708">
                <link rel="stylesheet" type="text/css" href="/static/css/owl.theme.default.min.css?q=1627023708">

                <div id="image-waiting">
					<div class="image-waiting spinner-cover uk-flex uk-flex-cen/seq/1middle">
						<div class="lds-ring"><div></div><div></div><div></div><div></div></div>
						<div class="text">잠시만 기다려주세요.</div>
					</div>
				</div>
                <div class="info-images chocolat-parent owl-carousel owl-theme clear"></div>
            </div>

            <div class="desc">여기에 업로드한 사진은<br>장소 상세페이지에 공유됩니다.</div>

            <div onclick="upload_trigger();"  class="btn but-primary">
                <span>사진 추가하기</span>
            </div>
            
            <a href="guideMap.jsp"><div class="close-modal">건너뛰기</div></a>
    </div>
  </div>
</div>
<!-- 장소등록 3차 끝 -->
<!-- Button trigger modal -->
<butpe="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-group-1">
모달띄우기
</button>
<butpe="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-group-2">
모달띄우기
</button>
<butpe="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-group-3">
모달띄우기
</button>
</body>
</html>
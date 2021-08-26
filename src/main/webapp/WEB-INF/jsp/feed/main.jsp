<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마론달그램 - 메인</title>
<link rel="stylesheet" href="/static/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="h-100 d-flex justify-content-center">
			<article class="d-flex flex-column">
				<div id="story-box" class="d-flex justify-content-around align-items-center mb-3">
					<c:forEach var="i" begin="0" end="5" step="1">
					<div id="story-user-profile" class="d-flex flex-column align-items-center">
					<c:choose>
					<c:when test="${userProfileUrl eq null }">
						<img src="/static/media/defaultProfileImg.png" alt="default" class="story-profileImgs">
					</c:when>
					<c:otherwise>
						<img src="${userProfileUrl }" alt="사용자 프로필" class="story-profileImgs">
					</c:otherwise>
					</c:choose>
						<div>${userNickname }</div>
					</div>
					</c:forEach>
				</div>
				<div id="createFeedDiv" class="text-center p-2 mb-3">
					<label>게시글 만들기</label>
					<textarea id="contentInput" class="form-control mt-2" rows="5" placeholder="문구 입력..."></textarea>
					<div class="d-flex justify-content-between align-items-center p-2">
					<label>
						<img id="cameraBtn" src="/static/media/camera.png" class="mt-1" style="width:45px; height:45px; cursor:pointer;">
					</label>
						<input id="fileInput" type="file" class="d-none" accept="image/*, video/*" multiple onchange="javascript:document.getElementById('fileRoute').value = this.value">
						<input type="text" readonly="readonly" id="fileRoute" class="mx-2" style="width:95%; border:none;">
						<button id="feedSubmitBtn" type="submit" class="btn btn-primary" style="width:70px; height:40px;">게시</button>
					</div>
				</div>
				<c:forEach var="feed" items="${feedList }">
				<div id="feed-box" class="d-flex flex-column mb-4">
					<div class="d-flex justify-content-between align-items-center mt-3">
					<div id="feed-user-profile" class="d-flex align-items-center">
					<c:choose>
					<c:when test="${userProfileUrl eq null }">
						<img src="/static/media/defaultProfileImg.png" alt="default" class="feed-profileImgs ml-4">
					</c:when>
					<c:otherwise>
						<img src="${userProfileUrl }" class="feed-profileImgs ml-4">
					</c:otherwise>
					</c:choose>
						<span class="ml-3"><b>${feed.userNickname }</b></span>
					</div>
						<img src="/static/media/more.png" alt="더보기" class="moreBtn feed-profileImgs mr-4">
					</div>
					<div class="w-100">
					<hr>
					</div>
					<div class="d-flex justify-content-center align-items-center">
						<div class="w-100 feed-imgVideo">
							<img class="w-100 h-100" src="${feed.imgUrl }" alt="feedImage">
						</div>
					</div>
					<div class="w-100">
					<hr>
					</div>
					<div class="d-flex align-items-center">
						<script>
							feedId = ${feed.id }
							userId = ${feed.userId}
						</script>
						<div class="like-box d-flex align-items-center">
							<img class="ml-4 like-icon" src="/static/media/heart-empty.png" alt="like">
							<span class="ml-2"><b>좋아요</b></span>
							<span class="ml-2 like-count">1234</span><b>개</b>
						</div>
						<div class="comment-box d-flex align-items-center">
							<img class="ml-4 comment-icon" src="/static/media/comment-icon.png" alt="comment">
							<span class="ml-2"><b>댓글</b></span>
							<span class="ml-2 comment-count"><b>12</b></span><b>개</b>
						</div>
					</div>
					<div class="d-flex mt-2">
						<div class="ml-4"><b>${feed.userNickname }</b></div>
						<div class="ml-3">${feed.content }</div>
					</div>
					<div id="comment-box" class="d-flex flex-column mt-3">
						<c:forEach var="i" begin="0" end="1" step="1">
						<div class="d-flex">
							<div class="ml-4"><b>${userLoginId }</b></div>
							<div class="ml-3">피드 잘보고 갑니다~</div>
						</div>
						</c:forEach>
						<div class="input-group mt-3">
  							<input type="text" class="form-control commentInput" placeholder="댓글 입력...">
  							<div class="input-group-append">
    						<button class="btn btn-success commentAddBtn" type="button">추가</button>
  							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</article>
			<article id="user" class="ml-5">
				<div class="d-flex align-items-center mt-3 btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<c:choose>
					<c:when test="${userProfileUrl eq null }">
						<img src="/static/media/defaultProfileImg.png" alt="default" class="story-profileImgs">
					</c:when>
					<c:otherwise>
						<img src="${userProfileUrl }" class="story-profileImgs">
					</c:otherwise>
					</c:choose>
					<div class="d-flex flex-column">
						<span class="ml-3"><b>${userNickname }</b></span>
						<span class="text-secondary ml-3">${userName }</span>
					</div>
					<div class="dropdown-menu ml-3 mt-3">
						<a id="lookProfileBtn" href="/feed/profile_view" class="dropdown-item">프로필 보기</a>
						<a href="#" class="dropdown-item">프로필 설정</a>
						<div class="dropdown-divider"></div>
						<a id="signoutBtn" href="/user/sign_out" class="dropdown-item">로그아웃</a>
					</div>
				</div>
			</article>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			$("#cameraBtn").on("click", function() {
				$("#fileInput").trigger("click");
			});
			
			$("#feedSubmitBtn").on("click", function() {
				var content = $("#contentInput").val().trim();
				
				if(content == null || content == "") {
					alert("게시글 내용을 입력하세요.");
					return;
				}
				
				var formData = new FormData();
				
				formData.append("content", content);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					enctype:"multipart/form-data",
					type:"post",
					url:"/feed/create_feed",
					processData:false,
					contentType:false,
					data:formData,
					success:function(data) {
						if(data.result == "success") {
							alert("게시글 작성 성공!");	
							// location.href="";
						}
						else {
							alert("게시글 작성에 실패 했습니다.")
						}
					},
					error:function(e) {
						alert("error");
					}
				});

			});
			
			$("#lookProfileBtn").on("click", function() {
				location.href="/feed/profile_view";
			});
			
			$("#signoutBtn").on("click", function() {
				location.href="/user/sign_out";
			});
			
			$(".like-box").on("click", function() {
				feedId;
				userId;
				
				var likeImg = $(this).children("img");
				var likeCount = parseInt($(this).children(".like-count").text());
				// alert(feedId);
				alert(userId);
				
				if(likeImg.attr("src") == "/static/media/heart-empty.png") {
					likeImg.attr("src", "/static/media/heart-fill.png");
					$(this).children(".like-count").text(likeCount + 1);
				}
				else {
					likeImg.attr("src", "/static/media/heart-empty.png");
					$(this).children(".like-count").text(likeCount - 1);
				}
			});
			
			$(".commentAddBtn").on("click", function() {
				
			});
			
		});
	</script>
</body>
</html>
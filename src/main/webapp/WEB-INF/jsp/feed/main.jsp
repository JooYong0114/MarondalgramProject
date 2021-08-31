<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마론달그램 - 메인</title>
<link rel="stylesheet" href="/static/css/style.css">
<link rel="stylesheet" href="https://cdn.iconmonstr.com/1.3.0/css/iconmonstr-iconic-font.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="h-100 d-flex justify-content-center">
			<article class="d-flex flex-column">
			
				<!-- 스토리 목록 -->
				
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
				
				<!-- 게시글 올리기 -->
				
				<div id="createFeedDiv" class="text-center p-2 mb-3">
					<label><b>게시글 만들기</b></label>
					<textarea id="contentInput" class="form-control mt-2" rows="5" placeholder="문구 입력..."></textarea>
					<div class="d-flex justify-content-between align-items-center p-2">
					<label>
						<img id="cameraBtn" src="/static/media/camera.png" class="mt-1" style="width:40px; height:40px; cursor:pointer;">
					</label>
						<input id="fileInput" type="file" class="d-none" accept="image/*, video/*" multiple onchange="javascript:document.getElementById('fileRoute').value = this.value">
						<input type="text" readonly="readonly" id="fileRoute" class="mx-2" style="width:95%; border:none;">
						<button id="feedSubmitBtn" type="submit" class="btn btn-primary" style="width:70px; height:40px;">게시</button>
					</div>
				</div>
				
				<!-- 피드 목록 -->
				
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
						<span class="ml-3"><b>${feed.feed.userNickname }</b></span>
					</div>
					
					<!-- 피드 수정, 삭제 모달창 -->
					<i class="im im-menu mr-3" data-toggle="modal" data-target="#feedModal${feed.feed.id }" style="cursor:pointer;"></i>
					
					<div class="modal fade" id="feedModal${feed.feed.id }" tabindex="-1" role="dialog" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <a href="/feed/edit_view" class="btn btn-primary w-100 h-100">수정하기</a>
					      </div>
					      <div class="modal-body">
					        <a href="/feed/delete_feed?id=${feed.feed.id }" class="btn btn-danger w-100 h-100">삭제하기</a>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary w-100 h-100" data-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div>
		
				</div>
					<div class="w-100">
					<hr>
					</div>
					<div class="d-flex justify-content-center align-items-center">
						<div class="w-100 feed-imgVideo">
							<img class="w-100 h-100" src="${feed.feed.imgUrl }" alt="feedImage">
						</div>
					</div>
					<div class="w-100">
					<hr>
					</div>
					
					<div class="d-flex align-items-center">
					<!-- 좋아요 -->
						<div class="like-box d-flex align-items-center" data-feed-id="${feed.feed.id }" data-user-id="${feed.feed.userId }">
							<img class="ml-4 like-icon" src="/static/media/heart-empty.png" alt="heart-empty">
							<span class="ml-2"><b>좋아요</b></span>
							<c:set var="likeCount" value="0" />
							<c:forEach var="like" items="${feed.likeList }">
							<c:set var="likeCount" value="${likeCount + 1 }"/>
							</c:forEach>
							<c:if test="${likeCount > 0 }">
							<span class="ml-2 like-count">${likeCount}</span><b>개</b>
							</c:if>
						</div>
					<!-- 댓글 -->
						<div class="comment-box d-flex align-items-center">
							<img class="ml-4 comment-icon" src="/static/media/comment-icon.png" alt="comment">
							<span class="ml-2"><b>댓글</b></span>
							<c:set var="commentCount" value="0" />
							<c:forEach var="comment" items="${feed.commentList }">
							<c:set var="commentCount" value="${commentCount + 1 }"/>
							</c:forEach>
							<c:if test="${commentCount > 0 }">
							<span class="ml-2 like-count">${commentCount}</span><b>개</b>
							</c:if>
						</div>
					</div>
					<div class="d-flex mt-2">
						<div class="ml-4"><b>${feed.feed.userNickname }</b></div>
						<div class="ml-3">${feed.feed.content }</div>
					</div>
					<div id="comment-box" class="d-flex flex-column mt-3">
						<c:forEach var="comment" items="${feed.commentList }">
						
						<div class="d-flex">
							<div class="ml-4"><b>${comment.userNickname }</b></div>
							<div class="ml-3">${comment.comment }</div>
						</div>
						
						</c:forEach>
						<!-- 댓글 추가 입력 -->
						<div class="input-group mt-3">
  							<input type="text" id="commentInput${feed.feed.id }" class="form-control" placeholder="댓글 입력...">
  							<div class="input-group-append">
    						<button class="btn btn-success commentAddBtn" type="button" data-feed-id="${feed.feed.id }" data-user-id="${userId }" data-user-nickname="${userNickname }">추가</button>
  							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			</article>
			<!-- 로그인한 유저 프로필 -->
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
				
				var likeImg = $(this).children("img");
				var likeCount = parseInt($(this).children(".like-count").text());
				var feedId = $(this).data("feed-id");
				var userId = $(this).data("user-id");
				
				if(likeImg.attr("src") == "/static/media/heart-empty.png") {
					likeImg.attr("src", "/static/media/heart-fill.png");
					$(this).children(".like-count").text(likeCount + 1);
					goThisUrl("/feed/like_add");
				}
				else {
					likeImg.attr("src", "/static/media/heart-empty.png");
					$(this).children(".like-count").text(likeCount - 1);
					goThisUrl("/feed/like_delete");
				}
				
				function goThisUrl(url) {
					$.ajax({
						type:"get",
						url:url,
						async:false,
						data:{"feedId":feedId, "userId":userId},
						success:function(data) {
							if(data.result == "insert success") {
								$(this).load(window.location.href + this);
							}
							else if(data.result == "insert fail") {
								alert("좋아요 실패");
							}
							else if(data.result == "delete success") {
								$(this).load(window.location.href + this);
							}
							else {
								alert("좋아요 실패");
							}
						},
						error:function(e) {
							alert("error");
						}
					});
				}
			});
			
			$(".commentAddBtn").on("click", function() {
				var userId = $(this).data("user-id");
				var userNickname = $(this).data("user-nickname")
				var feedId = $(this).data("feed-id");
				var comment = $("#commentInput" + feedId).val();
				
				$.ajax({
					type:"post",
					url:"/feed/comment_add",
					data:{"userId":userId, "userNickname":userNickname, "feedId":feedId, "comment":comment},
					success:function(data) {
						if(data.insert == "success") {
							location.href="/feed/main_view";
						}
						else {
							alert("댓글 추가에 실패 했습니다.");
						}
					},
					error:function(e) {
						alert("error");
					}
				});
			});
			
		});
	</script>
</body>
</html>
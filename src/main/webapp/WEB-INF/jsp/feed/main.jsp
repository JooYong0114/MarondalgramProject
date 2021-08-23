<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마론달그램 - 메인</title>
<link rel="stylesheet" href="/static/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="h-100 d-flex justify-content-center">
			<article class="d-flex flex-column">
				<div id="story-box" class="d-flex justify-content-around align-items-center mb-5">
					<c:forEach var="i" begin="0" end="5" step="1">
					<div id="story-user-profile" class="d-flex flex-column align-items-center">
					<c:choose>
					<c:when test="${userProfileUrl eq null }">
						<img src="/static/media/defaultProfileImg.png" alt="default" class="story-profileImgs">
					</c:when>
					<c:otherwise>
						<img src="${userProfileUrl }">
					</c:otherwise>
					</c:choose>
						<div>juyong_ii</div>
					</div>
					</c:forEach>
				</div>
				<c:forEach var="i" begin="1" end="3" step="1">
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
						<span class="ml-3"><b>${userNickname }</b></span>
					</div>
						<img src="/static/media/more.png" alt="더보기" class="moreBtn feed-profileImgs mr-4">
					</div>
					<div class="w-100">
					<hr>
					</div>
					<div class="d-flex justify-content-center align-items-center">
						<div id="feed-imgVideo" class="w-100">
						</div>
					</div>
					<div class="d-flex align-items-center mt-3">
						<div class="like-box d-flex align-items-center">
							<img class="ml-4 heart-empty like-icon" src="/static/media/heart-empty.png" alt="like">
							<img class="ml-4 heart-fill like-icon d-none" src="/static/media/heart-fill.png" alt="like">
							<span class="ml-2"><b>좋아요</b></span>
						</div>
						<span class="ml-2 like-count">1234</span><span><b>개</b></span>
						<img class="ml-4 comment-icon" src="/static/media/comment-icon.png" alt="comment">
						<span class="ml-2"><b>댓글</b></span>
						<span class="ml-2"><b>12개</b></span>
					</div>
					<div class="d-flex mt-2">
						<div class="ml-4"><b>${userNickname }</b></div>
						<div class="ml-3">#오늘의 일상</div>
					</div>
					<div class="w-100">
					<hr>
					</div>
					<div id="comment-box" class="d-flex flex-column">
						<c:forEach var="i" begin="0" end="1" step="1">
						<div class="d-flex">
							<div class="ml-4"><b>${userLoginId }</b></div>
							<div class="ml-3">피드 잘보고 갑니다~</div>
						</div>
						</c:forEach>
						<div class="d-flex mt-3">
							<input type="text" class="form-control" placeholder="댓글 입력...">
							<button type="submit" class="btn btn-success">추가</button>
						</div>
					</div>
				</div>
			</c:forEach>
			</article>
			<article id="user" class="ml-5">
				<div class="d-flex align-items-center mt-3 btn" data-toggle="dropdown">
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
						<a href="#" class="dropdown-item">프로필 보기</a>
						<a href="#" class="dropdown-item">프로필 설정</a>
						<a href="#" class="dropdown-item">스토리 작성</a>
						<a href="#" class="dropdown-item">게시글 작성</a>
						<div class="dropdown-divider"></div>
						<a id="signoutBtn" href="#" class="dropdown-item">로그아웃</a>
					</div>
				</div>
			</article>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			$(".moreBtn").click(function() {
				
			});
			
			$("#signoutBtn").click(function() {
				location.href="/user/sign_out";
			});
			
			$(".like-box").click(function() {
				
			});
			
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${userName }(${userNickname }) - marondalgram</title>
<link rel="stylesheet" href="/static/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section>
			<article class="d-flex justify-content-center">
				<div class="d-flex w-50" style="padding-bottom:10%; border-bottom:1px solid gray">
					<img src="/static/media/defaultProfileImg.png" alt="default" class="ml-4" style="width:150px; height:150px; border-radius:150px">
					<div style="margin-left:15%">
						<div class="d-flex align-items-center">
							<h2>${userNickname }</h2>
							<button type="button" class="btn btn-primary ml-3 mb-2">프로필 편집</button>
						</div>
						<div class="mt-3">
							<span class="mr-3">게시물</span><b>56</b>
							<span class="mx-3">팔로워</span><b>321</b>
							<span class="mx-3">팔로잉</span><b>135</b>
						</div>
					</div>
				</div>
			</article>
			<div class="d-flex justify-content-center">
				<div class="d-flex justify-content-around w-25">
					<div id="myFeedBtn" style="border:none; color:gray; border-top:5px solid blue; background-color:white; cursor:pointer;">게시물</div>
					<div id="myFollowerBtn" style="border:none; color:gray; background-color:white; cursor:pointer;">팔로워</div>
					<div id="myFollowingBtn" style="border:none; color:gray; background-color:white; cursor:pointer;">팔로잉</div>
				</div>
			</div>
			<article class="d-flex justify-content-center">
				<div id="feedList" class="w-50">
					<div class="d-flex flex-wrap justify-content-between mt-4">
						<c:forEach var="i" begin="1" end="10">
						<img src="/static/media/defaultProfileImg.png" alt="default" width=240px height=240px class="mb-4">
						</c:forEach>
					</div>
				</div>
				<div id="followerList" class="w-50 d-none">
					<div class="mt-4">
						<table class="table text-center">
							<tbody>
							<c:forEach var="i" begin="1" end="10">
								<tr>
									<td><img src="/static/media/defaultProfileImg.png" alt="default" width=30px height=30px></td>
									<td>${userName }(${userNickname })</td>
									<td><button type="button" class="btn btn-danger">삭제</button></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div id="followingList" class="w-50 d-none">
					<div class="mt-4">
						<table class="table text-center">
							<tbody>
							<c:forEach var="i" begin="1" end="5">
								<tr>
									<td><img src="/static/media/defaultProfileImg.png" alt="default" width=30px height=30px></td>
									<td>${userName }(${userNickname })</td>
									<td><button type="button" class="btn btn-danger">팔로우 취소</button></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</article>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#myFeedBtn").on("click", function() {
			$(this).css("border-top", "5px solid blue");
			$("#myFollowerBtn").css("border-top", "none");
			$("#myFollowingBtn").css("border-top", "none");
			
			$("#feedList").removeClass("d-none");
			$("#followerList").addClass("d-none");
			$("#followingList").addClass("d-none");
		});
		
		$("#myFollowerBtn").on("click", function() {
			$(this).css("border-top", "5px solid blue");
			$("#myFeedBtn").css("border-top", "none");
			$("#myFollowingBtn").css("border-top", "none");
			
			$("#feedList").addClass("d-none");
			$("#followerList").removeClass("d-none");
			$("#followingList").addClass("d-none");
		});
		
		$("#myFollowingBtn").on("click", function() {
			$(this).css("border-top", "5px solid blue");
			$("#myFollowerBtn").css("border-top", "none");
			$("#myFeedBtn").css("border-top", "none");
			
			$("#feedList").addClass("d-none");
			$("#followerList").addClass("d-none");
			$("#followingList").removeClass("d-none");
		});
	});
</script>
</html>
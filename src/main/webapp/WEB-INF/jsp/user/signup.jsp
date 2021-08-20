<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마론달그램 - 회원가입</title>
<link rel="stylesheet" href="/static/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<form id="signupForm" method="post" action="/user/sign_up">
		<section class="d-flex justify-content-center align-items-center mt-5">
		<div id="signup-box" class="w-50">
			<div class="d-flex flex-column justify-content-center align-items-center">
				<h1 class="text-center mt-5"><i>Marondalgram</i></h1>
				<div class="d-flex align-items-end w-50">
					<input type="text" id="loginIdInput" class="form-control mt-5 w-100" name="loginId" placeholder="아이디">
					<button type="submit" id="loginIdDuplicateCheckBtn" class="btn btn-success ml-3 h-75">중복 확인</button>
				</div>
				<input type="text" id="nameInput" class="form-control mt-3 w-50" name="name" placeholder="이름">
				<input type="text" id="nicknameInput" class="form-control mt-3 w-50" name="nickname" placeholder="닉네임">
				<input type="text" id="emailInput" class="form-control mt-3 w-50" name="email" placeholder="이메일">
				<input type="password" id="passwordInput" class="form-control mt-3 w-50" name="password" placeholder="비밀번호">
				<div class="d-flex align-items-end w-50">
					<input type="password" id="passwordConfirmInput" class="form-control mt-3 w-100" placeholder="비밀번호 확인">
					<button type="submit" id="passwordCheckBtn" class="btn btn-success ml-3 h-75">확인</button>
				</div>
				<small id="correctPassword" class="text-success w-50 d-none">비밀번호가 일치합니다.</small>
				<small id="differentPassword" class="text-danger w-50 d-none">비밀번호가 다릅니다. 다시 입력하세요.</small>
				</div>
				<div class="d-flex flex-column justify-content-center align-items-center">
				<button type="submit" id="signupBtn" class="btn btn-primary mt-3 w-50">회원가입</button>
				<div id="hr-box" class="w-50 mt-3">
				<hr>
				</div>
				<div class="w-50 d-flex justify-content-around align-items-center mb-5">
					<span>계정이 있으신가요?</span>
					<a href="/user/signin_view" class="btn btn-info">로그인</a>
				</div>
			</div>
		</div>
		</section>
		</form>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#passwordCheckBtn").on("click", function() {
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				if(password == passwordConfirm) {
					$("#correctPassword").removeClass("d-none");
					$("#differentPassword").addClass("d-none");
					return false;
				}
				else {
					$("#differentPassword").removeClass("d-none");
					$("#correctPassword").addClass("d-none");
					return false;
				}
			});
			$("#signupBtn").on("submit", function(event) {
				
				event.preventDefault();
				
				var loginId = $("#loginIdInput").val().trim();
				var name = $("#nameInput").val().trim();
				var nickname = $("#nicknameInput").val().trim(); 
				var email = $("#emailInput").val().trim();
				var password = $("#passwordInput").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력하세요.");
					return false;
				}
				if(name == null || name == "") {
					alert("이름을 입력하세요.");
					return false;
				}
				if(nickname == null || nickname == "") {
					alert("닉네임을 입력하세요.");
					return false;
				}
				if(email == null || email == "") {
					alert("이메일을 입력하세요.");
					return false;
				}
				if(password == null || password == "") {
					alert("패스워드를 입력하세요.");
					return false;
				}
				if(password != passwordConfirm) {
					return false;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"loginId":loginId, "name":name, "nickname":nickname, "email":email, "password":password},
					success:function(data) {
						if(data.result == "success") {
							event.currentTarget.submit();
							alert("회원가입 되었습니다.");
							location.href="/user/signin_view";
						}
						else {
							alert("회원가입에 실패 했습니다.");
						}
					},
					error:function(e) {
						alert("error");
					}
				});
				return false;
			});
		});
	</script>
</body>
</html>
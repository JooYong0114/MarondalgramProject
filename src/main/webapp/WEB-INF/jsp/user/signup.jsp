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
		<section class="d-flex justify-content-center align-items-center mb-5">
		<div id="signup-box">
			<form id="signupForm">
			<div class="d-flex flex-column justify-content-center align-items-center">
				<h1 class="text-center mt-5"><i>Marondalgram</i></h1>
				<div class="d-flex align-items-end w-50">
					<input type="text" id="loginIdInput" class="form-control mt-5 w-100" name="loginId" placeholder="아이디">
					<button type="button" id="idDuplicateCheckBtn" class="btn btn-success ml-3 h-75">중복 확인</button>
				</div>
				<small id="avaliableId" class="text-success w-50 ml-2 d-none">사용가능한 아이디 입니다.</small>
				<small id="duplicatedId" class="text-danger w-50 ml-2 d-none">중복된 아이디 입니다.</small>
				<input type="text" id="nameInput" class="form-control mt-3 w-50" name="name" placeholder="이름">
				<input type="text" id="nicknameInput" class="form-control mt-3 w-50" name="nickname" placeholder="닉네임">
				<input type="text" id="emailInput" class="form-control mt-3 w-50" name="email" placeholder="이메일">
				<input type="password" id="passwordInput" class="form-control mt-3 w-50" name="password" placeholder="비밀번호">
				<div class="d-flex align-items-end w-50">
					<input type="password" id="passwordConfirmInput" class="form-control mt-3 w-100" placeholder="비밀번호 확인">
					<button type="button" id="passwordCheckBtn" class="btn btn-success ml-3 h-75">확인</button>
				</div>
				<small id="correctPassword" class="text-success w-50 ml-2 d-none">비밀번호가 일치합니다.</small>
				<small id="differentPassword" class="text-danger w-50 ml-2 d-none">비밀번호가 다릅니다. 다시 입력하세요.</small>
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
			</form>
		</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			
			var DuplicateIdCheck = false;
			var isDuplicate = true;
			var passwordCheck = false;
			var correctPassword = false;
			
			$("#idDuplicateCheckBtn").on("click", function() {
				
				var loginId = $("#loginIdInput").val().trim();
				
				DuplicateIdCheck = true;
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력하세요.");
					return false;
				}
				
				$.ajax({
					type:"get",
					url:"/user/id_duplicate_check",
					data:{"loginId":loginId},
					success:function(data) {
						if(data.result == false) {
							isDuplicate = false;
							$("#avaliableId").removeClass("d-none");
							$("#duplicatedId").addClass("d-none");
						}
						else {
							isDuplicate = true;
							$("#avaliableId").addClass("d-none");
							$("#duplicatedId").removeClass("d-none");
						}
					},
					error:function(e) {
						alert("error");
					}
				});
				
			});
			
			$("#passwordCheckBtn").on("click", function() {
				
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				
				passwordCheck = true;
				
				if(password == passwordConfirm) {
					correctPassword = true;
					$("#correctPassword").removeClass("d-none");
					$("#differentPassword").addClass("d-none");
					return false;
				}
				else {
					correctPassword = false;
					$("#differentPassword").removeClass("d-none");
					$("#correctPassword").addClass("d-none");
					return false;
				}
			});
			$("#signupBtn").on("click", function(event) {
				
				var loginId = $("#loginIdInput").val().trim();
				var name = $("#nameInput").val().trim();
				var nickname = $("#nicknameInput").val().trim(); 
				var email = $("#emailInput").val().trim();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				
				event.preventDefault();
				
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
				if(DuplicateIdCheck == false) {
					alert("아이디 중복 확인 해주세요.");
					return false;
				}
				if(passwordCheck == false) {
					alert("비밀번호 일치 확인 해주세요.");
					return false;
				}
				if(isDuplicate == true 
						|| correctPassword == false) {
					return false;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_up",
					data:{"loginId":loginId, "name":name, "nickname":nickname, "email":email, "password":password},
					success:function(data) {
						if(data.result == "success") {
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

			});
		});
	</script>
</body>
</html>
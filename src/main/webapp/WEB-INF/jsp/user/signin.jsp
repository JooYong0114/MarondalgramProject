<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마론달그램 - 로그인</title>
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
		<div id="login-box">
			<div class="h-100 d-flex flex-column justify-content-center align-items-center">
				<form id="loginForm" method="post" action="/user/sign_in">
				<h1 class="text-center"><i>Marondalgram</i></h1>
				<input type="text" id="loginIdInput" class="form-control mt-5 w-100" name="loginId" placeholder="아이디">
				<input type="password" id="passwordInput"  class="form-control mt-3 w-100" name="password" placeholder="비밀번호">
				<button type="submit" id="loginBtn" class="btn btn-primary mt-3 w-100">로그인</button>
				</form>
				<div id="hr-box" class="w-50 mt-3">
				<hr>
				</div>
				<div class="w-50 d-flex justify-content-around align-items-center mb-5">
					<span>계정이 없으신가요?</span>
					<a href="/user/signup_view" class="btn btn-info">회원가입</a>
				</div>
			</div>
		</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#loginForm").on("submit", function(event) {
				
				event.preventDefault();
				
				var loginId = $("#loginIdInput").val().trim();
				var password = $("#passwordInput").val();
				
				if(loginId == null || loginId == "") {
					alert("아이디를 입력하세요.");
					return false;
				}
				if(password == null || password == "") {
					alert("패스워드를 입력하세요.");
					return false;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success") {
							location.href="/feed/main_view";
						}
						else {
							alert("아이디 또는 비밀번호를 확인하세요.");							
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
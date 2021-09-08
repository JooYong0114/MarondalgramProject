<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="d-flex justify-content-between align-items-center mb-5">
	<h2 id="header" class="ml-5" style="cursor:pointer;" data-user-nickname=${userNickname }><i>Marondalgram</i></h2>
</header>
<script>
	$("#header").on("click", function() {
		var userNickname = $(this).data("user-nickname");
		if(userNickname == null) {
			location.href="/user/signin_view";
		}
		else {
			location.href="/feed/main_view";			
		}
	});
</script>
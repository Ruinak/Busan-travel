<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Respect Your Busan!</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap');
.container, nav { 
	font-family: 'Nanum Gothic', sans-serif;
}
.nav-link { 
	font-size: 24px;
	width: 200px;
	text-align:center;
}
#home{
	font-size: 24px;
	width: 250px;
	margin-left: 100px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<!-- <a class="navbar-brand" href="/">Home </a> -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<sec:authorize access="isAnonymous()">
				<ul class="navbar-nav">
					<li class="nav-item">
					<a class="nav-link" href="/" id="home" >Respect Your Busan</a></li>
					<li class="nav-item"><a class="nav-link" href="/login" id="login" >로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="/join" id="join">회원가입</a></li>
					<li class="nav-item"><a class="nav-link" href="/board/boardMain" id="notice">공지사항</a></li>
				</ul>
			</sec:authorize>
			<c:choose>
				<c:when test="${principal.user.role == 'ROLE_ADMIN'}">
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link" href="/admin/userlist" id="userManager">회원 관리</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/blog/blogMain" id="board">여행 이야기 관리</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/board/boardMain" id="notice">공지사항 관리</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/logout">로그아웃(<sec:authentication
										property="principal.user.username" />)</a>
							</li>
						</ul>
					</sec:authorize>
				</c:when>
				<c:otherwise>
					<sec:authorize access="isAuthenticated()">
						<ul class="navbar-nav">
							<li class="nav-item">
							<a class="nav-link" href="/" id="home" >Respect Your Busan</a></li>
							<li class="nav-item">
								<a class="nav-link" href="/user/${principal.user.id}/update" 
										id="update">회원 정보 수정</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/busan/popular" id="popular1">인기 관광지</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/restaurant/restaurant" id="popular2">인기 맛집</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/blog/blogMain" id="travel">여행이야기</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/etc/info" id="corona" >With Corona</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/board/boardMain" id="notice">공지사항</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="/logout">로그아웃(<sec:authentication
											property="principal.user.username" />)
								</a>
							</li>
						</ul>
					</sec:authorize>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
	<br>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
console.log(window.location.pathname)
$("#login").removeClass("active")
$("#join").removeClass("active")
$("#popular1").removeClass("active")
$("#popukar2").removeClass("active")
$("#travel").removeClass("active")
$("#corona").removeClass("active")
$("#notice").removeClass("active")
$("#update").removeClass("active")
$("#travel").removeClass("active")
$("#userManager").removeClass("active")
$("#home").removeClass("active")
switch (window.location.pathname) {
	case "/login":
		$("#login").addClass("active")
		break;
	case "/join":
		$("#join").addClass("active")
		break;
	case "/":
		$("#home").addClass("active")
		break;
	case "/etc/info":
		$("#corona").addClass("active")
		break;
	case "/board/notice":
		$("#notice").addClass("active")
		break;
	case "/board":
		$("#travel").addClass("active")
		break;
	case "/user/${principal.user.id}/update":
		$("#update").addClass("active")
		break;
	case "/admin/userlist":
		$("#userManager").addClass("active")
		break;	
}
</script>
</body>
</html>
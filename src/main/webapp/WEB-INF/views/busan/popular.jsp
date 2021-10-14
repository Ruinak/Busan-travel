<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 관광지</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Materialize -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
	#text {
		font-size: 22px;
		font-weight: 700;
		center-align;
	}
	a {
		color: black;
		text-decoration: none;
	}
	img {
		width: 417px;
		height: 320px;
	}
	hr {
		border : solid 1px;
	}
</style>
</head>
<body>
	<div class="container">
		<h3 style="text-align: center">인기 관광지</h3><hr>
		<!-- 검색 창 -->
		<div style="margin: 1rem" class="float-center">
			<form class="form-inline" action="" id="saerchForm">
				<div class="form-group" style="float:left; width:10%">
					<label for="sel1"></label> 
					<select class="form-control" id="sel1">
						<option>검색</option>
						<option>관광지명</option>
						<option>제목+내용</option>
					</select>
				</div>
				<input class="form-control mr-sm-2" type="text" placeholder="Search" id="search" name="" 
					style="float:center; width:75%; margin-left: 3%;">
				<button class="btn btn-success" type="submit"
					onclick="onSearch(event)" style="float:right; width:10%;">Search</button>
			</form>
		</div>
		<!-- 테마 분류 -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">				
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#">자연</a></li>
						<li class="nav-item"><a class="nav-link" href="#">전시/체험</a></li>
						<li class="nav-item"><a class="nav-link" href="#">예술/건축물</a></li>
						<li class="nav-item"><a class="nav-link" href="#">운동/트레킹</a></li>
						<li class="nav-item"><a class="nav-link" href="#">가족/반려동물</a></li>
						<li class="nav-item"><a class="nav-link" href="#">공원</a></li>
						<li class="nav-item"><a class="nav-link" href="#">야경</a></li>
						<li class="nav-item"><a class="nav-link" href="#">사진</a></li>
						<li class="nav-item"><a class="nav-link" href="#">책</a></li>
						<li class="nav-item"><a class="nav-link" href="#">캠핑</a></li>
						<li class="nav-item"><a class="nav-link" href="#">역사/종교</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- Image Card -->
		<div class="row center-align">
			<c:forEach var="spot" items="${spots.content}">
				<div class="col-md-4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<a href="/busan/${spot.id}">
								<img class="activator" src="${spot.thumurl }">
							</a>							
						</div>
						<div class="card-content">
							<a href="/busan/${spot.id}">
								<span id="text">${spot.sight }</span>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 페이징 코드 -->
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${spots.first}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${spots.number-1}">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item "><a class="page-link"
						href="?page=${spots.number-1}">이전</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${spots.totalPages}" step="1">
				<c:choose>
					<c:when test="${i eq spots.number+1}">
						<li class="page-item active"><a class="page-link"
							href="?page=${i-1}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item "><a class="page-link"
							href="?page=${i-1}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${spots.last}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${spots.number+1}">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${spots.number+1}">다음</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
<script>
function onSearch(event) {
	event.preventDefault()
	let gubun = $("#sel1 option:selected").val() //sel 값을 받아옴
	console.log(gubun)
	if (gubun == "검색") {
		alert("검색 구분자를 선택하세요!")
		return false;
	}
	let text = $("#search").val()
	if (text == "") {
		alert("검색어를 입력 하세요");
		$("#search").focus();
		return false;
	}
	window.location = "/busan/search" + "?page=0&gubun=" + gubun
			+ "&text=" + text;
}
</script>
</body>
</html>
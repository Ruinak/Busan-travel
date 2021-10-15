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
		<h3 style="text-align: center">인기 맛집</h3><hr>
		<!-- 검색 창 -->
		<div style="margin: 1rem" class="float-center">
			<form class="form-inline" action="" id="saerchForm">
				<div class="form-group" style="float:left; width:10%">
					<label for="sel1"></label> 
					<select class="form-control" id="sel1">
						<option>검색</option>
						<option>가게이름</option>
						<option>제목+내용</option>
					</select>
				</div>
				<input class="form-control mr-sm-2" type="text" placeholder="Search" id="search" name="" 
					style="float:center; width:75%; margin-left: 3%;">
				<button class="btn btn-success" type="submit"
					onclick="onSearch(event)" style="float:right; width:10%;">검색</button>
			</form>
		</div>
		<!-- Image Card -->
		<div class="row center-align">
			<c:forEach var="restaurant" items="${restaurants.content}">
				<div class="col-md-4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<a href="/restaurant/${restaurant.id}">
								<img class="activator" src="${restaurant.thumurl }">
							</a>
						</div>
						<div class="card-content">
							<a href="/restaurant/${restaurant.id}">
								<span id="text">${restaurant.restaurant }</span>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 페이징 코드 -->
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${restaurants.first}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${restaurants.number-1}">&lt</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item "><a class="page-link"
						href="?page=${restaurants.number-1}">&lt</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${restaurants.totalPages}" step="1">
				<c:choose>
					<c:when test="${i eq restaurants.number+1}">
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
				<c:when test="${restaurants.last}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${restaurants.number+1}">></a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${restaurants.number+1}">></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
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
	window.location = "/restaurant/search" + "?page=0&gubun=" + gubun
			+ "&text=" + text;
}
</script>
</body>
</html>
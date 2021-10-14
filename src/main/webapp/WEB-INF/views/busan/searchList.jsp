<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<style>
h6 {
	color: blue;
}
.card:hover {
	color: silver;
	cursor: pointer;
}
img {
	width: 300px;
	height: 180px;
}
#sel1, input, button {
	font-family: 'Poor Story', cursive;
}
</style>
</head>
<body>
	<div class="container">
		<h2>'${searchDto.text}'에 대한 검색 결과</h2>
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
					onclick="onSearch(event)" style="float:right; width:10%;">검색</button>
			</form>
		</div>
		<c:forEach var="spot" items="${spots.content}">
			<div class="card m-3" onClick="location.href='/busan/${spot.id }'">
				<div class="card-body">
					<div style="float:left; width:30%;"> 
						<img class="activator" src="${spot.thumurl }">
					</div> 
					<div style="float:left; width:50%;"> 
						<h4>${spot.sight}</h4>
						<h5>${spot.title}</h5>
						<h6>${spot.tag}</h6>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- 페이징 코드 -->
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${spots.first}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${spots.number-1}&gubun=${searchDto.gubun}&text=${searchDto.text}">이전</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item "><a class="page-link"
						href="?page=${spots.number-1}&gubun=${searchDto.gubun}&text=${searchDto.text}">이전</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${spots.totalPages}" step="1">
				<c:choose>
					<c:when test="${i eq spots.number+1}">
						<li class="page-item active"><a class="page-link"
							href="?page=${i-1}&gubun=${searchDto.gubun}&text=${searchDto.text}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item "><a class="page-link"
							href="?page=${i-1}&gubun=${searchDto.gubun}&text=${searchDto.text}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${spots.last}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${spots.number+1}&gubun=${searchDto.gubun}&text=${searchDto.text}">다음</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${spots.number+1}&gubun=${searchDto.gubun}&text=${searchDto.text}">다음</a></li>
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
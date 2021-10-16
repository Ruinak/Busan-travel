<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 검색 목록</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/searchList.css">
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
						<option>가게이름</option>
						<option>제목+내용</option>
						<option>해시태그</option>
					</select>
				</div>
				<input class="form-control mr-sm-2" type="text" placeholder="Search" id="search" name="" 
					style="float:center; width:75%; margin-left: 3%;">
				<button class="btn btn-success" type="submit"
					onclick="onSearch(event)" style="float:right; width:10%;">검색</button>
			</form>
		</div>
		<c:forEach var="restaurant" items="${restaurants.content}">
			<div class="card m-3" onClick="location.href='/restaurant/${restaurant.id }'">
				<div class="card-body">
					<div style="float:left; width:30%;"> 
						<img class="activator" src="${restaurant.thumurl }">
					</div> 
					<div style="float:left; width:50%;"> 
						<h4>${restaurant.restaurant}</h4>
						<h5>${restaurant.menu}</h5>
						<h6>${restaurant.address}</h6>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- 페이징 코드 -->
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${restaurants.first}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${restaurants.number-1}&gubun=${searchDto.gubun}&text=${searchDto.text}">&lt</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item "><a class="page-link"
						href="?page=${restaurants.number-1}&gubun=${searchDto.gubun}&text=${searchDto.text}">&lt</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${restaurants.totalPages}" step="1">
				<c:choose>
					<c:when test="${i eq restaurants.number+1}">
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
				<c:when test="${restaurants.last}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${restaurants.number+1}&gubun=${searchDto.gubun}&text=${searchDto.text}">></a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${restaurants.number+1}&gubun=${searchDto.gubun}&text=${searchDto.text}">></a></li>
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
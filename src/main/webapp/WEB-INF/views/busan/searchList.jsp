<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 검색 목록</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/searchList.css">
</head>
<body>
	<div class="container">
		<h2>'${searchText }'에 대한 검색 결과</h2>
		<!-- 검색 창 시작 -->
		<div style="margin: 1rem" class="float-center">
			<form class="form-inline" action="" id="saerchForm">
				<div class="form-group" style="float:left; width:10%">
					<label for="sel1"></label> 
					<select class="form-control" id="searchType">
						<option value="">검색</option>
						<option value="sight">관광지명</option>
						<option value="detail">제목+내용</option>
						<option value="tag">해시태그</option>
					</select>
				</div>
				<input class="form-control mr-sm-2" type="text" placeholder="Search" id="searchText" name="" 
					style="float:center; width:75%; margin-left: 3%;">
				<button class="btn btn-success" type="submit"
					onclick="onSearch(event);" style="float:right; width:10%;">검색</button>
			</form>
		</div>
		<!-- 검색 창 끝-->
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
						href="?${menu }=${searchText }&page=${spots.number-1}">&lt</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item "><a class="page-link"
						href="?${menu }=${searchText }&page=${spots.number-1}">&lt</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${spots.totalPages}" step="1">
				<c:choose>
					<c:when test="${i eq spots.number+1}">
						<li class="page-item active"><a class="page-link"
							href="?${menu }=${searchText }&page=${i-1}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item "><a class="page-link"
							href="?${menu }=${searchText }&page=${i-1}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${spots.last}">
					<li class="page-item disabled"><a class="page-link"
						href="?${menu }=${searchText }&page=${spots.number+1}">></a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?${menu }=${searchText }&page=${spots.number+1}">></a></li>
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
	let searchType = $("#searchType option:selected").val()
	let searchText = $("#searchText").val()

	window.location="/busan/search?"+searchType+"="+searchText+"&page=0";
}
</script>
</body>
</html>
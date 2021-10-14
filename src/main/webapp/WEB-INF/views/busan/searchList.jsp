<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<style>
.card:hover {
	color: silver;
	cursor: pointer;
}

img {
	width: 300px;
	height: 180px;
}
</style>
</head>
<body>
	<div class="container">
		<h3>'${searchDto.text}'에 대한 검색 결과</h3>
		<c:forEach var="spot" items="${spots.content}">
			<div class="card m-3" onClick="location.href='/busan/${spot.id }'">
				<div class="card-body">
					<div style="float:left; width:30%;"> 
						<img class="activator" src="${spot.thumurl }">
					</div> 
					<div style="float:left; width:50%;"> 
						<h5>${spot.sight}</h5>
						<h6>${spot.title}</h6>
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
</body>
</html>
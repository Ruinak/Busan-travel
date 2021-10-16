<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행이야기 목록</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/blog.css">
</head>
<body>
<div class="container">
	<h1>나만의 여행 이야기</h1> <br>
	<div style="margin: 1rem" class="float-right">
		<form class="form-inline" action="" id="saerchForm">
			<span class="m-3"><a href="/blog/blogForm" class="btn btn-success">블로그 쓰기</a></span> <br>
			<div class="form-group">
				<label for="sel1"></label> 
				<select class="form-control" id="sel1">
					<option>검색</option>
					<option>작성일</option>
					<option>아이디</option>
					<option>제목+내용</option>
				</select>
			</div>
			<input class="form-control mr-sm-2" type="text" placeholder="Search" id="search" name="">
			<button class="btn btn-success" type="submit" onclick="onSearch(event)">Search</button>
		</form>
	</div>

	<div class="clearfix"></div> 
	
	<div>
		<c:forEach var="item" items="${lists.content }">
			<div id="card" class="card m-2" style="text-align: center;" display="inline-block; ">
				<div class="card-body" >
				<span>${item.id}</span> /
					<javatime:format value="${item.createDate}" pattern="yyyy.MM.dd" />
					/ <span style="font-size: 20px;">${item.user.username}</span> / <span>⬆조회수(${item.count })</span>
					 / <span>⬆댓글수(${item.replyCount })</span> / <span>좋아요(${item.likeCount})</span> <hr>
					<h4 class="card-title" id="h1" style="color: #1E90FF;">${item.title}</h4> <hr>
					<p>${item.content}</p> <hr>
					<a href="/blog/blogDetail/${item.id}" class="btn btn-primary float-right">상세 보기</a>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<div class="clearfix"></div> <br>
	
	<div>
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${lists.first}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${lists.number-1}&gubun=${param.gubun}&text=${param.text}">&lt</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item "><a class="page-link"
						href="?page=${lists.number-1}&gubun=${param.gubun}&text=${param.text}">&lt</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="1" end="${lists.totalPages}" step="1">
				<c:choose>
					<c:when test="${i eq lists.number+1}">
						<li class="page-item active"><a class="page-link"
							href="?page=${i-1}&gubun=${param.gubun}&text=${param.text}">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item "><a class="page-link"
							href="?page=${i-1}&gubun=${param.gubun}&text=${param.text}">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${lists.last}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${lists.number+1}&gubun=${param.gubun}&text=${param.text}">></a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${lists.number+1}&gubun=${param.gubun}&text=${param.text}">></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
<script>
function imageExtract(text) {
	let myRe = /<img .*?>/g;
	let myArray = myRe.exec(text);
	//console.log(myArray.length);
	if (myArray.length > 0) {
		/* console.log(myArray[0]); */
		let mytext = myArray[0];
		let myRe2 = /width: \d+(px|%)/;
		//let myArray = myRe.exec(mytext);
		let abc = mytext.replace(myRe2, 'width: 200px; height: 150px')
		//console.log(abc)
		return abc;
	} else {
		return "";
	}
}
/* imageExtract(); */
$(document).ready(function() {
	let array = new Array();
	//var temp = "";
	<c:forEach var="item" items="${lists.content }">
	//temp = '${item.content}';
	//temp = imageExtract(temp)
	//console.log(temp)
	array.push(imageExtract('${item.content}'))
	</c:forEach>
	//console.log(array)
	array.forEach(function(item, index, arr2) {
		//console.log(item)
		$("p[name='myname']:eq(" + index + ")").html(item);
	})
});
</script>
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
		window.location = "/blog/findbytext" + "?page=0&gubun=" + gubun
				+ "&text=" + text
	}
</script>
</body>
</html>
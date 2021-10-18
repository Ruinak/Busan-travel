<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Respect Your Busan</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/board.css">
</head>
<body>
<div class="container">
	<h1>Questions n Answers</h1> <hr id="hr"> <br> <br>
	<table class="table table-hover" style="text-align: center">
		<thead class="thead-light " style="font-wiehgt: bold;">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${boards.content}">
				<tr>
					<td>${board.id}</td>
					<td><a href="/board/${board.id}" style="text-decoration: none">${board.title}</a></td>
					<td>${board.user.username}</td>
					<td><javatime:format value="${board.createDate}" pattern="yyyy.MM.dd" /></td>
					<td>${board.count}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<button id="btn" class="btn btn-dark"
			onclick="location='/board/boardWrite'">QnA 쓰기</button>
	</div> <br> <br> <br>
	<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${boards.first}">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${boards.number-1}&gubun=${param.gubun}&text=${param.text}">&lt</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item "><a class="page-link"
					href="?page=${boards.number-1}&gubun=${param.gubun}&text=${param.text}">&lt</a></li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="1" end="${boards.totalPages}" step="1">
			<c:choose>
				<c:when test="${i eq boards.number+1}">
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
			<c:when test="${boards.last}">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${boards.number+1}&gubun=${param.gubun}&text=${param.text}">></a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="?page=${boards.number+1}&gubun=${param.gubun}&text=${param.text}">></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div> <br>
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
		window.location = "/board/findbytext" + "?page=0&gubun=" + gubun
				+ "&text=" + text
	}
</script>
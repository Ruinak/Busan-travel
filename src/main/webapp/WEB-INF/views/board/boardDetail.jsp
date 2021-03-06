<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/blog.css">
</head>
<body>
<div class="container">
	<h1>공지사항</h1> <br>
	<div class="form-group">
		<label for="id">글 번호:</label> <input type="text" name="id"
			class="form-control" value="${board.id }" disabled="disabled">
	</div>
	<div class="form-group">
		<label for="username">글 작성자:</label> <input type="text"
			name="username" class="form-control" value="${board.user.username}"
			disabled="disabled">
	</div>
	<div class="form-group">
		<label for="title">제목: </label> <input type="text" name="title"
			class="form-control" value="${board.title}" disabled="disabled">
	</div>
	<div class="form-group">
		<label for="content">내용: </label>
		<div style="border: 2px solid #d3d3d3; border-width:1px; border-radius: 5px;  padding:10px">
			${board.content}
		</div>
	</div> <br> <br>
	<div class="float-right">
		<button type="button" class="btn btn-dark"
			onclick="history.back()">목록으로</button>
	</div>
</div><br><br><br>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
</body>
</html>
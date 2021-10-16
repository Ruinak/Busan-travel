<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 로그인</title>
<link rel="stylesheet" href="/css/user.css">
</head>
<body>
	<form action="/login" method="post">
		<div id="container" class="container"> <br>
			<h1 id="title">로그인</h1> <br>
			<div class="form-group">
				<label for="username">아이디:</label> <input type="text"
					name="username" class="form-control" placeholder="아이디를 입력하세요"
					required="required" maxlength="20">
			</div>
			<div class="form-group">
				<label for=password>비밀번호:</label> <input type="password"
					name="password" class="form-control" placeholder="비밀번호를 입력하세요"
					required="required">
			</div> <br>
			<button id="btn" class="btn btn-dark btn-sm btn-block">로그인</button>
			<br>
			<button id="btn" type="button" class="btn btn-dark btn-sm btn-block"
				onclick="location.href='/'">메인페이지</button>
		</div>
	</form> <br> <br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	width: 30%;
	margin: auto;
	font-size: 22px;
}
#btn, #btnDelete {
	font-size: 24px;
}
#title {
	text-align: center;
}
.form-check-inline {
	margin: 5px;
}
</style>
</head>
<body>
	<form action="/login" method="post">
		<div class="container"> <br> <br>
			<h1 id="title">로그인</h1> <br> <br>
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
	</form><br><br>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
</body>
</html>
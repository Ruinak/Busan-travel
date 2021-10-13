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
	img {
		width: 700px;
		height: 500px;
	}
	#word {
		width: 500px;
		height: 500px;
	}
	ul {
		width: 50%;
		border: solid 1px;
		padding: 0px;
		margin: 1px; 
	}
	#flex {
		display: flex;
	}
	li {
		font-size : 24px;
		padding: 20px;
	}
	hr {
		border : solid 1px;
	}
</style>
</head>
<body>
<div class="container">
	<h1>${ restaurant.restaurant }</h1> <hr>
	<h4>메뉴 : ${ restaurant.menu }</h4> 
	<br>
	<div class="form-group">
		<div class="form-group">
			<img src="${ restaurant.imageurl}">
			<img id="word" src="images/${ restaurant.restaurant }.jpg">
		</div>
		<h3>상세정보</h3>
		<div id="flex">
			<hr>
			<ul>
				<li>주소 : ${ restaurant.address }</li>
				<li>전화번호 : ${ restaurant.call }</li>
				<li>운영시간 : ${ restaurant.hour }</li>
			</ul>
			<ul>
				<li>설명 : <br>${ restaurant.detail }</li>
			</ul>
			
		</div>		
	</div>
	<br> <br>
	<div class="float-right">
		<button type="button" class="btn btn-primary" onclick="history.back()">이전</button>
	</div>	
</div>
<!-- 		<div>
		<table class="table">
			<tr>
				<td>댓글 번호</td>
				<td>댓글 내용</td>
				<td>작성 일자</td>
			</tr>
			<c:forEach items="${ board.comments }" var="comment">
				<tr>
					<td>${ comment.cnum }</td>
					<td>${ comment.content }</td>
					<td><fmt:formatDate value="${ comment.regdate }" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
<script>
	// 댓글 쓰기
	$("#btnComment").click(function() {
		if (${empty principal.user}) {
			alert("로그인하세요")
			location.href="/login";
			return;
		}
		if($("#msg").val == ""){
			alert("댓글을 적으세요");
			return;
		}
		data = {
			"bnum" : $("#num").val(),
			"content" : $("#msg").val()
		}
		$.ajax({
			type : "POST",
			url : "/reply/insert/" + $("#num").val(),
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data)
		})
		.done(function() {
// 			alert("댓글 추가 성공")
			location.href="/board/view/" + $("#num").val();
			return;
		})
		.fail(function() {
			alert("댓글 추가 실패")
		})
	})
	// 댓글 리스트
	var init = function() {
		$.ajax({
			type : "GET",
			url : "/reply/list/" + $("#num").val(),
			data : {
				"bnum" : $("#num").val()
			}
		})
		.done(function(resp) {
//			alert(resp.length);
			var str = "";
			$.each(resp, function(key, val) {
				str += val.user.id + "  "
				str += val.content + "  "
				str += val.regdate + "<br>"
// 				str += "<a href='javascript:fdel("+val.cnum+")'>삭제</a><br>"
			})
			$("#replyResult").html(str);
		})
		.fail(function(e) {
			alert("Error : " + e);
		})
	}
	/*
	// 댓글 삭제
	function fdel(cnum) {
		// alert(cnum)
		if(!confirm('삭제하시겠습니까?'))
			return false;
		$.ajax({
			type : "delete",
			url : "/reply/delete/" + cnum
		})
		.done(function(resp) {
			alert(resp + "번 댓글 삭제 완료")
			init();
		})
		.fail(function(e) {
			alert("댓글 삭제 실패")
		})
	}	// fdel
	*/
	init();
	</script> -->
</body>
</html>
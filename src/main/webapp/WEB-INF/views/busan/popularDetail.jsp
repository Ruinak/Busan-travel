<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 관광지 상세보기</title>
<!-- Materialize -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/popularDetail.css">
</head>
<body>
<div class="container">
	<div id="title">
		<h1>${ spot.sight }</h1> <hr id="hr">
		<h4>${ spot.title }</h4> <br><br>
	</div>
	<div>
		<div>
			<img src="${ spot.imageurl}">
			<img id="word" src="images/${ spot.sight }.jpg">
		</div>
		<h4>상세정보</h4> <hr>
		<p>${ spot.detail }</p> 
		<div id="btn1">
			<button onclick="location.href='/busan/search?page=0&gubun=해시태그&text=${tagspot.tag1}'">#${ tagspot.tag1 }</button>
			<button onclick="location.href='/busan/search?page=0&gubun=해시태그&text=${tagspot.tag2}'">#${ tagspot.tag2 }</button>
			<button onclick="location.href='/busan/search?page=0&gubun=해시태그&text=${tagspot.tag3}'">#${ tagspot.tag3 }</button>
			<button onclick="location.href='/busan/search?page=0&gubun=해시태그&text=${tagspot.tag4}'">#${ tagspot.tag4 }</button>
			<button onclick="location.href='/busan/search?page=0&gubun=해시태그&text=${tagspot.tag5}'">#${ tagspot.tag5 }</button>
			<button onclick="location.href='/busan/search?page=0&gubun=해시태그&text=${tagspot.tag6}'">#${ tagspot.tag6 }</button>
			<button onclick="location.href='/busan/search?page=0&gubun=해시태그&text=${tagspot.tag7}'">#${ tagspot.tag7 }</button>
			<button onclick="location.href='/busan/search?page=0&gubun=해시태그&text=${tagspot.tag8}'">#${ tagspot.tag8 }</button>
			<button onclick="location.href='/busan/search?page=0&gubun=해시태그&text=${tagspot.tag9}'">#${ tagspot.tag9 }</button>
			<button onclick="location.href='/busan/search?page=0&gubun=해시태그&text=${tagspot.tag10}'">#${ tagspot.tag10 }</button>
		</div>
		<hr>
		<div id="flex">		
			<!-- 지도 -->
			<ul>
				<li id="map" style="width: 600px; height: 450px;"></li>
			</ul>	
			<ul>
				<li><br><br><br><br>주소 : ${ spot.address }</li>
				<li>휴무일 : ${ spot.holiday }</li>
				<li>운영시간 : ${ spot.hour }</li>
			</ul>
		</div>
		<hr>		
	</div> <br> <br>
	<div>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col" style="width:25%">댓글 작성자</th>
					<th scope="col" style="width:50%">댓글 내용</th>
					<th scope="col" style="width:25%">작성 일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${clist}">
					<tr>
						<td>${list.writer }</td>
						<td>${list.content }</td>
						<td id="date"><fmt:formatDate value="${ list.regdate }" pattern="yyyy-MM-dd a hh:mm" />						
						<c:if test="${list.user.id == principal.user.id}">
							<button class="btn btn-danger btn-sm badge" style="font-size: 13px">삭제</button>
						</c:if></td>
					</tr>
				</c:forEach>
			</tbody>
		</table><hr>	
		<c:if test="${ not empty principal.user }"><br/>
			<div>
				<textarea rows="3" cols="110" id="msg"></textarea>
				<div class="float-right">
					<button type="button" class="btn btn-primary" id="btnComment">댓글쓰기</button>
				</div>
			</div>
		</c:if>
	</div>
	<div class="float-letf">
		<button id="btn2" type="button" class="btn btn-primary" onclick="history.back()">목록으로</button> <br><br><br>
	</div>
</div>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1253c1261bc7379cfd6cf07b68488458"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script>
	//========================================= 지도 =========================================
	var container = document.getElementById('map'); // 지도를 표시할 div
	var place = '<c:out value="${spot.sight}"/>';
	var latitude = '<c:out value="${spot.latitude}"/>';
	var longitude = '<c:out value="${spot.longitude}"/>';
	var options = {
		center : new kakao.maps.LatLng(latitude,longitude), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	// 지도를 생성
	var map = new kakao.maps.Map(container, options);
	// 마커가 표시될 위치
	var markerPosition = new kakao.maps.LatLng(latitude,longitude); 
	// 마커를 생성
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	// 마커를 지도 위에 표시
	marker.setMap(map);

	//인포윈도우에 들어갈 텍스트, 위치 설정
	var iwContent = '<div style="padding:5px;">'+place+'</div>', 
	iwPosition = new kakao.maps.LatLng(latitude,longitude); 

	// 인포윈도우를 생성
	var infowindow = new kakao.maps.InfoWindow({
		position : iwPosition,
		content : iwContent
	});

	// 마커 위에 인포윈도우를 표시. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됨.
	infowindow.open(map, marker);
	//========================================= 댓글 =========================================
	// 댓글 쓰기
	$("#btnComment").click(function() {
		if($("#msg").val == ""){
			alert("댓글을 입력하세요");
			return;
		}
		data = {
			"content" : $("#msg").val(),
			"writer" : "${principal.user.username}"
		}
		$.ajax({
			type : "POST",
			url : "/comment/insert/" + ${spot.id},
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data)
		})
		.done(function() {
			location.href="/busan/" + ${spot.id};
			return;
		})
		.fail(function() {
			alert("댓글 추가 실패")
		})
	})
/* 	// 댓글 리스트
	var init = function() {
		$.ajax({
			type : "GET",
			url : "/comment/list/" + ${spot.id},
		})
		.done(function(resp) {
			var str1 = "", str2 = "", str3 = "";
			$.each(resp, function(key, val) {
				str1 += val.writer + "<br>"
				str2 += val.content + "<br>"
				str3 += val.regdate + "<br>"
// 				str += "<a href='javascript:fdel("+val.cnum+")'>삭제</a><br>"
			})
			$("#replyResultWriter").html(str1);
			$("#replyResultContent").html(str2);
			$("#replyResultRegdate").html(str3);
		})
		.fail(function() {
			alert("댓글 불러오기 실패");
		})
	}
	init(); */
</script>
</body>
</html>
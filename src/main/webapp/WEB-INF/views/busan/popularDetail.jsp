<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인기 관광지</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
	#hr {
		border : solid 1px;
		width : 50%
	}
	hr {
		border : solid 1px;
	}
	p {
		font-size: 18px;
		margin: 20px;
		line-height: 1.8;
	}
	li {
		font-size : 22px;
		padding: 10px;
	}
	#title {
		text-align: center;
	}
	ul {
		width: 50%;
		padding: 0px;
		margin: 1px; 
	}
	#flex {
		display: flex;
	}
	#btn1{ 
		margin: 20px;
	}	
	#btn2{
		width : 200px;
		height : 60px;
		font-size: 24px;
		background-color: #000000;
	}
	button {
		color: gray;
		border: solid 2px;
		border-color: gray;
		background-color: white;
		padding: 10px 20px 10px 20px;
		border-radius: 5px;
		font-size: 18px;
	}
	button:hover {
		color: fuchsia;
		border-color: fuchsia;
	}
</style>
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
			<button>#${ tagspot.tag1 }</button>
			<button>#${ tagspot.tag2 }</button>
			<button>#${ tagspot.tag3 }</button>
			<button>#${ tagspot.tag4 }</button>
			<button>#${ tagspot.tag5 }</button>
			<button>#${ tagspot.tag6 }</button>
			<button>#${ tagspot.tag7 }</button>
			<button>#${ tagspot.tag8 }</button>
			<button>#${ tagspot.tag9 }</button>
			<button>#${ tagspot.tag10 }</button>
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
	</div>
	
	<br> <br>
	<div class="float-right">
		<button id="btn2" type="button" class="btn btn-primary" onclick="history.back()">이전</button> <br><br><br>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1253c1261bc7379cfd6cf07b68488458"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<script>
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
</script>
</body>
</html>
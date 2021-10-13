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
	#text {
		font-size: 22px;
		font-weight: 700;
		center-align;
	}
	a {
		color: black;
		text-decoration: none;
	}
	img {
		width: 417px;
		height: 320px;
	}
</style>
</head>
<body>
	<div class="container">
		<h3 style="text-align: center">추천 관광지</h3>
		<!-- Image Card -->
		<div class="row center-align">
			<c:forEach var="spot" items="${spots}">
				<div class="col-md-4">
					<div class="card">
						<div class="card-image waves-effect waves-block waves-light">
							<a href="/busan/${spot.id}">
								<img class="activator" src="${spot.thumurl }">
							</a>							
						</div>
						<div class="card-content">
							<a href="/busan/${spot.id}">
								<span id="text">${spot.sight }</span>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
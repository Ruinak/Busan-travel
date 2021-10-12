<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
	<h1>${ spot.sight }</h1>
	<h2>${ spot.title}</h2> 
	<br>
	<div class="form-group">
		<div class="form-group">
			<img src="${ spot.imageurl}">
			
		</div>
		<div>
			<img src="images/test.jpg">
			<h3>상세정보</h3>
			<hr>
			<h5>주소 : ${ spot.address }</h5>
			<h5>휴무일 : ${ spot.holiday }</h5>
			<h5>운영시간 : ${ spot.hour }</h5>
			<h5>설명 : </h5>
			<p>${ spot.detail }</p>
		</div>		
	</div>
	<br> <br>
	<div class="float-right">
		<button type="button" class="btn btn-primary" onclick="history.back()">이전</button>
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<h1>나만의 여행 이야기</h1>
	<div>
		<div style="margin: 1rem" class="float-right">
			<form class="form-inline" action="" id="saerchForm">
				<div class="form-group">
					<label for="sel1"></label> <select class="form-control" id="sel1">
						<option>검색</option>
						<option>모두</option>
						<option>아이디</option>
						<option>이메일</option>
					</select>
				</div>
				<input class="form-control mr-sm-2" type="text" placeholder="Search" id="search" name="">
				<button class="btn btn-success" type="submit" onclick="onSearch(event)">Search</button>
			</form>
		</div>
		<div class="clearfix"></div>
		<c:forEach var="item" items="${lists.content }">
			<div class="card" style="width: 300px">
				<!-- <img class="card-img-top" src="" alt="Card image"> -->
				<div class="card-body">
					<h4 class="card-title">${item.title }</h4>
					<p class="card-text" name="myname"></p>
					<a href="#" class="btn btn-primary">상세 보기</a>
				</div>
			</div>
			<br>
		</c:forEach>
		<button class="btn btn-success btn-sm " onclick="location='/blog/blogForm'">블로그 쓰기</button>
	</div>
</div>
<script>
function imageExtract(text){
	let myRe = /<img .*?>/g;
	let myArray = myRe.exec(text);
	//console.log(myArray.length);
	
	if(myArray.length > 0) {
		/* console.log(myArray[0]); */
		let mytext = myArray[0];
		let myRe2 = /width: \d+(px|%)/;
		//let myArray = myRe.exec(mytext);
		let abc = mytext.replace(myRe2, 'width: 200px; height: 150px')
		console.log(abc)
		return abc;
	} else {
		return "";
	}
}
/* imageExtract(); */
$(document).ready(function(){
	let array = new Array();
	//var temp = "";
			<c:forEach var="item" items="${lists.content }">
				//temp = '${item.content}';
				//temp = imageExtract(temp)
				//console.log(temp)
				array.push(imageExtract('${item.content}'))
			</c:forEach>
	console.log(array)
	array.forEach(function(item,index,arr2){ 
		//console.log(item)
		$("p[name='myname']:eq("+index+")").html(item);
	})
});
</script>
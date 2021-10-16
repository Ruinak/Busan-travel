<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행이야기 쓰기</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/blog.css">
</head>
<body>
	<div class="container">
		<h1>여행이야기 쓰기</h1><br>
		<form>
			<div class="form-group">
				<input type="text"
					class="form-control" placeholder="Enter title" id="title">
			</div>
			<hr>
			<div class="form-group">
				<textarea class="form-control summernote" rows="5" id="content"></textarea>
			</div>
		</form>
		<hr>
		<p style="font-size:12px; color:red;">※사진 첨부시 사진을 클릭하여 사이즈를 50%이하로 줄여 주세요! </p>
		<div class="float-right">
			<button id="btn-save" class="btn btn-info">글쓰기</button>
			<button type="button" class="btn btn-info" onclick="history.back()">목록으로</button>
		</div>
	</div>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
<script>
	$('.summernote').summernote({
		tabsize : 2,
		height : 300,
		placeholder: 'Enter Content'
/* 		toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'video']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	        ] */
	});
</script>
<script src="/js/blog.js"></script>
</body>
</html>
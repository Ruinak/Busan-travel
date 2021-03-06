<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성화면</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- CSS 적용 -->
<link rel="stylesheet" href="/css/board.css">
</head>
<body>
	<div class="container">
		<h1>공지사항 쓰기</h1> <br>
		<form>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="제목을 입력해주세요" id="title">
			</div>
			<hr>
			<div class="form-group">
				<textarea class="form-control summernote" rows="5" id="content"></textarea>
			</div>
		</form> <hr> <br>
		<div class="float-right">
			<button id="btn-save" class="btn btn-info">글쓰기</button>
			<button type="button" class="btn btn-info" onclick="history.back()">이전</button>
		</div>
	</div> <br> <br> <br>
<!-- footer start-->
<%@ include file="../layout/footer.jsp"%>
<!-- footer end -->
<script>
	$('.summernote').summernote({
		tabsize : 2,
		height : 300,
		placeholder: '내용을 입력해주세요'
	});
</script>
<script src="/js/notice.js"></script>
</body>
</html>
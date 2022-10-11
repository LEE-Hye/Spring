<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>Spring MVC01</h2>
		<div class="panel panel-warning">
			<div class="panel-heading">Spring 게시판 만들기</div>
			<div class="panel-body">
				<form class="form-horizontal" action="boardUpdate.do" method="post">
				<!-- action에서 바로 쿼리스트링으로 보내줘도 되고 인풋 타입으로 겉으로는 보이지 않게 idx를 보내줄 수도 있다 -->
				<input type="hidden" value="${board.idx }" name="idx">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">title:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title"
								 name="title" value="${board.title}">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer" >writer:</label>
						<div class="col-sm-10">
							<input type=text class="form-control" id="writer"
								 name="writer" value="${board.writer}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">content:</label>
						<div class="col-sm-10">
							<textarea rows="10" class="form-control" id = "content" name="content">${board.content}</textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer">A강의장 이혜빈</div>
		</div>
	</div>
</body>
</html>

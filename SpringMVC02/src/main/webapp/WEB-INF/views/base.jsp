<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
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
				
				<table class="table table-hover">
					<thead>
						<tr>
							<td>글 번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>
					
					
					<tbody id="tbody">
						
					</tbody>
				</table>
				
			</div>
			<div class="panel-footer">A강의장 이혜빈</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	// boardlist함수를 변수처럼 집어넣었다.
	// 코드는 위에서 아래로 실행이 되는데 사용 후 선언이 왜 되냐면
	// js에서 알아서 정렬해줘서 가능하다. (호이스팅?)
		$(document).ready(boardList);
	
		function boardList(){
			
			$.ajax({
				url : 'boardList.do',
				type :'post',
				success : function(res){
					console.log(res);
				},
				error : function(){
					alert('error');
				}
				
			});
			
	
		}
	</script>
	
	
</body>
</html>

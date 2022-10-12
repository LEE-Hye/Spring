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
			<div class="panel-heading">
				Spring 게시판 만들기
				<button onclick="boardList()" class="btn btn-sm btn-info">목록</button>
				<button onclick="boardWrite()" class="btn btn-sm btn-warning">글쓰기</button>
			</div>
			<div class="panel-body">
				<div class="list" style="display: block;"></div>
				<div class="write" style="display: none;">
					<form class="form-horizontal" id="frm">
						<div class="form-group">
							<label class="control-label col-sm-2" for="title">title:</label>
							<div class="col-sm-10">
								<input type="text" name="title" class="form-control" id="title"
									placeholder="Enter title">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="writer">writer:</label>
							<div class="col-sm-10">
								<input type="text" name="writer" class="form-control"
									id="writer" placeholder="Enter writer">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="content">content:</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="content" name="content" rows="7" cols=""></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" onclick="goInsert()" class="btn btn-default">글작성</button>
								<button type="reset" class="btn btn-default">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="panel-footer">A강의장 이혜빈</div>
		</div>
	</div>


	<script type="text/javascript">
		// boardlist함수를 변수처럼 집어넣었다.
		// 코드는 위에서 아래로 실행이 되는데 사용 후 선언이 왜 되냐면
		// js에서 알아서 정렬해줘서 가능하다. (호이스팅?)
		$(document).ready(boardList); // document안의 리소스가 다 로딩 되고 사용

		function boardList() {

			// $.ajax({}); => ajax안에(중괄호)는 매개변수로 객체를 받는다.
			$.ajax({
				url : 'boardList.do',
				type : 'post',
				dataType : "JSON",
				success : result,
				error : function() {
					alert('error');
				}

			});
			
			$('.write').css('display', 'none');
			$('.list').css('display', 'block');
			
		}

		function result(data) { // data에 JSON Array 형태로 담김

			var table = "<table class='table table-hover table-bordered'>";
			table += "<tr><td>번호</td><td>제목</td><td>작성자</td>";
			table += "<td>조회수</td><td>작성일</td><td>삭제</td></tr>"

			$.each(data, (index, obj)=>{
				table += "<tr>";
				table += "<td>" + (index + 1) + "</td>";
				table += "<td>" + obj.title + "</td>";
				table += "<td>" + obj.writer + "</td>";
				table += "<td>" + obj.count + "</td>";
				table += "<td>" + obj.indate + "</td>";
				table += "<td><button value='"+obj.idx+"' onclick='goDel(this)' class='btn btn-sm btn-info'>삭제</button></td>";
				table += "</tr>";
			});
			
			table += "</table>";

			$('.list').html(table);
		}
		
		
		
		function goDel(e){
			var idx = $(e).attr("value");
			// console.log("삭제 버튼 누름" + idx);
			
			// 실습
			// BoardRestController에 boardDelete.do라는 요청이 들어오면
			// 게시글 idx값을 입력받아 해당되는 게시글을 삭제하는 기능을 만드시오
			
			
			
			$.ajax({
				url : "boardDelete.do",
				// 통신방식(type) 지정 안 해주면 get방식임
				type : "post",
				data:{"idx" : idx}, // json형태로 보냄
				success : boardList,
				error : function(er){
					console.log(er);
				}
				
			});
		}
		
		
		function boardWrite(){
			$('.list').css('display', 'none');
			$('.write').css('display', 'block');
		}
		
		
		function goInsert(){
			// form태그 안에 작성한 값을
			// title = hello&contents=hihi%writer=hodoo
			// form태그 안에 작성한 값을 직렬화 해서 가져온다
			var frmData = $("#frm").serialize();
			
			$.ajax({
				url : 'boardInsert.do',
				type : 'post', // 길이 문제때매 post를 적는게 좋다.
				data : frmData,
				success : boardList,
				error : function(){
					alert("error");
				}
			})
		}
		
	</script>


</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>두 수의 합 구하기</h1>

	num1 : <input type="number" id="num1">
	<br> 
	num2 : <input type="number" id="num2">
	<br>
	<button onclick="request()">더하기</button>

	<hr>

	<!-- 
	
		num1 과 num2 두 수를 POJO에게 보내고
		두 수를 더한 결과를 받아와 
		hr 뒤에
		
		15 + 25 = 40
		형식으로 출력하시오.
	
	 -->
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<!-- 내가 푼 것
	<script>
		function request() {

			// ajax요청하기
			$.ajax({
				url : 'ajax02.do',
				type : 'post',
				data : {
					"num1" : $('#num1').val(),
					"num2" : $('#num2').val()
				},
				success : function(res) {
					console.log('요청성공!');
					console.log('응답받은 내용 : ' + res);

					$('hr').after('<p>' + res + '</p>')
				},
				error : function() {
					alert("error!");
				}
			});
		}
	</script>
 	-->
 	
 	<!-- 선생님이 푼 것 -->
	<script>
		function request() {

			let num1 = $('#num1').val();
			let num2 = $('#num2').val();
			
			// ajax요청하기
			$.ajax({
				url : 'plus.do',
				type : 'post',
				data : {
					"num1" : num1, 
					"num2" : num2
				},
				success : function(res) { 
					console.log('요청성공!');
					console.log('응답받은 내용 : ' + res);

					$('hr').after('<p>' + res + '</p>')
				},
				error : function() {
					alert("error!");
				}
			});
		}
	</script>
</body>
</html>
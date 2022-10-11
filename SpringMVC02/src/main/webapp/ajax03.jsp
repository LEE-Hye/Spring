<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>데이터 응답받기</h1>
	
	<button onclick="request()">데이터 가져오기</button>
	
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript">
	function request(){
		$.ajax({
			url : 'json.do',
			type : 'get',
			dataType : 'json',
			success : function(res){
				console.log(res);
			},
			error : function(){
				alert("error!");
			}
			
		});
	}
	
	</script>
</body>
</html>
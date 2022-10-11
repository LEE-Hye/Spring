<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫 화면</title>
</head>
<body>
<!-- webapp에 'index'라는 이름의 jsp를 만들면 처음 실행할 때 여기로 들어와진다. 
	무조건 index라 지어야 한다.
  -->
welcome

<!-- jsp내장 함수. 굳이 스크립트릿 열어서 이동시킬 필요 없음 -->
<jsp:forward page="boardList.do"></jsp:forward>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<%-- 
					EL : 표현식()
					${스코프에 저장된 이름}
					Scope(page, request, session, application)에서 꺼내서 출력시키는 문법
					(변수 명 같은 걸 쓰는게 아니라 스코프에 저장된 이름을 꺼내서 써야 한다)
					
					<!-- html 주석에서 ${이름} 이라 적으면 서블릿으로 변환 되면서 '${이름}'을 인식해서 오류가 남 -->
					오류 고치는 방법
					1. 지금 감싸진 서블릿 주석을 준다.
					2. \${이름} 이런식으로 '\'를 붙여준다. 
					
					<%List<Board> list = (List<Board>)request.getAttribute("list");%>
					스크립트릿 없어도 ${list}가 나오는데 저걸 적어주고 세션에도 있으면
					더 작은 범위에 값이 나온다. 그래서 request 값이 나오는데
					session에 있는 걸 꺼내오고 싶으면 session.을 붙여주면 된다
					
					el은 서버의 데이터 영역인 스코프에서 꺼내온다.
					
					
					EL짝꿍인 JSTL이 있다.
					
					JSTL : Java코드를 태그화해서 사용하는 커스텀 태그 라이브러리
						   (원래 jar파일 가져와서 추가해줘야 하는데 스프링에서는 이미 제공되어 있다.)
						   -> taglib 지시자를 통해 어떤 라이브러리를 사용할지 선택하고 선언
						   -> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
					
		 		--%>
		 		
				<table class="table table-hover">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="board" items="${list}">
					<tr>
						<td>${board.idx}</td>
						<td>${board.title}</td>
						<td>${board.writer}</td>
						<td>${board.indate}</td>
						<td>${board.count}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="panel-footer">A강의장 이혜빈</div>
		</div>
	</div>
</body>
</html>

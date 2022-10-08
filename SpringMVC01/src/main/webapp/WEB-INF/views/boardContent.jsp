<%@page import="com.smhrd.entity.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 문자열을 핸들링 하기 좋은 라이브러리가 functions -->
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
						<tr>
							<td>제목 : </td>
							<!-- el표현식은 스코프 안에 담겨있는 걸 꺼내 쓰는거기 때문에 굳이 스크립트로 불러올 필요가 없다. -->
							<td>${board.title}</td>
						</tr>
						<tr>
							<td>작성자 : </td>
							<td>${board.writer}</td>
						</tr>
						<tr>
							<td>내용 : </td>
							<% pageContext.setAttribute("newLine", "\n"); %>
							<td>${ fn:replace(board.content,newLine,"<br>") }</td>
							<!-- 앞에 공간이 있어야 자동완성이 가능 / el에서는 '\'사용이 불가능하다=> 스크립트릿 써야함-->
							<!-- 제일 작은 공간인 pageContext에 \n를 변수에 담아서 사용하면 된다. -->
						</tr>
						<tr>
							<td>작성일 :</td>
							<td>${board.indate}</td>
						</tr>
				</table>
				<button class="btn btn-sm btn-info" onclick="location.href='boardModify.do'">수정</button>
				<button class="btn btn-sm btn-warning" onclick="location.href='boardDelete.do?idx=${board.idx}'">삭제</button>
				<button class="btn btn-sm btn-success" onclick="location.href='boardList.do'">목록</button>
			</div>
			<div class="panel-footer">A강의장 이혜빈</div>
		</div>
	</div>
</body>
</html>

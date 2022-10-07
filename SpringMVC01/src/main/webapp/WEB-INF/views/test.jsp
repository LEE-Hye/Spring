<%@page import="com.smhrd.entity.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	
	<h1>게시글 목록</h1>
	
	<%
		// 꺼낼 땐 Object(최상위객체)여서 쓰려면 다운캐스팅 해줘야 함
		List<Board> list = (List<Board>)request.getAttribute("list");
	%>
	
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<%for(int i = 0; i < list.size(); i++){ %>
		<tr>
			<td><%=list.get(i).getIdx() %></td>
			<td><%=list.get(i).getTitle() %></td>
			<td><%=list.get(i).getWriter() %></td>
			<td><%=list.get(i).getIndate() %></td>
			<td><%=list.get(i).getCount() %></td>
		</tr>
		<%} %>
		
		<%for(Board b : list){ %>
		<tr>
			<td><%=b.getIdx() %></td>
			<td><%=b.getTitle() %></td>
			<td><%=b.getWriter() %></td>
			<td><%=b.getIndate() %></td>
			<td><%=b.getCount() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>
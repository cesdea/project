<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript" charset="utf-8"></script>
<body>
<%
	BoardDBBean boardDB=BoardDBBean.getInstance();
	ArrayList<BoardBean> arrayBoard=boardDB.listBoard();
	
%>
	<table border="1">
		<tr>
			<td>
				글번호
			</td>
			<td>
				글제목
			</td>
			<td>
				글작성자
			</td>
		</tr>
		<%
		if(arrayBoard!=null){
			for(int i=0;i<arrayBoard.size();i++){
				BoardBean bb=arrayBoard.get(i);
			%>
			<tr>
				<td>
					<%= bb.getB_id() %>
				</td>
				<td>
					<a href="Board_show.jsp?b_id=<%= bb.getB_id() %>"><%= bb.getB_title() %></a>
				</td>
				<td>
				<% 
					if(bb.getB_name_hidden().equals("F")){
						out.println(bb.getB_name());	 
					}else{
						out.println("HIDDEN");	 
					}
	
				%>
				</td>
			</tr>
			<% 
			}
		}
	%>
		<tr>
			<td colspan="3">
				<form action="Board_serch.jsp" method="post">
					<select name="category">
						<option value="b_name">작성자</option>
						<option value="b_title">제목</option>
						<option value="b_content">내용</option>
						<option value="b_title,b_content">제목+내용</option>
						<option value="b_nickname">닉네임</option>
						<option value="b_hashtag">헤시태그</option>
					</select>
					<input type="text" name="serch" >
					<input type="submit" value="검색" ">
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="button" value="글쓰기" onclick="location.href='Board_write.jsp'">
			</td>
		</tr>
		
	</table>
</body>
</html>
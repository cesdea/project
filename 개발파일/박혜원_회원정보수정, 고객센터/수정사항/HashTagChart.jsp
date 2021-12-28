<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@page import="board.Board_AnswerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="CSS/bootstrap.css">
<body>
	<table class="table table-striped">
		<tr>
			<th class="text-center">인기 차트</th>
		</tr>
	<%	
		BoardDBBean bdd=BoardDBBean.getInstance();
		String[] rank=bdd.getHashTagChart(10);
		for(int i=0;i<10;i++){
	%>
			<tr>
				<td width="200px">
	<%
					if(rank[i]==null){
						break;
					}
	%>
					<%=i+1 %>.<%= rank[i] %>
				</td>
			</tr>				
	<%
		}
	%>
	</table>
</body>
</html>
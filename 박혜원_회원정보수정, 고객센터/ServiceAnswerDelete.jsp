<%@page import="portfolio.serviceAnswer.ServiceAnswerDBBean"%>
<%@page import="portfolio.serviceAnswer.ServiceAnswerBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String pageNum = request.getParameter("pageNum");
		int s_a_ref = Integer.parseInt(request.getParameter("s_a_ref")); 
	%>
	<h2>암호를 입력하세요.</h2>
	<form method="post" action="ServiceAnswerDeleteOk.jsp?pageNum=<%= pageNum %>&s_a_ref=<%= s_a_ref %>">
		<table>
			<tr>
				<td>암 호</td>
				<td>
					<input type="password" name="man_pwd">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="삭제하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
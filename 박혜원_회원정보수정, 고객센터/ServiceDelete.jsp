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
		String id = (String)session.getAttribute("id");
		String pageNum = request.getParameter("pageNum");
		int s_id = Integer.parseInt(request.getParameter("s_id"));
	%>
	<h2>암호를 입력하세요.</h2>
	<form method="post" action="ServiceDeleteOk.jsp?pageNum=<%= pageNum %>&s_id=<%= s_id %>">
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
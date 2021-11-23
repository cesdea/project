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
	int b_id=Integer.parseInt(request.getParameter("b_id"));
%>
	<form action="Board_deleteOk.jsp?b_id=<%= b_id %>" method="post">
		비밀번호:<input type="text" name="cus_pwd"><BR>
		<input type="submit" value="전송">
		<input type="button" value="취소" onclick="history.go(-1)">
	</form>
</body>
</html>
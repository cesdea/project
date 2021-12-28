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
int b_id=Integer.parseInt(request.getParameter("b_id"));
%>
<script type="text/javascript">
	parent.location.href="Board_answer.jsp?b_id=<%=b_id%>";
</script>
</body>
</html>
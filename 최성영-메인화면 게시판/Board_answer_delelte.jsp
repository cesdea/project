<%@page import="board.Board_AnswerDBBean"%>
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
	int b_a_ref=Integer.parseInt(request.getParameter("b_a_ref"));
%>
	<script>
    if (!confirm("삭제하시겠습니까?")) {
		location.href="Board_answer_list.jsp?b_id=<%=b_id%>&b_a_ref=<%=b_a_ref%>";    	
    } else {
		location.href="Board_answer_deleteOk.jsp?b_id=<%=b_id%>&b_a_ref=<%=b_a_ref%>";    	
    }
	</script>
</body>
</html>
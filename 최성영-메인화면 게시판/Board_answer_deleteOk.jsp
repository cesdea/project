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
	Board_AnswerDBBean bad=Board_AnswerDBBean.getInstance();
	bad.deleteBoard_Answer(b_a_ref,b_id);
	response.sendRedirect("Board_answer_list.jsp?b_id="+b_id+"&b_a_ref="+b_a_ref+"&pa=reset");
	int re=0;
%>
</body>
</html>
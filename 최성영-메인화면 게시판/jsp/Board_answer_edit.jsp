<%@page import="myUtil.HanConv"%>
<%@page import="board.Board_AnswerDBBean"%>
<%@page import="board.Board_AnswerBean"%>
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
		String b_a_content=HanConv.toKor(request.getParameter("b_a_content"));
	System.out.println(b_a_content);
		int b_a_ref=Integer.parseInt(request.getParameter("b_a_ref"));
		int b_id=Integer.parseInt(request.getParameter("b_id"));
		Board_AnswerDBBean bad=Board_AnswerDBBean.getInstance();
		int re=bad.editBoard_Answer(b_a_ref,b_a_content);
		if(re==1){
			System.out.println("수정성공");
			response.sendRedirect("Board_answer_list.jsp?b_id="+b_id+"&b_a_ref="+b_a_ref);
		}
		else{
			System.out.println("수정실패");
			response.sendRedirect("Board_answer_list.jsp?b_id="+b_id+"&b_a_ref="+b_a_ref);
		}
		
	%>
	
</body>
</html>
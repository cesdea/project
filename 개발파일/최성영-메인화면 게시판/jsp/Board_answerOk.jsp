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
<jsp:useBean id="bab" class="board.Board_AnswerBean"></jsp:useBean>
<jsp:setProperty property="*" name="bab"/>
<%
	//String cus_id=(String)session.getAttribute("cus_id");
	String cus_id="admin";
	int b_id=Integer.parseInt(request.getParameter("b_id"));
	Board_AnswerDBBean dbBean=new Board_AnswerDBBean();
	bab.setB_a_id(b_id);
	bab.setB_a_name(cus_id);
	int re=dbBean.insertBoard_Answer(bab);
	if(re==1){
	%>
		<script type="text/javascript">
			location.href="Board_answer.jsp?b_id=<%= b_id %>";
		</script>		
	<%
	}
	else{
	%>
		<script type="text/javascript">
			location.href="Board_answer.jsp?b_id=<%= b_id %>";
		</script>		
	<%
		
	}
%>
</body>
</html>
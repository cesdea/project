<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@page import="board.Board_SuggestDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//String cus_id=(String)session.getAttribute("cus_id");
	String cus_id="admin";
	int b_id=Integer.parseInt(request.getParameter("b_id"));
	Board_SuggestDBBean bsd=Board_SuggestDBBean.getInstance();
	int re=bsd.addSuggest(cus_id, b_id);
	if(re==1){
	%>
		<script type="text/javascript">
			alert("��õ�Ǿ����ϴ�.");
			location.href="Board_show.jsp?b_id=<%= b_id %>";
		</script>
	<%
	}else{
	%>
		<script type="text/javascript">
			alert("�̹� ��õ�Ǿ����ϴ�.");
			history.go(-1);
		</script>
	<% 
	}
%>
<%@page import="board.Board_AnswerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.Board_AnswerDBBean"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%	
	//String cus_id=(String)session.getAttribute("b_id");
	String cus_id="admin";
	int b_id=Integer.parseInt(request.getParameter("b_id"));
	BoardDBBean boardDBBean=BoardDBBean.getInstance();
	BoardBean boardBean = boardDBBean.getBoard(b_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript" charset="utf-8"></script>
<body>
	<table border="1">
		<tr>
			<td>
				����
			</td>
			<td>
				<%= boardBean.getB_title() %>
			</td>
			<td>
				��õ ��: <%=boardBean.getB_suggest() %>
			</td>
		</tr>
		<tr>
			<td>
				�ۼ���
			</td>
			<td colspan="2">
			<% 
				if(boardBean.getB_name_hidden().equals("F")){
					out.println(boardBean.getB_name()); 
				}else{
					out.println("hidden");
				}
			%>
			</td>
		</tr>
		<tr>
			<td>
				����
			</td>
			<td colspan="2">
				<%= boardBean.getB_content() %>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<%
						if(cus_id.equals(boardBean.getB_name())){
					%>
							<input type="button" value="����" onclick="location.href='Board_edit.jsp?b_id=<%= b_id %>'">
							<input type="button" value="����" onclick="location.href='Board_delete.jsp?b_id=<%= b_id %>'">
							<input type="button" value="�۸��" onclick="location.href='Board_list.jsp'">
					<%
						}else{
					%>
							<input type="button" value="�۸��" onclick="location.href='Board_list.jsp'">
							<input type="button" value="��õ"  onclick="location.href='Board_suggest.jsp?b_id=<%=b_id%>'">
							<input type="button" value="��õ���"  onclick="location.href='Board_suggest_cancle.jsp?b_id=<%=b_id%>'">
					<% 
						}
					%>
					
			</td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<input type="button" value="��õ" onclick="location.href='Board_suggest.jsp?b_id=<%=b_id%>'">
				<input type="button" value="��õ���" onclick="location.href='Board_suggest_cancle.jsp?b_id=<%=b_id%>'">
			</td>
		</tr>
		<tr>
			<td colspan="3" height="500px">
				<iframe src="Board_answer.jsp?b_id=<%=b_id%>" height="100%" width="100%" frameBorder="0"></iframe>
			</td>
		</tr>
	</table>
</body>
</html>
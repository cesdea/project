<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.QnA.QnABean"%>
<%@page import="magic.QnA.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int bid = Integer.parseInt(request.getParameter("b_id"));

	QnADBBean db = QnADBBean.getInstance();
	//BoardBean board = db.getBoard(bid);
	QnABean board = db.getBoard(bid, true);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int b_id=0, b_hit=0;
	String b_name="", b_email="", b_title="", b_content="";
	Timestamp b_date=null;
	
	b_id = board.getB_id();
	b_name = board.getB_name();
	b_email = board.getB_email();
	b_title = board.getB_title();
	b_content = board.getB_content();
	b_date = board.getB_date();
	b_hit = board.getB_hit();
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>�� �� �� �� ��</h1>
		<table border="1" width="800" cellspacing="0">
			<tr height="30" align="center">
				<td width="100">
					�۹�ȣ
				</td>
				<td width="200">
					<%= b_id %>
				</td>
				<td width="100">
					��ȸ��
				</td>
				<td width="200">
					<%= b_hit %>
				</td>
			</tr>
			<tr height="30" align="center">
				<td width="100">
					�ۼ���
				</td>
				<td width="200">
					<%= b_name %>
				</td>
				<td width="100">
					�ۼ���
				</td>
				<td width="200">
					<%= sdf.format(b_date) %>
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					������
				</td>
				<td colspan="3" width="100">
					<%= b_title %>
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					�۳���
				</td>
				<td colspan="3" width="100">
					<pre>
						<%= b_content %>
					</pre>
				</td>
			</tr>
			<tr height="30">
				<td colspan="4" align="right">
					<input type="button" value="�ۼ���" onclick="location.href='QnAedit.jsp?b_id=<%= b_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="�ۻ���" onclick="location.href='QnAdelete.jsp?b_id=<%= b_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="�亯��" onclick="location.href='QnAwrite.jsp?b_id=<%= b_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="�۸��" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'">
				</td>
			</tr>
		</table>
	</center>
</body>
</html>









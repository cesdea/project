<%@page import="qna.QnABean"%>
<%@page import="qna.QnADBBean"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int q_id = Integer.parseInt(request.getParameter("q_id"));
	
	QnADBBean db = QnADBBean.getInstance();
	//BoardBean board = db.getBoard(b_id);
	QnABean board = db.getBoard(q_id, false);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
   <link rel="stylesheet" href="CSS/bootstrap.css">
	<script type="text/javascript" src="QnA_check.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>글 수 정 하 기</h1>
		<form name="form" method="post" action="QnAedit_ok.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>">
    <input name="q_name" type="text" style="border:0 solid black;" value=<%=session.getAttribute("nickname")%> readonly class="form-control mt-4 mb-2">
	<input type="text" name="q_title" class="form-control mt-4 mb-2" value="<%= board.getQ_title() %>" >

	<div class="form-group">
		<textarea class="form-control" rows="10" name="q_content">
			<%= board.getQ_content() %>
		</textarea>
	</div>
	비밀번호 4자리<input name="q_pwd" type="password" size="4" minlength="4" maxlength="4">
	<input class="button"    type="button" value="글쓰기" onclick="check_ok()" >&nbsp;
	<button type="button" class="button" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'" >목록</button> 
</form>

	</center>
</body>
</html>









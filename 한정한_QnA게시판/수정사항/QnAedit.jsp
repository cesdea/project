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
	<script type="text/javascript" src="QnA_check.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>글 수 정 하 기</h1>
		<form name="form" method="post" action="QnAedit_ok.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140">
						<input type="text" name="q_name" maxlength="20" size="20" value="<%= board.getQ_name() %>" >
					</td>
					<tr height="30">
					<td width="80">글제목</td>
					<td colspan="3">
						<input type="text" name="q_title" maxlength="80" size="80" value="<%= board.getQ_title() %>" >
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="q_content" rows="10" cols="65">
							<%= board.getQ_content() %>
						</textarea>
					</td>
				</tr>
				<tr>
					<td width="80">비밀번호</td>
					<td colspan="3">
						<input type="password" name="q_pwd" maxlength="12" size="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="button" value="글수정" onclick="check_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='QnAlist.jsp';"/>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>









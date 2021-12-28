<%@page import="manager.ManagerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int q_id = Integer.parseInt(request.getParameter("q_id"));
	
	String cus_id=null;
	if(session.getAttribute("cus_id")!=null){
		cus_id=(String)session.getAttribute("cus_id");
	}
	
	ManagerDBBean manager=ManagerDBBean.getInstance();
%>


<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="QnA_check.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>글 삭 제 하 기</h1>
			<form name="form" method="post" action="QnAdelete_ok.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>">		
			<table>
				<tr height="50">
					<td colspan="2">
						<b> >> 비밀번호를 입력하세요. << </b>
					</td>
				</tr>
				<tr>
					<td width="80">비밀&nbsp;&nbsp;번호</td>
					<td>
						<input type="password" name="q_pwd" size="12" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="2">
						<input type="button" value="글삭제" onclick="delete_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'">
				
					
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
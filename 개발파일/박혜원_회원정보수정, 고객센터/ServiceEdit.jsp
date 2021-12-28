<%@page import="portfolio.service.ServiceBean"%>
<%@page import="portfolio.service.ServiceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="service.js" charset="utf-8"></script>
</head>
<body>
<%	
	String name = (String)session.getAttribute("nickname");
	String pageNum = request.getParameter("pageNum");
	int s_id = Integer.parseInt(request.getParameter("s_id"));

	String s_name="", s_content;
	ServiceDBBean db = ServiceDBBean.getInstance();
	ServiceBean service = db.getService(s_id);
	s_name = name;
	s_content = service.getS_content();
	
%>
	<form name="form" method="post" action="ServiceEditOk.jsp?pageNum=<%= pageNum %>">
		<input type="hidden" name="s_id" value="<%= s_id %>">
		<input type="hidden" name="s_name" value="<%= s_name %>">
		<table>
			<tr>
				<td><h2>고객센터 글 수정</h2></td>
			</tr>
			<tr>
				<td>
					<textarea rows="20" cols="80" name="s_content"><%= s_content %></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="수정하기" onclick="check_ok()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시 쓰기">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="글목록" onclick="location.href='ServiceList.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
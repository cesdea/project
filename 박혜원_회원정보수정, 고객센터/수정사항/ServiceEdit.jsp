<%@page import="service.ServiceBean"%>
<%@page import="service.ServiceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="service.js" charset="utf-8"></script>
</head>
<link rel="stylesheet" href="CSS/Service_write.css" type="text/css">
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
	<h1 class="text-center">고객센터 글 수정</h1>
	<form name="form" method="post" action="ServiceEditOk.jsp?pageNum=<%= pageNum %>">
		<input type="hidden" name="s_id" value="<%= s_id %>">
		<input type="hidden" name="s_name" value="<%= s_name %>">
		<table>
			<tr>
				<td>고객센터 문의 사항 답변을 입력하세요.</td>
			</tr>
			<tr class="text-center">
				<td>
					<textarea class="form-control" rows="20" cols="80" name="s_content"><%= s_content %></textarea>
				</td>
			</tr>
			<tr class="text-center">
				<td>
					<input class="button" type="button" value="수정하기" onclick="check_ok()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="button" type="reset" value="다시 쓰기">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="button" type="button" value="글목록" onclick="location.href='Service_list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
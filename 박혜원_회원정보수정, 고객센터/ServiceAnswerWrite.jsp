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
	String pageNum = request.getParameter("pageNum");
	String name = (String)session.getAttribute("nickname");
	
	int s_a_id=0, s_a_ref=0;
	String s_a_name="", s_a_content="";
	
	
	s_a_ref = Integer.parseInt(request.getParameter("s_id"));
	s_a_name = name;
	
%>
	<form name="form2" method="post" action="ServiceAnswerWriteOk.jsp?pageNum=<%= pageNum %>">
		<input type="hidden" name="s_a_id" value="<%= s_a_id %>">
		<input type="hidden" name="s_a_ref" value="<%= s_a_ref %>">
		<input type="hidden" name="s_a_name" value="<%= s_a_name %>">
		<table>
			<tr>
				<td><h2>고객센터 답변 쓰기</h2></td>
			</tr>
			<tr>
				<td>
					<textarea rows="20" cols="80" name="s_a_content"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="글쓰기" onclick="check_ok2()">
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
<%@page import="service.ServiceAnswerBean"%>
<%@page import="service.ServiceAnswerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="service.js" charset="utf-8"></script>
	<style type="text/css">
		tr{
			height: 50px;
		}
		table {
			margin: 20px auto;
		}
	</style>
</head>
<link rel="stylesheet" href="CSS/bootstrap.css" type="text/css">
<body>
<%	

	String pageNum = request.getParameter("pageNum");
	String name = (String)session.getAttribute("nickname");
	int s_a_id = Integer.parseInt(request.getParameter("s_a_id"));
	
	int s_a_ref=0;
	String s_a_name="", s_a_content="";
	
	ServiceAnswerDBBean db = ServiceAnswerDBBean.getInstance();
	ServiceAnswerBean service_answer = db.getServiceAnswer(s_a_id);
	s_a_ref = service_answer.getS_a_ref();
	s_a_name = name;
	s_a_content = service_answer.getS_a_content();
	
%>
	<h1 class="text-center">고객센터 답변 수정</h1>
	<form name="form2" method="post" action="ServiceAnswerEditOk.jsp?pageNum=<%= pageNum %>">
		<input type="hidden" name="s_a_id" value="<%= s_a_id %>">
		<input type="hidden" name="s_a_ref" value="<%= s_a_ref %>">
		<input type="hidden" name="s_a_name" value="<%= s_a_name %>">
		<table>
			<tr>
				<td>고객센터 문의 사항 답변을 입력하세요.</td>
			</tr>
			<tr class="text-center">
				<td>
					<textarea class="form-control" rows="20" cols="80" name="s_a_content"><%= s_a_content %></textarea>
				</td>
			</tr>
			<tr class="text-center">
				<td>
					<input class="btn btn-default" type="button" value="수정하기" onclick="check_ok2()">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type="reset" value="다시 쓰기">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input class="btn btn-default" type="button" value="글목록" onclick="location.href='Service_list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
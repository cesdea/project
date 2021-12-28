<%@page import="portfolio.serviceAnswer.ServiceAnswerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String pageNum = request.getParameter("pageNum");
		int s_a_id = Integer.parseInt(request.getParameter("s_a_id")); 
		String man_pwd = request.getParameter("man_pwd");
		
		ServiceAnswerDBBean db = ServiceAnswerDBBean.getInstance();
		int re = db.deleteServiceAnswer(s_a_id);
		
		if(re == 1){
			response.sendRedirect("ServiceList.jsp?pageNum="+pageNum);
		}else if(re == -1){
	%>
				<script type="text/javascript">
					alert("삭제에 실패하였습니다.");
					history.go(-1);
				</script>
	<%
		}
	%>
</body>
</html>
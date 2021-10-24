<%@page import="portfolio.serviceAnswer.ServiceAnswerBean"%>
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
		ServiceAnswerDBBean db = ServiceAnswerDBBean.getInstance();
		
		ServiceAnswerBean service_answer = new ServiceAnswerBean();
		service_answer.setS_a_ref(Integer.parseInt(request.getParameter("s_a_ref")));
		service_answer.setS_a_name(request.getParameter("s_a_name"));
		service_answer.setS_a_content(request.getParameter("s_a_content"));
		int re = db.editServiceAnswer(service_answer);
		
		if(re == 1){
			response.sendRedirect("ServiceList.jsp?pageNum="+pageNum);
		}else if(re == -1){
	%>
				<script type="text/javascript">
					alert("수정에 실패하였습니다.");
					history.go(-1);
				</script>
	<%
		}
	%>
</body>
</html>
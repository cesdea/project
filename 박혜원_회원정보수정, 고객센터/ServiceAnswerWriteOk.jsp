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
		ServiceAnswerDBBean a_db = ServiceAnswerDBBean.getInstance();
		ServiceAnswerBean ServiceAnswer = new ServiceAnswerBean();
		int re = 0;
		if(request.getParameter("s_a_ref") != null){
			ServiceAnswer.setS_a_id(Integer.parseInt(request.getParameter("s_a_id")));
			ServiceAnswer.setS_a_ref(Integer.parseInt(request.getParameter("s_a_ref")));
			ServiceAnswer.setS_a_content(request.getParameter("s_a_content"));
			ServiceAnswer.setS_a_name(request.getParameter("s_a_name"));
			
			re = a_db.insertServiceAnswer(ServiceAnswer);
		}
		
		if(re == 1){
	%>
			<script type="text/javascript">
				alert("고객센터에 새 글이 등록되었습니다.");
				document.location.href="ServiceList.jsp";
			</script>
	<%
		}else{
	%>
			<script type="text/javascript">
				alert("새 글 등록에 실패했습니다.");
				history.go(-1);
			</script>
	<%		
		}
	%>
</body>
</html>
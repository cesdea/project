<%@page import="portfolio.service.ServiceBean"%>
<%@page import="portfolio.service.ServiceDBBean"%>
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
		ServiceDBBean db = ServiceDBBean.getInstance();
		ServiceBean service = new ServiceBean();
		int re = 0;
		
		service.setS_id(Integer.parseInt(request.getParameter("s_id")));
		service.setS_content(request.getParameter("s_content"));
		service.setS_name(request.getParameter("s_name"));
		
		re = db.insertService(service);
		
		
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
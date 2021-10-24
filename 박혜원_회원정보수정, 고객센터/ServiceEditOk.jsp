<%@page import="myUtil.HanConv"%>
<%@page import="portfolio.service.ServiceBean"%>
<%@page import="portfolio.service.ServiceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>   
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String pageNum = request.getParameter("pageNum");
		ServiceDBBean db = ServiceDBBean.getInstance();
		
		ServiceBean service = new ServiceBean();
		service.setS_id(Integer.parseInt(request.getParameter("s_id")));
		service.setS_name(request.getParameter("s_name"));
		service.setS_content(request.getParameter("s_content"));
		int re = db.editService(service);
		
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
<%@page import="service.ServiceBean"%>
<%@page import="service.ServiceDBBean"%>
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
		service.setS_uid(request.getParameter("s_uid"));
		
		re = db.insertService(service);
		
		
		if(re == 1){
	%>
			<script type="text/javascript">
				alert("�����Ϳ� �� ���� ��ϵǾ����ϴ�.");
				document.location.href="Service_list.jsp";
			</script>
	<%
		}else{
	%>
			<script type="text/javascript">
				alert("�� �� ��Ͽ� �����߽��ϴ�.");
				history.go(-1);
			</script>
	<%		
		}
	%>
</body>
</html>
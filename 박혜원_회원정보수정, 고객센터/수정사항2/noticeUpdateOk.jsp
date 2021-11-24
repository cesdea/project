<%@page import="customer.CustomerBean"%>
<%@page import="customer.CustomerDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript"  charset="EUC-KR"></script>
</head>
<body>
	<%
	
		
	
		int n_id = Integer.parseInt(request.getParameter("n_id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String id =request.getParameter("cus_id");
		String pwd =request.getParameter("cus_pwd");
		CustomerDBBean manager = CustomerDBBean.getInstance();
		int check = manager.customerCheck(id, pwd);
		CustomerBean mb = manager.getCustomer(id);
	
		
		
		noticeDAO ndao = new noticeDAO();
	   	int re=ndao.noticeUpdate(n_id,title,content);
	   	if(re==1){
		%>
		<script>
		   alert("수정을 완료했습니다.");
		   location.href="Notice_list.jsp";
		</script>
		<%
	   	}else{
		%>
		<script>
		   alert("수정을 실패했습니다.");
		   history.go(-1);
		</script>
		<%
	   	}

%>
</body>
</html>
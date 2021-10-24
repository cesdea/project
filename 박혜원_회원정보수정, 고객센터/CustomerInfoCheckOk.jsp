<%@page import="portfolio.customer.CustomerBean"%>
<%@page import="portfolio.customer.CustomerDBBean"%>
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
		String id = (String)session.getAttribute("id"); 
		String cus_pwd = request.getParameter("cus_pwd");
		CustomerDBBean db = CustomerDBBean.getInstance();
		/*세션의 아이디와 일치하는 고객 정보를 가져옴*/
		CustomerBean customer = db.getCustomer(id);
		
		if(customer.getCus_pwd().equals(cus_pwd)){
	%>
			<script type="text/javascript">
				document.location.href="CustomerUpdate.jsp";
			</script>
	<%
		}else{
	%>
			<script type="text/javascript">
				alert("비밀번호가 일치하지 않습니다.");
				history.go(-1);
			</script>
	<%		
		}
		
	%>
</body>
</html>
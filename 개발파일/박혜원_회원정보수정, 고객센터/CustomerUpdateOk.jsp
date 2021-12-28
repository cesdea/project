<%@page import="portfolio.customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="customer" class="portfolio.customer.CustomerBean"></jsp:useBean>
<jsp:setProperty property="*" name="customer" />
	<%
		String uid = (String) session.getAttribute("id"); 
		String cus_nickname = request.getParameter("cus_nickname");
		customer.setCus_id(uid);		
		CustomerDBBean manager = CustomerDBBean.getInstance();
		int re = manager.updateCustomer(customer);	
		 
		if(re == 1){
	%>
			<script type="text/javascript">
				alert("입력하신대로 회원 정보가 수정되었습니다.");
				document.location.href="main.jsp";
			</script>
	<%
		}else{
	%>
			<script type="text/javascript">
				alert("수정이 실패되었습니다.");
				history.go(-1);
			</script>
	<%		
		}
	%>	
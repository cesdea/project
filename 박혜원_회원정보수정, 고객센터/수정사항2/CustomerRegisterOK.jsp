<%@page import="customer.CustomerDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mb" class="customer.CustomerBean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>
<%
	CustomerDBBean manager = CustomerDBBean.getInstance();
	int result = manager.customerCheck(mb.getCus_id(), mb.getCus_pwd());
	if(result == 1 || result == 0){
%>
		<script type="text/javascript">
			alert("�ߺ��Ǵ� ���̵� �����մϴ�.");
			//document.location.href="register.jsp";
			history.back();
		</script>
<%
	}else{
		int re = manager.insertMember(mb);
		
		if(re == 1){
%>
			<script>
				alert("ȸ�������� ���ϵ帳�ϴ�.\nȸ������ �α��� ���ּ���.");
				document.location.href="CustomerLogin.jsp";
			</script>
<%
		}else{
%>
			<script>
				alert("ȸ�����Կ� �����߽��ϴ�.");
				document.location.href="CustomerLogin.jsp";
			</script>
<%
		}
	}
%>
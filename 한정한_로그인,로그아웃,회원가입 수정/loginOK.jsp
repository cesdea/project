
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="magic.member.*" %>
<%
	String id = request.getParameter("cus_id");
	String pwd = request.getParameter("cus_pwd");
	CustomerDBBean manager = CustomerDBBean.getInstance();
	int check = manager.userCheck(id, pwd);
	CustomerBean mb = manager.getMember(id);
	
	if(mb == null){
%>
		<script>
			alert("�������� �ʴ� ȸ��");
			history.go(-1);
		</script>
<%
	}else{
		String nickname = mb.getCus_nickname();
		
		if(check == 1){
			session.setAttribute("id", id);
			session.setAttribute("nickname", nickname);
			session.setAttribute("Member", "yes");
			response.sendRedirect("main.jsp");
		}else if(check == 0){
%>
			<script>
				alert("��й�ȣ�� ���� �ʽ��ϴ�.");
				history.go(-1);
			</script>
<%
		}else{	/*���� �׽�Ʈ�ÿ��� �� ���̽��� ���ܵ�*/
%>
			<script>
				alert("���̵� ���� �ʽ��ϴ�.");
				history.go(-1);
			</script>
<%
		}
	}
%>







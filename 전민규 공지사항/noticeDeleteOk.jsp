<%@page import="notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   int n_id = Integer.parseInt(request.getParameter("n_id"));
   
   noticeDAO ndao = new noticeDAO();
   
   ndao.deleteBoard(n_id);
   %>
<script>
   alert("�Խñ��� ���� �Ǿ����ϴ�");
   location.href="http://localhost:8181/portpolio/noticeList.jsp";
</script>
   
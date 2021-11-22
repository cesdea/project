<%@page import="notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   int n_id = Integer.parseInt(request.getParameter("n_id"));
   
   noticeDAO ndao = new noticeDAO();
   
   ndao.deleteBoard(n_id);
   %>
<script>
   alert("게시글이 삭제 되었습니다");
   location.href="http://localhost:8181/portpolio/noticeList.jsp";
</script>
   
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//String cus_id=(String)session.getAttribute("cus_id");
	String cus_id="admin";
	int b_id=Integer.parseInt(request.getParameter("b_id"));
	String cus_pwd=request.getParameter("cus_pwd");
	
	BoardDBBean boardDBBean=BoardDBBean.getInstance();
	int re=boardDBBean.BoardDelete(b_id,cus_pwd);
	if(re==1){
		System.out.println("������ �����߽��ϴ�.");
	}else{
		System.out.println("������ �����߽��ϴ�.");
	}
	
	response.sendRedirect("Board_list.jsp");
	


	
%>

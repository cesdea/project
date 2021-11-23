
<%@page import="qna.QnADBBean"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="qna.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 


<jsp:useBean id="board" class="qna.QnABean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	board.setQ_date(new Timestamp(System.currentTimeMillis()));

	InetAddress address = InetAddress.getLocalHost();
	String ip = address.getHostAddress();
	
	board.setQ_ip(ip);

	QnADBBean db = QnADBBean.getInstance();
	if(db.insertBoard(board) == 1){
		response.sendRedirect("QnAlist.jsp");
	}else{
		response.sendRedirect("QnAwrite.jsp");
	}
%>
<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>
<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@page import="manager.ManagerDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   String cus_id=null;
   if(session.getAttribute("cus_id")!=null){
      cus_id=(String)session.getAttribute("cus_id");
   }
   
   String nickname=null;
   if(session.getAttribute("nickname")!=null){
      nickname =(String)session.getAttribute("nickname");
   }
   
   ManagerDBBean manager=ManagerDBBean.getInstance();
   
   
   
   String pageNum = request.getParameter("pageNum");
   int n_id = Integer.parseInt(request.getParameter("n_id"));
   noticeDAO ndao = new noticeDAO();
   noticeBean notice = new noticeBean();
   
   String man_id = ndao.manidCheck(cus_id);
   
   noticeBean nb = ndao.getNotice(n_id);
   
   Timestamp n_regDt=null;
   
   n_id = nb.getN_id();
   String n_name = notice.getN_name();
   String n_title = nb.getN_title();
   String n_content = nb.getN_content();
   n_regDt = nb.getN_regDt();
   
%>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- ��Ʈ ������ ��Ʈ��Ʈ���� �����ϴ� ��ũ -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<style type="text/css">
@charset "UTF-8";
* {
   font-family: 'Sunflower', sans-serif;
}
table {
width :100%;
}
</style>
</head>
<body>
   <center>
      <div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">��������</th>
					</tr>
				</thead>
      <table border="1" width="800" cellspacing="0">
         <tr height="30" align="center">
            <td width="50">
               ��ȣ
            </td>
            <td width="200">
               <%= n_id %>
            </td>
         <tr height="30" align="center">
            <td width="50">
               �ۼ���
            </td>
            <td width="200">
               <%= n_name %>
            </td>
            <td width="100">
               �ۼ���
            </td>
            <td width="200">
               <%= n_regDt %>
            </td>
         </tr>
         <tr height="30">
            <td width="50" align="center">
               ����
            </td>
            <td colspan="3" width="100">
               <%= n_title %>
            </td>
         </tr>
         <tr height="30">
            <td width="50" align="center">
               ����
            </td>
            <td colspan="3" width="100">
   
                  <%= n_content %>
      
            </td>
         </tr>
         <tr height="30">
            <td colspan="4" align="right">
               <%
               // �Խ��� �۾��̰� �ڱ��ڽ��̸� �� ���� ���� �亯 ���� 
               if(cus_id.equals("admin")){
                  
               %>
               <input type="button" value="�ۼ���" class="btn btn-primary" onclick="location.href='noticeUpdate.jsp?n_id=<%=n_id %>'">
               <input type="button" value="�ۻ���" class="btn btn-primary" onclick="location.href='noticeDeleteOk.jsp?n_id=<%=n_id %>'">
               <input type="button" value="���ۼ�" class="btn btn-primary" onclick="location.href='noticeWrite.jsp?n_id=<%=n_id %>'">
               <input type="button" value="�۸��" class="btn btn-primary" onclick="location.href='Notice_list.jsp?'">
                        
                 <%            //�׿� ������� ��۸��ް�
               }else{  
                 %> 
               <input type="button" value="���" onclick="location.href='Notice_list.jsp?pageNum=<%=pageNum%>'">
            </td>
            <%
               }
            %>
         </tr>
      </table>
   </center>
</body>
</html>
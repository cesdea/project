<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   
   int n_id = Integer.parseInt(request.getParameter("n_id"));
   noticeDAO ndao = new noticeDAO();
   noticeBean nb = ndao.getNotice(n_id);
    
   String n_name= nb.getN_name();
   String n_title= nb.getN_title();
   String n_content= nb.getN_content();
   Timestamp n_regDt = nb.getN_regDt();

   
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <center>
      <h1>�� �� �� �� ��</h1>
      <form method="post" action="noticeUpdateOk.jsp?n_id=<%=n_id%>">
      <table border="1" width="800" cellspacing="0">
         <tr height="30" align="center">
            <td width="100">
               �۹�ȣ
            </td>
            <td width="200">
               <%=n_id%>
            </td>
         </tr>
         <tr height="30" align="center">
            <td width="100">
               �ۼ���
            </td>
            <td width="200">
               <%=n_name %>
            </td>
            <td width="100">
               �ۼ���
            </td>
            <td width="200">
               <%=n_regDt %>
            </td>
         </tr>
         <tr height="30">
            <td width="100" align="center">
               ������
            </td>
            <td colspan="3" width="100">
               <input type="text" id="title" name="title" maxlength="50" style="border:0px;width:100%;" value="<%=n_title %>"/>
            </td>
         </tr>
         <tr height="30">
            <td width="100" align="center">
               �۳���
            </td>
            <td colspan="3" width="100">
                  <textarea id="content" name="content" style="border:0px;width:100%;align:center;"><%=n_content %></textarea>
            </td>
         </tr>
         <tr height="30">
            <td colspan="4" align="right">
               <input type="submit" value="�ۼ���"/>
            </td>
         </tr>
      </table>
      </form>
   </center>
</body>
</html>


<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
   
   int n_id = Integer.parseInt(request.getParameter("num"));
   
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
      <h1>글 내 용 보 기</h1>
      <table border="1" width="800" cellspacing="0">
         <tr height="30" align="center">
            <td width="100">
               글번호
            </td>
            <td width="200">
               <%=n_id %>
            </td>
         </tr>
         <tr height="30" align="center">
            <td width="100">
               작성자
            </td>
            <td width="200">
               <%=n_name %>
            </td>
            <td width="100">
               작성일
            </td>
            <td width="200">
               <%=n_regDt %>
            </td>
         </tr>
         <tr height="30">
            <td width="100" align="center">
               글제목
            </td>
            <td colspan="3" width="100">
               <%=n_title %>
            </td>
         </tr>
         <tr height="30">
            <td width="100" align="center">
               글내용
            </td>
            <td colspan="3" width="100">
                  <textarea style="border:0px;width:100%;align:center;" readonly><%=n_content %></textarea>
            </td>
         </tr>
         <tr height="30">
            <td colspan="4" align="right">
               <input type="button" value="글수정" onclick="location.href='noticeUpdate.jsp?n_id=<%=n_id %>'">
               <input type="button" value="글삭제" onclick="location.href='noticeDeleteOk.jsp?n_id=<%=n_id %>'">
               <input type="button" value="글작성" onclick="location.href='noticeWrite.jsp?n_id=<%=n_id %>'">
               <input type="button" value="글목록" onclick="location.href='noticeList.jsp?'">
            </td>
         </tr>
      </table>
   </center>
</body>
</html>




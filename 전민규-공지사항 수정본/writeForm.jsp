<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <%
      noticeDAO ndao = noticeDAO.getInstance();
      noticeBean nb = new noticeBean();
      
      nb.setN_title(request.getParameter("title"));
      nb.setN_content(request.getParameter("content"));
      nb.setN_name(request.getParameter("name"));
      
      String title = nb.getN_title();
      String content = nb.getN_content();
      String name = nb.getN_name();
      
      if("".equals(title) || title == null){
   %>
     <script type="text/javascript">
            alert("������ �Է��� �ּ���.");
            history.back();
     </script>
     <% }else
      if("".equals(content) || content == null){%>
      <script type="text/javascript">
            alert("������ �Է��� �ּ���");
            history.back();
      </script>
      <%}else
      if("".equals(name) || name == null){%>
      <script type="text/javascript">
            alert("�̸��� �Է��� �ּ���.");
            history.back();
      </script>
      <%}else{
         ndao.insertNotice(nb);%>
       <script type="text/javascript">
            alert("�������׿� �� ���� ��ϵǾ����ϴ�.");
            document.location.href="noticeList.jsp";
       </script>
      <%}%>
</body>
</html>
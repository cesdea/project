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
            alert("제목을 입력해 주세요.");
            history.back();
     </script>
     <% }else
      if("".equals(content) || content == null){%>
      <script type="text/javascript">
            alert("내용을 입력해 주세요");
            history.back();
      </script>
      <%}else
      if("".equals(name) || name == null){%>
      <script type="text/javascript">
            alert("이름을 입력해 주세요.");
            history.back();
      </script>
      <%}else{
         ndao.insertNotice(nb);%>
       <script type="text/javascript">
            alert("공지사항에 새 글이 등록되었습니다.");
            document.location.href="noticeList.jsp";
       </script>
      <%}%>
</body>
</html>
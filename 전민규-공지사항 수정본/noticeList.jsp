<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
   <%
      // noticeDAO ndao 객체생성    
      noticeDAO ndao = new noticeDAO();
      // 게시판 글개수를 담고 있는 메소드   getNoticeCount() 
      int count = ndao.getNoticeCount();
      // 한화면에 보여줄 가져올 글 개수 설정 
      int pageSize = 10;
      // 현페이지 번호 가져오기  pageNum 파라미터 가져오기
      String pageNum = request.getParameter("pageNum");
      // 현페이지 번호가 없으면 "1"페이지로 설정
      if (pageNum == null) {
         pageNum = "1";
      }
      int currentPage = Integer.parseInt(pageNum);

      int startRow = (currentPage - 1) * pageSize + 1;

      int endRow = currentPage * pageSize;

      List noticeList = ndao.getNoticeList(startRow, endRow);
   %>
   <h1>공지사항</h1> <span style="color:red">[ <%=count%> 개의 공지가 있습니다.]</span>
   <table border="1">
      <tr>
         <td>번호</td>
         <td>작성자</td>
         <td>글제목</td>
         <td>작성일</td>
      </tr>
      <%
         for (int i = 0; i < noticeList.size(); i++) {
            noticeBean nb = (noticeBean) noticeList.get(i);
      %>
      <tr>
         <td><%=nb.getN_id()%></td>
         <td>
            <a href="notice.jsp?num=<%=nb.getN_id()%>"><%=nb.getN_title()%></a>
         </td>
         <td><%=nb.getN_name()%></td>
         <td><%=nb.getN_regDt()%></td>
      </tr>
      <%
         }
      %>
   </table>
   <input type="button" value="공지작성" class="btn" onclick="location.href='writeForm.jsp'">
   <%
      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
      // 한화면에 보여줄 페이지 개수
      int pageBlock = 10;
      int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
      int endPage = startPage + pageBlock - 1;
      //  endPage 10  <=  전체 페이지수 5페이지
      if (endPage > pageCount) {
         endPage = pageCount;
      }
      // [이전]  10페이지 이전
      if (startPage > pageBlock) {
   %>
   <a href="noticeList.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
   <%
      }
      // 1~ 10  11~20   startPage  ~ endPage
      for (int i = startPage; i <= endPage; i++) {
   %>
   <a href="noticeList.jsp?pageNum=<%=i%>"><%=i%></a>
   <%
      }
      //[다음] 10페이지 다음
      if (endPage < pageCount) {
   %>
   <a href="noticeList.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
   <%
      }
      
   %>
</body>
</html>
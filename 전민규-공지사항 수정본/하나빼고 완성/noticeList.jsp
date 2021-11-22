<%@page import="notice.noticeBean"%>
<%@page import="notice.noticeDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<body>
   <%
      // noticeDAO ndao 객체생성    
      noticeDAO ndao = new noticeDAO();
      // 게시판 글개수를 담고 있는 메소드   getNoticeCount() 호출
      int count = ndao.getNoticeCount();
      // 한화면에 보여줄 가져올 글 개수 설정 
      int pageSize = 10;
      // 현페이지 번호 가져오기  pageNum 파라미터 가져오기
      String pageNum = request.getParameter("pageNum");
      // 현페이지 번호가 없으면 "1"페이지로 설정
      if (pageNum == null) {
         pageNum = "1";
      }
      // pageNum => 정수형으로 변경
      int currentPage = Integer.parseInt(pageNum);
      // 10개씩 잘라서 1페이지 시작하는 행번호 구하기
      //  pageNum(currentPage)    pageSize       =>   startRow시작행번호  
      //        1                    10          =>   (1-1)*10+1 => 0*10+1 => 0+1  => 1 
      //        2                    10          =>   (2-1)*10+1 => 1*10+1 => 10+1 => 11 
      //        3                    10          =>   (3-1)*10+1 => 2*10+1 => 20+1 => 21
      int startRow = (currentPage - 1) * pageSize + 1;
      // endRow
      //  pageNum(currentPage)    pageSize       =>   endRow시작행번호  
      //        1                    10          =>   10 
      //        2                    10          =>   20
      //        3                    10          =>   30
      int endRow = currentPage * pageSize;
      //리턴할형 List  getBoardList(시작하는행번호,글개수) 만들기
      // select * from board order by num desc limit 시작하는행번호-1,글개수
      // List boardList= getBoardList(startRow,pageSize) 호출
      List noticeList = ndao.getNoticeList(startRow, pageSize);
   %>
   <h1>공지사항</h1> <span style="color:red">[ <%=count%> 개의 공지가 있습니다.]</span>
   <table border="1">
      <tr>
         <td>번호</td>
         <td>글 제목</td>
         <td>담당자명</td>
         <td>작성일</td>
      </tr>
      <%
         for (int i = 0; i < noticeList.size(); i++) {
            noticeBean nb = (noticeBean) noticeList.get(i);
            
      %>
      <tr>
         <td><%=nb.getN_id()%></td>
         <td>
            <a href="noticeView.jsp?num=<%=nb.getN_id()%>"><%=nb.getN_title()%></a>
         </td>
         <td><%=nb.getN_name()%></td>
         <td><%=nb.getN_regDt()%></td>
         
      </tr>
      <%
         }
      %>
   </table>
   <input type="button" value="공지작성" class="btn" onclick="location.href='noticeWrite.jsp'">
   <%
      // 전체 페이지수 구하기    
      //          전체 글 개수    50     한화면에 보여줄 글개수 10  => 전체페이지수 5 + 나머지없으면 0 => 5
      //                     59                      10  =>           5 +      있으면 1 => 6
      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
      // 한화면에 보여줄 페이지 개수
      int pageBlock = 3;
      // 한화면에 보여줄 시작페이지 번호 구하기
      // 페이지 번호currentPage      pageBlock    =>   시작페이지 번호 startPage
      //      1~10                    10       =>    0~9/10*10+1=> 0*10+1=> 0+1  => 1
      //      11~20                   10       =>    10~19/10*10+1=> 1*10+1=> 10+1 => 11
      //      21~30                   10       =>    20~29/10*10+1=> 2*10+1=> 20+1 => 21
      int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
      // 한화면에 보여줄 끝페이지 번호 구하기
      //   startPage      pageBlock =>  endPage
      //      1               10    =>   1+10-1  =>10 
      //      11              10    =>   11+10-1 =>20
      //      21              10    =>   21+10-1 =>30
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
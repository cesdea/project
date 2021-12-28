<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@page import="manager.ManagerDBBean"%>
<%@page import="qna.QnABean"%>
<%@page import="qna.QnADBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String cus_id="";
	if(session.getAttribute("cus_id")!=null){
		cus_id=(String)session.getAttribute("cus_id");
	}
	

	String nickname="";
	if(session.getAttribute("nickname")!=null){
		nickname =(String)session.getAttribute("nickname");
	}
	
	ManagerDBBean manager=ManagerDBBean.getInstance();
	
	
	
	String pageNum = request.getParameter("pageNum");
	int bid = Integer.parseInt(request.getParameter("q_id"));

	QnADBBean db = QnADBBean.getInstance();
	String man_id = db.manidCheck(cus_id);
	
	QnABean board = db.getBoard(bid, true);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int q_id=0, q_hit=0;
	String q_name="",q_uid="", q_title="", q_content="";
	Timestamp q_date=null;
	
	q_id = board.getQ_id();
	q_name = board.getQ_name();
	q_uid = board.getQ_uid();
	q_title = board.getQ_title();
	q_content = board.getQ_content();
	q_date = board.getQ_date();
	q_hit = board.getQ_hit();
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/bootstrap.css">
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
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">Q&A</th>						
					</tr>
				</thead>
				<tbody>
				<td width="50">
					번호
				</td>
				<td width="200">
					<%= q_id %>
				</td>
					<tr>
						<td style="width: 20%;">글제목</td>
						<td colspan="2"><%= q_title.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= q_name %></td>
					</tr>
					<tr>
						<td>작성일자</td>
					 <td colspan="2"><%= sdf.format(q_date) %> </td> 
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= q_content.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<%
					// 게시판 글쓴이가 자기자신이면 글 수정 삭제 답변 가능 
					if(cus_id.equals(q_uid)){
						
					%>
					<input type="button" class="btn btn-primary" value="수정" onclick="location.href='QnAedit.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>'">
					<input type="button" class="btn btn-primary" value="삭제" onclick="location.href='QnAdelete.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>'">
					<input type="button" class="btn btn-primary" value="답변" onclick="location.href='QnAwrite.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>'">
					<input type="button" class="btn btn-primary" value="목록" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'">
					<%         //관리자이면 답변,삭제 가능
					}else if( manager.checkManager(cus_id)){ 
						
					%>
					<input type="button" class="btn btn-primary" value="답변" onclick="location.href='QnAwrite.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>'">
					<input type="button" class="btn btn-primary" value="삭제" onclick="location.href='QnAdelete.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>'">
					<input type="button" class="btn btn-primary" value="목록" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'">
			               
			        <%            //그외 사람들은 답글못달게
					}else{  
			        %> 
					<input type="button" class="btn btn-primary" value="목록" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'">
				</td>
				<%
					}
				%>
		</div>
	</div>
		<%-- <h1>Q&A</h1>
		<table border="1" width="800" cellspacing="0">
			<tr height="30" align="center">
				<td width="50">
					번호
				</td>
				<td width="200">
					<%= q_id %>
				</td>
				<td width="100">
					조회수
				</td>
				<td width="200">
					<%= q_hit %>
				</td>
			</tr>
			<tr height="30" align="center">
				<td width="50">
					작성자
				</td>
				<td width="200">
					<%= q_name %>
				</td>
				<td width="100">
					작성일
				</td>
				<td width="200">
					<%= sdf.format(q_date) %>
				</td>
			</tr>
			<tr height="30">
				<td width="50" align="center">
					제목
				</td>
				<td colspan="3" width="100">
					<%= q_title %>
				</td>
			</tr>
			<tr height="30">
				<td width="50" align="center">
					내용
				</td>
				<td colspan="3" width="100">
	
						<%= q_content %>
		
				</td>
			</tr>
			<tr height="30">
				<td colspan="4" align="right">
					<%
					// 게시판 글쓴이가 자기자신이면 글 수정 삭제 답변 가능 
					if(cus_id.equals(q_uid)){
						
					%>
					<input type="button" value="수정" onclick="location.href='QnAedit.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="삭제" onclick="location.href='QnAdelete.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="답변" onclick="location.href='QnAwrite.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="목록" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'">
					<%         //관리자이면 답변,삭제 가능
					}else if( manager.checkManager(cus_id)){ 
						
					%>
					<input type="button" value="답변" onclick="location.href='QnAwrite.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="삭제" onclick="location.href='QnAdelete.jsp?q_id=<%= q_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="목록" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'">
			               
			        <%            //그외 사람들은 답글못달게
					}else{  
			        %> 
					<input type="button" value="목록" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'">
				</td>
				<%
					}
				%>
			</tr>
		</table> --%>
	</center>
</body>
</html>









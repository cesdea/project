<%@page import="manager.ManagerDBBean"%>
<%@page import="customer.CustomerDBBean"%>
<%@page import="customer.CustomerBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.Board_AnswerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.Board_AnswerDBBean"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%	
   SimpleDateFormat ymdhm=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	String cus_id=(String)session.getAttribute("cus_id");
	if(cus_id==null){
		cus_id="";
	}
	int b_id=Integer.parseInt(request.getParameter("b_id"));
	ManagerDBBean manager=ManagerDBBean.getInstance();
	
	BoardDBBean boardDBBean=BoardDBBean.getInstance();
	BoardBean boardBean = boardDBBean.getBoard(b_id,true);
%>
<!DOCTYPE html>
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
.answer{
	height:1000px;
}
.answer iframe {
	height: 100%;
}
</style>
</head>
<script type="text/javascript" charset="utf-8"></script>
<!-- <style>
table{
	border-collapse:collapse;
	width: 100%;s
	height:700px;
}
table td{
	padding:10px;
	border-bottom: 1px solid black; 
	height: 15px;
}
.answer{
	height:1000px;
}
.answer iframe {
	height: 100%;
}
</style> -->
<body><div class="container">
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
					<%= b_id %>
				</td>
					<tr>
						<td style="width: 20%;">글제목</td>
						<td colspan="2"><%= boardBean.getB_title().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= boardBean.getB_name() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
					 <td colspan="2" align="center">
						<%= ymdhm.format(boardBean.getB_date()) %></td> 
				     
					</tr>
					<tr>
					<td colspan="2" align="center">
				추천 수: <%=boardBean.getB_suggest() %> &nbsp;&nbsp;&nbsp;&nbsp; 조회 수: <%=boardBean.getB_hit() %> 
		      	</td>
			     </tr> 
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= boardBean.getB_content().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<%
	
			if(cus_id.equals(boardBean.getB_name()) || manager.checkManager(cus_id) ){
		%>
				<input type="button" class="btn btn-primary" value="수정" onclick="location.href='Board_edit.jsp?b_id=<%= b_id %>'">
				<input type="button" class="btn btn-primary" value="삭제" onclick="location.href='Board_delete.jsp?b_id=<%= b_id %>'">
				<input type="button" class="btn btn-primary" value="글목록" onclick="location.href='Board_list.jsp'">
		<%
			}else{
		%>
				<input type="button" class="btn btn-primary" value="글목록" onclick="location.href='Board_list.jsp'">
				<input type="button" class="btn btn-primary" value="추천"  onclick="location.href='Board_suggest.jsp?b_id=<%=b_id%>'">
				<input type="button" class="btn btn-primary" value="추천취소"  onclick="location.href='Board_suggest_cancle.jsp?b_id=<%=b_id%>'">
		<% 
			}
		%>
	<td colspan="4" class="answer" height="100%">
				<iframe src="Board_answer.jsp?b_id=<%=b_id%>&pageNum=1" height="100%" width="100%" frameBorder=0 scrolling=yes  topmargin="0"></iframe>
			</td>
		</div>
	</div>
	<%-- <table >
		<tr>
			<td>
				제목
			</td>
			<td>
				<%= boardBean.getB_title() %>
			</td>
			<td align="center">
				<%
					SimpleDateFormat ymdhm=new SimpleDateFormat("yyyy-MM-dd hh:mm");
				%>
				<%= ymdhm.format(boardBean.getB_date()) %>
			</td>
			<td>
				추천 수: <%=boardBean.getB_suggest() %> &nbsp;&nbsp;&nbsp;&nbsp; 조회 수: <%=boardBean.getB_hit() %> 
			</td>
		</tr>
		<tr>
			<td>
				작성자
			</td>
			<td colspan="3">
			<% 
				if(boardBean.getB_name_hidden().equals("F")){
					out.println(boardBean.getB_name()); 
				}else{
					out.println("hidden");
				}
			%>
			</td>
		</tr>
		<tr>
			<td>
				내용
			</td>
			<td colspan="3">
				<pre><%= boardBean.getB_content() %></pre>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<%
						if(cus_id.equals(boardBean.getB_name()) || manager.checkManager(cus_id) ){
					%>
							<input type="button" value="수정" onclick="location.href='Board_edit.jsp?b_id=<%= b_id %>'">
							<input type="button" value="삭제" onclick="location.href='Board_delete.jsp?b_id=<%= b_id %>'">
							<input type="button" value="글목록" onclick="location.href='Board_list.jsp'">
					<%
						}else{
					%>
							<input type="button" value="글목록" onclick="location.href='Board_list.jsp'">
							<input type="button" value="추천"  onclick="location.href='Board_suggest.jsp?b_id=<%=b_id%>'">
							<input type="button" value="추천취소"  onclick="location.href='Board_suggest_cancle.jsp?b_id=<%=b_id%>'">
					<% 
						}
					%>
					
			</td>
		</tr>
		<tr>
			<td colspan="4" class="answer" height="100%">
				<iframe src="Board_answer.jsp?b_id=<%=b_id%>&pageNum=1" height="100%" width="100%" frameBorder=0 scrolling=yes  topmargin="0"></iframe>
			</td>
		</tr>
	</table> --%>
</body>
</html>
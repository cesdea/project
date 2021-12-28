<%@page import="qna.QnABean"%>
<%@page import="qna.QnADBBean"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<%
	String pageNum = request.getParameter("pageNum");
	
    String q_uid = (String)session.getAttribute("cus_id");

	int q_id=0, q_ref=1, q_step=0, q_level=0;
	String q_title="";
	String q_name="";
	
	if(request.getParameter("q_id") != null){
		q_id = Integer.parseInt(request.getParameter("q_id"));
	}
	
	QnADBBean db = QnADBBean.getInstance();
	QnABean board = db.getBoard(q_id, false);
	
	if(board != null){
		q_title = board.getQ_title();
		q_ref = board.getQ_ref();
		q_step = board.getQ_step();
		q_level = board.getQ_level();
	}
%>
<html>
	<script type="text/javascript" src="QnA_check.js" charset="utf-8"></script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link rel="stylesheet" href="CSS/bootstrap.css">
  <!-- <style type="text/css">
@charset "UTF-8";
* {
   font-family: 'Sunflower', sans-serif;
}
table {
width :100%;
}
.button{
    background-color: #4B89DC; 
  
 }

 </style> -->
</head>
<body>
	<center>
		<h1>Q & A 글작성</h1>
		<%-- 입력 폼 --%>
<form name="form" action="QnAwrite_ok.jsp" method="post">
	<input type="hidden" name="q_id" value="<%= q_id %>">
			<input type="hidden" name="q_uid" value="<%= q_uid %>">
			<input type="hidden" name="q_ref" value="<%= q_ref %>">
			<input type="hidden" name="q_step" value="<%= q_step %>">
			<input type="hidden" name="q_level" value="<%= q_level %>">
    <input name="q_name" type="text" style="border:0 solid black;" value=<%=session.getAttribute("nickname")%> readonly class="form-control mt-4 mb-2">
	<input type="text" name="q_title" class="form-control mt-4 mb-2"
		<%
		if(q_id == 0){
			%>
		placeholder="제목을 입력해주세요." required
		<% 
		}else{
								%>
							 img src="images/qna1.gif" alt="logo" type="text"value="[<%= q_title %>]에 대한 답변" >
								
								<%
							}
	%>
	
	<div class="form-group">
		<textarea class="form-control" rows="10" name="q_content"
			placeholder="내용을 입력해주세요" required
		></textarea>
	</div>
	비밀번호 4자리<input name="q_pwd" type="password" size="4" minlength="4" maxlength="4">
	<input class="button"    type="button" value="글쓰기" onclick="check_ok()" >&nbsp;
	<button type="button" class="button" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'" >목록</button> 
</form>
		
		
		<%-- <form name="form" method="post" action="QnAwrite_ok.jsp">
			<input type="hidden" name="q_id" value="<%= q_id %>">
			<input type="hidden" name="q_uid" value="<%= q_uid %>">
			<input type="hidden" name="q_ref" value="<%= q_ref %>">
			<input type="hidden" name="q_step" value="<%= q_step %>">
			<input type="hidden" name="q_level" value="<%= q_level %>">
			<table>
				<tr height="30">
					<td width="80">
						작성자
					</td>
					<td width="200">
						<input name="q_name" type="text" style="border:0 solid black;" value=<%=session.getAttribute("nickname")%> readonly>
					</td>
				<tr height="30">
					<td width="80">
						제목
					</td>
					<td colspan="3">
						<%
							if(q_id == 0){
								%>
									<input name="q_title" type="text" size="55">
								<%
							}else{
								%>
									<input name="q_title" img="images/qna1.gif"type="text" size="55" value="[<%= q_title %>]에 대한 답변" >
								<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="q_content" rows="10" cols="65"></textarea>
					</td>
				</tr>
				<tr>
					<td width="80">
						비밀번호 &nbsp(4자리)
					</td>
					<td colspan="3">
						<input name="q_pwd" type="password" size="4" minlength="4" maxlength="4">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input class="button"  style="color:white"   type="button" value="글쓰기" onclick="check_ok()" >&nbsp;
						<input class="button"  style="color:white"   type="reset" value="다시작성">&nbsp;
						<input class="button"  style="color:white"   type="button" value="글목록" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'" >
					</td>
				</tr>
			</table>
		</form> --%>
	</center>
</body>
</html>












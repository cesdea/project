<%@page import="magic.QnA.QnABean"%>
<%@page import="magic.QnA.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");

	int b_id=0, b_ref=1, b_step=0, b_level=0;
	String b_title="";
	String b_name="";
	
	if(request.getParameter("b_id") != null){
		System.out.println("@@@### write.jsp b_id ===>"+request.getParameter("b_id"));
		
		b_id = Integer.parseInt(request.getParameter("b_id"));
	}
	
	QnADBBean db = QnADBBean.getInstance();
	QnABean board = db.getBoard(b_id, false);
	
	if(board != null){
		b_title = board.getB_title();
		b_ref = board.getB_ref();
		b_step = board.getB_step();
		b_level = board.getB_level();
	}
%>
<html>
	<script type="text/javascript" src="QnA_check.js" charset="utf-8"></script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>Q & A 글작성</h1>
		<form name="form" method="post" action="QnAwrite_ok.jsp">
			<input type="hidden" name="b_id" value="<%= b_id %>">
			<input type="hidden" name="b_ref" value="<%= b_ref %>">
			<input type="hidden" name="b_step" value="<%= b_step %>">
			<input type="hidden" name="b_level" value="<%= b_level %>">
			<table>
				<tr height="30">
					<td width="80">
						작성자
					</td>
					<td width="140">
						<input name="b_name" type="text">
					</td>
					<td width="80">
						이메일
					</td>
					<td width="240">
						<input name="b_email" type="text">
					</td>
				</tr>
				<tr height="30">
					<td width="80">
						글제목
					</td>
					<td colspan="3">
						<%
							if(b_id == 0){
								%>
									<input name="b_title" type="text" size="55">
								<%
							}else{
								%>
									<input name="b_title" type="text" size="55" value="[<%= b_title %>]에 대한 답변" >
								<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="b_content" rows="10" cols="65"></textarea>
					</td>
				</tr>
				<tr>
					<td width="80">
						비밀번호 &nbsp(4자리)
					</td>
					<td colspan="3">
						<input name="b_pwd" type="password" size="4" minlength="4" maxlength="4">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="button" value="글쓰기" onclick="check_ok()" >&nbsp;
						<input type="reset" value="다시작성">&nbsp;
						<input type="button" value="글목록" onclick="location.href='QnAlist.jsp?pageNum=<%= pageNum %>'" >
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>












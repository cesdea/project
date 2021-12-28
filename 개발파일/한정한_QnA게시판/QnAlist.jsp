<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.QnA.QnABean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="magic.QnA.QnADBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");


	System.out.println("@@@### pageNum ===>"+pageNum);
	
	if(pageNum == "null"){
		pageNum="1";
	}
	
	QnADBBean db = QnADBBean.getInstance();
	ArrayList<QnABean> boardList = db.listBoard(pageNum);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int b_id=0, b_hit=0, b_level=0;
	String b_name, b_email, b_title, b_content;
	Timestamp b_date;
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>Q&A 게시판</h1>
		<table width="600">
			<tr>
				<td align="right">
					<a href="QnAwrite.jsp?pageNum=<%=pageNum%>">글 쓰 기</a>
				</td>
			</tr>
		</table>
		<table width="800" border="1" cellspacing="0" >
			<tr height="25">
				<td width="40" align="center">번호</td>
				<td width="450" align="center">글제목</td>
				<td width="120" align="center">작성자</td>
				<td width="130" align="center">작성일</td>
				<td width="60" align="center">조회수</td>
			</tr>
			<%
				for(int i=0; i<boardList.size(); i++){
						QnABean board = boardList.get(i);
						b_id = board.getB_id();
						b_name = board.getB_name();
						b_email = board.getB_email();
						b_title = board.getB_title();
						b_content = board.getB_content();
						b_date = board.getB_date();
						b_hit = board.getB_hit();
						b_level = board.getB_level();
			%>
					<tr height="25" bgcolor="#f7f7f7" 
									onmouseover="this.style.backgroundColor='#eeeeef'" 
									onmouseout="this.style.backgroundColor='#f7f7f7'">
						<td align="center">
							<%=b_id%>
						</td>
						<td>
							<%
								if(b_level > 0){
														for(int j=0; j<b_level; j++){
							%>
											&nbsp;
										<%
											}
										%>
										<img src="file:///E:/workspace2/elwork/WebContent/imges/AnswerLine.gif" width="16" height="16">
									<%
										}
									%>
							<a href="QnAshow.jsp?b_id=<%=b_id%>&pageNum=<%=pageNum%>"><%=b_title%></a>
						</td>
						<td align="center">
							<a href="mailto:<%=b_email%>"><%=b_name%></a>
						</td>
						<td align="center">
							<%=sdf.format(b_date)%>
						</td>
						<td align="right">
							<%=b_hit%>
						</td>
					</tr>
			<%
				}
			%>
		</table>
	</center>
	<center>
		<%=QnABean.pageNumer(5)%>
	</center>
</body>
</html>
















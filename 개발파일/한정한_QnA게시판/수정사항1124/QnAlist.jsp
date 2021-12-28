<%@page import="qna.QnABean"%>
<%@page import="qna.QnADBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum="1";
	}
	
	String id = (String)session.getAttribute("cus_id");
	if(id==null){
		id="";
	}
	
	
	
	QnADBBean db = QnADBBean.getInstance();
	ArrayList<QnABean> boardList = db.listBoard(pageNum);
	
/* 	int bid = Integer.parseInt(request.getParameter("q_id"));
	QnABean board = db.getBoard(bid, true); */
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	int q_id=0, q_hit, q_level=0;
	String q_name, q_email, q_title, q_content;
	Timestamp q_date;
	
	
%>

<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
@charset "UTF-8";
*{
    font-family: 'Sunflower', sans-serif;
}

table {
  
    width :100%;
    border-top:1px solid #444444;
    border-collapse: collapse;
    }
    
    th, td {
     
     border-bottom: 1px solid black;
     padding: 10px;
     border-right: 1px solid white;
    }
    th{
       
    }
   
 .button {
    background-color: black;
    color: white;
    border-radius: 5px;
 
   } 
   
 /*   onmouseover="this.style.backgroundColor='#eeeeef'" 
									onmouseout="this.style.backgroundColor='#f7f7f7'" */
</style>
</head>
<body>
	<center>
		<h1>Q&A</h1>
		<table width="800"  cellspacing="0" >
			<tr height="25" id="main">
				<th width="100" align="center">번호</td>
				<th width="340" align="center">글제목</td>
				<th width="120" align="center">작성자</td>
				<th width="130" align="center">작성일</td>
				<th width="60" align="center">조회수</td>
			</tr>
			<%
			    QnABean bb = new QnABean();
				for(int i=0; i<boardList.size(); i++){
						QnABean board = boardList.get(i);
						q_id = board.getQ_id();
						q_name = board.getQ_name();
						q_title = board.getQ_title();
						q_content = board.getQ_content();
						q_date = board.getQ_date();
						q_hit = board.getQ_hit();
						q_level = board.getQ_level();
			%>
					<tr height="25" class="text">
					
		
							
						<td align="center">
							<%=q_id%>
						</td>
						<td>
							<%
								if(q_level > 0){
														for(int j=0; j<q_level; j++){
							%>
											&nbsp;
										<%
											}
										%>
										<img src="${pageContext.request.contextPath}/imges/right.png" /" width="16" height="16">
									<%
										}
									%>
							<a href="QnAshow.jsp?q_id=<%=q_id%>&pageNum=<%=pageNum%>"><%=q_title%></a>
						</td>
						<td style="border-left: none;" align="center">
							<a><%=q_name%></a>
						</td>
						<td align="center">
							<%=sdf.format(q_date)%>
						</td>
						<td align="right">
							<%= q_hit%>
						</td>
					</tr>
			<%
				}
			%>
			<table width="600">
			<%  
			if(!id.equals("")){			
			%>
			  
               <tr>
				<td align="right">
			 <input class="button" type="button" style="color:white"  value="글쓰기" onclick ="location.href='QnAwrite.jsp?pageNum=<%=pageNum%>'">
				</td>
		    <%
			}
		    %>
			</tr>
		</table>
		</table>
	</center>
	<center>
		<%=QnABean.pageNumer(5)%>
	</center>
</body>
</html>
















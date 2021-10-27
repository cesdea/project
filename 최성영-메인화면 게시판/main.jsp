<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	
%>
<%
	String cus_id = (String)session.getAttribute("cus_id");
	String nickname = (String)session.getAttribute("nickname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="CSS/main_model.css" type="text/css">
<body>
	<center>
		<header>
			<div class="left">
				<a href="main.jsp?cus_id=<%= cus_id %>">메인보더</a>
			</div>
			<ul class="memu" >
				<li>
					<a href="main_memu.jsp?cus_id=<%= cus_id %>&movepage=notice">공지사항</a>
				</li>
				<li>
					<a href="main_memu.jsp?cus_id=<%= cus_id %>&movepage=board">게시판</a>
				</li>
				<li>
					<a href="main_memu.jsp?cus_id=<%= cus_id %>&movepage=qna">QnA</a>
				</li>
				<li>
					<a href="main_memu.jsp?cus_id=<%= cus_id %> && movepage=service">고객센터</a>
				</li>
			</ul>
			<div class="right">
				<a  href="messenger.jsp?cus_id=<%= cus_id %>">채팅방 입장</a>
			</div>
		</header>
		<content>
			<table>
				<tr>
					<td class="news" align="center" rowspan="5">
						<iframe src="news.html" width="700" height="870" scrolling="no" frameborder="0"></iframe>
					</td>
					<td>	
						<div id="login">
                        <%
                        	if(cus_id!=null){
                        %>
                        	<div>
                        		닉네임:<%=nickname %>(<%=cus_id %>)<br>
                        		<a href="CustomerLogOut.jsp" id="logout">로그아웃</a>
                        	</div>
                        <%
                        	}else{
                        %>
                        	<div>
                            	<a href="main_login.jsp">로그인</a>
                        	</div>
                        <%
                        	}
                        %>
                        </div>
					</td>
				</tr>
				<tr>
					<td class="exchage">
						<iframe src="https://sbiz.wooribank.com/biz/Dream?withyou=FXCNT0006&rc=0&divType=1&lang=KOR" frameBorder=0 scrolling=no topmargin="0" 
						name=irate marginWidth=0 marginHeight=0 title="무료환율표A형"></iframe>		
					</td>
				</tr>
				<tr>
					<td class="empty"></td>
				</tr>
				<tr>
					<td class="empty"></td>
				</tr>
				<tr>
					<td class="empty"></td>
				</tr>
				<tr>
					<td class="chart">
						인기차트
					</td>
					<td class="empty">
					</td>
				</tr>
			</table>
		</content>
		<footer>
			since 2021/10/15
		</footer>
	</center>
</body>
</html>

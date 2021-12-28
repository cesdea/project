<%@page import="service.ServiceAnswerBean"%>
<%@page import="service.ServiceAnswerDBBean"%>
<%@page import="service.ServiceBean"%>
<%@page import="service.ServiceDBBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#question{
	background-color: #f9f9f9;
}
</style>
</head>
<link rel="stylesheet" href="CSS/bootstrap.css" type="text/css">
<body>
	<%	
		int s_id=0;
		String s_name, s_content, s_uid;
		String id = (String)session.getAttribute("cus_id");
		if(id==null){
			id="";
		}
		String pageNum = request.getParameter("pageNum");

		if(pageNum == null){
			pageNum="1";
		}
		
		ServiceDBBean db = ServiceDBBean.getInstance();
		/*������ ��ü �� ����*/
		int countNum = db.countService();
		ArrayList<ServiceBean> serviceList = db.listService(pageNum);//������ �� ���
		
		/*������ id ���� Ȯ��*/
		String man_id = db.manidCheck(id);
	
		int s_a_id=0, s_a_ref=0;
		String s_a_name="", s_a_content="", s_a_uid;
		ServiceAnswerDBBean a_db = ServiceAnswerDBBean.getInstance();
		ArrayList<ServiceAnswerBean> serviceAnswerList = a_db.listServiceAnswer(pageNum);//������ �亯 �� ���
	%>
		
		<h1 class="text-center">�� �� �� ��</h1>
		<p class="text-left">��ü <%= countNum %>��</p>
		<table class="table">
			<tr>
				<th class="text-center">��ȣ</th>
				<th class="text-center">�۳���</th>
				<th class="text-left" colspan="2">�ۼ���</th>			
			</tr>
	<%
				for(int i=0; i<serviceList.size(); i++){
					ServiceBean service = serviceList.get(i);
					s_id = service.getS_id();
					s_name = service.getS_name();
					s_content = service.getS_content();
					s_uid = service.getS_uid();
					
					/*����� id Ȯ��*/
					String cus_id = db.cusidCheck(s_uid);
					
			%>
					<tr class="table" id="question">
						<td class="text-center">
							<%= s_id %>
						</td>
						<td class="text-center">
							<%= s_content %>
						</td>
						<td class="text-left">
							<%= s_name %>
						</td>
			<%
						if(man_id.equals(id) && !id.equals("") ){
			%>
							<td class="text-right">
								<a class="text-muted" href="ServiceAnswerWrite.jsp?pageNum=<%= pageNum %>&s_id=<%= s_id %>">�亯</a>	
								| <a class="text-muted" href="ServiceEdit.jsp?pageNum=<%= pageNum %>&s_id=<%= s_id %>">����</a>	
								| <a class="text-muted" href="ServiceDeleteOk.jsp?pageNum=<%= pageNum %>&s_id=<%= s_id %>">����</a>	
							</td>
			<%
						}
						else if(id.equals(cus_id) && !id.equals("")){
			%>
							<td class="text-right">
								<a class="text-muted" href="ServiceEdit.jsp?pageNum=<%= pageNum %>&s_id=<%= s_id %>">����</a>	
								| <a class="text-muted" href="ServiceDeleteOk.jsp?pageNum=<%= pageNum %>&s_id=<%= s_id %>">����</a>	
							</td>
			<%
						}else if(!id.equals("")){
			%>
							<td></td>
			<%
						}
			%>
								
					</tr>
			<%
						for(int j=0; j<serviceAnswerList.size(); j++){
							ServiceAnswerBean serviceAnswer = serviceAnswerList.get(j);
							s_a_id = serviceAnswer.getS_a_id();
							s_a_ref = serviceAnswer.getS_a_ref();
							s_a_name = serviceAnswer.getS_a_name();
							s_a_content = serviceAnswer.getS_a_content();
							s_a_uid = serviceAnswer.getS_a_uid();
							
							if(s_id == s_a_id){
			%>
								<tr>
									<td class="text-center">
										<img src="imges/right.png">
									</td>
									<td class="text-center">
										<%= s_a_content %>
									</td>
									<td class="text-left">
										<%= s_a_name %>
									</td>
			<%
								if(man_id.equals(id) && !id.equals("")){
			%>
									<td class="text-right">
										<a class="text-muted" href="ServiceAnswerEdit.jsp?pageNum=<%= pageNum %>&s_a_id=<%= s_a_id %>">����</a>	
										| <a class="text-muted" href="ServiceAnswerDeleteOk.jsp?pageNum=<%= pageNum %>&s_a_id=<%= s_a_id %>">����</a>	
									</td>
			<%
								}else if(!id.equals("")){
			%>
									<td></td>
			<%
								}
			%>
								</tr>
			<%
							}
						}
					}
			
			%>
		</table>
			<%
				if(!id.equals("")){
			%>
					<div class="text-right">
						<input class="btn btn-default" type="button" value="�۾���" onclick="location.href='ServiceWrite.jsp?pageNum=<%= pageNum %>'">
					</div>	
			<%
				}
			%>
					<div class="text-center">
							<%= ServiceBean.pageNumer(5) %>				
					</div>
</body>
</html>
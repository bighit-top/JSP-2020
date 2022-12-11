<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.global.professor.qaDAO" %>
<%@ page import="project.global.professor.qaDTO" %>
<%@ page import="project.global.professor.qainfoDTO" %>
<%@include file = "/global/professor/professorMain.jsp"%>


<% request.setCharacterEncoding("UTF-8"); %>
<title>자유 게시판 글쓰기</title>
<jsp:useBean id="dto" class="project.global.professor.qaDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>
<%
	int num=0;
	//String writer = "";
	//String pageNum = request.getParameter("pageNum");
	
	String classnum = request.getParameter("classnum");
	
	
	
	try{
		qaDAO dao = new qaDAO();
		qaDTO qqdto = dao.selectqaboard(classnum);
		qainfoDTO qdto = dao.qainfo(id);
		
		if(request.getParameter("num")!=null){
			num=Integer.parseInt(request.getParameter("num"));
		}
	
%>
<style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 60%;
	margin: auto;
}
td, th{
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
	font-size: 14px;
}
tr: nth-child(even){
	background-color: #dddddd;
}
div.btn{
	margin: auto;
}

</style> 
<article>
<h1 style="text-align:center;" >게시판 글쓰기</h1>
<br /><br />
<form action="qawritePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="homeroompro" value="<%=qqdto.getHomeroompro()%>">
<input type="hidden" name="classnum" value="<%=classnum %>" />

	<table style="margin: 0 auto;">
		<tbody>
			<tr>
				<th scope="row" style="background-color: #eee;">강의명</th>
				<td style="text-align: center;" ><%=qqdto.getClassname() %>&nbsp;(<%=classnum %>)
				<input type="hidden" name="classname" value="<%=qqdto.getClassname() %>"/></td>
			</tr>
			<tr>
				<th scope="row" style="background-color: #eee;">작성자</th>
				<td style="width: 150px;"><%=qqdto.getHomeroompro()%>
				<input type="hidden" name="writer" value="<%=qqdto.getHomeroompro()%>" /> </td>
				
			</tr>
			<tr>
				<th scope="row" style="background-color: #eee;">제목</th>
				<td><input type="text" name="subject" style="width: 450px;"
					value=""></td>
			</tr>
			<tr>
				<th style="background-color: #eee;">내용</th>
				<td><textarea name="content" rows="23" cols="61"></textarea></td>
				
			</tr>
			
			<tr>
				<td colspan="2">	
					<input type="submit" value="저장" /> <input type="button"
					value="취소" onClick="window.location='Q&Alist.jsp?classnum=<%=classnum%>'" /></td>
			</tr>
		</tbody>
	</table>
	<%}catch(Exception e){} %>
</form></article>
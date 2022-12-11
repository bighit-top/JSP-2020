<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.global.professor.qaDTO"%>
<%@ page import="project.global.professor.qaDAO"%>
<%@ page import="project.global.professor.qainfoDTO"%>
<%@include file = "/global/student/Main2.jsp"%>


<% request.setCharacterEncoding("UTF-8"); %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	String classnum = request.getParameter("classnum");
	
	try {
		qaDAO dao = new qaDAO();
		qaDTO qdto = dao.selectqaboard(classnum);
		qaDTO dto = dao.updateGetArticle(num, classnum);
		qainfoDTO idto = dao.qainfo(id);
%>
<title>글 수정 페이지</title>
<body>
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
<h1 style="text-align: center;"> 게시판 글 수정</h1>
<br />

<form method="post" action="qaUpdatePro.jsp?num=<%=num %>&pageNum=<%=pageNum%>&
classnum=<%=classnum%>">

	<table  border="1" cellspacing="0" cellpadding="0"
		align="center">
		<tr height="30">
			<td align="center" style="background-color: #eee;">번호</td>
			<td align="center" ><%=dto.getNum()%></td>
			<td align="center"  style="background-color: #eee;">작성자</td>
			<td align="center"><%=idto.getStname() %>
			<input type="hidden" name="writer" value="<%=idto.getStname() %>" /></td>
			
		</tr>
		<tr height="30">
			<td align="center" style="background-color: #eee;">강의명</td>
			<td colspan="3" colspan="3" align="center" ><%=qdto.getClassname() %>
			<input type="hidden"  name="classname" value="<%=qdto.getClassname() %>" /></td>
		</tr>
		<tr height="30">
			<td align="center" style="background-color: #eee;">제목</td>
			<td align="center"  colspan="3"><input type="text" name="subject" value="<%=dto.getSubject()%>" /></td>
		</tr>

		<tr height="30">
			<td align="center"  colspan="4" style="background-color: #eee;">질문 내용</td>
		</tr>
		<tr height="30">
		
				<td align="left" colspan="4">
				<textarea name="content" rows="23" cols="61"><%=dto.getContent()%></textarea></td>
				
				
			</tr>
		
	</table>
	<br />
		
		<table width="500" border="0" cellspacing="0" cellpadding="0"
			align="center">
			<tr>
				<td><input type="submit" value="글수정"> 
				<a href="Q&Alist.jsp?pageNum=<%=pageNum%>
				&classnum=<%=classnum%>"><input type="button" value="목록보기"/></a>
				</td>
			</tr>
		</table>
		</from>
		<br />
		<%
			} catch (Exception e) {}
		%>
		
		
</article>
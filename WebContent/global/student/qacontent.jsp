<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.global.professor.qaDTO"%>
<%@ page import="project.global.professor.replyDTO"%>
<%@ page import="project.global.professor.qaDAO"%>
<%@ page import="project.global.professor.qainfoDTO"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@include file = "/global/student/Main2.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String classnum = request.getParameter("classnum");
	String pageNum = request.getParameter("pageNum");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");


	try {
		qaDAO dao = new qaDAO();
		//해당 강의코드와 일치한 강의 데이터 
		qaDTO qdto = dao.selectqaboard(classnum);
		qaDTO dto = dao.getArticle(num, classnum);
		
		//댓글 리스트 select
		List<replyDTO> list = dao.replylist(num, classnum);
		qainfoDTO idto = dao.qainfo(id);//해당 세션 학번과 일치한 개인이름, 학번 
%>


<title>글 내용 보기</title>
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
<table width="500" border="1" cellspacing="0" cellpadding="0"
	align="center">
	<h1 style="text-align: center;">QnA 질문 내용 - 강의명 : <%=qdto.getClassname() %></h1>
	<br />
	<tbody>
		<tr height="30">
			<td align="center" width="125" style="background-color: #eee;">글번호</td>
			<td align="center" width="125"><%=dto.getNum()%></td>
			<td align="center" width="125" style="background-color: #eee;">작성자</td>
			<td align="center" width="125"><%=dto.getWriter()%></td>
		</tr>
		<tr height="30">
			<td align="center" width="125" style="background-color: #eee;">글제목</td>
			<td align="center" width="375" colspan="3"><%=dto.getSubject()%></td>
		</tr>
		<tr height="30">
			<td align="center" width="125" style="background-color: #eee;">작성일</td>
			<td align="center" width="125"><%=sdf.format(dto.getReg_date())%></td>
			<td align="center" width="125" style="background-color: #eee;">조회수</td>
			<td align="center" width="125"><%=dto.getReadcount()%></td>
		</tr>
		<tr height="30">
			<td align="center" width="500" colspan="4" style="background-color: #eee;">질문 내용</td>
		</tr>
		<tr height="30">
			<td align="left" width="500" colspan="4"><%=dto.getContent()%></td>
		</tr>
	</tbody>
</table>
<br />
<table width="500" border="0" cellspacing="0" cellpadding="0"
	align="center">
	<tr>
		<td><a href="Q&Alist.jsp?&pageNum=<%=pageNum%>&
			classnum=<%=classnum%>"><input type="button" value="목록보기" /></a>
			<%if(id != null && id.equals(idto.getStnum())){  %>
				<a href="qaUpdateForm.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&
				classnum=<%=classnum%>"><input type="button" value="글수정"/></a>
				<a href="qadeleteForm.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&classnum=<%=classnum%>">
				<input type="button" value="글삭제"/></a>
			<%} %>

		</td>
	</tr>
</table>
<br><br><br><br>
<!-- 댓글 작성 -->
<form action="replyPro.jsp">

	<table width="500" border="1" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td colspan="1" style="background-color: #eee;"><%=idto.getStname() %>
			<input type="hidden" name="rname" value="<%=idto.getStname() %>"/>

			</td>
	
			<td><textarea rows="5" cols="60" name="replytext"
					placeholder="댓글을 작성하세요" /></textarea></td>
		</tr>
	</table>
	<input type="hidden" name="num" value="<%=num%>" />
	<input type="hidden" name="classname" value="<%=qdto.getClassname()%>" />
	<input type="hidden" name="classnum" value="<%=classnum%>" />
	<input type="hidden" name="homeroompro" value="<%=qdto.getHomeroompro()%>" />
	<input type="hidden" name="pageNum" value="<%=pageNum%>" /><br/>
	<input type="hidden" name="id" value="<%=idto.getStnum() %> " />
	<input type="submit" value="댓글 작성" style="margin-left: 50%;"/>
</form><br />
<table width="500" border="1" cellspacing="0" cellpadding="0"
	align="center">
	<%
		for (replyDTO r : list) {
	%>
	<tr>
		<form action="replydeleteForm.jsp">

		<td style="background-color: #eee;"><%=r.getRname()%></td>
		<td rowspan="2"><%=r.getReplytext()%></td>
		<td rowspan="2">
		<span style="float:center;">
		<% System.out.println("======================"+r.getId());%>
	<%if(id != null ){
		 System.out.println("if 1:"+r.getId());	
			if(id.equals(r.getId())){ 
			 System.out.println("if 2:"+r.getId());	 %>	
				<input type="submit" value="삭제" >
				<input type="hidden" name="id" value="<%=r.getId() %>" />
				<input type="hidden" name="qno" value="<%=r.getQno()%>" />
				<input type="hidden" name="step" value="<%=r.getStep()%>" />
				<input type="hidden" name="classnum" value="<%=r.getClassnum()%>" />
		</span>
		<%} 
	}%>	</td>
	</tr>
	<tr>
		<td><%=sdf.format(r.getReplydate())%></td>
		
	</tr>
		</form>
	<%} %>
</table>
<%}catch(Exception e){} %>

</article>
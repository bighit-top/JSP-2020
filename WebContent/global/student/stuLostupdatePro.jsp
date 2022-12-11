<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import= "project.global.student.studentDAO"%>
<%@ page import= "project.global.student.stuLostDTO"%>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="project.global.student.stuLostDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
 
    String pageNum = request.getParameter("pageNum");

	studentDAO dbPro = new studentDAO();
    int check = dbPro.updateArticle1(article);

    if(check==1){
%>
	 <meta http-equiv="Refresh" content="0;url=stuLostForm.jsp?pageNum=<%=pageNum%>" >
<% }%>




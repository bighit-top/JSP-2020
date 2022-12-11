<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "project.global.student.studentDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="project.global.student.stuLostDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
    article.setReg_date(new Timestamp(System.currentTimeMillis()) );
	

	studentDAO dbPro = new studentDAO();
    dbPro.insertArticle1(article);

    response.sendRedirect("stuLostForm.jsp");
%>


<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "project.global.admin.adminDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="project.global.admin.adminListDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
    article.setReg_date(new Timestamp(System.currentTimeMillis()) );
	

	adminDAO dbPro = new adminDAO();
    dbPro.insertArticle(article);

    response.sendRedirect("adminListForm.jsp");
%>


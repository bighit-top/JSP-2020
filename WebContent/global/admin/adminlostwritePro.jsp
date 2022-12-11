<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "project.global.admin.adminDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("euc-kr");%>

<jsp:useBean id="article" scope="page" class="project.global.admin.adminlostDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
    article.setReg_date(new Timestamp(System.currentTimeMillis()) );
	

	adminDAO dbPro = new adminDAO();
    dbPro.insertArticle1(article);

    response.sendRedirect("adminLostForm.jsp");
%>


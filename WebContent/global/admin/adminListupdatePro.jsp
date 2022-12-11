
<%@ page import= "project.global.admin.adminDAO"%>
<%@ page import= "project.global.admin.adminListDTO"%>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="project.global.admin.adminListDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
 
    String pageNum = request.getParameter("pageNum");

	adminDAO dbPro = new adminDAO();
    int check = dbPro.updateArticle(article);

    if(check==1){
%>
	 <meta http-equiv="Refresh" content="0;url=adminListForm.jsp?pageNum=<%=pageNum%>" >
<% }%>

<h2> <%=pageNum%> </h2>

<h2> <%=article.getWriter() %> </h2>

<h2> <%=check%> </h2>


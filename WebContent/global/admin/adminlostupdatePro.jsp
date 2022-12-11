<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import= "project.global.admin.adminDAO"%>
<%@ page import= "project.global.admin.adminlostDTO"%>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="article" scope="page" class="project.global.admin.adminlostDTO">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
 
    String pageNum = request.getParameter("pageNum");

	adminDAO dbPro = new adminDAO();
    int check = dbPro.updateArticle1(article);

    if(check==1){
%>
	 <meta http-equiv="Refresh" content="0;url=adminLostForm.jsp?pageNum=<%=pageNum%>" >
<% }%>




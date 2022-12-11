<% 
	session.invalidate();
	response.sendRedirect("/project/global/loginForm.jsp");
	%>
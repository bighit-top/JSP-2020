<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "project.global.admin.globalDAO" %>

<% request.setCharacterEncoding("euc-kr");%>


<%
	String id = request.getParameter("id");
	String pw  = request.getParameter("pw");
	String a = request.getParameter("ppp");		// 교수 
	globalDAO manager = globalDAO.getInstance();//나중에 교수디에이오로 이름변경
    int check= manager.globalCheck(id, pw);
	
	
	if(check==1 && a.equals("1")){
		session.setAttribute("studentId", id);
		response.sendRedirect("/project/global/student/Main.jsp");
	}else if(check==2 && a.equals("2")){
		session.setAttribute("professorId",id);
		response.sendRedirect("/project/global/professor/professorMain2.jsp");
	}else if(check==3 && a.equals("2")){
		session.setAttribute("adminId",id);
		response.sendRedirect("/project/global/admin/adminMain.jsp");
	}else if(check == 0){%>
	<!-- <script> 
	  alert("아이디/비밀번호가 맞지 않습니다.. ㅠ3ㅠ");
      history.go(-1);//뒤로가기, 이전페이지로 돌아가라
	</script> -->
	<script>
		document.location.href="errorPage.jsp";
	</script>
<%	}else{%>
	<script>
		document.location.href="errorPage.jsp";
	</script>
<%} %>


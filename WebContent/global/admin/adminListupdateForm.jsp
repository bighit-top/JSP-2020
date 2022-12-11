<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import= "project.global.admin.adminDAO"%>
<%@ page import= "project.global.admin.adminListDTO"%>
<%@include file = "/global/admin/adminMain2.jsp"%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">

</head>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  try{
	  adminDAO dbPro = new adminDAO();
	  adminListDTO article =  dbPro.updateGetArticle(num);

%>

<body> 
	<style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 50%;
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
<center><b>글수정</b>
<br>
<form method="post" name="writeform" action="adminListupdatePro.jsp?pageNum=<%=pageNum%>">
<table width="400" border="1" cellspacing="0" cellpadding="0"   align="center">
  <tr>
    <td  width="70" align="center" style="background-color: #eee;">이 름</td>
    <td align="left" width="330">
       <input type="text" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>" disabled>
       <input type="hidden" value="<%=article.getWriter() %>" name = "writer" />
	   <input type="hidden" name="num" value="<%=article.getNum()%>"></td>
  </tr>
  <tr>
    <td  width="70"  align="center" style="background-color: #eee;">제 목</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>"></td>
  </tr>

  <tr>
    <td  width="70" align="center" style="background-color: #eee;">내 용</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="40"><%=article.getContent()%></textarea></td>
  </tr>

  <tr>      
   <td colspan=2  align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='adminListForm.jsp?pageNum=<%=pageNum%>'">
   </td>
 </tr>
 </table>
</form>
<%
}catch(Exception e){}%>      
      
</body>
</html>      

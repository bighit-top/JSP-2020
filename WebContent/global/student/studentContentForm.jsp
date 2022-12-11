 <%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import= "project.global.admin.adminListDTO"%>
<%@ page import= "project.global.admin.adminDAO"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@include file = "/global/student/Main2.jsp"%>



 <article>
<title>게시판</title>

</head>

<%
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");

   try{
	   adminDAO dbPro = new adminDAO();
	   adminListDTO article =  dbPro.getArticle(num);
  
	 
%>
<body>  
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
<center><b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0"align="center">  
  <tr height="30" >
    <td align="center" width="125" style="background-color: #eee;">글번호</td>
    <td align="center" width="125" align="center">
	     <%=article.getNum()%></td>
    <td align="center" width="125" style="background-color: #eee;">조회수</td>
    <td align="center" width="125" align="center">
	     <%=article.getReadcount()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" style="background-color: #eee;" >작성자</td>
    <td align="center" width="125" align="center">
	     <%=article.getWriter()%></td>
    <td align="center" width="125" style="background-color: #eee;" >작성일</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(article.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125" style="background-color: #eee;">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=article.getSubject()%></td>
  </tr>
  <tr>
    <td align="center" width="125" style="background-color: #eee;">글내용</td>
    <td align="left" width="375" colspan="3"><pre><%=article.getContent()%></pre></td>
  </tr>
  
</table>    <br/>
<input type= "button" value="뒤로가기" onclick="history.go(-1)" align ="center">
<%
 }catch(Exception e){} 
 %>
</form>      
</body></article></section></body>
</html>      

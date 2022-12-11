<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import= "project.global.admin.adminListDTO"%>
<%@ page import= "project.global.admin.adminDAO"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<% request.setCharacterEncoding("UTF-8");%>


<%!//선언문 인스턴스 변수
    int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");//
%>

<%
    String pageNum = request.getParameter("pageNum");//파라미터는 겟이나 포스트방식으로 받아야됨
    if (pageNum == null) {
        pageNum = "1";//페이지의 기본 값 1페이지
    }

    int currentPage = Integer.parseInt(pageNum);//문자를 숫자로 바꿔주는 인티저 파세인트 커랜트페이지 = 1
    int startRow = (currentPage - 1) * pageSize + 1;//(1-1)*10+1=1 스타트로우는=1
    int endRow = currentPage * pageSize;//1*10=10
    int count = 0;
    int number=0;

    List articleList = null;
    adminDAO dbPro = new adminDAO();
    
    count = dbPro.getArticleCount();
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, endRow);
    }

	number=count-(currentPage-1)*pageSize;
%>
<html>


 <article>
 <style>
table{

	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 80%;
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
<title>게시판 </title>




<center><b>공지사항(전체 글:<%=count%>)</b>


     <!-- 관리자 로그인 시 글쓰기 보이게 함 뿌우 -->
      <%if(session.getAttribute("adminId") !=null){ %> 
    <a href="adminListWriteForm.jsp">글쓰기</a>
    <%}%>
   
   


<%
    if (count == 0) {
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
    게시판에 저장된 글이 없습니다.
    </td>
</table>

<%  } else {    %>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"> 
      <td align="center"  width="50"  style="background-color: #eee;" >번 호</td> 
      <td align="center"  width="250" style="background-color: #eee;">제   목</td> 
      <td align="center"  width="100" style="background-color: #eee;">작성자</td>
      <td align="center"  width="150" style="background-color: #eee;" >작성일</td> 
      <td align="center"  width="50"  style="background-color: #eee;">조 회</td> 
      
    </tr>
<%  
        for (int i = 0 ; i < articleList.size() ; i++) {
        	adminListDTO article = (adminListDTO)articleList.get(i);
%>
   <tr height="30">
    <td align="center"  width="50" > <%=number--%></td>
    <td  width="250" >

           
      <a href="adminContentForm.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
           <%=article.getSubject()%></a> 
          <% if(article.getReadcount()>=20){%>
         <%}%> </td>
    <td align="center"  width="100"> 
      <%=article.getWriter()%></a></td>
    <td align="center"  width="150"><%= sdf.format(article.getReg_date())%></td>
    <td align="center"  width="50"><%=article.getReadcount()%></td>
 
  </tr>
     <%}%>
</table>
<%}%>

<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="adminListForm.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="adminListForm.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="adminListForm.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
</center></article></section>
</body>
</html>
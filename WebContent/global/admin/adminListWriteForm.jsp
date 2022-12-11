<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<html>
<head>
<title>게시판</title>
<%-- 
<script language="JavaScript" src="script.js"></script>
</head>
 <%if(session.getAttribute("memId") ==null){%>
	<script>
		alert("로그인 후 글쓰기 가능합니다.")
		history.go(-1);
		</script>



<%}%>--%>



   
<body>  
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
<center><b>글쓰기</b>
<br>

<form method="post" name="adminListWriteform" action="adminListWritePro.jsp" onsubmit="return writeSave()">
<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
   <tr>
    <td align="right" colspan="2">
	   
   </td>
   </tr>
   <tr>
    <td  width="70"  align="center" style="background-color: #eee;">이 름</td>
    <td  width="330">
      
       <%=id %>
       <input type="hidden" name="writer" value="<%=id %>"></td>
  </tr>
  <tr>
    <td  width="70"  align="center" style="background-color: #eee;">제 목</td>
    <td  width="330">
    <%if(request.getParameter("num")==null){%>
       <input type="text" size="40" maxlength="50" name="subject"></td>
	<%}else{%>
	   <input type="text" size="40" maxlength="50" name="subject" value="[답변]">
	<%}%>
  </tr>
  
  <tr>
    <td  width="70"  align="center" style="background-color: #eee;">내 용</td>
    <td  width="330" >
     <textarea name="content" rows="13" cols="40"></textarea> </td>
  </tr>

<tr>      
 <td colspan=2  align="center"> 
  <input type="submit" value="글쓰기" >  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='adminListForm.jsp'">
</td></tr></table>    
  
</form>      
</body>
</html>      

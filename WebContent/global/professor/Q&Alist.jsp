<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.global.professor.qaDTO" %>
<%@ page import="project.global.professor.qaDAO" %>
<%@ page import="project.global.professor.replyDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@include file = "/global/professor/professorMain.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%!
	int pageSize = 10; //게시판 글 갯수 10개 씩 보이도록 설정하기 위한 변수 
	SimpleDateFormat sdf = 
		new SimpleDateFormat("yyyy-MM-dd HH:mm"); //날짜 형식 타입
	
%>
<%
	String pageNum = request.getParameter("pageNum"); 
	
	if (pageNum == null) { 
	    pageNum = "1"; //pageNum이 null 인 경우 1로 설정
	}
	 int currentPage = Integer.parseInt(pageNum); //pageNum 정수로 변경
	 int startRow = (currentPage - 1) * pageSize + 1; //게시판 목록 시작 페이지 
	 int endRow = currentPage * pageSize; //게시판 목록 다음 페이지
	 int count = 0; //게시판 글 갯수 
	 int number=0; //게시판 글 목록 번호

	 
	//강의명 클릭 시 각 강의 QnA게시판으로 이동하기 위한 파라미터 변수 설정
	String classnum = request.getParameter("classnum");

	
	
	 List articleList = null; //List 변수 설정
	 qaDAO dao  =  new qaDAO(); //qaDAO 객체 생성
	 count = dao.getArticleCount(classnum); //강의코드로 게시판 글 조회 후 글 갯수 count 변수에 저장 
	 qaDTO qdto = dao.selectqaboard(classnum);
	 
	 
	 //dao.selectqaboard(classname, homeroompro, classnum);
	 //각 강의 게시판에 저장된 글이 있다면
	 if(count>0){
		 //글 list로 출력
		 articleList = dao.getArticles(classnum, startRow, endRow);
	 }
	 //게시판 글 목록 번호
	 number=count-(currentPage-1)*pageSize;
	 
	 

%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
</head>


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
<article>
<h2 align="center">자유 게시판 </h2>

<table border="0" width="500" cellpadding="1" cellspacing="1" align="center">
	<tr>
		<td>강의명 : <%=qdto.getClassname()%></td>&nbsp;&nbsp;
		<td style="text-align:right;"><a href="qawriteForm.jsp?classnum=<%=classnum%>">글쓰기</a></td>
	</tr>
</table><br>
<%if(count==0){ %>
<table border="1" width="500" cellpadding="1" cellspacing="1" align="center">
	<tr>
		<td align="center">게시판에 저장된 글이 없습니다.</td>
	</tr>

</table>

<%}else{ %>
<table border="1" width="500" cellpadding="1" cellspacing="1" align="center">
	<tr height="30">
	<td align="center" width="30" style="background-color: #eee;">번호</td>
	<td align="center" width="150" style="background-color: #eee;">제목</td>
	<td align="center" width="50" style="background-color: #eee;">작성자</td>
	<td align="center" width="50" style="background-color: #eee;">작성일</td>
	<td align="center" width="30" style="background-color: #eee;">조 회</td>
	</tr>
	<%
	 	int replycount = 0; //댓글 갯수 변수 초기화
		
		for(int i=0; i<articleList.size(); i++){
			//게시판 글 목록 리스트 qaDTO 변수에 저장
			qaDTO dto = (qaDTO)articleList.get(i);
			//댓글 갯수 글번호, 강의코드로 select해오기
			replycount = dao.replyCount(dto.getNum(), classnum);
	%>
	<tr>
	<td align="center"><%=dto.getNum() %></td>
	<td align="center"><a href="qacontent.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage %>&classnum=<%=classnum %>" >
	<%=dto.getSubject() %>&nbsp;[<%=replycount %>]</a></td>
	<td align="center"><%=dto.getWriter() %></td>
	<td align="center"><%=dto.getReg_date() %></td>
	<td align="center"><%=dto.getReadcount() %></td>
	</tr>
	<%} %>
</table>


<%} %>
<%  //페이지번호 계산
	
    if (count > 0) {//게시판 글 있는 경우
    	//게시판 글 10개 넘을 때마다 게시판 페이지 1씩 증가
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		//게시판 페이지
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		//게시판 마지막 페이지
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        //페이지 수 10 이상인 경우 [이전] 추가
        if (startPage > 10) {    %>
        <p style="text-align: center;"><a href="Q&Alist.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <p style="text-align: center;"><a href="Q&Alist.jsp?pageNum=<%= i %>">[<%= i %>]</a></p>
<%
        }
        
        if (endPage < pageCount) {  %>
        <p style="text-align: center;"><a href="Q&Alist.jsp?pageNum=<%= startPage + 10 %>">[다음]</a></p>
<% 
        } 
    }
%>
<br/>
<p style="text-align: center;"><a href="/project/global/professor/proboardForm.jsp?classnum=<%=classnum%>" >
<input type="button" value="강의리스트" /> </a></p>
</body></article>
</html>
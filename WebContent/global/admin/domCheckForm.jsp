<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="project.global.admin.domCheckDTO" %>
<%@ page import="project.global.admin.domDAO" %>
<%@include file = "/global/admin/adminMain2.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	
	domDAO dao1 = new domDAO(); //domDAO() 객체 생성
	List<domCheckDTO> list = dao1.getCheck(); //입실 신청 학생 데이터 조회
	String allow= request.getParameter("allow"); //승인 파라미터 
%>
<!DOCTYPE html>

 <article>
<title>기숙사 입실 승인 페이지</title>
<!--  
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                   document.getElementById('zonecode').value = data.roadAddress;
            
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>
-->
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

</head>
<body>
<h1 align="center">기숙사 입실 승인</h1>

<table>
	<tr style="background-color: #eee;">
		<th>번호</th>
		<th>학번</th>
		<th>학과</th>
		<th>성명</th>
		<th>성별</th>
		<th>희망 생활관</th>
		<th>입실 승인</th><!-- DB insert -->
	</tr>
	<%for(domCheckDTO dto : list){ %>
	<tr>
		<td><%=dto.getNo() %></td>
		<td><%=dto.getStnum() %>
			<!-- <input type="hidden" name="stnum" value="<%=dto.getStnum()%>"> -->
		</td>
		<td><%=dto.getPart() %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getGender() %></td>
		<td><%=dto.getDreamroom() %></td>
		<!-- <td><input type="text" id="zonecode" /></td> -->
		<td><div class="btn"><a href ="/project/global/admin/domCheckPro.jsp?stnum=<%=dto.getStnum()%>&allow=1">
		<input type="button" value="승인"/></a>
		<a href="/project/global/admin/domCheckPro.jsp?stnum=<%=dto.getStnum()%>&allow=-1"><input type="button" value="거부" /></a>
		</div></td>
	</tr>
	<%} %>
</table><br />
<center><a href="/project/global/admin/adminMain.jsp"><input type="button" value="메인으로"></a></center>
</body></article></section></body>
</html>
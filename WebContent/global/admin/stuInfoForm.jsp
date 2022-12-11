<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.global.admin.adminDAO" %>
<%@ page import="project.global.admin.subjectDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Locale" %>
<% request.setCharacterEncoding("UTF-8");%>
<%@include file = "/global/admin/adminMain2.jsp"%>
<html>
<head>

</head>
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
<title>학생정보 입력</title>

<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

<%
	adminDAO dao1 = new adminDAO();
	List<subjectDTO> list = dao1.partcall();
	
	Calendar calendar = new GregorianCalendar(Locale.KOREA);
	int nYear = calendar.get(Calendar.YEAR);

%>


<script>           
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("zon").value = data.zonecode;
				document.getElementById("street").value = data.address;
			}
		}).open();
	}
</script>

<script language="javascript">
	function lastday(){
		var year1 = document.getElementById('select_year').value;
		var month1 = document.getElementById('select_month').value;
		
		var lastday = (new Date(year1, month1, 0)).getDate();
		
/* 		$('select_day').empty(); */
		$("select#select_day option").remove();
		$("select#select_day").append("<option value='' selected disabled>일</option>");
		for(var count = 1; count<=lastday; count++){
			var option = $("<option value="+count+">"+count+"</option>");
			$('#select_day').append(option);
		}
	}
</script>




<h2 align="center">학생정보입력</h2>
<form action = "stuInfo.do" method="post" enctype="multipart/form-data">
<!-- <form action = "stuInfoPro.jsp" method="post" enctype="multipart/form-data"> -->
	<table border=1 align="center">
		<tr>
			<td align="center" rowspan=6 width="100px">
				<!-- image src 지정 / name 지정 -->
				<img src="user.png" width="100" height="100"/>
			</td>
			
			
			<td height="30"  style="background-color: #eee;">이름</td>
			<td><input type="text" size="7" name="stname" /> </td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">이미지</td>
			<td>
				<input type="file" value="이미지선택" name="image" /> 
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">비밀번호</td>
			<td>
				<input type="text" name="pw" size="9"/>
			</td>
		
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">생년월일</td>
			<td>
			 			 
			 <select name="year1" id="select_year">
			 	<option value="" selected disabled>년</option>
			 	<%for(int i = nYear; i!=1930; i--){ %>
			 		<option value="<%=i%>"><%=i%></option>
			 	<%} %>
			 </select>년
			 
			 <select  name="mon" id="select_month" onchange="lastday()">
			 	<option value="" selected disabled>월</option>
			 	<%for(int i = 1; i<=12; i++) {%>
			 		<option value="<%=i%>"> <%=i%> </option>
			 	<%}%>
			 </select>월
			<!--  <input type="text" size="2" name="day1" />일 -->
			
			 <select name="day1" id="select_day">
			 	<option value="" selected disabled>일</option>
			 </select>&nbsp;&nbsp;일
			 </td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">email </td>
			<td>
				<input type="text" name="email" size="30"/>
			</td>  
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">성별</td>
			<td>
				<input type="radio" value="남자" name="sex"/>남자 &nbsp;
				<input type="radio" value="여자" name="sex"/>여자
			</td>
		</tr>
		
<!-- 		<tr>
			<td height="30"  style="background-color: #eee;">학번</td>
			<td>
				<input type="text" size="7" name="stnum" />
			</td>
			
		</tr> -->
		
		<tr>
			<td rowspan=7></td>
			<td height="30"  style="background-color: #eee;">신분</td>
			<td>
				<select name = "floor">
					<option value="" selected disabled>신분선택</option>
					<option value="재학">재학</option>
					<option value="편입">편입</option>
				</select>
			</td>
		</tr>
	
		<tr>
			<td height="30"  style="background-color: #eee;">학년</td>
			<td>
				<select name="grade">
					<option value="" selected disabled>학년</option>
					<option value="1">1학년</option>
					<option value="2">2학년</option>	
				
				</select>
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">학과</td>
			<td>
				<select name="part">
					<option value="" selected disabled>학과선택</option>
					<%for(subjectDTO dto : list){ %>
						<option value="<%=dto.getSubname()%>"><%=dto.getSubname()%> </option>
					<%}%>
				</select>
			 </td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">핸드폰번호</td>
			<td>
			<input type="text" size="10" name="phone" />
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">주소</td>
			<td>
			<input type="TEXT" id="zon" name="zon" SIZE="12" placeholder="우편번호" readonly />
			<input type="button" id="jooso_btn" onclick="openZipSearch()" value="주소검색" /> <br/>
			<input type="TEXT" name="street" id="street" SIZE="40" placeholder="주소" readonly /> <br/>
			<input type="TEXT" name="addr" id="addr" SIZE="40" placeholder="상세주소" />
			</td>
		</tr>
		
		<tr>
			<td height="30"  style="background-color: #eee;">은행</td>
			<td>
			<select name = "bank">
				<option value="" selected disabled hidden>은행선택</option>
				<option value="국민">국민</option>
				<option value="신한">신한</option>
				<option value="IBK기업은행">IBK기업은행</option>
				<option value="농협">농협</option>
				<option value="수협">수협</option>
				<option value="하나">하나 </option>
				<option value="카카오">카카오</option>
			</select>
			&nbsp;계좌 <input type="text" size="14" name = "acnt" />
			</td>
		</tr>
		
		
		<tr>
			<td colspan="3" align="right">
				<input type="reset" value="다시입력" />
				<input type="submit" value="입력" />
			</td>
		</tr>
		
	</table>
</form>



</article></section></body></html>
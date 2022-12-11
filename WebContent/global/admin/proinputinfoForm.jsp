<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="project.global.admin.adminDAO" %>
<%@ page import="project.global.admin.subjectDTO" %>
<%@ page import="java.util.List" %>
<%@include file = "/global/admin/adminMain2.jsp"%>

<% 
	adminDAO dao1 = new adminDAO();
	List<subjectDTO> list1 = dao1.partcall();
%>


<!DOCTYPE html>

<html>

<article>
<title>교수정보 입력</title>
	
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	
	</head>

<body bgcolor = "white">


<script>           
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("zone").value = data.zonecode;
				document.getElementById("street").value = data.address;
			}
		}).open();
	}
</script>
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
	<h2 align="center">교수정보 입력</h2>
	<form method="post" action="proInfo.do" enctype="multipart/form-data">
		<table align="center" border="1">
	
		<tr>
			<td rowspan=5 width="100px" align="center">사 진</td> 
			<!-- image src / name  지정하기 -->
			<td align="center" style="background-color: #eee;">성함  </td>
			<td><input type="text" name="proname"/> </td>
		</tr>
		  
		<tr>
			<td align="center" style="background-color: #eee;">생년월일</td>
			<td>  <input type="date" name="proborn"/> </td>
		</tr>
		
		<tr>
			<td align="center" style="background-color: #eee;">이미지</td>
			<td><input type="file" name="image" /> </td>
		</tr>
				
		<tr>
			<td align="center" style="background-color: #eee;">담당학과  </td>
			<td>
			<select name="propart">
				<option value="" selected disabled>학과선택</option>
				<%for(int i = 0; i<list1.size(); i++){ %>
					<option value="<%=list1.get(i).getSubname() %>"> <%=list1.get(i).getSubname() %> </option>
				<%}%>
			</select>
			
			</td>
		</tr>
		
		<tr>
			<td align="center" style="background-color: #eee;">비밀번호</td>
			<td>  <input type="text" name="pw"/> </td>
		</tr>
		
		<tr>
			<td rowspan="4"> </td>
			<td align="center" style="background-color: #eee;">핸드폰 </td>
			<td>
				<input type="text" size="10" name="tel1"/>
			</td>
		</tr>
		
		<tr>
			<td align="center" style="background-color: #eee;">이메일</td>
			<td > 
				<input type="text" size = "20" name="proemail"/>
			</td>
		</tr>
		
		<tr>
			<td align="center" style="background-color: #eee;">주 소</td>
			<td>
				<input type="TEXT" id="zone" name="zone" SIZE="12" placeholder="우편번호" readonly />
			<input type="button" id="jooso_btn" onclick="openZipSearch()" value="주소검색" /> <br/>
			<input type="TEXT" name="street" id="street" SIZE="40" placeholder="주소" readonly /> <br/>
			<input type="TEXT" name="addr" id="addr" SIZE="40" placeholder="상세주소" />
			</td>
		</tr>
		
		<tr>
			<td align="center" style="background-color: #eee;">은행</td>
			<td >
				<select name="bank">
					<option value="" selected disabled hidden>은행선택</option>
					<option value="국민">국민</option>
					<option value="신한">신한</option>
					<option value="IBK기업은행">IBK기업은행</option>
					<option value="농협">농협</option>
					<option value="수협">수협</option>
					<option value="하나">하나 </option>
					<option value="카카오">카카오</option>
				</select>
				&nbsp;계좌 <input type="text" size="16" name="acount" />
			</td>
		</tr>
		
		<tr>
			<td colspan="3" align="right">
				<input type="reset" size="10" value="다시입력">
				<input type="submit" size="10" value="입력">
			</td>
		</tr>
		
		</table>		
	</form></body></article></section>
</body>
</html>


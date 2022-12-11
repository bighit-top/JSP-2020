<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.global.student.changePartDAO" %>
<%@ page import = "project.global.student.changePartDTO" %>    
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Date" %>    
<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.util.GregorianCalendar" %>
<%@ page import = "java.util.Locale" %>
<%@include file = "/global/student/Main2.jsp"%>

<html>
 <head>
  
<article> 


<head>
<meta charset="UTF-8">
<title>전과신청</title>
</head>
<%
	//String stnum = "20164097";
	String date1 = ""; //년도
	String semester = ""; //학기

	//년도와 학기를 정함
	Date d = new Date();
	date1 = (d.getYear()+1900)+""; //년도
	int month = d.getMonth(); //0~11
	
	if(month >= 2 && month <=7) {//3~8월
		semester = "1"; //학기
	}else{
		semester = "2"; //학기
	}
	
	changePartDAO dao = new changePartDAO(); //dao를 불러움
	changePartDTO info = dao.stinfo(id); //학생정보를 가져오기 위한 인스턴스-학생테이블
	List<changePartDTO> sublist = dao.subjectList(); //학과리스트를 가져오기 위한 인스턴스-학과테이블
	List<changePartDTO> changelist = dao.changeCheckList(id);//전과신청 리스트를 가져옴-전과테이블
	changePartDTO in = new changePartDTO(); //넘길 객체를 담음


%>
<% //신청일자를 넣기 위한 처리
	Calendar calendar = new GregorianCalendar(Locale.KOREA);
	int nYear = calendar.get(Calendar.YEAR);
	int nMonth = calendar.get(Calendar.MONTH) + 1;
	int nDay = calendar.get(Calendar.DAY_OF_MONTH);
	String nowday = null;
	
	String year = Integer.toString(nYear);
	String mon = Integer.toString(nMonth);
	String day = Integer.toString(nDay);
	nowday = year+"-0"+mon+"-"+day;
%>



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
	<h1 align="center">전과신청</h1>
	<form action = "changePartPro.jsp" method = "post"> 
	<table align = "center" border = "1"> 
		<tr>
			<td height="30"  style="background-color: #eee;">
				년도
			</td>
			<td>
				<%=year %>년
				<input type = "hidden" name = "date1" value="<%=year %>"/>
				 
			</td>
			<td height="30"  style="background-color: #eee;">
				학기
			</td>
			<td>
				<%=semester %>학기
				<input type = "hidden" name = "semester" value="<%=semester %>"/>
			</td>
		</tr>
		<tr>
			<td height="30"  style="background-color: #eee;">
				이름
			</td>
			<td>
				<%=info.getStname() %>
				<input type = "hidden" name = "stname" value="<%=info.getStname() %>"/>
			</td>
			<td height="30"  style="background-color: #eee;">
				학번
			</td>
			<td>
				<%=info.getStnum() %>
				<input type = "hidden" name = "stnum" value="<%=info.getStnum() %>"/>
			</td>
		</tr>
			<td height="30"  style="background-color: #eee;">
				학과
			</td>
			<td>
				<%=info.getBfname() %>
				<input type = "hidden" name = "bfname" value="<%=info.getBfname() %>"/>				
			</td>
			<td height="30"  style="background-color: #eee;">
				학년
			</td>
			<td>
				<%=info.getGrade() %>
				<input type = "hidden" name = "grade" value="<%=info.getGrade() %>"/>				
			</td>			
		<tr>
			<td height="30"  style="background-color: #eee;">
				신청일자
			</td>
			<td>
				<%=nowday %>
				<input type = "hidden" name = "appdate" value="<%=nowday%>"/>				
			</td>
			<td height="30"  style="background-color: #eee;">
				신청학과
			</td>
			<td>
				<select name="afname">
					<%for(changePartDTO list : sublist) {// <!-- 학과테이블에서 학과리스트를 불러옴 -->
						String af = list.getAfname(); //변경할 학과
						String bf = info.getBfname(); //현재 학과
	
						if(!af.equals(bf)){%> <!-- 현재학과와 같은 경우 제외하고 불러옴 -->
						<option><%=list.getAfname() %></option>
						<%} %>
					
					<%} %>
				</select>
			</td>
		</tr>
		<tr>
			<td height="30"  style="background-color: #eee;">신청사유</td>
			<td colspan = "2"><input type = "textarea" name = "couse"/></td>
			<td><input type = "submit" name="in" value = "신청하기" align="center"/></td>
		</tr>

	</table>
	<table align = "center">
			
			<input type = "hidden" name="proapp" value = "0"/> <!-- 1차교수승인 -->
			<input type = "hidden" name="adapp" value = "0"/> <!-- 2차관리자승인 -->
			<input type = "hidden" name="finalapp" value = "0"/> <!-- 최종승인 -->
			<input type = "hidden" name="stphone" value = "<%=info.getStphone() %>"/> <!-- 학생휴대폰 -->
			<input type = "hidden" name="stemail" value = "<%=info.getStemail() %>"/> <!-- 학생이메일 -->
	</table>		
	</form>
	
	
	<h1 align="center">전과신청 확인</h1>
	<table align = "center" border = "1">
		<tr>
			<td height="30"  style="background-color: #eee;">신청일자</td>
			<td height="30"  style="background-color: #eee;">년도</td>
			<td height="30"  style="background-color: #eee;">학기</td>
			<td height="30"  style="background-color: #eee;">학번</td>
			<td height="30"  style="background-color: #eee;">이름</td>
			<td height="30"  style="background-color: #eee;">현재학과</td>
			<td height="30"  style="background-color: #eee;">신청학과</td>
			<td height="30"  style="background-color: #eee;">승인상태</td>
		</tr>
		<%for(changePartDTO mylist : changelist){ %>
		<tr>
			<td><%=mylist.getAppdate() %></td>
			<td><%=mylist.getDate1() %></td>
			<td><%=mylist.getSemester() %></td>
			<td><%=mylist.getStnum() %></td>
			<td><%=mylist.getStname() %></td>
			<td><%=mylist.getBfname() %></td>
			<td><%=mylist.getAfname() %></td>

			<%if(mylist.getProapp()==0) {%>
			<td>교수 승인 대기</td>
			<%}else if(mylist.getProapp()==2){ %>
			<td>1차 거절</td>
			<%}else if(mylist.getProapp()==1 && mylist.getAdapp()==0){ %>
			<td>1차승인완료 2차대기</td>
			<%}else if(mylist.getProapp()==1 && mylist.getAdapp()==2){ %>
			<td>2차 거절</td>
			<%}else if(mylist.getProapp()==1 && mylist.getAdapp()==1){ %>
			<td>승인완료</td>
			<%} %>
		</tr>
		<%} %>				
	</table>
	
</body>

</article></section></body>
</html>
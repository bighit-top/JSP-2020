<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="project.global.student.studentDAO"%>
<%@ page import="project.global.student.outDTO2"%>
<%@include file = "/global/student/Main2.jsp"%>
<%
	//String stnum = request.getParameter("stnum");
	//String stnum = "20164097";
	studentDAO dao = new studentDAO();
	outDTO2 dto = dao.extraadd2(id);
%>

<html>
<title>학생 - 기숙사 퇴실 신청서</title>
 <script type="text/javascript">	
	var check=function(){
		if(!f.agree.checked){
			alert("동의하셔야 퇴실 신청이 가능합니다");
			f.agree.focus();
			return;
		}
		f.submit();
	}
</script>


		<article>


			<form action="outPro.jsp" method="post" name="f" id="f">
				

				<table border="1" align="center" margin="auto" width="50%">
					<caption>글로벌대학교 생활관 퇴실원서</caption>

					<tr>
						<td><font size="4">학번</font>
						<td><input type="text" name="stnum" size="20"
							value="<%=dto.getStnum()%>" disabled /> <input type="hidden"
							name="stnum" value="<%=dto.getStnum()%>" /></td>
						<td><font size="4">성별</font> 
						<input type="text" size="20" value="<%=dto.getSex()%>"disabled />
						<input type="hidden" name="gender" value="<%=dto.getSex()%>" /></td>
					</tr>
					<tr>
						<td><font size="4">성명</font></td>
						<td><input type="text" name="name" size="20"
							value="<%=dto.getStname()%>" disabled /> <input type="hidden"
							name="name" value="<%=dto.getStname()%>" /></td>
						<td><font size="4">학과:</font> <input type="text" name="part"
							size="20" value="<%=dto.getPart()%>" disabled /> <input
							type="hidden" name="part" value="<%=dto.getPart()%>" /></td>
					</tr>
					<tr>
						<td><font size="4">학년</font></td>
						<td><input type="text" name="grade" size="20"
							value="<%=dto.getGrade()%>" disabled /> <input type="hidden"
							name="grade" value="<%=dto.getGrade()%>" /></td>
						<td><font size="4">E-mail:</font> <input type="text"
							name="email" size="20" /></td>
					</tr>
					<tr>

						<td><font size="4">휴대전화번호</font></td>
						<td colspan="2"><br /> <input type="text" name="phone"
							size="20" value="<%=dto.getPhone()%>" disabled /> <input
							type="hidden" name="phone" value="<%=dto.getPhone()%>" /><br />
							<font color="red" align="right" size="2">※번호 변경 시
								개인신상정보(수정)메뉴에서 변경바랍니다. </font></td>
					</tr>
					<tr>
						<td><font size="4">주소</font></td>
						<td colspan="2"><input type="text" name="post" size="10"
							placeholder="우편번호" value="<%=dto.getZon()%>" disabled /> 
							<input type="hidden" name="post" value="<%=dto.getZon()%>" /> <br /> 
							<input type="text" size="25" name="street" placeholder="도로명주소(구주소)"
							value="<%=dto.getStreet()%>" disabled /> <input type="hidden"
							name="street" value="<%=dto.getStreet()%>" /><br /> <br /> <input
							type="text" size="35" name="addr" placeholder="상세주소"
							value="<%=dto.getAddr()%>" disabled /> <input type="hidden"
							name="addr" value="<%=dto.getAddr()%>" /><br /> <font
							color="red" align="right" size="2">※주소 변경 시 개인신상정보(수정)메뉴에서
								변경바랍니다. </font></td>
					</tr>
					<tr>
						<td width="100px"><font size="4">사용생활관</font></td>

						<td><input type="text" name="dormitory" size="8"></td>

						<td><font size="4">세부호실</font> <input type="text" name="ho"
							size="8"></td>
					</tr>
					<tr>
						<td><font size="4">은행명</font></td>

						<td><select name="bankname"><option value="">--선택--</option>
								<option value="경남은행">경남은행</option>
								<option value="광주은행">광주은행</option>
								<option value="국민은행">국민은행</option>
								<option value="기업은행">기업은행</option>
								<option value="농협중앙회">농협중앙회</option>
								<option value="농협회원조합">농협회원조합</option>
								<option value="대구은행">대구은행</option>
								<option value="도이치은행">도이치은행</option>
								<option value="부산은행">부산은행</option>
								<option value="산업은행">산업은행</option>
								<option value="상호저축은행">상호저축은행</option>
								<option value="새마을금고">새마을금고</option>
								<option value="수협중앙회">수협중앙회</option>
								<option value="신한금융투자">신한금융투자</option>
								<option value="신한은행">신한은행</option>
								<option value="신협중앙회">신협중앙회</option>
								<option value="외환은행">외환은행</option>
								<option value="우리은행">우리은행</option>
								<option value="우체국">우체국</option>
								<option value="전북은행">전북은행</option>
								<option value="제주은행">제주은행</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="케이뱅크">케이뱅크</option>
								<option value="하나은행">하나은행</option>
								<option value="한국씨티은행">한국씨티은행</option>
								<option value="HSBC은행">HSBC은행</option>
								<option value="SC제일은행">SC제일은행</option>


						</select></td>
						<td><font size="4">계좌번호</font> <input type="text" size="20"
							name="acount" /></td>
					</tr>
					<tr>
						<td><font size="4">예금주</font></td>
						<td colspan="2"><input type="text" name="depositer" size="20" /></td>

					</tr>
					<tr>
						<td><font size="4">신청년도/학기</font></td>
						<!--년도만 지정할수있게 만들고싶음   -->
						<td><input type="text" name="dday" size="8">/<select
							name="semester"><option value="">--선택--</option>
								<option>1</option>
								<option>2</option>
						</select><font size="4">학기</font></td>


						<td><font size="4">퇴사사유</font> 
						<select name="reason">
								<option selected disabled hidden>--선택--</option>
								<option value="자퇴">자퇴</option>
								<option value="기간만료">기간만료</option>
								<option value="개인사유">개인사유</option>
								<option value="군휴학">군휴학</option>
						</select><br />
						<font size="4">퇴사예정날짜</font> <input type="date" name="outdate"></td>



					</tr>
					<tr>
						<td colspan="4"><font size="4">기타사유</font> <input type="text"
							name="other" size="80"></td>
					<tr>
						<td><font color="red" align="right" size="4">※생활관비
								환불규정</font></td>
						<td colspan="2"><font color="red" align="right" size="4"><br>1.개관
								10일전: 전액 환불.<br /> 2.개관 9일전~1일전:90%<br />3.개관일부터는 중도퇴사기준 적용 환불<br />
				</table>

				<h4 align="center">개인정보보호법과 관련하여 아래의 버튼을 눌러 동의 절차를 진행하여 주시기
					바랍니다.</h4>
				<table align="center" margin="auto" width="50%">

					<tr>
						<td colspan="2" align="center"><input type="checkbox"
							name="agree" value="check" >동의 합니다.</td>
					</tr>
					<tr>
						<td align="center">상기 본인은 위와 같이 퇴사하고자 하오니 승인하여 주시기 바랍니다.</td>
					</tr>

					<tr>
						<td align="center" colspan="2"><br /> 
						<button type="button" onclick="check()">신청서 접수</button>
						
						<button type="button" onclick="document.location.href='Main.jsp'">닫기</button></td>
					</tr>
				</table>
			</form>
		</article>
	</section>
</body>
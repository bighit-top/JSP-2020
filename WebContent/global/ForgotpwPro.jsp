<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import=" javax.mail.Message" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="javax.mail.PasswordAuthentication" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.util.Random" %>
<%@ page import="project.global.admin.globalDAO" %>

<jsp:useBean id="dto"  class="project.global.admin.pwDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>
<jsp:useBean id="pdto"  class="project.global.admin.pwProDTO">
	<jsp:setProperty name="pdto" property="*" />
</jsp:useBean>

<%
	String what = request.getParameter("what");
	String id = request.getParameter("id");
	globalDAO dao = new globalDAO();
	
	if(what.equals("1")){
		dao.getPw(dto);
	}else{
		dao.getProPw(pdto);
	}

%>
<%=what %>
<%=id %>
<%
        //mail server 설정
        String host = "smtp.naver.com";
        final String user = "enjal96@naver.com"; //자신의 네이버 계정
        final String password = "anapple9596!";//자신의 네이버 패스워드
        String to_email = "";
        //메일 받을 주소
        if(what == "1"){
        	to_email = dto.getEmail();
        }else{
        	to_email = pdto.getProemail();
        }
        
        //SMTP 서버 정보를 설정한다.
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        
        //인증 번호 생성기
        StringBuffer temp = new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        System.out.println(AuthenticationKey);
        
        Session session2 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        //email 전송
        try {
            MimeMessage msg = new MimeMessage(session2);
            msg.setFrom(new InternetAddress(user, "global university"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
            
            //메일 제목
            msg.setSubject("글로벌대학교 인증번호 발송.. .");
            //메일 내용
            msg.setText("귀하의 인증번호는 : "+temp +" 입니다."); 
            
            Transport.send(msg);
            System.out.println("이메일 전송");
            
            String updatepw = temp.toString();
    		if(what.equals("1")){
    			dao.updatePw(updatepw, id);
    			System.out.println("학생 비밀번호 변경 성공");
    		}else{
    			dao.updatepwPro(updatepw, id);
    			System.out.println("교수 비밀번호 변경 성공");
    		}

        }catch (Exception e) {
            e.printStackTrace();// TODO: handle exception
        } 
%>

	<script language="JavaScript">
		alert("임시 비밀번호에 관한 이메일 발송이 완료되었습니다. 새 비밀번호로 변경해주세요!");
		location.href="/project/global/loginForm.jsp";
	</script>
	
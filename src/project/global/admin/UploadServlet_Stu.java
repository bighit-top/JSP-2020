package project.global.admin;

import project.global.admin.adminDAO;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

@WebServlet("/global/admin/stuInfo.do")
public class UploadServlet_Stu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html); charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 파일 저장 경로
		String fileSavePath = "stuImage\\";
		
		// 파일 크기 10M 제한
		int uploadSizeLimit = 10*1024*1024;
		String encType = "UTF-8";
		
		ServletContext context = getServletContext();
		
		String uploadPath = context.getRealPath(fileSavePath);
		
		// upload할 경로에 폴더가 존재하지 않을 경우 폴더 생성.
		File upDir = new File(uploadPath);
		if(!upDir.exists()) {
			upDir.mkdir();
			System.out.println("파일 생성 완료.");
		}
		
		System.out.println(uploadPath);
		
		// request : request 객체 / uploadPath : 서버 상 업로드 될 디렉토리
		// uploadSizeLimit : 업로드 파일 크기 제한 / encType : 인코딩 방법
		// new DefaultFileRenamePolic() : 동일 이름 존재 시 새로운 이름 부여 방식
		MultipartRequest multi = new MultipartRequest(request, uploadPath, uploadSizeLimit, encType, new DefaultFileRenamePolicy());
		
		// 업로드 된 파일 이름 얻어오기
		String file = multi.getFilesystemName("image");
		
		if(file == null) {
			// 업로드 실패시
			System.out.println("업로드 실패"); 
		}else {
			// 업로드 성공시
			stuInfoDTO dto = new stuInfoDTO();
			adminDAO dao = new adminDAO();
			
			dto.setStname(multi.getParameter("stname"));
			String i = multi.getParameter("year1");
			int j = Integer.parseInt(i);
			dto.setYear1(j);
			System.out.println("년 : " + dto.getYear1());
			
			i = multi.getParameter("mon");
			j = Integer.parseInt(i);
			dto.setMon(j);
			System.out.println("월 : " + dto.getMon());
			
			i = multi.getParameter("day1");
			j = Integer.parseInt(i);
			dto.setDay1(j);
			System.out.println("일 : " + dto.getDay1());
			
			// 학번 부여하기
			Calendar calendar = new GregorianCalendar(Locale.KOREA);
			int year = calendar.get(Calendar.YEAR);
			String Year = Integer.toString(year);
						
			String part = dao.subnum2(multi.getParameter("part"));	// 학과번호 갖고오기

			String num = dao.partnum(multi.getParameter("part"));

			if(num != null) {
				int temp = Integer.parseInt(num);
				temp++;
				num = Integer.toString(temp);
				dto.setStnum(num);
			}else {
				dto.setStnum(Year+part+"01");
			}
			
			dto.setPart(multi.getParameter("part"));
			dto.setPhone(multi.getParameter("phone"));
			dto.setZon(multi.getParameter("zon"));
			dto.setStreet(multi.getParameter("street"));
			dto.setAddr(multi.getParameter("addr"));
			dto.setBank(multi.getParameter("bank"));
			dto.setAcnt(multi.getParameter("acnt"));
			
			String gra = multi.getParameter("grade");
			int grade = Integer.parseInt(gra);
			dto.setGrade(grade);
			
			dto.setImage(file);
			dto.setFloor(multi.getParameter("floor"));
			
			//acsday
			
			dto.setSex(multi.getParameter("sex"));
			dto.setDomiuse(multi.getParameter("domiuse"));
			dto.setPw(multi.getParameter("pw"));
			dto.setEmail(multi.getParameter("email"));
			
			System.out.println("<br> 글쓴이 : " + dto.getStname());
			System.out.println("<br> 신   분  : " + dto.getFloor());
			System.out.println("<br> 계   좌  : " + dto.getAcnt());
			System.out.println("<br> 학   년  : " + dto.getGrade());
			System.out.println("<br> stnum  : " + dto.getStnum());
			System.out.println("<br> image : " + file);
			
			
			String msg = dao.insertStudent(dto);
			
			System.out.println(msg);
			
			// java 에서 jsp 로 이동
			request.setAttribute("msg", msg);
			RequestDispatcher rd = request.getRequestDispatcher("/global/admin/stuInfoPro.jsp");
			//rd.forward(request, response);
			response.sendRedirect("stuInfoPro.jsp");
		}
	}
}

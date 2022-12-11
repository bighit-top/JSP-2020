package project.global.admin;

import project.global.admin.adminDAO;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/global/admin/proInfo.do")
public class inputpro_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html); charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 파일 저장 경로
		String fileSavePath = "proImage\\";
		
		// 파일 크기 10M 제한
		int uploadSizeLimit = 10*1024*1024;
		String encType = "UTF-8";
		
		ServletContext context = getServletContext();
		
		String uploadPath = context.getRealPath(fileSavePath);
		
		// upload할 경로에 폴더가 존재하지 않을 경우 폴더 생성.
		File upDir = new File(uploadPath);
		if(!upDir.exists()) {
			upDir.mkdir();
			//System.out.println("파일 생성 완료.");
		}
		
		//System.out.println(uploadPath);
		
		// request : request 객체 / uploadPath : 서버 상 업로드 될 디렉토리
		// uploadSizeLimit : 업로드 파일 크기 제한 / encType : 인코딩 방법
		// new DefaultFileRenamePolic() : 동일 이름 존재 시 새로운 이름 부여 방식
		MultipartRequest multi = new MultipartRequest(request, uploadPath, uploadSizeLimit, encType, new DefaultFileRenamePolicy());
		
		adminDAO dao = new adminDAO();
		
		// 업로드 된 파일 이름 얻어오기
		String file = multi.getFilesystemName("image");
		
		if(file == null) {
			// 업로드 실패시
			//System.out.println("업로드 실패"); 
		}else {
			// 업로드 성공시
			proinputinfoDTO dto = new proinputinfoDTO();
			
			dto.setImage(multi.getFilesystemName("image"));
			dto.setProname(multi.getParameter("proname"));
			dto.setProborn(multi.getParameter("proborn"));

			dto.setPropart(multi.getParameter("propart"));
			dto.setTel1(multi.getParameter("tel1"));
			dto.setProemail(multi.getParameter("proemail"));
			
			dto.setZone(multi.getParameter("zone"));
			dto.setStreet(multi.getParameter("street"));
			dto.setAddr(multi.getParameter("addr"));
			
			dto.setBank(multi.getParameter("bank"));
			dto.setAcount(multi.getParameter("acount"));
			
			/* 교수 id(학번) 부여하기 : 교수 생년월일(4)+학과번호(2)+고유번호(3)*/	
			String born = multi.getParameter("proborn");
			born = born.substring(0,4);
			
			String propart = dao.subnum2(multi.getParameter("propart"));
			
			String num = dao.pronumber(multi.getParameter("propart"));
			int temp = Integer.parseInt(num);
			temp++;
			num = String.format("%03d", temp);
			
			if(num != null) {
				dto.setId(born+propart+num);
			}else {
				dto.setId(born+propart+"001");
			}
			
			System.out.println(born + " " + propart + " " + num);
			
			dto.setPw(multi.getParameter("pw"));

			// propart code
			List<subjectDTO> list = dao.partcall();
			for(int i = 0; i<list.size(); i++){
				String part = list.get(i).getSubname();
				if(dto.getPropart().equals(part)){
					dto.setPropartcode(list.get(i).getSubnum());
				}
			}
			

			String msg = dao.proinputinfo(dto);
			
			//System.out.println(msg);
			
			// java 에서 jsp 로 이동
			request.setAttribute("msg", msg);
			RequestDispatcher rd = request.getRequestDispatcher("/global/admin/proinputinfoPro.jsp");
			//rd.forward(request, response);

			response.sendRedirect("proinputinfoPro.jsp");
		}
	}
}

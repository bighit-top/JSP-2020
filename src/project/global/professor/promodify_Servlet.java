package project.global.professor;

import project.global.professor.professorDAO;

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

@WebServlet("/global/professor/promodify.do")
public class promodify_Servlet extends HttpServlet {
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
		
		String file;
		promodifyDTO dto = new promodifyDTO();
		

		
		String image = multi.getFilesystemName("image");		// 수정할 이미지 파일
		String image2 = multi.getParameter("image2");	// 기존에 저장되있었던 이미지 갖고옴. 
		
		
		
		//System.out.println("image(수정할 이미지) : " + image);
		//System.out.println("image2(db에 저장된 이미지) : " + image2);
		
		
		
		if(image == null) {				// 기존에 저장된 이미지를 유지할 경우
			dto.setImage(multi.getParameter("image2"));
			
			dto.setProname(multi.getParameter("proname"));
			dto.setProborn(multi.getParameter("proborn"));
			dto.setPropart(multi.getParameter("propart"));
			
			dto.setTel1(multi.getParameter("tel1"));
			dto.setProemail(multi.getParameter("proemail"));
			dto.setZone(multi.getParameter("zone"));
			
			dto.setStreet(multi.getParameter("street"));
			dto.setAddr(multi.getParameter("addr"));
			dto.setAcount(multi.getParameter("acount"));
			
			dto.setPw(multi.getParameter("pw"));
			dto.setId(multi.getParameter("id"));
			dto.setBank(multi.getParameter("bank"));
			dto.setPropartcode(multi.getParameter("propartcode"));
			
			
			/* dao */
			professorDAO dao = new professorDAO();
			dao.proModify(dto);
			
			//System.out.println(msg);
			
			// java 에서 jsp 로 이동
			//request.setAttribute("msg", msg);
			//RequestDispatcher rd = request.getRequestDispatcher("/global/admin/stumodifyPro.jsp");
			//rd.forward(request, response);
			response.sendRedirect("pro modifyPro.jsp");
			

		}else {							// 이미지 수정을 진행할 경우
			
			file = multi.getFilesystemName("image");
			
			if(file == null) {
				// 업로드 실패
				//System.out.println("업로드 실패");
			}else {
				// 업로드 성공
				
				File file2 = new File(uploadPath + "\\" + image2);
				if(file2.exists()) {
					if(file2.delete()) {
						//System.out.println("파일 삭제 성공");
					}else {
						//System.out.println("파일 삭제 실패");
					}
				}else {
					//System.out.println("파일이 존재 X");
				}
				dto.setImage(image);
				dto.setProname(multi.getParameter("proname"));
				dto.setProborn(multi.getParameter("proborn"));
				dto.setPropart(multi.getParameter("propart"));
				
				dto.setTel1(multi.getParameter("tel1"));
				dto.setProemail(multi.getParameter("proemail"));
				dto.setZone(multi.getParameter("zone"));
				
				dto.setStreet(multi.getParameter("street"));
				dto.setAddr(multi.getParameter("addr"));
				dto.setAcount(multi.getParameter("acount"));
				
				dto.setPw(multi.getParameter("pw"));
				dto.setId(multi.getParameter("id"));
				dto.setBank(multi.getParameter("bank"));
				dto.setPropartcode(multi.getParameter("propartcode"));
				
				/* dao */
				professorDAO dao = new professorDAO();
				dao.proModify(dto);
				
				//System.out.println(msg);
				
				// java 에서 jsp 로 이동
				//request.setAttribute("msg", msg);
				//RequestDispatcher rd = request.getRequestDispatcher("/global/admin/stumodifyPro.jsp");
				//rd.forward(request, response);
				response.sendRedirect("pro modifyPro.jsp");
			}
		}
	}
}

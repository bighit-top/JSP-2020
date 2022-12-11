package project.global.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class changePartDAO {
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		private Connection getConnection() throws Exception{
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
				String user = "class09", pass = "class09";
				conn = DriverManager.getConnection(url, user,pass);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
		
		//학생테이블에서 학생의 정보를 가져온다
		public changePartDTO stinfo(String stnum) {
			changePartDTO info = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select * from student where stnum=?");
				pstmt.setString(1, stnum); //학번 조건으로 학생 정보를 가져옴
				rs = pstmt.executeQuery();
				info = new changePartDTO();
				if(rs.next()) {
					info.setStnum(rs.getString("stnum"));//학번
					info.setStname(rs.getString("stname"));//이름
					info.setGrade(rs.getString("grade"));//학년
					info.setBfname(rs.getString("part"));//학과
					info.setStphone(rs.getString("phone"));//휴대푠
					info.setStemail(rs.getString("email"));//이메일
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();} catch(SQLException s) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if(conn != null) try {conn.close();} catch(SQLException s) {}
			}
			return info;
		}//학생정보 끝
		
		//학과테이블에서 학과리스트를 가져온다.
		public List<changePartDTO> subjectList(){
			List<changePartDTO> sublist = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select * from subject");
				rs = pstmt.executeQuery();
				sublist = new ArrayList<changePartDTO>();
				while(rs.next()) {
					changePartDTO dto = new changePartDTO();
					dto.setAfnum(rs.getString("subnum")); //학과코드
					dto.setAfname(rs.getString("subname")); //학과명
					sublist.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();} catch(SQLException s) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if(conn != null) try {conn.close();} catch(SQLException s) {}
			}
			return sublist;
		}//학과 리스트 끝
		
		//전과신청 확인 리스트
		public List<changePartDTO> changeCheckList(String stnum){
			List<changePartDTO> changelist = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select * from subjectchange where stnum=?");
				pstmt.setString(1, stnum);
				rs = pstmt.executeQuery();
				changelist = new ArrayList<changePartDTO>();
				while(rs.next()) {
					changePartDTO dto = new changePartDTO();
					dto.setAppdate(rs.getString("appdate")); //신정일자
					dto.setDate1(rs.getString("date1"));//년도
					dto.setSemester(rs.getString("semester"));//학기
					dto.setStnum(rs.getString("stnum"));//학번
					dto.setStname(rs.getString("stname"));//이름
					dto.setBfname(rs.getString("bfname"));//현재학과
					dto.setAfname(rs.getString("afname"));//신청학과
					dto.setProapp(rs.getInt("proapp"));//1차승인
					dto.setAdapp(rs.getInt("adapp"));//2차승인
					dto.setFinalapp(rs.getInt("finalapp"));//최종승인
					changelist.add(dto);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();} catch(SQLException s) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if(conn != null) try {conn.close();} catch(SQLException s) {}
			}
			return changelist;		
		}//전과신청 리스트 끝
		
		//전과신청 테이블에 값을 집어 넣음
		public void subjectInsert(changePartDTO in) {
			String bfname = in.getBfname();//현재학과 대입
			String afname = in.getAfname();//변경학과 대입
			String sql = "";
			changePartDTO bfcode = null; //현재학과코드번호를 넣을 DTO			
			changePartDTO afcode = null; //변경학과코드번호를 넣을 DTO
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select * from subject where subname=?");//학과테이블
				pstmt.setString(1, bfname); //현재학과 대입
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bfcode = new changePartDTO();
					bfcode.setBfnum(rs.getString("subnum"));//현재학과 코드를 빼옴
				}

				sql = "select * from subject where subname=?";//변경학과로 변경학과 코드를 찾는다.
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, afname); //기존학과대입
				rs = pstmt.executeQuery();
				afcode = new changePartDTO();
				if(rs.next()) {
					afcode.setAfnum(rs.getString("subnum")); //변경학과 코드를 빼옴
				}

				sql = "insert into subjectchange(stnum,bfnum,bfname,afnum,afname,proapp,adapp,appdate,date1,semester,stname,couse,stphone,stemail,finalapp) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, in.getStnum());//학번
				pstmt.setString(2, bfcode.getBfnum());//기존학과코드
				pstmt.setString(3, in.getBfname());//기존학과명
				pstmt.setString(4, afcode.getAfnum());//변경학과코드
				pstmt.setString(5, in.getAfname());//변경학과명
				pstmt.setInt(6, in.getProapp());//1차교수승인
				pstmt.setInt(7, in.getAdapp());//2차관리자승인
				pstmt.setString(8, in.getAppdate());//신청일자
				pstmt.setString(9, in.getDate1());//년도
				pstmt.setString(10, in.getSemester());//학기
				pstmt.setString(11, in.getStname());//이름
				pstmt.setString(12, in.getCouse());//전과신청이유
				pstmt.setString(13, in.getStphone());//학생전화번호
				pstmt.setString(14, in.getStemail());//학생이메일
				pstmt.setInt(15, in.getFinalapp());//최종승인
				pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if(conn != null) try {conn.close();} catch(SQLException s) {}
			}
		}	//전과신청 테이블에 값을 집어 넣음 끝
		
		
		//전과신청시 1번만 가능하도록 체크함
		public int changeCheck(String stnum) //학번과 최종승인으로 확인
		throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int fin=0;
			int pro=0;
			int check = -1; //결과를 반환하기 위한 임의의 변수
			
			try {
				conn = getConnection(); 
				pstmt = conn.prepareStatement("select stnum, finalapp, proapp from subjectchange where stnum=?");
				pstmt.setString(1, stnum); //학번으로 조회
				rs = pstmt.executeQuery();

				if(rs.next()) {
					fin = rs.getInt("finalapp");					
					pro = rs.getInt("proapp");
				
					if(fin == 1) { //최종 승인이 있으면 거절
						check = 1;
					}else if(fin == 2) { //최종 거절이 있으면 재신청
						check = 2;
					}else if(fin == 1 && pro == 0) { //최종승인 전이면 검토중
						check = 0; 
					}else if(fin == 0 && pro == 0) { //교수님 승인 전
						check = 3;
					} 
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();} catch(SQLException s) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if(conn != null) try {conn.close();} catch(SQLException s) {}
			}			
			return check;
		}
		
}

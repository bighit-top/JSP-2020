package project.global.admin;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import project.global.admin.changePartConfirmDTO;

import java.util.ArrayList;

public class changePartConfirmDAO {
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
		public List<changePartConfirmDTO> changeConfirmList(){
			List<changePartConfirmDTO> list = null;
			int x = 1;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(
						"select * from (select appdate,date1,semester,stnum,stname,bfname,afname,couse,"
						+ "proapp,adapp,finalapp from(select * from subjectchange order by appdate desc, stname asc)"
						+ "order by appdate desc, stname asc) where proapp=? and finalapp=0");
				pstmt.setInt(1, x);
				rs = pstmt.executeQuery();
				list = new ArrayList<changePartConfirmDTO>();
				while(rs.next()) {
					changePartConfirmDTO dto = new changePartConfirmDTO();
					dto.setAppdate(rs.getString("appdate")); //신정일자
					dto.setDate1(rs.getString("date1"));//년도
					dto.setSemester(rs.getString("semester"));//학기
					dto.setStnum(rs.getString("stnum"));//학번
					dto.setStname(rs.getString("stname"));//이름
					dto.setBfname(rs.getString("bfname"));//현재학과
					dto.setAfname(rs.getString("afname"));//신청학과
					dto.setCouse(rs.getString("couse"));//전과신청사유
					dto.setProapp(rs.getInt("proapp"));//1차승인
					dto.setAdapp(rs.getInt("adapp"));//2차승인
					dto.setFinalapp(rs.getInt("finalapp"));//최종승인
					list.add(dto);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();} catch(SQLException s) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if(conn != null) try {conn.close();} catch(SQLException s) {}
			}
			return list;		
		}//전과신청 리스트 끝
		
		//전과신청 관리자 승인
		public void changePart(String stnum, String stname, String bfname, String afname, int proapp, int data) {//학번, 이름, 기존학과, 변경학과, proapp 가져옴
			String sql="";
			//int x = 1; //adapp과 finalapp 승인에 사용할 변수
			try {
				conn = getConnection();
				sql = "select * from subjectchange where stnum=? and proapp=?"; //전과테이블에서 학번이 맞고, 교수가 승인한 경우만
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, stnum); //가져온 학번을 대입함 
				pstmt.setInt(2, proapp); //2차검증으로 proapp이 1인 경우만
				rs = pstmt.executeQuery();
				if(rs.next()) {
					sql = "update subjectchange set adapp=?, finalapp=? where stnum=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, data); //adapp 승인
					pstmt.setInt(2, data); //finalapp 승인
					pstmt.setString(3, stnum);
					pstmt.executeUpdate();
				}
				
				sql = "select * from student where stnum=? and stname=? and part=?"; //학생테이블에서 학번과 이름이 맞을 경우만
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, stnum); //학번
				pstmt.setString(2, stname); //이름
				pstmt.setString(3, bfname); //기존학과
				rs = pstmt.executeQuery();
				if(rs.next()) {
					sql = "update student set part=? where stnum=?"; //학생테이블에서 학생의 학과변경
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, afname); //학과변경
					pstmt.setString(2, stnum);
					pstmt.executeUpdate();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();} catch(SQLException s) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if(conn != null) try {conn.close();} catch(SQLException s) {}
			}
		}//전과신청 관리자 승인 끝
		
		//전과신청 관리자 거절
			public void changePart(String stnum, int proapp, int data) {//학번, proapp을 가져옴
				String sql="";
				//int y = 2; //adapp과 finalapp 거절에 사용할 변수
				
				try {
					conn = getConnection();
					sql = "select * from subjectchange where stnum=? and proapp=?"; //전과테이블에서 학번이 맞고, 교수가 승인한 경우만
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, stnum); //가져온 학번을 대입함 
					pstmt.setInt(2, proapp); //2차검증으로 proapp이 1인 경우만
					rs = pstmt.executeQuery();
					if(rs.next()) {
						sql = "update subjectchange set adapp=?, finalapp=? where stnum=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, data); //adapp 거절
						pstmt.setInt(2, data); //finalapp 거절
						pstmt.setString(3, stnum);
						pstmt.executeUpdate();
					}
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					if(rs != null) try {rs.close();} catch(SQLException s) {}
					if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
					if(conn != null) try {conn.close();} catch(SQLException s) {}
				}
			}//전과신청 관리자 거절 끝

}//클래스 끝

package project.global.professor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class lectureListDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	private Connection getConnection() {
		try { 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09", pass="class09";
			conn=DriverManager.getConnection(url,user,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	/*
	public lectureListDTO Building(String building){
		lectureListDTO dto = null;
		try {
			conn=getConnection();
			pstmt= conn.prepareStatement("select * from lookclass where building=?");//DB쿼리문을 불러오겠다.
			pstmt.setString(1, building);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				dto = new lectureListDTO();
				dto.setClasscode(rs.getString("classcode"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null)try {rs.close();}catch(SQLException s) {}
			if(pstmt !=null)try {pstmt.close();}catch(SQLException s) {}	
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
		}
		return dto;
	}
	public lectureListDTO Ho(String ho){
		lectureListDTO dto = null;
		try {
			conn=getConnection();
			String sql = "select * from lookclass where ho=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, dto.getClasscode());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto = new lectureListDTO();
				dto.setClasscode(rs.getString("classcode"));
			}
		}catch(Exception e) {
				e.printStackTrace();
		}finally {
				if(rs !=null)try {rs.close();}catch(SQLException s) {}
				if(pstmt !=null)try {pstmt.close();}catch(SQLException s) {}	
				if(conn!=null)try {conn.close();}catch(SQLException s) {}	
		}
		return dto;
	}*/

	public List<lectureListDTO> God(String building, String roomnum, String day){
		List<lectureListDTO> list = null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from class1 where building=? and roomnum=? and day=? ");
			pstmt.setString(1, building);
			pstmt.setString(2, roomnum);
			pstmt.setString(3, day);
			
			rs = pstmt.executeQuery();//결과값 저장
			list = new ArrayList<lectureListDTO>(8);
			if(rs.next()) {
				do {
				lectureListDTO dto = new lectureListDTO();
				dto.setBuilding(rs.getString("building"));
				dto.setRoomnum(rs.getString("roomnum"));
				dto.setDay(rs.getString("day"));
				dto.setTime(rs.getInt("time"));
				dto.setCan(rs.getInt("can"));
				dto.setClasscode(rs.getString("classcode"));
				list.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null)try {rs.close();}catch(SQLException s) {}
			if(pstmt !=null)try {pstmt.close();}catch(SQLException s) {}	
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
		}
	return list;
	}
	
	public List<lectureListDTO> Sod(String building, String roomnum, String day, int time, int can, String classcode){
		List<lectureListDTO> list = null;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement("select * from class1 where building=? and roomnum=? and day=? and time=? and can=? and classcode=?");
			pstmt.setString(1, building);
			pstmt.setString(2, roomnum);
			pstmt.setString(3, day);
			pstmt.setInt(4, time);
			pstmt.setInt(5, can);
			pstmt.setString(6, classcode);
			
			rs = pstmt.executeQuery();//결과값 저장
			list = new ArrayList<lectureListDTO>();
			
			if(rs.next()) {
				do {
				lectureListDTO dto = new lectureListDTO();
				dto.setBuilding(rs.getString("building"));
				dto.setRoomnum(rs.getString("roomnum"));
				dto.setDay(rs.getString("day"));
				dto.setTime(rs.getInt("time"));
				dto.setCan(rs.getInt("can"));
				dto.setClasscode(rs.getString("classcode"));
				list.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null)try {rs.close();}catch(SQLException s) {}
			if(pstmt !=null)try {pstmt.close();}catch(SQLException s) {}	
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
		}
		
	return list;
	
	}
	
	public lectureListDTO Mod(String classcode) {
		lectureListDTO dto=null;
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from class1 where classcode=?");
			pstmt.setString(1, classcode);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto = new lectureListDTO();
				dto.setClasscode(rs. getString("classcode"));
			}
		}catch(Exception e) {
				e.printStackTrace();
		}finally {
				if(conn !=null) try { conn.close();} catch(SQLException s) {}
				if(pstmt !=null) try {pstmt.close();} catch(SQLException s) {}	
		}
					return dto;
	}
	
	//해당 강의실에 값을 저장함 - 같은 학기 신청된 강의가 있을 경우 신청할 수 없음
	public int checkRoom(openLectureDTO checkroom) {
		int check = 1; //제약사항을 줄 임의의 변수
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select date1,semester from class1 where classcode=?");
			pstmt.setString(1, checkroom.getClasscode());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String checkdate = checkroom.getDate1();
				String rsdate = rs.getString("date1");
				String checksem = checkroom.getSemester();
				String rssem = rs.getString("semester");
				
				if(checkdate.equals(rsdate) && checksem.contentEquals(rssem)){
					
					check = 2; //이미 배정된 강의실임
				}
				
				pstmt = conn.prepareStatement("update class1 set proemail=?, classname=?, homeroompro=?, "
						+ "part=?, who=?, date1=?, semester=?, score=?, id=?, goal=?, reg_date=sysdate where classcode=?");
				pstmt.setString(1, checkroom.getProemail()+"@" +(checkroom.getProemail1()));
				pstmt.setString(2, checkroom.getClassname());
				pstmt.setString(3, checkroom.getHomeroompro());
				pstmt.setString(4, checkroom.getPart());
				pstmt.setString(5, checkroom.getWho());
				pstmt.setString(6, checkroom.getDate1());
				pstmt.setString(7, checkroom.getSemester());
				pstmt.setInt(8, checkroom.getScore());
				pstmt.setString(9, checkroom.getId());
				pstmt.setString(10, "강의계획서를 준비중입니다.");
				pstmt.setString(11, checkroom.getClasscode());
				pstmt.executeUpdate();			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) try { conn.close();} catch(SQLException s) { }
			if(pstmt != null) try { pstmt.close();} catch(SQLException s) { }
			if(rs != null) try { rs.close();} catch(SQLException s) { }
		}
		return check;
	}
	

	//교수 이름과 담당학과를 가져옴
	public openLecProInfoDTO proinfo(String id) {
		openLecProInfoDTO info = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from professor where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			info = new openLecProInfoDTO();
			if(rs.next()) {
				info.setProname(rs.getString("proname")); //교수명
				info.setPropart(rs.getString("propart")); //담당학과
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null)try {rs.close();}catch(SQLException s) {}
			if(pstmt !=null)try {pstmt.close();}catch(SQLException s) {}	
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
		}
		return info;
	}
	
	
}
	
	
	

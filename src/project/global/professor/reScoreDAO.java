package project.global.professor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class reScoreDAO {
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	
	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user="class09", pass="class09";
			conn=DriverManager.getConnection(url,user,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	public reScoreDTO grade(String subject, String search_stnum) {
		reScoreDTO dto= null;
		try {
			conn = getConnection();
		
			pstmt = conn.prepareStatement("select * from student where part=? and stnum=?");
			pstmt.setString(1, subject);
			pstmt.setString(2, search_stnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new reScoreDTO();
				dto.setStname(rs.getString("stname"));
				dto.setYear1(rs.getInt("year1"));
				dto.setMon(rs.getInt("mon"));
				dto.setDay1(rs.getInt("day1"));
				dto.setStnum(rs.getString("stnum"));
				dto.setGrade(rs.getInt("grade"));
				dto.setPart(rs.getString("part"));
				dto.setZon(rs.getString("zon"));
				dto.setStreet(rs.getString("street"));
				dto.setAddr(rs.getString("addr"));
				dto.setBank(rs.getString("bank"));
				dto.setAcnt(rs.getString("acnt"));
				dto.setFloor(rs.getString("floor"));
				dto.setSex(rs.getString("sex"));
				dto.setDomiuse(rs.getString("domiuse"));
				dto.setPw(rs.getString("pw"));
				dto.setPhone(rs.getString("phone"));
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) try { conn.close(); } catch(SQLException s) { }
			if(pstmt != null) try { pstmt.close(); } catch(SQLException s) { }
		
		}
	
		return dto;
	}
	// 관리자 학생 정보 수정
	public String grade1(reScoreDTO dto) {
		String msg = "수정 스타뜨";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update student set "
					+ "image =?, stname=?, year1=?, mon=?,"
					+ "day1=?, grade=?, part=?,"
					+ "zon=?, street=?, addr=?, bank=?,"
					+ "acnt=?, floor=?, acsday=sysdate, sex=?,"
					+ "domiuse=?, pw=?, phone=? where stnum=?");
			
			
			pstmt.setString(1, dto.getImage());
			pstmt.setString(2, dto.getStname());
			pstmt.setInt(3, dto.getYear1());
			pstmt.setInt(4, dto.getMon());
			
			pstmt.setInt(5, dto.getDay1());
			pstmt.setInt(6, dto.getGrade());
			pstmt.setString(7, dto.getPart());
			
			pstmt.setString(8, dto.getZon());
			pstmt.setString(9, dto.getStreet());
			pstmt.setString(10, dto.getAddr());
			pstmt.setString(11, dto.getBank());
			
			pstmt.setString(12, dto.getAcnt());
			pstmt.setString(13, dto.getFloor());
			// sysdate
			pstmt.setString(14, dto.getSex());
			
			pstmt.setString(15, dto.getDomiuse());
			pstmt.setString(16, dto.getPw());
			pstmt.setString(17, dto.getPhone());
			
			pstmt.setString(18, dto.getStnum());
			pstmt.executeUpdate();
			msg = "수정되었쯈!";
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) try { conn.close(); } catch(SQLException s) { }
			if(pstmt != null) try { pstmt.close(); } catch(SQLException s) { }
		}
		
		return msg;
	}
}

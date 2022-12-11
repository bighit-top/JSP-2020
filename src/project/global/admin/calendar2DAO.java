package project.global.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class calendar2DAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09", pass="class09";
			conn = DriverManager.getConnection(url, user, pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public List<calendar2DTO> calendarChecking(){
		List<calendar2DTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from schedule");
			rs = pstmt.executeQuery();
			list = new ArrayList<calendar2DTO>();
			while(rs.next()) {
				calendar2DTO dto = new calendar2DTO();
				dto.setDay(rs.getString("day"));
				dto.setContents(rs.getString("contents"));
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
	}
	
	public List<calendar2DTO> calendarChecking(int start, int end){
		List<calendar2DTO> arrList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from (select day, contents, rownum r from"
					+ "(select * from schedule order by day desc) order by day desc) where r >= ? and r <= ?");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			arrList = new ArrayList<calendar2DTO>(end);
			while(rs.next()) {
				calendar2DTO dto = new calendar2DTO();
				dto.setDay(rs.getString("day"));
				dto.setContents(rs.getString("contents"));
				arrList.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}
		return arrList;	
	}
	
	public int getLectureCount() throws Exception{
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from schedule"); //ÇÐ»çÀÏÁ¤ °¹¼ö¸¦ °¡Á®¿È
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}

		return x;
	}
}

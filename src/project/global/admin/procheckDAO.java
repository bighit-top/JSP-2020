package project.global.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class procheckDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09", password = "class09";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	//강의 개설 신청 조회
	public List<procheckDTO> getLecture(){
		List<procheckDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from class1");
			rs = pstmt.executeQuery();
			
			list = new ArrayList<procheckDTO>();
			while(rs.next()) {
				procheckDTO dto = new procheckDTO();
				dto.setCan(rs.getString("can"));
				dto.setClassnum(rs.getString("classnum"));
				dto.setClassname(rs.getString("classname"));
				dto.setScore(rs.getInt("score")); 
				dto.setReg_date(rs.getTimestamp("reg_date"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException s) {}
			if(pstmt != null)try {pstmt.close();}catch(SQLException s) {}
			if(conn != null)try {conn.close();}catch(SQLException s) {}
		}
		return list;
	}
}

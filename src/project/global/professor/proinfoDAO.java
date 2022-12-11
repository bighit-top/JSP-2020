package project.global.professor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class proinfoDAO {
	
	private Connection conn;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	
	private Connection getConnetion() {
		Connection conn = null; 
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
	//교수정보확인(proinfoFormDTO / pro infoForm.jsp)
	public proinfoDTO proinfo(String id) {
		proinfoDTO dto = null;
	
		try {
			conn = getConnetion();
			String sql = "select * from professor where id=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				dto = new proinfoDTO();
				dto.setId(rs.getString("id"));
				dto.setImage(rs.getString("image"));
				dto.setProname(rs.getString("proname"));
				dto.setProborn(rs.getString("proborn"));
				dto.setPropart(rs.getString("propart"));
				dto.setTel1(rs.getString("tel1"));
				dto.setProemail(rs.getString("proemail"));
				dto.setZone(rs.getString("zone"));
				dto.setStreet(rs.getString("street"));
				dto.setAddr(rs.getString("addr"));
				dto.setAcount(rs.getString("acount"));
				dto.setBank(rs.getString("bank"));
					
				}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null)
				try {
					conn.close();
				}catch(SQLException s) {
				}
			if(pst != null)
				try {
					pst.close();
				} catch(SQLException s) {
				}
		}
		return dto;
	}
}


















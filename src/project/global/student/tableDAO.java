package project.global.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class tableDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception{ //DB에 연결하기
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09", pass = "class09";
			conn = DriverManager.getConnection(url,user,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public List<tableDTO> myList(String stnum, String date1, String semester){ //학번, 년도, 학기가 맞으면 강의 리스트를 불러옴
		List<tableDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from signup where stnum=? and date1 =? and semester=?");//학번, 년도, 학기가 맞는가?
			pstmt.setString(1, stnum);
			pstmt.setString(2, date1);
			pstmt.setString(3, semester);
			rs = pstmt.executeQuery();
			list = new ArrayList<tableDTO>();
			while(rs.next()) {
				tableDTO mylistdto = new tableDTO();
				mylistdto.setClassname(rs.getString("classname")); //강의명
				mylistdto.setHomeroompro(rs.getString("homeroompro")); //담당교수
				mylistdto.setScore(rs.getInt("score"));//학점
				mylistdto.setClassroom(rs.getString("classroom")); //강의실
				mylistdto.setClasstime(rs.getString("classtime")); //강의시간
				mylistdto.setDate1(rs.getString("date1")); //년도
				mylistdto.setSemester(rs.getString("semester")); //학기
				mylistdto.setBuilding(rs.getString("building")); //건물명
				mylistdto.setDay(rs.getString("day"));//요일
				mylistdto.setClassnum(rs.getString("classnum"));//강의코드
				mylistdto.setPart(rs.getString("part"));//학과

				list.add(mylistdto);
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(rs != null) try {rs.close();} catch(SQLException s) {}
		}
		return list;
	}

}

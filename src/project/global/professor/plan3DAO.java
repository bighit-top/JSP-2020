package project.global.professor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class plan3DAO {
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
		
	//강의계획서 조회
	public plan3DTO plan(String classnum){ //일단 강의 코드로만 분리
		plan3DTO plan = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from class1 where classnum =? and allow=1");
			pstmt.setString(1, classnum);
			rs = pstmt.executeQuery();
			plan = new plan3DTO();
			if(rs.next()) {
				plan.setClassnum(rs.getString("classnum")); //강의코드
				plan.setPart(rs.getString("part")); //학과
				plan.setClassname(rs.getString("classname")); //강의명
				plan.setHomeroompro(rs.getString("homeroompro")); //교수명
				plan.setScore(rs.getInt("score")); //학점
				plan.setBuilding(rs.getString("building")); //건물명
				plan.setRoomnum(rs.getString("roomnum")); //강의실
				plan.setDay(rs.getString("day")); //요일
				plan.setTime(rs.getInt("time")); //교시
				plan.setCan(rs.getInt("can")); //인원
				plan.setWho(rs.getString("who"));//수강대상
				plan.setGoal(rs.getString("goal"));//강의목표
				plan.setProemail(rs.getString("proemail"));//교수이메일
				plan.setDate1(rs.getString("date1")); //개설년도
				plan.setSemester(rs.getString("semester"));//학기
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}		
		return plan;
	}
	//강의계획서 수정 - 강의코드와 교수id가 맞을 경우만 가능
	public void planModify(plan3DTO modify) {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update class1 set building=?, roomnum=?, day=?, time=?, can=?, part=?, who=?, goal=? where allow=1 and classnum=? and id=?");
			pstmt.setString(1, modify.getBuilding());
			pstmt.setString(2, modify.getRoomnum());
			pstmt.setString(3,  modify.getDay());
			pstmt.setInt(4, modify.getTime());
			pstmt.setInt(5, modify.getCan());
			pstmt.setString(6, modify.getPart());
			pstmt.setString(7, modify.getWho());
			pstmt.setString(8, modify.getGoal());
			pstmt.setString(9, modify.getClassnum());
			pstmt.setString(10, modify.getId());
			
			pstmt.executeUpdate();


		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}
	}
	
}

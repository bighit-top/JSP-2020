package project.global.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class plan2DAO {
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
	//학과를 선택하기 위한 리스트를 조회함
	public List<plan2DTO> lecture(){
		List<plan2DTO> lecturelist = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from subject"); //학과테이블
			rs = pstmt.executeQuery();
			lecturelist = new ArrayList<plan2DTO>();
			while(rs.next()) { //학과명 반복
				plan2DTO lec = new plan2DTO();
				lec.setClassname(rs.getString("subname")); //학과명
				lecturelist.add(lec);
			}
		}catch(Exception e) { //예외처리
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException s) {}
			if(conn != null) try {conn.close();}catch(SQLException s) {}
		}
		return lecturelist; //값 리턴
	}
	
	
	public List<plan2DTO> allListSelect(){ //전체 강의 리스트를 가져옴
		List<plan2DTO> alllist = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from class1 where allow=1");
			rs = pstmt.executeQuery();
			alllist = new ArrayList<plan2DTO>();
			while(rs.next()) {
				plan2DTO dto = new plan2DTO();
				dto.setClassnum(rs.getString("classnum"));
				dto.setPart(rs.getString("part"));
				dto.setClassname(rs.getString("classname"));
				dto.setHomeroompro(rs.getString("homeroompro"));
				dto.setScore(rs.getInt("score"));
				dto.setBuilding(rs.getString("building"));
				dto.setRoomnum(rs.getString("roomnum"));
				dto.setDay(rs.getString("day"));
				dto.setTime(rs.getInt("time"));
				dto.setCan(rs.getInt("can"));
				alllist.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}		
		return alllist;
	}
	
	//검색 강의 리스트 조회 - 년도, 학기, 학과, 강의명
		public List<plan2DTO> planListSelect(String date1, String semester, String part, String classname){
			List<plan2DTO> planlist = null; //반환할 DTO
			String sql = ""; //SQL
			String name = ""; //강의명을 담을 임시변수
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select * from class1 where date1=? and semester=? and part=? and allow=1"); //년도,학기,학과가 같을 경우 출력
				pstmt.setString(1, date1);
				pstmt.setString(2, semester);
				pstmt.setString(3, part);	
				rs = pstmt.executeQuery();
				
				while(rs.next()) { //결과값에서 classname을 반복으로 돌림
					name = rs.getString("classname");
					if(name.equalsIgnoreCase(classname)) { //입력받은 강의명과 대소문자를 구분하지 않고 값이 같으면 반복문은 종료됨
						break;
					}
				}
				
				if(name.equalsIgnoreCase(classname)) { //만약 입력받은 값과 같은 강의명이 있다면
					sql = "select * from class1 where date1=? and semester=? and part=? and classname=? and allow=1"; //출력한 name으로 다시 검색
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, date1);
					pstmt.setString(2, semester);
					pstmt.setString(3, part);
					pstmt.setString(4, name);
					rs = pstmt.executeQuery();
					
					planlist = new ArrayList<plan2DTO>();
					while(rs.next()) {
						plan2DTO dto = new plan2DTO();
						dto.setClassnum(rs.getString("classnum")); //강의코드
						dto.setPart(rs.getString("part")); //학과
						dto.setClassname(rs.getString("classname")); //강의명
						dto.setHomeroompro(rs.getString("homeroompro")); //교수명
						dto.setScore(rs.getInt("score")); //학점
						dto.setBuilding(rs.getString("building")); //건물
						dto.setRoomnum(rs.getString("roomnum")); //강의실
						dto.setDay(rs.getString("day")); //요일
						dto.setTime(rs.getInt("time")); //교시
						dto.setCan(rs.getInt("can")); //정원
						planlist.add(dto);
					}
					
				}else if(classname==null || classname==""|| name!=classname) { //classname이 없거나, 공백이거나, 강의명과 다를 경우, 년도,학기,학과만 가지고 검색
					sql = "select * from class1 where date1=? and semester=? and part=? and allow=1";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, date1);
					pstmt.setString(2, semester);
					pstmt.setString(3, part);
					
					rs = pstmt.executeQuery();
					planlist = new ArrayList<plan2DTO>();
					while(rs.next()) {
						plan2DTO dto = new plan2DTO();
						dto.setClassnum(rs.getString("classnum")); //강의코드
						dto.setPart(rs.getString("part")); //학과
						dto.setClassname(rs.getString("classname")); //강의명
						dto.setHomeroompro(rs.getString("homeroompro")); //교수명
						dto.setScore(rs.getInt("score")); //학점
						dto.setBuilding(rs.getString("building")); //건물
						dto.setRoomnum(rs.getString("roomnum")); //강의실
						dto.setDay(rs.getString("day")); //요일
						dto.setTime(rs.getInt("time")); //교시
						dto.setCan(rs.getInt("can")); //정원
						planlist.add(dto);
					}
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();} catch(SQLException s) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if(conn != null) try {conn.close();} catch(SQLException s) {}
			}		
			return planlist;
		}



	
	
	
}

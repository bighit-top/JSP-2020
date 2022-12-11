package project.global.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class gradeDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09", pass="class09";
			conn =  DriverManager.getConnection(url, user, pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public gradeDTO student(String stnum) { //성적조회의 학생 정보조회
		gradeDTO info = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from student where stnum=?"); //학번조건 넣기
			pstmt.setString(1, stnum); //학번 pro 통해서 넘겨 받아야 할듯
			rs = pstmt.executeQuery();
			info = new gradeDTO();
			if(rs.next()) {
				info.setStnum(rs.getString("stnum")); //학번
				info.setStname(rs.getString("stname")); //이름
				info.setGrade(rs.getInt("grade")+""); //학년
				info.setPart(rs.getString("part")); //학과
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}
		return info;
	}	
	
	/*
	 * public gradeDTO studentInfo(String stnum) { //성적조회의 학생 성적조회 gradeDTO stuinfo
	 * = null; try { conn = getConnection(); pstmt =
	 * conn.prepareStatement("select * from signup where stnum=? and record!=null");
	 * //학번과 성적이 부여된 경우로 조건 넣기 pstmt.setString(1, stnum); rs = pstmt.executeQuery();
	 * stuinfo = new gradeDTO(); if(rs.next()) {
	 * stuinfo.setStnum(rs.getString("stnum"));
	 * stuinfo.setStname(rs.getString("stname"));
	 * stuinfo.setRecord(rs.getInt("record"));
	 * stuinfo.setClassname(rs.getString("classname"));
	 * stuinfo.setGrade(rs.getString("grade"));
	 * stuinfo.setScore(rs.getInt("score")); stuinfo.setPart(rs.getString("part"));
	 * } }catch(Exception e) { e.printStackTrace(); }finally { if(rs != null) try
	 * {rs.close();} catch(SQLException s) {} if(pstmt != null) try {pstmt.close();}
	 * catch(SQLException s) {} if(conn != null) try {conn.close();}
	 * catch(SQLException s) {} } return stuinfo; }
	 */
	
	//성적 리스트
	public List<gradeDTO> resultChecking(String stnum){ 
		List<gradeDTO> list = null;		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from (select stnum, stname, classnum, "
					+ "classname, record, grade, score, part from(select * from signup "
					+ "order by grade desc, classname asc)order by grade desc, classname asc)"
					+ " where stnum=?"); //
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();
			list = new ArrayList<gradeDTO>();
			while(rs.next()) {
				gradeDTO dto = new gradeDTO();
				dto.setStnum(rs.getString("stnum"));
				dto.setStname(rs.getString("stname"));
				dto.setLecturecode(rs.getString("classnum"));
				dto.setClassname(rs.getString("classname"));
				dto.setRecord(rs.getInt("record"));
				dto.setGrade(rs.getString("grade"));
				dto.setScore(rs.getInt("score"));
				list.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}		
		return list;		
	}	
	
	//학년 조건에 맞게 성적 검색
	public List<gradeDTO> gradeSelect(String grade, String stnum){
		List<gradeDTO> select = null;
		try {
			conn = getConnection();
			if(grade.equals("1")|| grade.equals("2")) { //셀렉트로 1학년, 2학년을 선택했을 경우의 조건
				pstmt = conn.prepareStatement("select * from signup where grade = ? and stnum = ? ");
				pstmt.setString(1, grade);
				pstmt.setString(2, stnum);
				rs = pstmt.executeQuery();
				select = new ArrayList<gradeDTO>();
				while(rs.next()) {
					gradeDTO selectlist = new gradeDTO();
					selectlist.setStnum(rs.getString("stnum")); //학번
					selectlist.setStname(rs.getString("stname")); //학생이름
					selectlist.setLecturecode(rs.getString("classnum")); //강의코드
					selectlist.setClassname(rs.getString("classname")); //강의명
					selectlist.setRecord(rs.getInt("record")); //성적
					selectlist.setGrade(rs.getString("grade")); //학년
					selectlist.setScore(rs.getInt("score")); //부여학점
					select.add(selectlist);
				}
			}else if(grade.equals("전부")) { //전체학년 조회
				pstmt = conn.prepareStatement("select * from signup where stnum = ?  order by grade desc");
				pstmt.setString(1, stnum);
				rs = pstmt.executeQuery();
				select = new ArrayList<gradeDTO>();
				while(rs.next()) {
					gradeDTO selectlist = new gradeDTO();
					selectlist.setStnum(rs.getString("stnum")); //학번
					selectlist.setStname(rs.getString("stname")); //학생이름
					selectlist.setLecturecode(rs.getString("classnum")); //강의코드
					selectlist.setClassname(rs.getString("classname")); //강의명
					selectlist.setRecord(rs.getInt("record")); //성적
					selectlist.setGrade(rs.getString("grade")); //학년
					selectlist.setScore(rs.getInt("score")); //부여학점
					select.add(selectlist);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}		
		return select;
	}
	
}

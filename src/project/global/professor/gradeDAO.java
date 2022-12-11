package project.global.professor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.global.student.evalDTO;

public class gradeDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09" ,pass="class09";
			conn = DriverManager.getConnection(url,user,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public int classCount(String classnum) { //강의인원 불러오기// 강의명의 조회인원으로 매개변수 설정(classname)
		//gradeDTO claCount = null;//디티오 타입으로 clacount변수 초기화
		int count = 0; //카운트 세기위해 초기화 해주었다.
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from signup where classnum=? ");//signup테이블의 classnum의 인원을 불러온다
			pstmt.setString(1, classnum); //스트링 타입으로 set(classnum의 값을 저장)해준다.
			rs = pstmt.executeQuery();
			rs.next();//화살표가리킨다.
			count = rs.getInt(1); //카운트가 첫번째 행(1) 을
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}
		return count;
	}
	
	
	
	public List<gradeDTO> stcall(String classnum){//학생이름, 학생학번 불러오기 
		List<gradeDTO> list = null;
		try {
			conn = getConnection();
			pstmt= conn.prepareStatement("select * from signup where classnum=?");
			pstmt.setString(1, classnum); //강의코드 대입
			rs = pstmt.executeQuery();
			list = new ArrayList<gradeDTO>();
			while(rs.next()) {
				gradeDTO dto = new gradeDTO();
				dto.setStnum(rs.getString("stnum")); //학생학번
				dto.setName(rs.getString("stname")); //학생이름
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}
		return list;
	}
	
	//강의테이블에서 교수의 담당 과목들을 셀렉트로 가져온다 - id, 년도, 학기 - class1
	public List<gradeDTO> lectureList(String proid, String date1, String semester){ 
		List<gradeDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from class1 where allow=1 and id=? and date1=? and semester=?");//id, 년도, 학기가 맞는가?
			pstmt.setString(1, proid);
			pstmt.setString(2, date1);
			pstmt.setString(3, semester);
			rs = pstmt.executeQuery();
			list = new ArrayList<gradeDTO>();
			while(rs.next()) {
				gradeDTO lecture = new gradeDTO();
				lecture.setClassname(rs.getString("classname")); //강의명
				lecture.setLecturecode(rs.getString("classnum")); //강의코드
				list.add(lecture);
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
	
	//성적을 입력할 수 있도록 업데이트함
	public void insertResult(gradeDTO dto) {
		try {
			conn = getConnection();			
			pstmt = conn.prepareStatement("update signup set record=? where stnum=? and classnum=?"); //학번과 강의코드가 맞을 경우 성적을 기입
			pstmt.setInt(1, dto.getRecord()); //점수
			pstmt.setString(2, dto.getStnum()); //학생명
			pstmt.setString(3, dto.getLecturecode()); //강의코드
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}
	}
}






















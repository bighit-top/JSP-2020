package project.global.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class evalDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09", pass = "class09";
			conn = DriverManager.getConnection(url, user, pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public List<evalDTO> lectureList(String stnum, String date1, String semester){ //수강신청 테이블에서 과목들을 불러옴
		List<evalDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from signup where stnum=? and date1=? and semester=?");//학번, 년도, 학기가 맞는가?
			pstmt.setString(1, stnum);
			pstmt.setString(2, date1);
			pstmt.setString(3, semester);
			rs = pstmt.executeQuery();
			list = new ArrayList<evalDTO>();
			while(rs.next()) {
				evalDTO lecture = new evalDTO();
				lecture.setClassname(rs.getString("classname")); //강의명
				lecture.setProname(rs.getString("homeroompro")); //교수명
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
	
	public evalDTO lectureSelect(String stnum, String date1, String semester){ //수강신청 테이블에서 선택
		evalDTO select = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from signup where stnum=? and date1=? and semester=?");//학번, 년도, 학기가 맞는가?
			pstmt.setString(1, stnum); //학번
			pstmt.setString(2, date1); //년도
			pstmt.setString(3, semester); //학기
			rs = pstmt.executeQuery();
			select = new evalDTO();
			if(rs.next()) {
				select.setProname(rs.getString("homeroompro")); //교수명
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(rs != null) try {rs.close();} catch(SQLException s) {}
		}
		return select;
	}
	
	
	public void evalInsert(evalDTO eval) {	//수강평가 테이블에 값 저장하기
		String lecture = eval.getClassname(); //학과 대입
		String stnum = eval.getStnum(); //학번 대입
		String sql = "";
		evalDTO choose = null; //교수명을 넣을 DTO
		int score = 0;	//총점을 계산할 변수
		int [] num = new int[10];
			num[0] = eval.getNum1();
			num[1] = eval.getNum2();
			num[2] = eval.getNum3();
			num[3] = eval.getNum4();
			num[4] = eval.getNum5();
			num[5] = eval.getNum6();
			num[6] = eval.getNum7();
			num[7] = eval.getNum8();
			num[8] = eval.getNum9();
			num[9] = eval.getNum10();
			
		for(int i = 0; i < 10; i++) {				
			score += num[i];
		}		

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from signup  where stnum=? and classname=?"); //교수명을 조건에 맞게 찾는다.
			pstmt.setString(1, stnum);
			pstmt.setString(2, lecture);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				choose = new evalDTO();
				choose.setProname(rs.getString("homeroompro"));
			}
		
			sql = "insert into evaluation values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eval.getDate1()); //년도
			pstmt.setString(2, eval.getSemester()); //학기
			pstmt.setString(3, eval.getClassname()); //강의명
			pstmt.setString(4, choose.getProname()); //찾아낸 교수명을 선택해서 넣는다
			pstmt.setInt(5, eval.getNum1()); //항목
			pstmt.setInt(6, eval.getNum2());
			pstmt.setInt(7, eval.getNum3());
			pstmt.setInt(8, eval.getNum4());
			pstmt.setInt(9, eval.getNum5());
			pstmt.setInt(10, eval.getNum6());
			pstmt.setInt(11, eval.getNum7());
			pstmt.setInt(12, eval.getNum8());
			pstmt.setInt(13, eval.getNum9());
			pstmt.setInt(14, eval.getNum10());
			pstmt.setString(15, eval.getTopro()); //교수님께
			pstmt.setString(16, eval.getStnum()); //학번
			pstmt.setInt(17, score); //총점
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}
		
	}	
		
	//강의 평가시 두번 제출할 수 없음.
	public int submitCheck(String stnum, String classname) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int check =  -1; //제출 체크를 하기 위한 변수
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select stnum, classname from evaluation where stnum=? and classname=?");
			pstmt.setString(1, stnum);
			pstmt.setString(2, classname);
			rs = pstmt.executeQuery();
				
			if(rs.next()) { //검색 결과가 있으면 
				check = 1;					
			}else {	//검색 결과가 없으면
				check  = -1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}			
		return check;
		
	}
}

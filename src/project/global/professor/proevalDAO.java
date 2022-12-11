package project.global.professor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class proevalDAO {
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
	public proevalDTO profassor(String id) {//성적조회의 교수 정보조회
	proevalDTO info = null;
	try {
		conn = getConnection();
		pstmt = conn.prepareStatement("select * from professor where id=?");//학번조건 넣기
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		info = new proevalDTO();
		if(rs.next()) {
			info.setHomeroompro(rs.getString("proname"));
			info.setId(rs.getString("id"));
			info.setPart(rs.getString("propart"));
		}
		System.out.println(info.getHomeroompro());
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(rs != null) try {rs.close();} catch(SQLException s) {}
		if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
		if(conn != null) try {conn.close();} catch(SQLException s) {}
	}
	return info;
	}
	
	
	/*public void evalsum(proevalDTO eval) {//수강평가 테이블에 값 저장하기
		String proid = eval.getId();
		String classname = eval.getClassname();
		String sql = "";
		proevalDTO choose = null;
		int score = 0;
		int [] num = new int[10];//총점을 계산할 변수
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
			pstmt = conn.prepareStatement("select * from calss1 where classname=?");
			pstmt.setString(1, classname);
			rs =pstmt.executeQuery();
		if(rs.next()) {
			choose = new proevalDTO();
			choose.setproname(rs.get)
		}
		*/
	
	
	
	
	public proevalDTO proeval(String classname) { //년도 학기 강의명 받은평가 기타 출력
		proevalDTO eval = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from evaluation where classname");
			pstmt.setString(1, classname);
			rs = pstmt.executeQuery();
			eval = new proevalDTO();
			if(rs.next()) {
				eval.setDate1(rs.getString("date1"));
				eval.setSemester(rs.getString("semester"));
				eval.setClassname(rs.getString("classname"));
				eval.setTotal(rs.getInt("total"));
				eval.setTopro(rs.getString("topro"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}
		return eval;
		}
	
	public int proevalcount(String homeroompro, String classname, String semester, String date1) throws Exception{
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from evaluation where homeroompro=? and classname=? and semester=? and date1=?");
			pstmt.setString(1,homeroompro);
			pstmt.setString(2,classname);
			pstmt.setString(3,semester);
			pstmt.setString(4,date1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
			System.out.println(homeroompro);
			System.out.println(classname);
			System.out.println(semester);
			System.out.println(date1);
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	
	public List<proevalDTO> evalList(String id, String date1, String semester){
		List<proevalDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from class1 where id=? and date1=? and semester=? and allow=1");
			pstmt.setString(1,id);
			pstmt.setString(2, date1);
			pstmt.setString(3, semester);
			rs = pstmt.executeQuery();
			list = new ArrayList<proevalDTO>();
			while(rs.next()) {
				proevalDTO proeval= new proevalDTO();
				proeval.setClassname(rs.getString("classname"));
				list.add(proeval);
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
	
	/*
	public proevalDTO lookeval() {
		proevalDTO dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from evaluation where classname=?");
			pstmt.setString(1, dto.getClassname());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt.setString(1, dto.getDate1());
				pstmt.setString(2, dto.getSemester());
				pstmt.setString(3, dto.getClassname());
				pstmt.setString(4, dto.get);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return dto;
	} */
	
	public List<proevalDTO> proevalList(String classname){//년도 학기 강의명 받은평가 기타 출력
		List<proevalDTO> proevalList = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from evaluation where classname=?");
			pstmt.setString(1, classname);
			rs= pstmt.executeQuery();
			proevalList = new ArrayList<proevalDTO>();
			while(rs.next()) {
				proevalDTO dto = new proevalDTO();
				dto.setDate1(rs.getString("date1"));
				dto.setSemester(rs.getString("semester"));
				dto.setClassname(rs.getString("classname"));
				dto.setTopro(rs.getString("topro"));
				dto.setTotal(rs.getInt("total"));
				proevalList.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch(SQLException s) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
			if(conn != null) try {conn.close();} catch(SQLException s) {}
		}		
		
		return proevalList;
	}
	
}




	
	
	
	
	
	
	
	
	
	
	
package project.global.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class domDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Connection getConnection(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class09" , password = "class09";
			conn = DriverManager.getConnection(url,user,password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	//입실 신청 학생 조회
	public List<domCheckDTO> getCheck() {
		List<domCheckDTO> list = null;
		try {
			conn = getConnection();
			//입실 신청한 학생  select
			pstmt = conn.prepareStatement("select * from enter where allow=0");
			rs = pstmt.executeQuery();
			 
			list = new ArrayList<domCheckDTO>();//리스트 객체 생성
			while(rs.next()) {
				domCheckDTO dto = new domCheckDTO();
				dto.setNo(rs.getInt("no")); 
				dto.setStnum(rs.getString("stnum"));
				dto.setGender(rs.getString("gender"));
				dto.setDreamroom(rs.getString("dreamroom"));
				dto.setName(rs.getString("name"));
				dto.setPart(rs.getString("part"));
				list.add(dto);//list에 dto add
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
	//기숙사 합격자 조회 
	public List<domCheckDTO> getAllowCheck() {
		List<domCheckDTO> list = null;
		int dballow = 0;
		String sql="";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from enter");
			rs = pstmt.executeQuery();
			
			list = new ArrayList<domCheckDTO>();//ArrayList 객체 생성
			while(rs.next()) {
				domCheckDTO dto = new domCheckDTO(); //domCheckDTO() 객체 생성
				dballow = rs.getInt("allow");
				if(dballow == 1) { //allow=1 승인된 학생만 dto 객체에 저장 
				dto.setNo(rs.getInt("no")); 
				dto.setStnum(rs.getString("stnum"));
				dto.setDreamroom(rs.getString("dreamroom"));
				dto.setName(rs.getString("name"));
				dto.setPart(rs.getString("part"));
				dto.setHo(rs.getString("ho"));
				list.add(dto); //list에 저장
				}
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
	//기숙사 입실 신청 승인 
	public void updateAllow(String stnum) throws Exception{
		String dbstnum = "";
		String sql = "";
		
		try {
			conn = getConnection();
			//해당 학번의 학생 데이터 select
			pstmt = conn.prepareStatement("select * from enter where stnum=?");
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbstnum = rs.getString("stnum");
				if(dbstnum.equals(stnum)) {
					//승인 버튼 클릭 시 allow=1로 업데이트
					sql = "update enter set allow=1 where stnum=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, stnum);
					pstmt.executeUpdate();
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
		//기숙사 입실 신청 거부
		public void updateAllowNo(String stnum) throws Exception{
			String dbstnum = "";
			String sql = "";
			
			try {
				conn = getConnection();
				//해당 학번의 학생 데이터 select
				pstmt = conn.prepareStatement("select * from enter where stnum=?");
				pstmt.setString(1, stnum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dbstnum = rs.getString("stnum");
					if(dbstnum.equals(stnum)) {
						//거절 버튼 클릭 시 allow=1로 업데이트
						sql = "update enter set allow=-1 where stnum=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, stnum);
						pstmt.executeUpdate();
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
		}		
	
		
	//기숙사 방 배정 필요한 학생 리스트
	public List<roomDTO> getPass(){
		List<roomDTO> list = null;
		int dballow=0;
		try {
			conn = getConnection();
			//방배정할 학생 조회
			pstmt = conn.prepareStatement("select * from enter where ok=0 order by dreamroom");
			rs = pstmt.executeQuery();
			
			list = new ArrayList<roomDTO>();
			while(rs.next()) {
				roomDTO dto = new roomDTO();
				dballow = rs.getInt("allow");
				if(dballow==1) {//입실 승인된 학생만 roomDTO 객체에 저장
					dto.setStnum(rs.getString("stnum"));
					dto.setGender(rs.getString("gender"));
					dto.setDreamroom(rs.getString("dreamroom"));
					dto.setName(rs.getString("name"));
					dto.setPart(rs.getString("part"));
					list.add(dto);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}
	//기숙사 방 배정 승인
	public void updateRoom(roomDTO dto) {
		String dbstnum="";
		String sql="";
		try {
			conn = getConnection();
			//입실 승인된 해당 학번의 학생 데이터 select
			pstmt = conn.prepareStatement("select * from enter where stnum=?");
			pstmt.setString(1, dto.getStnum());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dbstnum = rs.getString("stnum");
				if(dbstnum.equals(dto.getStnum())){	
					//방배정 완료된 학생 호실커럼, ok=1로 업데이트
					sql = "update enter set ho=?, ok=1 where stnum=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getHo()); 
					pstmt.setString(2, dto.getStnum());
					pstmt.executeUpdate();	
				} 
			}		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	//기숙사 방 배정 승인 후 두번째 테이블 
	//기숙사 방 배정 조회
		public List<roomDTO> updateGetRoom(){
			List<roomDTO> list = null;
			int dbok=0;
			try {
				conn = getConnection();
				//방배정 완료된 학생 select
				pstmt = conn.prepareStatement("select * from enter where ok=1 order by dreamroom ");
				rs = pstmt.executeQuery();
				
				list = new ArrayList<roomDTO>(); //ArrayList 객체 생성
				while(rs.next()) {
					roomDTO dto = new roomDTO(); //roomDTO 객체 생성
					dbok = rs.getInt("ok");//ok컬럼 값 대입
					if(dbok==1) { //ok 컬럼 값이 1 인 경우(방 배정 완료된 학생) dto에 저장
						dto.setStnum(rs.getString("stnum"));
						dto.setGender(rs.getString("gender"));
						dto.setDreamroom(rs.getString("dreamroom"));
						dto.setName(rs.getString("name"));
						dto.setPart(rs.getString("part"));
						dto.setHo(rs.getString("ho"));
						list.add(dto); //list 객체에 저장
					}
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
			return list;
		}
	//기숙사 퇴실 신청 학생 조회 
	public List<domoutDTO> getOut(){
		List<domoutDTO> list = null;
		try {
			conn = getConnection();
			//퇴실 신청 학생 select
			pstmt = conn.prepareStatement("select * from leaving where allow=0");
			rs = pstmt.executeQuery();
			list = new ArrayList<domoutDTO>(); 
			while(rs.next()) {
				domoutDTO dto = new domoutDTO(); //domoutDTO 객체 생성하여 데이터 저장
				dto.setNo(rs.getInt("no"));
				dto.setStnum(rs.getString("stnum"));
				dto.setDormitory(rs.getString("dormitory"));
				dto.setReason(rs.getString("reason"));
				dto.setDday(rs.getString("dday"));
				dto.setPart(rs.getString("part"));
				dto.setHo(rs.getString("ho"));
				dto.setName(rs.getString("name"));
				list.add(dto); //list 객체에 dto 저장
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}
	//기숙사 퇴실 신청 승인 
	public void updateOutAllow(String stnum) throws Exception{
		String dbstnum = "";
		String sql = "";

		try {
			conn = getConnection();
			//퇴실 신청한 학생 학번 select
			pstmt = conn.prepareStatement("select * from leaving where stnum=?");
			pstmt.setString(1, stnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbstnum = rs.getString("stnum");
				if(dbstnum.equals(stnum)) {//승인 버튼 클릭 시 allow=1 로 업데이트
					sql = "update leaving set allow=1 where stnum=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, stnum);
					pstmt.executeUpdate();
				}
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
	//외박 신청 조회
	public List<nightDTO> getNignt(){	
		List<nightDTO> list = null;
		try {
			conn = getConnection();
			//외박 신청한 학생 select
			pstmt = conn.prepareStatement("select * from sexnight where allow=0");
			rs = pstmt.executeQuery();
			list = new ArrayList<nightDTO>();
			while(rs.next()) {
				nightDTO dto = new nightDTO(); //nightDTO 객체 생성
				dto.setNo(rs.getInt("no"));
				dto.setStnum(rs.getString("stnum"));
				dto.setAllow(rs.getInt("allow"));
				dto.setName(rs.getString("name"));
				dto.setDreamroom(rs.getString("dreamroom"));
				dto.setHo(rs.getString("ho"));
				dto.setPart(rs.getString("part"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setStartday(rs.getString("startday"));
				dto.setComeback(rs.getString("comeback"));
				list.add(dto); //list 객체에 dto add
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return list;
	}
	//외박 신청 승인/거부 확인 테이블
		public List<nightDTO> getAllNignt(){	
			List<nightDTO> list = null;
			try {
				conn = getConnection();
				//외박 승인/거부된 학생 데이터 select
				pstmt = conn.prepareStatement("select * from sexnight where allow=-1 or allow=1");
				rs = pstmt.executeQuery();
				list = new ArrayList<nightDTO>();//ArrayList 객체 생성
				while(rs.next()) {
					nightDTO dto = new nightDTO(); //nightDTO 객체 생성
					dto.setNo(rs.getInt("no"));
					dto.setStnum(rs.getString("stnum"));
					dto.setAllow(rs.getInt("allow"));
					dto.setName(rs.getString("name"));
					dto.setDreamroom(rs.getString("dreamroom"));
					dto.setHo(rs.getString("ho"));
					dto.setPart(rs.getString("part"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					list.add(dto); //list 객체에 dto add
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
			return list;
		}
	//외박 승인
	public void sleepoutAllow(String stnum, int no) throws Exception {
		//String dbstnum = "";
		String sql = "";
		
		
		try {
			conn = getConnection();
			//외박 신청한 학생 데이터 select
			pstmt = conn.prepareStatement("select * from sexnight");
			rs = pstmt.executeQuery();
			if(rs.next()) {
					//해당 시퀀스 번호, 학번 일치한 리스트 외박 승인된 학생 컬럼 allow=1로 업데이트
					sql = "update sexnight set allow=1 where stnum=? and no=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, stnum);
					pstmt.setInt(2, no);
					pstmt.executeUpdate();
				}		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
	}
		//기숙사 외박 승인 거부
		public void sleepAllowNo(String stnum, int no) throws Exception{
			//String dbstnum = "";
			String sql = "";
				
			try {
				conn = getConnection();
				//외박 신청한 학생 데이터 select
				pstmt = conn.prepareStatement("select * from sexnight where stnum=?");
				pstmt.setString(1, stnum);
				rs = pstmt.executeQuery();
				if(rs.next()) {
						//해당 시퀀스 번호, 학번 일치한 리스트 외박 거부 버튼 클릭 시 allow 컬럼 값 -1로 업데이트	
						sql = "update sexnight set allow=-1 where stnum=? and no=?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, stnum);
						pstmt.setInt(2, no);
						pstmt.executeUpdate();
					}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
		}		
		
		
	
}
